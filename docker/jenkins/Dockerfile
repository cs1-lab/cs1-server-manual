M jenkins/jenkins:lts

# セットアップウィザードを無効化する
# （Suggested pluginsのインストールをスキップできる）
#ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# rootユーザでplugins.txtに記載されたプラグインをインストールする
# install-plugins.shは公式イメージに同梱されているインストール用スクリプト
USER root

COPY ./plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# デフォルトのログインユーザに"jenkins"を指定
USER jenkins

# add permission to tmp
RUN chmod 777 /tmp
