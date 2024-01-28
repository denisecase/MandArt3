# Developer Notes

## Keeping Tools Updated

All at once with brew upgrade, or provide just the name or names of those you want to upgrade.

```shell
brew update
brew upgrade
brew upgrade periphery powershell swiftformat-for-xcode
```

## Formatting and Linting

```
swiftformat Sources/MandArt3 --config .swiftformat
swiftlint --fix --config .swiftlint.yml Sources/MandArt3
```

## Periphery

First, build, then run:

```
xcodebuild -scheme MandArt3 -destination 'platform=macOS' -derivedDataPath 'DerivedData' clean build

periphery scan --skip-build --index-store-path 'DerivedData/MandArt3/Index.noindex/DataStore/'
```

