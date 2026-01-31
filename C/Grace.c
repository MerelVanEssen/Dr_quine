#include <stdio.h>

const char *str = "#include <stdio.h>%c%cconst char *str = %c%s%c;%c%c#define PRINT(fptr, txt) fprintf(fptr,txt,10,10,34,txt,34,10,10,10,10,34,34,34,34,10,10,10,10);%c#define CLOSE(fptr) fclose(fptr);%c#define RUN int main() { FILE *fptr=fopen(%cGrace_kid.c%c, %cw%c); PRINT(fptr, str); CLOSE(fptr) };%c%c// comment%cRUN;";

#define PRINT(fptr, txt) fprintf(fptr,txt,10,10,34,txt,34,10,10,10,10,34,34,34,34,10,10,10,10);
#define CLOSE(fptr) fclose(fptr);
#define RUN int main() { FILE *fptr=fopen("Grace_kid.c", "w"); PRINT(fptr, str); CLOSE(fptr) };

// comment
RUN;