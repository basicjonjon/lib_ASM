NAME= libasm.a
EXE= libasm
TEST_ARGS=


MAIN= main.c
FILES= ft_strlen \
		ft_strcpy \
		ft_strcmp \
		ft_write \
		ft_read \
		ft_strdup

COMP_C= cc
COMP_C_FLAG= -Wall -Werror -Wextra -Iinclude -Lsrc

COMP= nasm
COMP_FLAG= -f elf64 

AR= ar rcs
AR_FLAG=

LINKER= ld
LINKER_FLAG=

OBJS_FOLDER= obj
SRCS_FOLDER= src

OBJ_EXT= .o
SRC_EXT= .s

OBJS_FILES= $(addprefix $(OBJS_FOLDER)/, $(addsuffix $(OBJ_EXT),$(FILES)))

$(OBJS_FOLDER)/%$(OBJ_EXT): $(SRCS_FOLDER)/%$(SRC_EXT)
	@mkdir -p $(OBJS_FOLDER)
	@$(COMP) $(COMP_FLAG) $^ -o $@
	@echo "$^ : [OK]"

#for lib
$(NAME): $(OBJS_FILES)
	@$(AR) $(AR_FLAG) src/$@ $^
	@echo "$@ : [READY]"

#for link
# $(NAME): $(OBJS_FILES)
# 	@$(LINKER) $(LINKER_FLAG) $< -o $@
# 	@echo "$@ : [READY]"

all: re main test

re: fclean $(NAME) 

main:
	@$(COMP_C) $(COMP_C_FLAG) $(MAIN) ./src/$(NAME) -o $(EXE)
	@echo "test : $(EXE) : [OK]"

test: re main
	@echo "[START] $(NAME)"
	@echo " "
	@./$(EXE) $(TEST_ARGS)

clean:
	@rm -rf $(OBJS_FOLDER)
	@clear
	@echo "[OBJ DELETED]"

fclean: clean
	@rm -rf src/$(NAME)
	@rm -rf $(EXE)
	@echo "[EXE DELETED]"


.PHONY: all re main test clean fclean