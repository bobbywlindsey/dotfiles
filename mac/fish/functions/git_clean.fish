function git_clean
    git branch -d $argv[0]
    git push origin --delete $argv[0]
    git remote prune origin
end
