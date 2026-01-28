NAME1 = Colleen
NAME2 = Grace

ASM = nasm 
ASMFLAGS = -f elf64

CC = gcc

SRC1 = Colleen.s
SRC2 = Grace.s
OBJ1 = $(SRC1:.s=.o)
OBJ2 = $(SRC2:.s=.o)

all: ${NAME1} ${NAME2}

${NAME1}: ${OBJ1}
	${CC} ${OBJ1} -o ${NAME1}

${NAME2}: ${OBJ2}
	${CC} ${OBJ2} -o ${NAME2}

%.o: %.s 
	${ASM} ${ASMFLAGS} $< -o $@

clean:
	rm -f ${OBJ1} ${OBJ2}

fclean: clean
	rm -rf ${NAME1} ${NAME2}

re: fclean all
