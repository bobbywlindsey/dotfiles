function jn-connect
    ssh -N -L localhost:8888:localhost:8889 bobby@$argv[1] -p 22222
end
