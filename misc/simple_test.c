
int main(){
    int sum = 0;
    
    for(int i = 0; i < 100; ++i){
        sum += i;
    }

    for(int j = 0; j < 100; ++j){
        for(int k = 0; k < 100; ++k){
            for(int l = 0; l < 100; ++l){
                sum += l;
            }
        }
    }
}