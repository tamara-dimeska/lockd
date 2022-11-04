//
//  UsernameSection.swift
//  PasswordGenerator
//
//  Created by Iliane Zedadra on 07/07/2021.
//

import SwiftUI
import SwiftUIX

struct UsernameSection: View {
    
    @Binding var showUsernameSection: Bool
    @Binding var editingUsername: Bool
    @Binding var editedPassword: String
    @Binding var editedUsername: String
    @Binding var username: String
    @Binding var key: String
    @Binding var password: String
    @Binding var title: String
    @Binding var clipboardSaveAnimation: Bool
    @Binding var savedChangesAnimation: Bool
    @ObservedObject var passwordListViewModel:PasswordListViewModel
    @ObservedObject var passwordGeneratorViewModel:PasswordGeneratorViewModel
    @ObservedObject var settings:SettingsViewModel
    
    var body: some View {
        
        if showUsernameSection {
            
            if !editingUsername {
                
                HStack {
                    
                    Spacer()
                    Text(username)
                        .accessibility(identifier: "username-text")
                    Spacer()
                    
                    Button(action: {

                        editingUsername.toggle()
                        editedUsername = username
                    },
                           label: {
                        Image(systemName: "pencil")
                            
                    })
                    .accessibility(identifier: "view-pass-edit-username-button")
                }
                
            } else {
                
                HStack {
                    CocoaTextField("Username", text: $editedUsername)
                        .keyboardType(.asciiCapable)
                        .isFirstResponder(true)
                        .disableAutocorrection(true)
                        .accessibility(identifier: "edited-username-text")
                    
                    Button(action: {
                        
                        updateUsername()
                        savedChangesAnimation = true
                        
                    }
                    , label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(!editedPassword.isEmpty ? .green : .blue)
                        
                    })
                    .accessibility(identifier: "view-pass-save-edit-username-button")
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(settings.colors[settings.accentColorIndex])
                }
               
            }
            
            Button(action: {
                
                settings.copyToClipboard(password: username)
                passwordGeneratorViewModel.copyPasswordHaptic()
                clipboardSaveAnimation = true
                
            })
            {
                
                HStack {
                    Spacer()
                    Text("Copier")
                    Spacer()
                }
            }
            .disabled(editingUsername)
            .accessibility(identifier: "view-pass-copy-username-button")
        } else {
            
            HStack {
                Spacer()
                
                Button(action : {
                    showUsernameSection = true
                },    label: Text("Ajouter un nom de compte"))
                
                Spacer()
            }
        }
        
    }
}

extension UsernameSection {
    
     func updateUsername() {
        
        editingUsername.toggle()
        username = editedUsername
        password = passwordListViewModel.keychain.get(key)!
        let newKey = passwordListViewModel.updateUsername(key: key, password: password, newUsername: username, title: title)
        key = newKey
        passwordListViewModel.addedPasswordHaptic()
        
    }
}

struct UsernameSection_Previews: PreviewProvider {
    static var previews: some View {
        UsernameSection(showUsernameSection: .constant(true),
                        editingUsername: .constant(true),
                        editedPassword: .constant(""),
                        editedUsername: .constant(""),
                        username: .constant(""),
                        key: .constant(""),
                        password: .constant(""),
                        title: .constant(""),
                        clipboardSaveAnimation: .constant(true), savedChangesAnimation: .constant(false),
                        passwordListViewModel: PasswordListViewModel(),
                        passwordGeneratorViewModel: PasswordGeneratorViewModel(),
                        settings: SettingsViewModel())
    }
}
