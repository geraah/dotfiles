#!/bin/bash

wal --backend wal -i "$1" && hyprctl reload