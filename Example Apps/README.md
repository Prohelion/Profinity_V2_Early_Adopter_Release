# Profinity API Example Applications

This repository contains two example applications that demonstrate the integration capabilities of the Profinity API:

1. **Battery Charging Station (Web Application)**
2. **Vehicle Dashboard (Mobile Application)**

## Battery Charging Station (Web Application)

A web application that demonstrates how to integrate Profinity APIs with Square's payment processing system to create a battery-powered charging station. The application monitors battery pack usage through Profinity's APIs and processes payments using Square's APIs for the consumed power.

![Battery Charging Station Screenshot](Charge%20for%20Power%20using%20Square%20(Web)/public/screen-shot.png)

### Key Features
- Real-time monitoring of battery pack status and power consumption
- Secure payment processing through Square
- User-friendly interface for both station operators and customers
- Detailed logging of power consumption and associated costs

[View detailed documentation](Charge%20for%20Power%20using%20Square%20(Web)/README.md)

## Vehicle Dashboard (Mobile Application)

A cross-platform mobile application built with React Native and Expo that demonstrates how to connect to and use Profinity APIs. The app provides real-time access to WaveSculptor and BMS information, offering a simple vehicle monitoring solution.

<table>
  <tr>
    <td width="50%">
      <img src="Vehicle%20Dashboard%20(Android%20&%20iOS%20Mobile%20App)/assets/login-screen-shot.png" alt="Login Screen" width="100%">
      <p align="center"><strong>Login Screen</strong></p>
    </td>
    <td width="50%">
      <img src="Vehicle%20Dashboard%20(Android%20&%20iOS%20Mobile%20App)/assets/dashboard-screen-shot.png" alt="Dashboard Screen" width="100%">
      <p align="center"><strong>Dashboard Screen</strong></p>
    </td>
  </tr>
</table>

### Key Features
- Cross-platform support (Android & iOS)
- Real-time vehicle data monitoring
- WaveSculptor and BMS information integration
- User authentication and secure access
- Modern, responsive user interface

[View detailed documentation](Vehicle%20Dashboard%20(Android%20&%20iOS%20Mobile%20App)/README.md)

## Getting Started

Each example application has its own detailed documentation and setup instructions. Please refer to the respective README files in each application's directory for specific setup and running instructions.

## Prerequisites

Common prerequisites for both applications:
- Node.js (v14 or later)
- Yarn (recommended) or npm
- Profinity API access credentials
- A running Profinity instance

Additional requirements for the Vehicle Dashboard:
- Expo CLI
- For iOS development: Xcode (Mac only)
- For Android development: Android Studio

Additional requirements for the Battery Charging Station:
- Square API credentials

## License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## Support

For support, please contact Prohelion Support via our website at [www.prohelion.com](https://www.prohelion.com) 