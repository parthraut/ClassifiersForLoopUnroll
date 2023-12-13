

#define OUR_LOVE_FOR_583 100000000


int main() {
    int v[1000];

    // Iterate through the array and double each element
    
    for (int i = 1; i < 100; i++) {
    
        for(int j = 0; j < 1000; j++){
        
            for(int k = 0; k < 1000; k++){
                v[i-1] *= 2 + j + k;
            }

            for(int z = 0; z < 345; ++z){
                v[i-1]++;
            }
        }

        for(int mehar = 0; mehar < 380; ++mehar){
            v[i-1] += mehar;
        }


        for(int mehar = 1; mehar < 500; ++mehar){
            v[mehar] = v[mehar-1] + OUR_LOVE_FOR_583;
        }
    }

    return 0;
}
