set -x

swift build --swift-sdk DEVELOPMENT-SNAPSHOT-2025-01-06-a-wasm32-unknown-wasi -Xswiftc -Xclang-linker -Xswiftc -mexec-model=reactor -Xlinker --export=__main_argc_argv
