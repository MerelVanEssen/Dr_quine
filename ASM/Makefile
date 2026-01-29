NAME1 = Colleen
NAME2 = Grace
NAME3 = Sully

ASM = nasm 
ASMFLAGS = -f elf64

CC = gcc

SRC1 = Colleen.s
SRC2 = Grace.s
SRC3 = Sully.s
OBJ1 = $(SRC1:.s=.o)
OBJ2 = $(SRC2:.s=.o)
OBJ3 = $(SRC3:.s=.o)

all: ${NAME1} ${NAME2} ${NAME3}

${NAME1}: ${OBJ1}
	${CC} ${OBJ1} -o ${NAME1}

${NAME2}: ${OBJ2}
	${CC} ${OBJ2} -o ${NAME2}

${NAME3}: ${OBJ3}
	${CC} ${OBJ3} -o ${NAME3}

%.o: %.s 
	${ASM} ${ASMFLAGS} $< -o $@

clean:
	rm -f ${OBJ1} ${OBJ2} ${OBJ3}

fclean: clean
	rm -rf ${NAME1} ${NAME2} Grace_kid.s ${NAME3} Sully_*

re: fclean all
