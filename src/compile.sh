g++ -c -I utils/ main.cpp -o main.o -std=c++11
g++ -c -I utils/ utils/sort_method.cpp -o utils/sort_method.o -std=c++11
g++ utils/sort_method.o main.o -o main.out
