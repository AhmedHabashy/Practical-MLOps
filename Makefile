.PHONY: install clean lint test format run

# Define a virtual environment directory

VENV_DIR = .venv
MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
# Rule to create and activate a virtual environment and install dependencies
install:
	@echo "Creating and activate virtual environment..."
	python -m venv $(VENV_DIR)
	@echo "Installing dependencies..."
	$(VENV_DIR)/Scripts/pip install -r requirements.txt

# Rule to clean up build artifacts and virtual environment
clean:
	@echo "Cleaning up"
	rm -rf $(VENV_DIR)
	@echo "Clean up complete"

# Rule for linting (using flake8 fornow, we'll install it later)
lint:
	@echo "Running linting with flake8..."
	$(VENV_DIR)/Scripts/pip install flake8
	$(VENV_DIR)/Scripts/flake8 src/

# Rule for testing 
test: 
	@echo "Running tests..."
	$(VENV_DIR)/Scripts/pip install pytest
	$(VENV_DIR)/Scripts/pytest src/test_main.py

#Rule for code formatting
format: 
	@echo "Running code formatting with Black..."
	$(VENV_DIR)/Scripts/pip install black
	$(VENV_DIR)/Scripts/black src/

#Rule to run the application
run: 
	@echo "Running application..."
	$(VENV_DIR)/Scripts/python src/main.py
