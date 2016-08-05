# biab-provisioning
Ansible playbook for setting up build-iab

```bash
ansible-playbook -i inventory -l powertrip --extra-vars "aws_access_key_id=foo aws_secret_access_key=bar github_secret=baz" site.yml -K
```
