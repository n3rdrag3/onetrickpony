#!/bin/bash

# TODO Create ASCII logo

if [[ $1 == '' ]] || [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
        echo "1) Usage - ./megplus.sh -s <single host>"
        echo
        echo "1) Example: ./otp.sh -s example.com"
        exit 1
fi

