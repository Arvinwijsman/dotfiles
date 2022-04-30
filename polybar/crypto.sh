#!/bin/sh

quote=$(curl -sf 'https://ftx.com/api/markets/BTC-PERP' | sed -E 's/.*"last":"?([^,"]*)"?.*/\1/')
quote=$(LC_NUMERIC="en_US.UTF-8" LANG=C printf "%.1f" "$quote")

echo "BTC $quote "
