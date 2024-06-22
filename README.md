<h1 align="center">TastyTradeAPI</h1>

<p align="center">
    <img src="https://img.shields.io/github/v/release/klou23/TastyTradeAPI" alt="release"/>
    <img src="https://img.shields.io/github/license/klou23/TastyTradeAPI" alt="license"/>
    <img src="https://img.shields.io/badge/coverage-94%25-brightgreen" alt="coverage"/>
    <br>
    <img src="https://img.shields.io/badge/Swift-5.5+-orange" alt="swift"/>
    <img src="https://img.shields.io/badge/macOS-13.0+-blue" alt="macOS"/>
    <img src="https://img.shields.io/badge/iOS-15.0+-blue" alt="iOS">
    <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen" alt="spm"/>
</p>

## Overview

TastyTradeAPI is a Swift library that provides a seamless interface to interact
with the TastyTrade brokerage API. It simplifies the process of accessing
market data, managing accounts, and executing trades on the TastyTrade platform.

## Table of Contents
- **[Features](#features)**
- **[Installation](#installation)**
- **[Quick Start](#quick-start)**
- **[API Documentation](#api-documentation)**

## Features
- Easy authentication with TastyTrade servers including automatically refreshing
  the access token when necessary
- Data models for all supported API responses
- Currently supported API routes:
  - Users and Sessions
  - Account Status

## Installation

Because TastyTradeAPI using Async/Await to simplify API calls, TastyTradeAPI
requires Swift 5.5+, and can run on the following platforms:
- iOS 15.0+
- macOS 13.0+

Installation steps:
1. Open the project you want to add TastyTradeAPI to in Xcode.
2. In the menu bar, select File > Add Package Dependencies...
3. Paste the [URL](https://github.com/klou23/TastyTradeAPI) of this repository 
   in the search field
4. Choose the version or branch you want (latest release is recommended)
5. Select the target to which you want to add TastyTradeAPI

## Quick Start

### Authentication

The first step to using TastyTradeAPI is setting up authentication. Authentication 
is done using your Tasty Trade credentials:

```swift
// Create auth object
let auth = TastyTradeAuth(
    login: "your-login-here",
    password: "your-password-here",
    rememberMe: true,
    sandbox: false
)
// Attempt to authenticate
try await auth.login()
// Tell TastyTradeAPI to use the new auth
TastyAPI.auth = auth
```

### Making Requests

After setting up authentication, requests can be made very easily using the 
methods in TastyAPI:

```swift
// Get the trading status for an account
let status = try await TastyAPI.tradingStatus(accountNumber: "12345")
```

## API Documentation

In progress...