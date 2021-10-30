This Docker file allows cross building (and releasing with [Goreleaser](https://github.com/goreleaser/goreleaser)) using CGO for Linux, MacOS and Windows. If your application does not use CGO (C or C++ bindings) you should probably use something much simpler.

## Versioning

We use the [Semver Pair Encoding](https://github.com/bep/semverpair) with the Go version as the main version.


So if the Go version is `1.17.2` and this is the first version based on that:

```bwiash
version=1.1700.200 make install
```

## MacOS

The OSX part of the build requires the MaxOS SDK.

To obtain it, register for a developer account, then download Xcode:

https://download.developer.apple.com/Developer_Tools/Xcode_12.4/Xcode_12.4.xip


Using macOS, you can mount the dmg and create the SDK tarfile with `create_osx_sdk.sh`.
