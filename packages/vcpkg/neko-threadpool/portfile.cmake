vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO hoshimoe/NekoThreadPool
    REF v1.0.3
    # TODO(release): replace with the real SHA512 of the v1.0.3 tarball
    SHA512 0
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DNEKO_THREAD_POOL_BUILD_TESTS=OFF
        -DNEKO_THREAD_POOL_AUTO_FETCH_DEPS=OFF
        -DNEKO_THREAD_POOL_ENABLE_MODULE=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/NekoThreadPool PACKAGE_NAME nekothreadpool)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")


