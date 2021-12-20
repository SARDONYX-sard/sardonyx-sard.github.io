HUGO?=hugo
GIT?=git
THEME=eureka

THEME_PATH=themes/$(THEME)
BLOG_PATH=docs

SOURCE_ORIGIN=git@github.com:SARDONYX-sard/sardonyx-sard.github.io.git
BLOG_ORIGIN=$(SOURCE_ORIGIN)
THEME_ORIGIN=git@github.com:wangchucheng/hugo-eureka.git

PW_CMD := powershell "Get-Date -UFormat '+%Y-%m-%d %H:%M:%S UTC'"
TODAY := $(shell $(PW_CMD))

default: preview

preview:
				$(HUGO) server -D -vw -t $(THEME) -d $(BLOG_PATH)

build:
				$(HUGO) -v -t $(THEME)

deploy:
				$(HUGO) -v -t $(THEME) --minify -d $(BLOG_PATH)
				cd $(BLOG_PATH) && \
								$(GIT) add -A && \
								$(GIT) commit -m "Site updated at `$(TODAY)`" && \
								$(GIT) push origin main
				$(GIT) add $(BLOG_PATH)
				$(GIT) commit -m 'update submodule'
				$(GIT) push origin main


.PHONY: preview build deploy
