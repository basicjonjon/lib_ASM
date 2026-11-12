NAME= putnbr
TEST_ARGS=

ASM_FILES= main 

COMP= nasm
COMP_FLAG= -f elf64 -Iinclude

LINKER= ld
LINKER_FLAG=

OBJS_FOLDER= obj
SRCS_FOLDER= src

OBJ_EXT= .o
SRC_EXT= .s

OBJS_FILES= $(addprefix $(OBJS_FOLDER)/, $(addsuffix $(OBJ_EXT),$(ASM_FILES)))

$(OBJS_FOLDER)/%$(OBJ_EXT): $(SRCS_FOLDER)/%$(SRC_EXT)
	@clear
	@mkdir -p $(OBJS_FOLDER)
	@$(COMP) $(COMP_FLAG) $< -o $@
	@echo "$@ : [OK]"

$(NAME): $(OBJS_FILES)
	@$(LINKER) $(LINKER_FLAG) $< -o $@
	@echo "$@ : [READY]"

all: $(NAME)

clean:
	@rm -rf $(OBJS_FOLDER)
	@clear
	@echo "[OBJ DELETED]"

fclean: clean
	@rm -rf $(NAME)
	@echo "[EXE DELETED]"

re: fclean all

test: re
	@clear
	@echo "[START] $(NAME)"
	@echo "---------------"
	@echo " "
	@./$(NAME) $(TEST_ARGS)
	@echo " "
	@echo "---------------"

