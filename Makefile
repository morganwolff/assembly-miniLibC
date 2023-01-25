##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile
##

CC			=	ld

SRC			= 	strlen.asm	\
				strcmp.asm 	\
				strchr.asm 	\
				strcasecmp.asm 	\
				strncmp.asm \
				strstr.asm 	\
				memset.asm 	\
				memcpy.asm 	\
				strrchr.asm \

CFLAGS		=	-shared

OBJ			=	$(SRC:.asm=.o)

NAME		=	libasm.so

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all