# k8s-Desktop   Temos algumas opções para usar Kubernetes na sua localhost, notebook e até um pc velho


choco install terraform minikube gcloudsdk docker-desktop -y


<br> 


# Windows ajudante
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

</br>

winget search Microsoft.PowerShell
winget install --id Microsoft.Powershell --source winget
winget install --id Microsoft.Powershell.Preview --source winget

install choco

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


Sobre kubeconfig file
In order for kubectl to find and access a Kubernetes cluster, it needs a kubeconfig file, 
which is created automatically when you create a cluster using kube-up.sh or successfully deploy a Minikube cluster.
 By default, kubectl configuration is located at ~/.kube/config.
If you need access to a cluster you didn't create, see the Sharing Cluster Access document.


o que o instalador .sh faz:
Install and Set Up kubectl on Linux

install minikube
?May connect to invilia cluster via kubeconfig file

The following methods exist for installing kubectl on Linux:
Install kubectl binary with curl on Linux
Install using native package management
Install using other package management
Install kubectl binary with curl on Linux 


logo depois disso tudo funcionar
criar ou acrscentar a insgtalação do lens no .sh
https://k8slens.dev/



PC Velho
2 CPUs or more
2GB of free memory
20GB of free disk space
Internet connection
Container or virtual machine manager, such as: Docker, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMware Fusion/Workstation


Verify kubectl configuration


Check that kubectl is properly configured by getting the cluster state:


curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"



https://minikube.sigs.k8s.io/docs/start/
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
https://docs.brew.sh/Homebrew-on-Linux
Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
📋
Cole em macOS Terminal or Linux shell prompt










 Kubernetes in Docker Desktop:
 docker-desktop -y
https://docs.docker.com/desktop/kubernetes/




Manage your cluster
Pause Kubernetes without impacting deployed applications:

minikube pause
Unpause a paused instance:

minikube unpause
Halt the cluster:

minikube stop
Change the default memory limit (requires a restart):

minikube config set memory 9001
Browse the catalog of easily installed Kubernetes services:

minikube addons list
Create a second cluster running an older Kubernetes release:

minikube start -p aged --kubernetes-version=v1.16.1
Delete all of the minikube clusters:

minikube delete --all






Plugin de Redes

Usar sempre a opção:
--network-plugin=kubenet especifica que iremos usar o plugin de rede kubenet com os plugins CNI bridge, lo e host-local localizados em /opt/cni/bin ou cni-bin-dir.

e NÃO USAR:
--network-plugin=cni especifica que devemos usar o plugin de redes cni com os binários do plugin localizados em --cni-bin-dir (padrão /opt/cni/bin) e as configurações do plugin localizadas em --cni-conf-dir (default /etc/cni/net.d).
--network-plugin-mtu=9001 especifica o MTU a ser utilizado, atualmente apenas em uso pelo plugin de rede kubenet
https://kubernetes.io/pt-br/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/#network-plugin-requirements




à fazer

If you see a URL response, kubectl is correctly configured to access your cluster.

If you see a message similar to the following, kubectl is not configured correctly or is not able to connect to a Kubernetes cluster.

The connection to the server <server-name:port> was refused - did you specify the right host or port?
For example, if you are intending to run a Kubernetes cluster on your laptop (locally), you will need a tool like Minikube to be installed first and then re-run the commands stated above.

If kubectl cluster-info returns the url response but you can't access your cluster, to check whether it is configured properly, use:

kubectl cluster-info dump
Optional kubectl configurations and plugins
Enable shell autocompletion
kubectl provides autocompletion support for Bash, Zsh, Fish, and PowerShell, which can save you a lot of typing.

Below are the procedures to set up autocompletion for Bash, Fish, and Zsh.

Bash
Fish
Zsh
Introduction
The kubectl completion script for Bash can be generated with the command kubectl completion bash. Sourcing the completion script in your shell enables kubectl autocompletion.

However, the completion script depends on bash-completion, which means that you have to install this software first (you can test if you have bash-completion already installed by running type _init_completion).

Install bash-completion
bash-completion is provided by many package managers (see here). You can install it with apt-get install bash-completion or yum install bash-completion, etc.

The above commands create /usr/share/bash-completion/bash_completion, which is the main script of bash-completion. Depending on your package manager, you have to manually source this file in your ~/.bashrc file.

To find out, reload your shell and run type _init_completion. If the command succeeds, you're already set, otherwise add the following to your ~/.bashrc file:

source /usr/share/bash-completion/bash_completion
Reload your shell and verify that bash-completion is correctly installed by typing type _init_completion.

Enable kubectl autocompletion
Bash
You now need to ensure that the kubectl completion script gets sourced in all your shell sessions. 
There are two ways in which you can do this:

User
System

echo 'source <(kubectl completion bash)' >>~/.bashrc
If you have an alias for kubectl, you can extend shell completion to work with that alias:

echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
Note: bash-completion sources all completion scripts in /etc/bash_completion.d.
Both approaches are equivalent. After reloading your shell, kubectl autocompletion should be working. To enable bash autocompletion in current session of shell, run exec bash:

