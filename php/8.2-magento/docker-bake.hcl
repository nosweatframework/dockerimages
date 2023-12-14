group "default" {
    targets = [
        "default"
    ]
}
target "default" {
    context="."
    dockerfile="Dockerfile"
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
    tags = [
        "nosweatcloud/php:8.2.13-magento"
        "nosweatcloud/php:8.2-magento"
    ]
}
