#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define OPENFILE(name) fopen(name, "w")
#define NL 10
#define QUOTE 34

const char *str = "#include <stdio.h>%c#include <string.h>%c#include <stdlib.h>%c%c#define OPENFILE(name) fopen(name, %cw%c)%c#define NL 10%c#define QUOTE 34%c%cconst char *str = %c%s%c;%c%cint main() {%cchar execute[] = %cgcc -Wall -Wextra -Werror Sully_X.c -o Sully_X%c;%cchar run[] = %c./Sully_X%c;%cchar file[] = %cSully_X.c%c;%cint nr = %c;%cexecute[32] = nr + 48;%crun[8] = nr + 48;%cexecute[45] = nr + 48;%cfile[6] = nr + 48;%cFILE *fptr = OPENFILE(file);%cif (!fptr) return (1);%cfprintf(fptr,str,NL,NL,NL,NL,QUOTE,QUOTE,NL,NL,NL,NL,QUOTE,str,QUOTE,NL,NL,NL,QUOTE,QUOTE,NL,QUOTE,QUOTE,NL,QUOTE,QUOTE,NL,nr+48-1,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL);%cfclose(fptr);%cif (nr == 0) return (0);%cif (system(execute) != 0) return (1);%cif (system(run) != 0) return (1);%creturn (0);%c}%c";

int main() {
char execute[] = "gcc -Wall -Wextra -Werror Sully_X.c -o Sully_X";
char run[] = "./Sully_X";
char file[] = "Sully_X.c";
int nr = 5;
execute[32] = nr + 48;
run[8] = nr + 48;
execute[45] = nr + 48;
file[6] = nr + 48;
FILE *fptr = OPENFILE(file);
if (!fptr) return (1);
fprintf(fptr,str,NL,NL,NL,NL,QUOTE,QUOTE,NL,NL,NL,NL,QUOTE,str,QUOTE,NL,NL,NL,QUOTE,QUOTE,NL,QUOTE,QUOTE,NL,QUOTE,QUOTE,NL,nr+48-1,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL,NL);
fclose(fptr);
if (nr == 0) return (0);
if (system(execute) != 0) return (1);
if (system(run) != 0) return (1);
return (0);
}
