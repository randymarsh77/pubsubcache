// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "PubSubCache",
	products: [
		.library(
			name: "PubSubCache",
			targets: ["PubSubCache"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/randymarsh77/scope", .branch("master")),
	],
	targets: [
		.target(
			name: "PubSubCache",
			dependencies: ["Scope"]
		),
	]
)
