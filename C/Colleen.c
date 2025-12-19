#include <stdio.h>

const char *str = "#include <stdio.h>%c%cconst char *str = %c%s%c;%c%c// comment outside%c%cvoid print(const char *prt) { printf(prt,10,10,34,prt,34,10,10,10,10,10,10,10,9,10,9,10,9,10,10); }%c%cint main(void) {%c%c// comment inside%c%cprint(str);%c%creturn (0);%c}%c";

// comment outside

void print(const char *prt) { printf(prt,10,10,34,prt,34,10,10,10,10,10,10,10,9,10,9,10,9,10,10); }

int main(void) {
	// comment inside
	print(str);
	return (0);
}
