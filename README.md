# MacOS-Style Dock Implementation

## Overview

This project is a professional implementation of a macOS-style dock system in **Flutter**, utilizing advanced animation techniques, state management, and clean architecture principles. It serves as a demonstration of my skills in creating sophisticated user interfaces with smooth animations, while adhering to industry best practices for development, testing, and deployment.

As part of my application for the **Flutter Developer** position at IT Solutions Management International Pte. Ltd., this project highlights my ability to:
- Design and develop **advanced UI features** with smooth animations and transitions, mimicking macOS functionality.
- Implement **efficient state management** using **GetX** for seamless data flow and minimal boilerplate code.
- Integrate **Firebase** for persistent storage, real-time synchronization, and user authentication.
- Set up a **CI/CD pipeline** using **GitHub Actions** for automated testing and deployment to GitHub Pages.
- Follow **MVP architecture**, ensuring modularity, scalability, and maintainability.
- Ensure cross-platform compatibility, making the app responsive across mobile, web, and desktop platforms.

## 🚀 Features

### Core Functionality
- ✅ **Draggable and sortable dock icons** for intuitive user interaction.
- ✅ **Smooth animation transitions** for dock item movements and reordering.
- ✅ **MacOS-style magnification effect** on hover to mimic real desktop behavior.
- ✅ **Responsive layout** for both mobile and web platforms, ensuring adaptability.
- ✅ **Custom icon support**, including **Apple-style icons** for a realistic macOS experience.

### Advanced Features
- ✅ **Firebase integration** for saving settings, user preferences, and cloud synchronization.
- ✅ **User authentication** to manage personalized experiences and settings.
- ✅ **Cloud synchronization** of dock arrangement, ensuring consistency across devices.
- ✅ **Custom theming** with **light/dark mode support** to offer a modern and user-preference-driven experience.
- ✅ **Multiple dock positions** (bottom, left, right), adding flexibility to the layout.

### Animations & UI Effects
- ✅ **Smooth animations** for dragging and dropping icons with real-time repositioning.
- ✅ **Hover animation** to scale icons on mouse hover, enhancing user feedback.
- ✅ **Magnification effect** for dock icons on hover to simulate macOS-like behavior.
- ✅ **Icon rearrangement** with smooth transitions, ensuring a fluid user experience.
- ✅ **Slide-up**, **remove**, and **rearrange animations** for dock icons to add realism.

## 📱 Implementation Phases

### Phase 1: Core Dock Implementation ✅
- Designed the basic dock container and icon layout using Flutter widgets.
- Implemented **drag-and-drop functionality** with smooth transitions using **Flutter's Draggable** and **AnimatedPositioned**.
- Integrated **basic animations** for smooth movements and icon transformations.

### Phase 2: Animation Enhancement ✅
- Developed and integrated the **magnification effect** on hover for a realistic macOS dock interaction.
- Created **smooth reordering animations** when dragging and rearranging icons in the dock.
- Implemented **hover effects** and **position transition animations** for dock icons.

### Phase 3: State Management & Data Persistence 🚧
- Integrated **GetX** for **state management**, allowing efficient and reactive UI updates with minimal boilerplate.
- Configured **Firebase** for storing user preferences, settings, and cloud synchronization across devices.
- Implemented **cloud synchronization** of dock arrangement, ensuring a personalized user experience across different platforms.

### Phase 4: Testing & Documentation 🚧
- Added **unit tests**, **widget tests**, and **integration tests** to ensure stability and code reliability.
- Completed **documentation** for setup, configuration, and usage.
- Set up **continuous testing** and **CI/CD pipelines** using **GitHub Actions** for automated deployment and integration.

## 🛠 Technical Stack

### Core Technologies
- **Flutter 3.16+**: Leveraged Flutter's powerful UI toolkit to build the macOS-style dock system with responsive and fluid interfaces across platforms (Android, iOS, Web, Desktop).
- **Dart 3.0+**: Utilized Dart's modern features for clean, concise, and high-performance code.
- **GetX**: Used for **state management**, offering efficient and lightweight solutions for managing state and data in Flutter apps.
- **Firebase**: Integrated for backend services such as **authentication**, **cloud storage**, and **real-time data synchronization**.
  
### Testing Framework
- **Flutter Test**: Used for writing unit and widget tests to ensure code quality and prevent regressions.
- **Integration Test**: Implemented integration tests to ensure proper functionality of the application across platforms.
- **Golden Toolkit**: Utilized for screenshot-based testing to compare and validate UI consistency.
- **Gherkin**: Integrated for **end-to-end (E2E)** testing to simulate real user interactions and ensure the overall app works as expected.

### CI/CD
- **GitHub Actions**: Set up **continuous integration** for automatic testing and **deployment automation** via **GitHub Pages**, ensuring that every change is properly validated before deployment.
- **Web Deployment**: Deployed the project on **GitHub Pages** for easy access and demonstration of the app's functionality.

## 🧪 Testing & Commands

For development and testing automation, the following commands are used:

- **Run all tests**:
    ```bash
    flutter test
    ```

- **Analyze code and check for formatting issues**:
    ```bash
    flutter analyze
    ```

- **Format code and run all tests**:
    ```bash
    dart format --set-exit-if-changed . && flutter test
    ```

You can also use the pre-configured script `./tools/run_checks.bat` to automatically run these checks:
```bash
./tools/run_checks.bat
```

## 📈 Progress Tracking

### Current Sprint Goals
- [ ] Implement advanced magnification effects.
- [ ] Complete Firebase integration.
- [ ] Add user authentication.
- [ ] Implement settings persistence.

### Completed Milestones
- [x] Basic dock implementation.
- [x] Drag-and-drop functionality.
- [x] Basic animations.
- [x] Project structure setup.
- [x] CI/CD pipeline configuration.

## 🎥 Demo Video

You can view the demo video showcasing the features and animations implemented in this project here:  
[MacOS-Style Dock Demo Video](https://github.com/user-attachments/assets/8a24ae82-25fc-4e0d-8fb0-853d3ec79904)

## 🙋‍♂️ Author

Vedant Singh - [GitHub Profile](https://github.com/geekyved)

---

⌨️ with ❤️ by Vedant Singh
