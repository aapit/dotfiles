#!/bin/bash
for f in *.md; do mv "$f" `echo "$f" | sed 's/ /\\_/g'`; done
