The version represents the Goreleaser version + a counter.

See https://github.com/goreleaser/goreleaser/releases

So if the Goreleaser version is `0.30.5` and this is the first version based on that:

```bash
version=0.30.5-1 make install
```

# OSX

The OSX part of the build requires the MaxOS SDK.

To obtain it, register for a developer account, then download Xcode:

https://download.developer.apple.com/Developer_Tools/Xcode_8.3.3/Xcode8.3.3.xip


Using macOS, you can mount the dmg and create the SDK tarfile with `create_osx_sdk.sh`.