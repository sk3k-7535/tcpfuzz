# sample setup

## virtualBox

- two machines (fuzzer vs target)
	- e.g. with ubuntu 22.04 server
	- e.g. with common [shared folder](https://gist.github.com/estorgio/0c76e29c0439e683caca694f338d4003)
- same network for both VMs
	- [YT Video](https://www.youtube.com/watch?v=vReAkOq-59I)
	- create network
		- VBox: Tool/...-Menu/Network/Nat Networks
		- Create / Properties -> e.g.:
			- Name: FuzzNetwork 
			- IPv4 Prefix: 192.168.11.0/24 (= SubnetMask 255.255.255.0)
	- connecting VMs to network: 
		- Settings / Network
		- Adapter N: Enable Network Adapter
			- Attached to: NAT Network
			- Name: FuzzNetwork
	- SSH host -> VM:
		- network settings from create network
		- port forwarding
		- host port: 2222 (e.g.), guest port: 22, guest ip: check in vm (ifconfig), host ip can be left empty
- setup tcpfuzzer
	- `git clone --recurse-submodules https://github.com/sk3k-7535/tcpfuzz.git`
	- check network adapter name (e.g. `ifconfig` or `ip a`)
	- edit `create_nic.sh`: change `enp0s3` to your network adapter
	- set network settings with `.\create_nic.sh`
	- check IP address of target
	- edit `echotc.c`: set SERVER_IP to target IP address
	- build with `.\buildecho.c`
	- fuzz with `.\fuzz.sh`
	- on target, `tshark -i <network interface name>` can log traffic

Question: 
- why do I get so many `./fuzz.sh: line 3: ./echotc.elf: Permission denied`?
- how to read the actual package content and what happens with it / should happen with it? (framework)