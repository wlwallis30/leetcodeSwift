# Leetcode Swift	 
Leetcode swift for MacOS, arrange problems in a group fashion.

## Installation
This repository is migrated to use XCodeGen, which is to avoid merging of .pbxproj step, you need to install XCodeGen first:

```shell
git clone https://github.com/yonaskolb/XcodeGen.git
cd XcodeGen
make
```
Then, make sure that you've installed the latest version of XCode command line tool:
```shell
xcode-select --install
```
Having done all, before you can open the workspace, you have to call the following command:
```shell
xcodegen && pod install
```
And you should be able to run the project properly.
Contact @wlwallis30 if needed.
