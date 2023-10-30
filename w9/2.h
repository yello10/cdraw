
#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#define SYMBOL_TABLE_INITIAL_CAPACITY 16

typedef struct {
    char *name;
} SymbolEntry;

typedef struct {
    SymbolEntry *entries;
    int size;
    int capacity;
} SymbolTable;

void symbol_table_init(SymbolTable *table);
void symbol_table_destroy(SymbolTable *table);
int symbol_table_add(SymbolTable *table, const char *name);
void symbol_table_display(SymbolTable *table);

#endif // SYMBOL_TABLE_H
