function find_no_tags  
  find ~/Dropbox/personal/notes/ -maxdepth 1 -name '*.md' -exec grep -rL '\#' {} \;
end
