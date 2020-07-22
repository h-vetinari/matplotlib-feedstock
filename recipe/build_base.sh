#!/bin/bash

cat <<EOF > setup.cfg
[directories]
basedirlist = $PREFIX

[packages]
tests = False
toolkit_tests = False
sample_data = False

[libs]
system_freetype = False

EOF

cat setup.cfg
sed -i.bak "s|/usr/local|${PREFIX}|" setupext.py

if [[ "$target_platform" == linux* ]]; then
  export AR=$GCC_AR
  export RANLIB=$GCC_RANLIB
fi

$PYTHON -m pip install . --no-deps -vv
