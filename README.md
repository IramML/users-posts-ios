# Users posts
![License](https://img.shields.io/github/license/iramml/users-posts-ios)
![Stars](https://img.shields.io/github/stars/iramml/users-posts-ios?style=social)
![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2FIramML_)
## About the project

The application was generated with [Xcode](https://developer.apple.com/xcode/). Is developed using the Swift UI. The architectural patterns I used here are MVVM and clean architecture.

In the case of the UI, the views are designed are under smart and dumb componets pattern.

The purpose of the project is to create an app that makes a list of users that are obtained from a REST service. Once the users are loaded for the first time, they will be saved locally in core data, so the next time you want to list the users, they are obtained locally from the cell phone. Being able to filter users by name.

When you select an user, a screen should be displayed where you can see the posts made by the user.

## Getting Started

### Requirements
- [Xcode](https://developer.apple.com/xcode/)
