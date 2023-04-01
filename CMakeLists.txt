cmake_minimum_required(VERSION 3.16)

project(RollCall VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 获取添加.cpp与.h文件
file(GLOB_RECURSE CPP_FILES *.cpp *.h)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

# message("test: ${CMAKE_CURRENT_SOURCE_DIR}")

qt_add_executable(appRollCall
    ${CPP_FILES}
    ./Resources/Resource.qrc
)

# 获取添加.qml文件
file(GLOB_RECURSE QmlFiles *.qml)
# 将QmlFiles列表中各元素的绝对路径更改为相对路径
foreach(element ${QmlFiles})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" qmlfile ${element})
    list(APPEND QMLFiles ${qmlfile})
endforeach(element)
# 去重
list(REMOVE_DUPLICATES QMLFiles)

foreach(element ${QMLFiles})
    message("qml file:${element}")
endforeach(element)

# 获取添加.qml文件
file(GLOB_RECURSE ImgFiles *.png *.svg *.jpg)
# 将QmlFiles列表中各元素的绝对路径更改为相对路径
foreach(element ${ImgFiles})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" imgfile ${element})
    list(APPEND IMGFiles ${imgfile})
endforeach(element)
# 去重
list(REMOVE_DUPLICATES IMGFiles)

message("source dir: ${CMAKE_CURRENT_SOURCE_DIR}")
foreach(element ${IMGFiles})
    message("image file:${element}")
endforeach(element)

qt_add_qml_module(appRollCall
    URI RollCall
    VERSION 1.0
    QML_FILES
        ${QMLFiles}
    RESOURCES
        ${IMGFiles}
#        Resources/Themes/ThemeBase.qml
#        Resources/Themes/Dark.qml
#        Resources/Themes/Light.qml
#        Resources/Themes/OneDark.qml
#        Resources/MyButton.qml
#        Resources/ThemeManager.qml
)
#qt_add_qml_module(appRollCall
#    URI Themes
#    VERSION 1.0
#    RESOURCES
#        qrc:/themes/Themes/Dark.qml
#        qrc:/themes/Themes/Light.qml
#        qrc:/themes/Themes/OneDark.qml
#        qrc:/themes/Themes/ThemeBase.qml
#        qrc:/themes/Themes/ThemeManager.qml
#)

list(APPEND QML_DIRS "qrc:/themes")
set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "")

set_target_properties(appRollCall PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRollCall
    PRIVATE Qt6::Quick)

install(TARGETS appRollCall
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

qt_generate_deploy_qml_app_script(
    TARGET appRollCall
    FILENAME_VARIABLE deploy_script
    MACOS_BUNDLE_POST_BUILD
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${deploy_script})
