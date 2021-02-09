//
//  PermissionCustomizeModifiers.swift
//
//
//  Created by Jevon Mao on 1/31/21.
//

import SwiftUI

public extension View{
    /**
     Customizes the image view, title (optional), and description (optional) of any permission component

     Use this modifier on your existing view to set all the available customizations–the symbol image , and title (optional) and description (optional).

     For example,
     ```
     YourTopLevelView()
     .setPermissionComponents(for: .camera,
                              image: AnyView(Image(systemName: "camera.fill")),
                              title: "Camera",
                              description: "Camera description")
     ```
     will override the default image, title , and description for the `camera` permission. It will result in a camera image symbol, and the custom title and description
     - Parameters:
        - for: `PermissonType` specifying the permission component
        - image: The color to render the symbol image
        - title: The title text (optional)
        - description: The description text (optional)
     */
    
    func setPermissionComponent(for permission: PermissionType, image:AnyView, title: String?=nil, description: String?=nil) -> some View{
        var permission = permission
        let currentPermission = permission.currentPermission
        permission.currentPermission = JMPermission(
            imageIcon: image,
            title: title ?? currentPermission.title,
            description: description ?? currentPermission.description, authorized: currentPermission.authorized
        )
        return self
    }
    
    /**
     Customizes only the title of any permission component

     Use this modifier on your existing view to set the title customization.

     For example,
     ```
     YourTopLevelView()
     .setPermissionComponents(for: .camera,
                              title: "Camera")
     ```
     will override the default title for the `camera` permission. It will result in a custom title.
     - Parameters:
        - for: `PermissonType` specifying the permission component
        - title: The title text
     */
    
    func setPermissionComponent(for permission: PermissionType, title: String) -> some View{
        var permission = permission
        let currentPermission = permission.currentPermission
        permission.currentPermission = JMPermission(
            imageIcon: currentPermission.imageIcon,
            title: title,
            description: currentPermission.description, authorized: currentPermission.authorized
        )
        return self
    }
    
    /**
     Customizes only the description of any permission component

     Use this modifier on your existing view to set the description customization.

     For example,
     ```
     YourTopLevelView()
     .setPermissionComponents(for: .camera,
                              description: "Camera description")
     ```
     will override the default title for the `camera` permission. It will result in a custom description.
     - Parameters:
        - for: `PermissonType` specifying the permission component
        - description: The description text
     */
    
    func setPermissionComponent(for permission: PermissionType, description: String) -> some View{
        var permission = permission
        let currentPermission = permission.currentPermission
        permission.currentPermission = JMPermission(
            imageIcon: currentPermission.imageIcon,
            title: currentPermission.title,
            description: description, authorized: currentPermission.authorized
        )
        return self
    }
}
