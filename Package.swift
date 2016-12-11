import PackageDescription

let package = Package(
    name: "PubSubCache",
    dependencies: [
		.Package(url: "https://github.com/randymarsh77/scope", majorVersion: 1),
	]
)
