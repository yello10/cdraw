
#include "2.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void symbol_table_init(SymbolTable *table) {
    table->size = 0;
    table->capacity = SYMBOL_TABLE_INITIAL_CAPACITY;
    table->entries = (SymbolEntry *)malloc(sizeof(SymbolEntry) * table->capacity);
}

void symbol_table_destroy(SymbolTable *table) {
    for (int i = 0; i < table->size; i++) {
        free(table->entries[i].name);
    }
    free(table->entries);
}

int symbol_table_add(SymbolTable *table, const char *name) {
    // Check for duplicate entries
    for (int i = 0; i < table->size; i++) {
        if (strcmp(table->entries[i].name, name) == 0) {
            return 0; // Identifier already exists
        }
    }

    // Resize the symbol table if needed
    if (table->size == table->capacity) {
        table->capacity *= 2;
        table->entries = (SymbolEntry *)realloc(table->entries, sizeof(SymbolEntry) * table->capacity);
    }

    // Add the new identifier
    table->entries[table->size].name = strdup(name);
    table->size++;

    return 1; // Identifier added successfully
}

void symbol_table_display(SymbolTable *table) {
    printf("Symbol Table Contents:\n");
    for (int i = 0; i < table->size; i++) {
        printf("%s\n", table->entries[i].name);
    }
}

