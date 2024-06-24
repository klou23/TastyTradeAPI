# Authentication

Setting up Authentication in TastyTradeAPI

## Overview

In order to authenticate with TastyTrade's servers, you will need to have a 
TastyTrade account. Authentication is done with your TastyTrade credentials.
TastyTradeAPI supports authentication for both real accounts and sandbox
accounts. More information about sandbox account can be found
[here](https://developer.tastytrade.com/sandbox/).

If you use the API for the first time or from a new location, your login may
fail, and you will need to verify the login came from you by following the 
email from TastyTrade.

More information on how TastyTrade's authentication works can be found in their
[API docs](https://developer.tastytrade.com/api-guides/sessions/).

## Steps

### 1. Create a new TastyTradeAuth object

The first step for authentication is creating a new instance of TastyTradeAuth 
with your credentials. Below is an example:

```swift
let auth = TastyTradeAuth(
    login: "your-login-here",
    password: "your-password-here",
    rememberMe: true
)
```

##### Remember Me

The `rememberMe` parameter determines if TastyTradeAPI request a remember token.
If a remember token is requested then the remember token will be used instead 
off the password when attempting to authenticate again.

##### Sandbox

By default, `TastyTradeAuth` will create an auth object for a sandbox account. 
If you wish to use a real account, you can set the sandbox parameter:

```swift
let auth = TastyTradeAuth(
    login: "your-login-here",
    password: "your-password-here",
    rememberMe: true,
    sandbox: false
)
```

### 2. Authenticating

After creating the TastyTradeAuth object, the ``TastyTradeAuth/login()`` method
can be used to authenticate with the TastyTrade servers. It is recommended to 
surround the call with a do-catch statement.

```swift
do {
    try await auth.login()
} catch {
    // handle the error
}
```

The most common error that will be thrown when calling
``TastyTradeAuth/login()`` is ``TastyAPI/ApiError/http401(code:message:)``,
which indicates an invalid username/password.

### 3. Setting the authentication object

After successfully authenticating your `TastyTradeAuth` object, you need to tell
TastyTradeAPI you use your newly create Auth object:

```swift
TastyAPI.auth = auth
```

After this, you should be ready to start making API calls.
