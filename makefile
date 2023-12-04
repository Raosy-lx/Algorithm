INCLUDE =./include
SRC = ./src
OBJ = ./obj
BIN = ./bin
# 4个文件目录

SRC_EXT = cpp
rwildcard = $(foreach d, $(wildcard $1*), $(call rwildcard, $d/, $2) $(filter $2, $d))

SOURCES = $(call rwildcard,  $(SRC), %.$(SRC_EXT))
# wildcard 函数 产生一个所有以.c .cpp结尾的文件列表，存入SOURCES
# 得到SRC目录下的源文件列表，包含目录项

OBJS = $(patsubst %.cpp, $(OBJ)/%.o, $(notdir $(SOURCES)))
# 创建目标文件列表
# notdir去除源文件列表的目录信息，SRC里的文件名列表将只有文件名
# 例：./src/a.c → a.c → ./obj/a.o
# (patsubst %.src , %.dst , $(dir))
# 把 dir中变量 src后缀的替换为 dst后缀 %匹配0或若干字符

TARGET = main
BIN_TARGET = ${BIN}/${TARGET}
# 创建可执行文件 main


XX = g++
CC = gcc
# 编译器信息

CFLAGS = -Wall -g -O -I$(INCLUDE) -std=c++11
# 配置编译器设置 
# -Wall输出警告信息 
# -O编译时优化 
# -g编译debug版本
# -I$(INCLUDE): $(INCLUDE)作为第一个寻找头文件的目录

LIBS = -lm
# 使用的函数库，在默认Lib中找寻lm.so动态库
# 如果gcc编译选项加入-static则是lm.a静态库
# -L + 目录 可以指定第一个找寻库文件目录

$(BIN_TARGET): $(OBJS)
	$(XX) -o $@  $^
# 用所有的目标文件生成目的可执行文件
# 内部变量 $@ 为当前规则的目的文件名 此处等价于 ${TARGET}
# $^ 表示所有的依赖文件 此处等价于 ${OBJS}
# $< 表示第一个依赖文件
# $? 表示比目标还要新的依赖文件列表
# 依赖文件：是生成目标依赖的文件或目标

$(OBJ)/%.o: $(SRC)/%.cpp
	$(XX) -c $(CFLAGS) -o $@ $<
# 通过源文件生成各个目标文件
# $< 此处等价于 $(SRC)/%.c

.PHONY: clean
# clean是伪文件，make过程不会生成

clean:
	rm -f $(BIN_TARGET) $(OBJS)
# 清除生成的目标文件和可执行文件