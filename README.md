# TODO

Complete CICD vibecoded application 

## Prerequis
- source your rc_file from Openstack/OVH
- install Python requirements from requirements.txt
- install Ansible requirements from requirements.yml

## Packer

Deploy Rocky 9 template
```
sh ./packer/build.sh
```

## Terraform

Deploy VM to host k3s
```
sh ./terraform/build.sh
```

## Ansible

Deploy k3s and kubernetes services on the created VM

- Add your host on k3s group in inventory
    ```yml
    #./ansible/inventory/inventory.yaml
    
    k3s:
    hosts:
        YOUR_FLOATING_IP:
        ansible_user: rocky # because of rocky template
    ```

- Create your group_var file for k3s
    ```yml
    #./ansible/inventory/group_vars/k3s/k3s.yaml
    
    k3s_fqdn: ""
    k3s_hostname: ""
    k3s_version: ""
    kubeconfig: ""
    local_trust_store: ""
    ```

- Execute ansible
    The playbook to deploy k3s and django App need your local sudo password for several tasks (Ca, kubeconfig and /etc/hosts)
    ```
    ansible-playbook -v -i inventory/inventory.yaml playbooks/k3s/deploy_django_app_infra.yaml -v -K
    ```

## CICD Github

- Create a branch from docker-image-prod
- Modify the django app
- Make a pull request to docker-image-prod
    The workflow .github/workflows/on_pull_request_docker_image_prod.yml starts
- Accept the PR and merge
    The workflox .github/workflows/on_push_docker_docker_image_prod.yml starts

## CICD K8S

After the new docker image push, argocd syncronize the django-app image