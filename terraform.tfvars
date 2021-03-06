ssh_key_public = "~/ya_rsa.pub"

ssh_key_private = "~/ya_rsa"

region = "eu-frankfurt-1" 

image_id = {
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaymguk5srho2luw7w627fm3sshgtgpsfkzmeiec3qrrwsy3ys76fa"
  }

compartment_name = "OpenVPN"

instance_name = "OpenVPN Server"

vnic_name = "OpenVPN VNIC"

assign_public_ip = true  

hostname_label = "openvpn-server"

ssh_user = "opc"

remote_exec_command = ["sudo yum check-update", "sudo yum install python3 -y", "echo Done!"]

app_tags = {
      "app" = "openvpn"
    }

vcn_dns_label = "internal"  

vcn_cidr_block = "172.16.0.0/20"

vcn_name = "OpenVPN VCN"

subnet_cidr_block = "172.16.0.0/24"

subnet_display_name = "OpenVPN subnet"

subnet_dns_label = "openvpn"

route_table_name = "OpenVPN Access"

IG_name = "OpenVPN IG"

dns_zone_name = "rand-vpn.tk"

dns_zone_type = "PRIMARY"

security_list_name = "OpenVPN security list"

egress_rule = [{"protocol": "6", "destination": "0.0.0.0/0"},
               {"protocol": "17", "destination": "0.0.0.0/0"}]

ingress_rule_all = [{"protocol": "all", "source": "10.9.0.0/24"},
                    {"protocol": "all", "source": "172.16.1.0/24"}]

tcp_ingress_rule = [{"protocol": "6", "source": "0.0.0.0/0", "description": "Allow ssh", "port": "22"},]

udp_ingress_rule = [{"protocol": "17", "source": "0.0.0.0/0", "description": "Allow openvpn", "port": "1194"}, 
                    {"protocol": "17", "source": "0.0.0.0/0", "description": "Allow NTP Chrony", "port": "323"}]

create_vcn = true


create_dns = false

create_dns_zone = false

create_dns_record = false

domain_record = [{ "domain_name" : "vpn.rand-app.tk", "dns_record_type" : "A", "ttl" : "3600" }]

reserve_public_ip = false

skip_source_dest_check = false