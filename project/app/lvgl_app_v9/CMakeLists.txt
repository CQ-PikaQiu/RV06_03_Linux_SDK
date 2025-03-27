cmake_minimum_required(VERSION 3.10)
project(lvgl)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
add_compile_options(-fPIC -Wall -Wno-error -O2 -g)
set(CMAKE_C_STANDARD 99)#C99 # lvgl officially support C99 and above
set(CMAKE_CXX_STANDARD 17)#C17
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(PROJECT_NAME lvgl_app_v9)

file(GLOB GUI_GUIDER_SRC 
    gui-guider/generated/*.c
    gui-guider/generated/guider_fonts/*.c
    gui-guider/custom/*.c
    )

set(GUI_GUIDER_INC
        gui-guider/
        gui-guider/custom/
        gui-guider/generated/
        gui-guider/generated/guider_fonts/
        gui-guider/generated/guider_customer_fonts
        gui-guider/generated/images
        gui-guider/generated/mPythonImages
    )


add_subdirectory(lvgl)
target_include_directories(lvgl PUBLIC 
                ${PROJECT_SOURCE_DIR}
                ${GUI_GUIDER_INC}
                )

add_executable(${PROJECT_NAME} main.c mouse_cursor_icon.c ${GUI_GUIDER_SRC})

target_link_libraries(${PROJECT_NAME} 
            lvgl 
            lvgl::examples 
            lvgl::demos 
            lvgl::thorvg 
            m 
            pthread
            )
