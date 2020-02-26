The version represents the Go version + a counter.

So if the Go version is `1.13.7` and this is the first version based on that:

```bash
version=1.13.7-1 make install
```

# OSX

The OSX part of the build requires the MaxOS SDK.

To obtain it, register for a developer account, then download Xcode:

https://download.developer.apple.com/Developer_Tools/Xcode_8.3.3/Xcode8.3.3.xip


Using macOS, you can mount the dmg and create the SDK tarfile with `create_osx_sdk.sh`.