# Variables de chemins
BIN_DIR = $(HOME)/.local/bin
MAN_DIR = $(HOME)/.local/share/man/man1

# Noms des fichiers
EXEC = as09
MAN_SRC = as09.man
MAN_DEST = as09.1

.PHONY: install clean_install help

help:
	@echo "Options disponibles :"
	@echo "  make install       - Installe le binaire et la page man dans ~/.local"
	@echo "  make clean_install - Supprime les fichiers installés"

install:
	@echo "Installation de $(EXEC) dans $(BIN_DIR)..."
	mkdir -p $(BIN_DIR)
	cp $(EXEC) $(BIN_DIR)/
	chmod +x $(BIN_DIR)/$(EXEC)
	
	@echo "Installation du manuel dans $(MAN_DIR)..."
	mkdir -p $(MAN_DIR)
	cp $(MAN_SRC) $(MAN_DIR)/$(MAN_DEST)
	
	@echo "Mise à jour de la base de données man..."
	mandb -q
	@echo "Installation terminée."

clean_install:
	@echo "Suppression de l'installation locale..."
	rm -f $(BIN_DIR)/$(EXEC)
	rm -f $(MAN_DIR)/$(MAN_DEST)
	@echo "Nettoyage terminé."
