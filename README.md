# Quick Shop App

Quick Shop App is a versatile shopping application designed to streamline the shopping experience for users.

## Features

- **User-Friendly Interface**: Intuitive design for easy navigation.
- **Multi-Platform Support**: Compatible with various devices and operating systems.
- **Secure Transactions**: Ensures user data and transactions are protected.

## Technologies Used

The project utilizes a diverse set of technologies, including:

- **C++**: Core application logic.
- **CMake**: Build system management.
- **Dart**: Front-end development.
- **Swift**: iOS-specific functionalities.
- **C**: Additional system-level programming.
- **HTML**: Structuring web content.

For a detailed breakdown, refer to the [GitHub repository](https://github.com/hardebayobakare/quick-shop-app).

## Getting Started

### Requesting Project Assets

Certain assets required for the project, such as design files, images, and configuration files, are not included in the repository. To request these assets, please:

1. Open an issue in the [repository](https://github.com/hardebayobakare/quick-shop-app/issues) titled "Request for Project Assets".
2. Include your email address or preferred contact method in the issue description.
3. Specify the type of assets you need (e.g., Firebase configuration files, app icons).


### Setting Up Firebase

Follow these steps to set up Firebase for the Quick Shop App:

1. **Create a Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/).
   - Click **Add Project** and follow the instructions to set up a new project.

2. **Add Your App to Firebase**:
   - Register your app (iOS and Android) in the Firebase project.
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files.

3. **Integrate Firebase Config Files**:
   - Place the `google-services.json` file in the `android/app/` directory.
   - Place the `GoogleService-Info.plist` file in the `ios/Runner/` directory.

4. **Enable Firebase Services**:
   - In the Firebase Console, enable the necessary services (e.g., Authentication, Firestore, Storage) under the **Build** section.

5. **Update Firebase Configuration**:
   - Ensure your app's `build.gradle` files (for Android) and `info.plist` (for iOS) are updated as per the Firebase documentation.

6. **Test the Configuration**:
   - Run the app to ensure Firebase services are correctly integrated.

For detailed instructions, refer to the [official Firebase documentation](https://firebase.google.com/docs).


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, please open an issue in the [GitHub repository](https://github.com/hardebayobakare/quick-shop-app/issues).
