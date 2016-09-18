#!/bin/sh
plink -C -D 8888 -N -pw $Password $Username@$Server << EOF
y
EOF
