#!/usr/bin/env bash

TMP=$(mktemp -d /tmp/XXXXXXXXXXX)
SDK="MacOSX10.12.sdk"

mkdir -p $TMP/$SDK/usr/include/c++

cp -rf ~/Downloads/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/$SDK $TMP &>/dev/null || true
cp -rf ~/Downloads/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1 $TMP/$SDK/usr/include/c++  || exit -1


tar -C $TMP -czf $SDK.tar.gz $SDK
 