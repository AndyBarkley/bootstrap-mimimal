# bootstrap-mimimal
Bootstrap a server with minimum requirements.

Steps:
```bash
wget https://github.com/AndyBarkley/bootstrap-mimimal/main/bootstrap.sh
```
```bash
sudo chmod +x bootstrap.sh
```
``` bash
sudo ./bootstrap.sh
```

Your bootstrap.sh will:

1. Install git + ansible
2. Generate /root/.ssh/id_ansible_pull
3. Print the public key
4. You paste it into GitHub
5. bootstrap.sh runs ansible‑pull
6. This role creates:
    - andybob user with SSH key
    - ansible user with SSH key
    - sudoers file
    - removes ubuntu user
    - updates the system
