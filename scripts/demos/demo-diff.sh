#!/usr/bin/env bash

source env.sh

echo -e "Would that not be cool to be able to diff 2 runtimes ? This is precisely what the diff command does!" | $human

echo -e "We first use the get command to fetch the latest and an older version of the Polkadot runtime:" | $human
cmd="subwasm -q get --chain polkadot --output runtime_older.wasm --block 0x825e14cb9f1707f976d7873ff47ff89a307308271afb82a6febeb2b1cb3eaa7d"
echo -e "$cmd" | $human
$cmd
cmd="subwasm -q get --chain polkadot --output runtime_latest.wasm"
echo -e "$cmd" | $human
$cmd
echo -e

cmd="subwasm -q diff runtime_latest.wasm runtime_latest.wasm"
echo -e "Let's check identity first!" | $human
echo -e "$cmd" | $human
$cmd
sleep 3
echo -e

cmd="subwasm -q diff runtime_older.wasm runtime_latest.wasm"
echo -e "We can now check for the differences:" | $human
echo -e "$cmd" | $human | cut -c -120
$cmd
sleep 3

echo -e
rm -f "*.wasm"
