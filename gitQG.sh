#!/bin/bash
## GIT QUIK

TYPE=$1
OWNER=$2
NAME=$3
README=$4

if [ -z "$1" ]; then 
	echo "Usage: $0 n/e <NEW>or<EXIST> dnt/t <REPO OWNER> <REPO NAME> <README MESSAGE>"
	exit
fi

#dnt
if [ $2=="dnt" ]; then 
	$OWNER="defnottrendy"
	echo "<REPO OWNER> is $OWNER"
fi
#t
if [ $2=="t" ]; then 
	$OWNER="trendy77"
	echo "<REPO OWNER> is $OWNER"
fi
# new or existing?
if [ $1 == "n" ]; then 
	newGit
fi
if [ $1 == "e" ]; then 
	existinGit
fi

function existinGit{
# For push an existing repository from the command line
git remote add origin https://github.com/$OWNER/$3.git
git push -u origin master	
}

function newGit{
echo $4 >> README.md
git init
git add README.md
git commit -m "First Commit INIT - $3 ... $4"
git remote add origin https://github.com/$OWNER/$3.git
git push -u origin master
}

