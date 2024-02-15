CC := clang
CFLAGS := -std=c17 -O0 -g -Wall -Wextra -Wpedantic -Wstrict-aliasing -Werror=vla
INCFLAGS := -I.
LDFLAGS := ""

SRC := $(shell find -name "*.c")
OBJ := $(SRC:./%.c=%.o)
BIN := bin
EXE := practice

.PHONY:
build: ./$(BIN) $(OBJ)
	$(CC) ./$(BIN)/$(OBJ) -o ./$(BIN)/$(EXE)

%.o: %.c
	$(CC) -o ./$(BIN)/$@ -c $< $(CFLAGS) $(INCFLAGS)

./$(BIN):
	mkdir -p ./$(BIN)

.PHONY:
run:
	@./$(BIN)/$(EXE)

.PHONY:
print:
	@echo SRC $(SRC)
	@echo OBJ $(OBJ)
	@echo BIN $(BIN)
	@echo EXE $(EXE)