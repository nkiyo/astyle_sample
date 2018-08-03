#include <stdio.h>

namespace unk {

class DummyClass {
public:
    int func(int x, int y);
    int func2(const int& x, int *y);
private:
    int x_;
    double y_;
};

/**
 * サンプル関数
 * @param x hoge
 * @param y hage
 * @return hhhh
 */
void DummyClass::func(int x,
                      int y) {
    x += 2;
    y = 0 + y;
    int z = x + y; /* てすと */
    return z; // てすと
}

/************
 * hoge
 * @author nkiyo
 * @date 2018-08-03
 *************/
int main() {
    DummyClass *dc = new DummyClass();
    dc->func(1, 1);
    printf("hello\n");
}

}
int DummyClass::func2(const int& x, int *y) {
    if(x > 1)
        return (x + y);
    printf("hoge\n");
    if(x <= 0) {
        return 0;
    }
}

