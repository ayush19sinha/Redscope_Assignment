# Flutter App

A Flutter application to explore public GitHub repositories and display a gallery of images from Unsplash. This app features network caching, bookmarking functionality, and a polished UI with intuitive navigation.

## Objective

Develop an app that showcases:
1. A repository listing from GitHub Gists.
2. An image gallery using Unsplash's API.
3. Bookmark functionality for images.

## Features

### 1. Splash Screen
A welcoming splash screen on app launch, introducing the app's main functionality.

### 2. Home Screen with Bottom Tabs
The home screen includes two main tabs:
   - **Repo Tab**: Displays a list of public GitHub gists. Each item shows:
     - Description
     - Comment count
     - Created Date
     - Updated Date
     
     *(Data sourced from [GitHub Gists API](https://api.github.com/gists/public))*
   
   - **Gallery Tab**: A grid-style gallery view showing images from Unsplash. 
     *(Images sourced from [Unsplash API](https://unsplash.com/developers))*

### 3. Click Actions
   - **Repository Tab Actions**:
     - **Long Press**: Opens a popup showing owner information.
     - **Single Tap**: Opens a new screen listing all files in the gist.
     
   - **Gallery Tab Actions**:
     - **Grid Item Tap**: Opens the image in full-screen mode with pinch-to-zoom support.

### 4. Network Caching
   - On first launch, data is fetched from the network and displayed after the API response is received.
   - On subsequent launches, data is served from the cache with automatic background refresh.

### 5. Bookmark Functionality
   - **Full-Screen Image View**: A bookmark button allows users to save their favorite images.
   - **Bookmarks Tab**: Accessed from the top-right corner of the home screen. Displays bookmarked images in a staggered layout, combining grid and list styles.


## App Video
 


https://github.com/user-attachments/assets/00118995-df18-4bc6-ad6a-f24b3b40a920



## API Integration
- **GitHub Gists**: Lists public gists.
- **Unsplash**: Fetches and displays images in the gallery.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/FlutterApp.git

2. Navigate into the project directory:
   ```bash
    cd FlutterApp
   
3. Install dependencies:
   ```bash
   flutter pub get

4. Obtain API keys for GitHub Gists and Unsplash if required.

5. Run the app on an emulator or physical device:
  ```bash
    flutter run
