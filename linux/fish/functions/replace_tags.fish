function replace_tags
  find ~/Dropbox/personal/notes/ -name '*.md' -exec sed -i -e "s/\#$argv[1]/\#$argv[2]/g" {} \;
end
