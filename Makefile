# Компілятор C++
CXX = g++
# Флаги компіляції (Wall - показувати всі предупреждення, Wextra - показувати додаткові предупреждення, std=c++11 - використовувати стандарт C++11)
CXXFLAGS = -Wall -Wextra -std=c++11
# Каталог із вихідними файлами (cpp)
SRC_DIR = ./src
# Каталог для об'єктних файлів
OBJ_DIR = ./obj

# Знаходимо всі файли cpp в папці src нашого проекта
SOURCE_FILES = $(wildcard $(SRC_DIR)/*.cpp)
# Визначаємо об'єктні файли (замінюємо cpp на o)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SOURCE_FILES))
# Архів (статична бібліотека)
LIB = libcalculator_lib.a
# Назва виконуваного файлу
TARGET = calculator

# Все, що буде виконано, якщо просто написати make без аргументів
all: $(TARGET)

# Лінкування виконуваного файлу
$(TARGET): $(OBJ_FILES) $(LIB)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ_FILES) -L. -lcalculator_lib

# Компіляція кожного cpp файлу у відповідний об'єктний файл
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)  # Створення каталогу для об'єктних файлів, якщо його не існує
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Створення архіву з об'єктним файлом
$(LIB): $(OBJ_DIR)/calculator.o
	ar rcs $@ $^

# Правило для очищення вихідних та тимчасових файлів
clean:
	rm -rf $(OBJ_DIR) $(TARGET) $(LIB)