exec bash
Install kubectl convert plugin
A plugin for Kubernetes command-line tool kubectl, which allows you to convert manifests between different API versions. This can be particularly helpful to migrate manifests to a non-deprecated api version with newer Kubernetes release. For more info, visit migrate to non deprecated apis

Download the latest release with the command:

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert"
Validate the binary (optional)

Download the kubectl-convert checksum file:

curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert.sha256"
Validate the kubectl-convert binary against the checksum file:

echo "$(cat kubectl-convert.sha256) kubectl-convert" | sha256sum --check
If valid, the output is:

kubectl-convert: OK
If the check fails, sha256 exits with nonzero status and prints output similar to:

kubectl-convert: FAILED
sha256sum: WARNING: 1 computed checksum did NOT match
Note: Download the same version of the binary and checksum.
Install kubectl-convert

sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
Verify plugin is successfully installed

kubectl convert --help
If you do not see an error, it means the plugin is successfully installed.











Para trabalhar com objetos do Kubernetes seja para criar, modificar ou deletar eles, você precisará usar a API do Kubernetes. Quando você usa a interface de linha de comando do kubectl, por exemplo, o CLI faz as chamadas necessárias na API do Kubernetes para você. Você também pode usar a API do Kubernetes diretamente no seu próprio programa usando uma das Bibliotecas

























Linux (WSL), also, which is covered in
  a separate gist. It also has a choco command for installing Docker Desktop after:
  - https://gist.github.com/ScriptAutomate/
  
## Search visually on site: https://chocolatey.org/packages
## I like installing the below packages, for example

# Windows Terminal: Huge improvement over native tooling

# PowerShell Core: Latest PowerShell, can sit ontop of Windows PowerShell
## run with pwsh.exe or in Microsoft Terminal when installed
 powershell-core -y
 microsoft-windows-terminal -y

# Visual Studio Code: Cross-platform IDE of choice for me
 vscode -y

# Git: Should be hard to avoid needing this at work
 git -y

# Google Chrome
 googlechrome -y

# Brave Browser: Alternative web browser with many fans
 brave -y


<#
Simple, nice bootstrap to get Windows 10 up-and-running with nice setup!

- Installs chocolatey (choco)
- Installs common software

I highly recommend Windows Subsystem for Linux (WSL), also, which is covered in
  a separate gist. It also has a choco command for installing Docker Desktop after:
  - https://gist.github.com/ScriptAutomate/f94cd44dacd0f420fae65414e717212d
#>

## IN AN ELEVATED SHELL
## Right-click PowerShell -> Run As Administrator

# Install chocolatey
## For more info on chocolatey, see: https://chocolatey.org/docs/getting-started
## For more info on this install approach: https://chocolatey.org/install#individual
###
# WARNING: As said by Chocolatey, themselves:
# "Please inspect https://chocolatey.org/install.ps1 prior to running any of these scripts
# to ensure safety. We already know it's safe, but you should verify the security and contents
# of any script from the internet you are not familiar with. All of these scripts download a
# remote PowerShell script and execute it on your machine. We take security very seriously."
# Learn more about Chocolatey security protocols: https://docs.chocolatey.org/en-us/information/security
###
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

### Install things with chocolatey!
## Search from terminal: choco search <package>
## View locally installed choco packages: choco list --local-only
## Search visually on site: https://chocolatey.org/packages
## I like installing the below packages, for example

# Windows Terminal: Huge improvement over native tooling
 microsoft-windows-terminal -y

# PowerShell Core: Latest PowerShell, can sit ontop of Windows PowerShell
## run with pwsh.exe or in Microsoft Terminal when installed
 powershell-core -y

# Visual Studio Code: Cross-platform IDE of choice for me
 vscode -y

# Git: Should be hard to avoid needing this at work
 git -y

# Google Chrome
 googlechrome -y

# Brave Browser: Alternative web browser with many fans
 brave -y


function GoAdmin { Start-Process pwsh –Verb RunAs }
install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
xclip -v >> install-kubectl.ps1 
start-process powershell –verb runAs

#kubectl

