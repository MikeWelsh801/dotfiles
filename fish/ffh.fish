function ffh
    ssh "$argv[1]@$argv[2]" -X -t "fish -l"
end
