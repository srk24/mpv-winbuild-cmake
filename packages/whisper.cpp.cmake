ExternalProject_Add(whisper.cpp
    DEPENDS
        vulkan
    GIT_REPOSITORY https://github.com/ggml-org/whisper.cpp.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    GIT_REMOTE_NAME origin
    GIT_TAG master
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} CONF=1 cmake -H<SOURCE_DIR> -B<BINARY_DIR>
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE}
        -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX}
        -DCMAKE_FIND_ROOT_PATH=${MINGW_INSTALL_PREFIX}
        -DBUILD_SHARED_LIBS=OFF
        -DWHISPER_BUILD_TESTS=OFF
        -DWHISPER_BUILD_EXAMPLES=OFF
        -DGGML_NATIVE=OFF
        -DGGML_AVX=ON
        -DGGML_AVX2=ON
        -DGGML_FMA=ON
        -DGGML_F16C=ON
        -DGGML_VULKAN=ON
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(whisper.cpp)
cleanup(whisper.cpp install)
