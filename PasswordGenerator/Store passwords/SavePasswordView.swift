//
//  SavePasswordView.swift
//  PasswordGenerator
//
//  Created by Iliane Zedadra on 07/05/2021.
//

import SwiftUI
import SwiftUIX
import KeychainSwift

struct SavePasswordView: View {
    
    @Binding var password: String
    @Binding var sheetIsPresented: Bool
    @ObservedObject var editedPassword = TextBindingManager(limit: 30)
    @State private var username = ""
    @State private var title = ""
    @State private var isEditingPassword = false
    @State private var showKeyboard = false
    @State private var passwordLenght = ""
    @State private var showMissingTitleAlert = false
    @State private var showMissingPasswordAlert = false
    @State private var showMissingPasswordAndTitleAlert = false
    @State private var showMissingUsernameFooter = false
    @State private var showMissingTitleFooter = false
    @State var generatedPasswordIsPresented: Bool
    @ObservedObject var viewModel: PasswordListViewModel
    @ObservedObject var settings:SettingsViewModel
    let keyboard = Keyboard()
    let keychain = KeychainSwift()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Form {
                    Section(header: Text("Mot de passe").foregroundColor(.gray),
                            footer: passwordLenght.isEmpty ? Text("Champ obligatoire")
                                .foregroundColor(.red) : Text("")) {
                        HStack {
                            Spacer()
                            
                            if !isEditingPassword {
                                Text(editedPassword.text)
                                    .foregroundColor(.gray).font(editedPassword.characterLimit > 25 ? .system(size: 15) : .body)
                                
                            } else {
                                
                                TextField(password, text: $editedPassword.text)
                                    .keyboardType(.asciiCapable)
                                    .disableAutocorrection(true)
                                    .accessibility(identifier: "password-field")
                                
                            }
                            Spacer()
                            
                            if !isEditingPassword {
                                
                                Button(action: {
                                    withAnimation {
                                        isEditingPassword.toggle()
                                        showKeyboard = keyboard.isShowing
                                    }
                                    
                                }, label: {
                                    Text("Modifier")
                                })
                                .buttonStyle(PlainButtonStyle())
                                .foregroundColor(settings.colors[settings.accentColorIndex])
                                
                            }
                            else {
                                Button(action: {
                                    withAnimation(.default) {
                                        isEditingPassword.toggle()
                                        showKeyboard = keyboard.isShowing
                                        viewModel.addedPasswordHaptic()
                                    }
                                    
                                }, label: {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(!editedPassword.text.isEmpty ? .green : .blue)
                                        .accessibility(identifier: "checkmark-icon")
                                })
                                .animation(.easeIn)
                                .disabled(editedPassword.text.isEmpty)
                                .buttonStyle(PlainButtonStyle())
                                .foregroundColor(settings.colors[settings.accentColorIndex])
                            }
                        }
                        .alert(isPresented: $showMissingPasswordAlert, content: {
                            Alert(title: Text("Mot de passe invalide"), message: Text("Le champ mot de passe ne peut pas être vide."), dismissButton: .cancel(Text("OK!")))
                            
                        })
                    }
                    
                    Section(header: Text("Nom de compte").foregroundColor(.gray)) {
                        TextField("ex: example@icloud.com", text: $username)
                            .accessibility(identifier: "username-input")
                    }
                    
                    Section(header: Text("Titre").foregroundColor(.gray), footer: title.isEmpty ? Text("Champ obligatoire").foregroundColor(.red) : Text("") ) {
                        TextField("ex: Twitter", text: $title)
                            .accessibility(identifier: "title-input")
                    }
                    .alert(isPresented: $showMissingTitleAlert, content: {
                        Alert(title: Text("Champ manquant"), message: Text("Vous devez au moins donner un nom de compte a votre mot de passe."), dismissButton: .cancel(Text("OK!")))
                        
                    })
                    
                }
                .alert(isPresented: $showMissingPasswordAndTitleAlert, content: {
                    Alert(title: Text("Champs manquants"), message: Text("Champ(s) manquant(s)."), dismissButton: .cancel(Text("OK!")))
                })
                .navigationBarTitle("Nouveau mot de passe")
                .navigationBarItems(leading: Button(action: {
                    
                    sheetIsPresented.toggle()
                    
                }, label: {
                    Text("Annuler")
                })
                                    
                                    , trailing: Button(action: {
                    
                    withAnimation {
                        
                        if !isEditingPassword {
                            
                            if title.isEmpty || editedPassword.text.isEmpty {
                                showMissingPasswordAndTitleAlert.toggle()
                                print("Missing fields")
                            }
                            
                            else if !title.isEmpty && !editedPassword.text.isEmpty {
                                sheetIsPresented.toggle()
                                viewModel.saveToKeychain(password: editedPassword.text, username: username, title: title)
                                viewModel.getAllKeys()
                            }
                        }
                    }
                    
                }, label: {
                    Text("Enregistrer")
                        .accessibility(identifier: "save-pass-button")
                })
                .disabled(isEditingPassword ? true : false))
            }
            .onChange(of: editedPassword.text.count, perform: { _ in
                passwordLenght = editedPassword.text
            })
        }
        .overlay(settings.isHiddenInAppSwitcher ? PrivacyView() : nil)
        .onAppear(perform: {
            if !generatedPasswordIsPresented {
                isEditingPassword = true
                
            }
            editedPassword.text = password
            passwordLenght = password
        })
    }
}

struct SavePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SavePasswordView(password: .constant("MotDePasseExtremementCompliqué"), sheetIsPresented: .constant(true), generatedPasswordIsPresented: true, viewModel: PasswordListViewModel(), settings: SettingsViewModel())
    }
}
