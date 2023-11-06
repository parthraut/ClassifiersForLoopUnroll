#include <vector>

int main() {
    std::vector<int> v(1000, 1);

    // Iterate through the array and double each element
    for (int i = 1; i < 1000; i++) {
        v[i-1] *= 2;
    }

    return 0;
}