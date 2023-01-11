install-python-pre-commit-hooks:
	touch .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit
	mv .git/hooks/pre-commit /tmp/pre-commit
	pre-commit install
	mkdir -p .git/hooks/pre-commit.d
	mv .git/hooks/pre-commit .git/hooks/pre-commit.d/python-pre-commit
	mv /tmp/pre-commit .git/hooks/pre-commit
	grep -qxF '#!/usr/bin/env bash' .git/hooks/pre-commit || echo '#!/usr/bin/env bash' >> .git/hooks/pre-commit
	grep -qxF './.git/hooks/pre-commit.d/python-pre-commit' .git/hooks/pre-commit || echo './.git/hooks/pre-commit.d/python-pre-commit' >> .git/hooks/pre-commit
