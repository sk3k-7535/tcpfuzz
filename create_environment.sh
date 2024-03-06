git -C picotcp apply -v --whitespace=fix --check --stat ../picotcp.patch
cd picotcp
make TAP=1
cd ..
./buildecho.sh
