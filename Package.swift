// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoxOffices",
    platforms: [.iOS(.v15)], // init 버전 설정 
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library( // 임포트할수이쓴 녀석
            name: "BoxOffices",
            targets: ["BoxOffices"]),
       // .executable(name: <#T##String#>, targets: <#T##[String]#>) // 실행파일만드는거임
    ],
    dependencies: [
  //      .package(url: , from)
    ],
    targets: [ // 여러 타겟추가
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BoxOffices"), // 이름
        .testTarget(
            name: "BoxOfficesTests",
            dependencies: ["BoxOffices"]),
    ]
)
