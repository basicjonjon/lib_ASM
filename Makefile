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
COMP_C_FLAG= -Wall -Werror -Wextra

COMP= nasm
COMP_FLAG= -f elf64 -Iinclude

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
	@clear
	@mkdir -p $(OBJS_FOLDER)
	@$(COMP) $(COMP_FLAG) $< -o $@
	@echo "$@ : [OK]"

#for lib
$(NAME): $(OBJS_FILES)
	@$(AR) $(AR_FLAG) $@ $^
	@echo "$@ : [READY]"

#for link
# $(NAME): $(OBJS_FILES)
# 	@$(LINKER) $(LINKER_FLAG) $< -o $@
# 	@echo "$@ : [READY]"

all: $(NAME)

clean:
	@rm -rf $(OBJS_FOLDER)
	@clear
	@echo "[OBJ DELETED]"

fclean: clean
	@rm -rf $(NAME)
	@echo "[EXE DELETED]"

re: fclean all

test: re main
	@clear
	@echo "[START] $(NAME)"
	@echo "---------------"
	@echo " "
	@./$(EXE) $(TEST_ARGS)
	@echo " "
	@echo "---------------"


main:
	@$(COMP_C) $(COMP_C_FLAG) $(MAIN) ./$(NAME) -o $(EXE)
