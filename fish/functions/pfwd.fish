function pfwd
    ssh -fNT -L "127.0.0.1:$argv[2]:127.0.0.1:$argv[2]" "$argv[1]"
end