kubectl get ns
kubectl get nm -A
kubectl get namespace -A
kubectl get pod -A |grep post
kubectl config get-contexts
kubectl cp .\postgres_data-sender.tar.gz   pod-postgresql-0\postgres_data-sender.tar.gz
kubectl config get-contexts
kubectl  -it prometheus-pgsql   -n machina-pg sh
kubectl  -it postgresql-backup-node-0   -n machina-pg sh
kubectl  -it kafka-zookeeper  -n machina-kafka sh
kubectl  -it pod-postgresql-0   -n machina-postgres sh
kubectl  -it kafka-zookeeper  -n machina-kafka sh
kubectl  -it prometheus-pgsql-76b569bb59-swvnb  -n machina-pg sh
kubectl  -it pod-postgresql-0   -n machina-pg sh
kubectl  -it postgresql-backup-node-0   -n machina-pg sh
kubectl port-forward svc/prometheus-kube -n telemetry 9090
kubectl port-forward svc/prometheus-grafana 3000:80 -n telemetry
kubectl -n machina logs -f deployment/machina-pod1 --all-containers=true --since=10m
kubectl get gateways.networking.istio.io -A
kubectl get secret cloud-es-elastic-user -n machina-es -o=jsonpath='{.data.elastic}' | base64 --decode; echo
kubectl port-forward svc/prometheus-grafana 3000:80 -n telemetry
export POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus-pgsql,release=prometheus-pgsql-1619920850" -o jsonpath="{.items[0].metadata.name}")
export POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus-pgsql,release=prometheus-pgsql-1619920850" -o jsonpath="{.items[0].metadata.name}")
export POD_NAME=$(kubectl get pods --namespace machina-pg -l "app=prometheus-pgsql,release=prometheus-pgsql" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
set POD_NAME=$(kubectl get pods --namespace machina-pg -l "app=prometheus-pgsql,release=prometheus-pgsql" -o jsonpath="{.items[0].metadata.name}")
kubectl get dc
kubectl get deployments
kubectl get deployments -n machina-pg
kubectl patch deployment prometheus-pgsql --type=json -p='[{"op": "remove", "path": "/spec/selector/matchLabels/chart"}]'
kubectl patch deployment prometheus-pgsql --type=json -p='[{"op": "remove", "path": "/spec/selector/matchLabels/chart"}]' -n machina-pg


#helm   
helm show values prometheus-community/prometheus-pgsql | grep database
helm show values prometheus-community/prometheus-pgsql >> values.yaml
echo '{mariadb.auth.database: user0db, mariadb.auth.username: user0}' > values.yaml
 helm install -f values.yaml bitnami/wordpress --generate-name
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-pgsql prometheus-community/prometheus-pgsql --version 1.0 -n machina-pg
  export POD_NAME=$(kubectl get pods --namespace machina-pg -l "app=prometheus-postgres-exporrter,release=prometheus-pgsql" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
kubectl get pod -A |grep post
helm install prometheus-pgsql prometheus-community/prometheus-pgsql --version 1.0 -n machina-pg
  export POD_NAME=$(kubectl get pods --namespace machina-pg -l "app=prometheus-postgres-exporrter,release=prometheus-pgsql" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80
aws ec2-instance-connect send-ssh-public-key --ssh-public-key profile-production
helm list prometheus-pgsql
helm list --all
helm list --failed
helm list --all-namespaces
helm show values prometheus-community/prometheus-pgsql | grep 9187
helm status postgres-exporter
helm status postgres-data-sender
helm status prometheus-community/prometheus-pgsql
helm status prometheus-pgsql/prometheus-pgsql-869b456wpwk 
helm status  prometheus-pgsql
helm install prometheus-community/prometheus-pgsql --version 1.0 -n machina-pg
helm install prometheus-pgsql prometheus-community/prometheus-pgsql --version 1.0 -n machina-pg
kubectl port-forward $POD_NAME 8080:80
  echo "Visit http://127.0.0.1:8080 to use your application"
helm status -76b569bb59-swvnb
helm status prometheus-pgsql
helm uninstall prometheus-pgsql  -n machina-pg
helm uninstall prometheus-community/prometheus-pgsql --version 1.0 --generate-name
helm uninstall prometheus-pgsql-1619920850-648bc84768-fb6cl  -n default
helm uninstall prometheus-pgsql  -n machina-pg



#wsl
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-VirtualMachinePlatform
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage .\Ubuntu_2004.2020.424.0_x64.appx
Add-AppxPackage .\Ubuntu.appx
wsl --set-default-version 2
wsl.exe --install ubuntu
wsl --list --online
wsl --install -d ubuntu





#backlog

aws ec2-instance-connect --instance-id  SOME-TOKEN
 aws ec2-instance-connect --instance-id cluster-eks-$(ENV) --instance-id cluster-eks-$(ENV)
aws ec2-instance-connect --instance-id cluster-eks-$(ENV)
aws ec2-instance-connect --instance-id cluster-eks-$(ENV)
 
aws eks list-clusters
setx AWS_ACCESS_KEY_ID aws_access_key_id=SOME-KEY-ID
setx AWS_SECRET_ACCESS_KEY aws_secret_access_key=


  
setx AWS_SECRET_ACCESS_KEY aws_secret_access_key=SOME-TOKEN
aws login
aws
aws help


aws ec2-instance-connect send-ssh-public-key --ssh-public-key profile-production 
aws ec2-instance-connect send-ssh-public-key --ssh-public-key profile-production --instance-id  SOME-TOKEN
 
setx AWS_ACCESS_KEY_ID aws_access_key_id=SOME-KEY-ID



aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) 
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) 
  
 
 
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) 
   

aws iam list-users
aws iam list-users --profile profile-quality
 
 
aws iam list-users --profile 

aws eks list-clusters --profile profile-production
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV)

aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) --profile profile-production
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) --profile .\profile-quality
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) --profile profile-production

 unset AWS_DEFAULT_PROFILE
 
 
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV)
 curl http://169.254.169.254/latest/meta-data/iam/security-credentials
aws iam list-users
 
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) 
aws get-session-token
aws eks --region us-east-1 update-kubeconfig --name cluster-eks-$(ENV) 

