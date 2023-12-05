

#define MEHAR_IS_SUPER_COOL 69

void mehar_deep_singh(int* mehar_is_cool){
    for(int i = 0; i < 1000; ++i){
        mehar_is_cool[i] += MEHAR_IS_SUPER_COOL;
    }
}

int main() {
    int v[1000];

    // Iterate through the array and double each element
    
    for (int i = 1; i < 1000; i++) {
    
        for(int j = 0; j < 1000; j++){
        
            for(int k = 0; k < 1000; k++){
                v[i-1] *= 2 + j + k;
            }

            for(int z = 0; z < 345; ++z){
                v[i-1]++;
            }
        }

        for(int mehar = 0; mehar < 384; ++mehar){
            v[i-1] += mehar;
        }
        mehar_deep_singh(v);
    }

    return 0;
}
