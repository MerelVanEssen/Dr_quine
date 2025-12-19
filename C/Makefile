NAME1 = Colleen
NAME2 = Grace

CC = cc
CFLAGS = -Wall -Wextra -Werror

SRC1 = Colleen.c
SRC2 = Grace.c

OBJ1 = $(SRC1:.c=.o)
OBJ2 = $(SRC2:.c=.o)

all: ${NAME1} ${NAME2}

${NAME1}: ${OBJ1}
	${CC} ${CFLAGS} ${OBJ1} -o ${NAME1}

${NAME2}: ${OBJ2}
	${CC} ${CFLAGS} ${OBJ2} -o ${NAME2}

%.o: %.c
	${CC} -c ${CFLAGS} $< -o $@

clean:
	rm -rf ${OBJ1} ${OBJ2}

fclean: clean
	rm -rf ${NAME1} ${NAME2}

re: fclean all