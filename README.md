### Project Overview

This project is a Flutter application designed to display a list of albums using state management with the Provider package. It features a search bar in the AppBar, allowing users to search for albums by title.

### Technologies Used

- **Flutter SDK**: 3.22.2
- **HTTP Package**: 1.2.1
- **Provider Package**: 6.1.2

### Key Features

1. **State Management**:
   - The application uses the Provider package for managing state.
   - The album list and search functionality are managed through separate providers.

2. **Album List Display**:
   - Albums are fetched from an API using the HTTP package.
   - The album list is displayed using custom widgets.

3. **Search Functionality**:
   - A search bar is added to the AppBar.
   - The search functionality compares album titles and filters the list accordingly.

### Project Structure

- **main.dart**: Entry point of the application.
- **providers**: Contains providers for state management.
- **widgets**: Custom widgets for displaying the album list and other UI components.
- **models**: Defines the album model.
- **services**: Contains services for fetching data from the API.

### Installation and Setup

1. **Clone the repository**:
   ```
   git clone <repository-url>
   ```
2. **Navigate to the project directory**:
   ```
   cd <project-directory>
   ```
3. **Install dependencies**:
   ```
   flutter pub get
   ```
4. **Run the application**:
   ```
   flutter run
   ```

### APK Download

You can download the APK of this project from the following link: [Download APK](https://drive.google.com/drive/folders/16pmVTm-nUacCzu6WgTAhXcvdqEYz-eS_?usp=sharing)
