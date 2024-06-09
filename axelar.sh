#!/bin/bash

RPC_URL="https://tm.axelar.lava.build/lava-referer-22b903a3-4ff1-4af6-b155-c61837306d5b/"

OUTPUT_DIR="logs"

axelar_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"
    
    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
