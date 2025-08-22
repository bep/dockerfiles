This Docker file allows cross building (and releasing with [Goreleaser](https://github.com/goreleaser/goreleaser)) using CGO for Linux, MacOS and Windows. If your application does not use CGO (C or C++ bindings) you should probably use something much simpler.

## Versioning

The version represents the Go version + a counter.

So if the Go version is `1.16.0` and this is the first version based on that:

```bwiash
version=1.16.0-1 make install
```

## MacOS

The OSX part of the build requires the MaxOS SDK.

To obtain it, register for a developer account, then download Xcode:


https://developer.apple.com/download/all/


Using macOS, you can mount the dmg and create the SDK tarfile with `create_osx_sdk.sh`.
