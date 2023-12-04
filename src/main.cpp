#include <iostream>
#include <stdlib.h>
#include "sort_method.h"

using namespace std;

int main() {
    SortX sortX;
    vector<int> a = {3, 1, 2};
    sortX.insertSort(a);
    for (int i = 0; i < a.size(); i++) {
        cout << a[i] << " "; 
    }
    cout << endl;
    return 0;
}