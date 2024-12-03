#!/usr/bin/env sh

git config --global user.email "27835+wrobbins@users.noreply.github.com"
git config --global user.name "wrobbins"

git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global merge.conflictStyle zdiff3

git config --global delta.navigate true
git config --global delta.dark true
git config --global delta.side-by-side true
git config --global delta.line-numbers true
