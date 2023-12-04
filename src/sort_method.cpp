#include "sort_method.h"

void SortX::insertSort(vector<int> &slice) {
    int key = 0;
    for (int i = 1; i < slice.size(); i++) {
        key = slice[i];
        int j = i - 1;
        while (j >= 0 && slice[j] > key) {
            slice[j + 1] = slice[j];
            j = j - 1;
        }
        slice[j + 1] = key;
    }
    return;
}

