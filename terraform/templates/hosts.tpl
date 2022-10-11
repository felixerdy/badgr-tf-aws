[servers]
%{ for index, group in public_ips ~}
${public_ips[index]} ansible_user=ubuntu ansible_ssh_private_key_file=../terraform/key.pem
%{ endfor ~}