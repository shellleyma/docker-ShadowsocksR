echo "========================================================================"
echo " You can now connect to this ShadowSocksR server at port: $SS_SERVER_PORT "
echo " timeout: $SS_TIMEOUT  protocol: $SS_PROTOCOL , $SS_PROTOCOLP  obfs: $SS_OBFS , $SS_OBFSP "
echo " encryption method: $SS_METHOD  redirect: $SS_REDIRECT  dnsv6: $SS_DNSIPV6 "
echo " Please remember the password: $SS_PASSWORD "
echo "========================================================================"

cd ~/vpnserver
./vpnserver start
cd ~/shadowsocks/shadowsocks
echo '{"server":"0.0.0.0","server_ipv6":"::","server_port":'$SS_SERVER_PORT',"local_address":"127.0.0.1","local_port":1080,"password":"'$SS_PASSWORD'","timeout":'$SS_TIMEOUT',"method":"'$SS_METHOD'","protocol":"'$SS_PROTOCOL'","protocol_param":'$SS_PROTOCOLP',"obfs":"'$SS_OBFS'","obfs_param":'$SS_OBFSP',"redirect":'$SS_REDIRECT',"dns_ipv6":'$SS_DNSIPV6',"fast_open": false,"workers": 1}'>shadowsocksr.json
python server.py -c shadowsocksr.json
