# k8s-Desktop


Temos algumas opções para usar Kubernetes na sua localhost, notebook e até um pc velho
 
sudo '




https://docs.brew.sh/Homebrew-on-Linux
Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
📋
Cole em macOS Terminal or Linux shell prompt










 Kubernetes in Docker Desktop:
choco install docker-desktop -y
https://docs.docker.com/desktop/kubernetes/








Plugin de Redes

Usar sempre a opção:
--network-plugin=kubenet especifica que iremos usar o plugin de rede kubenet com os plugins CNI bridge, lo e host-local localizados em /opt/cni/bin ou cni-bin-dir.

e NÃO USAR:
--network-plugin=cni especifica que devemos usar o plugin de redes cni com os binários do plugin localizados em --cni-bin-dir (padrão /opt/cni/bin) e as configurações do plugin localizadas em --cni-conf-dir (default /etc/cni/net.d).
--network-plugin-mtu=9001 especifica o MTU a ser utilizado, atualmente apenas em uso pelo plugin de rede kubenet
https://kubernetes.io/pt-br/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/#network-plugin-requirements