function git_clean
    git branch -d $argv[1]
    git push origin --delete $argv[1]
    git remote prune origin
end
