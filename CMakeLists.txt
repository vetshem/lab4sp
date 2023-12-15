cmake_minimum_required(VERSION 3.10)

project(calculator_proj)

# Встановлюємо стандарт C++
set(CMAKE_CXX_STANDARD 11)

# Знаходимо всі файли cpp в папці src нашого проекта
file(GLOB SOURCE_FILES "${CMAKE_SOURCE_DIR}/src/*.cpp")

# Тут я вирішив, що зроблю динамічну бібліотеку і відмовлюсь від ідеї створювати каталог з об'єктниками
# Динамічна бібліотека
add_library(calculator_lib SHARED ${SOURCE_FILES})
set(LIB_PATH "${CMAKE_BINARY_DIR}/libcalculator.so")
set_target_properties(calculator_lib PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${LIB_PATH})

# Назва виконуваного файлу
add_executable(calculator ${SOURCE_FILES})

# Вказуємо шлях до бібліотеки
target_link_libraries(calculator PRIVATE ${LIB_PATH})

# Генерація файла rules.ninja та build.ninja для системи збирання Ninja
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
