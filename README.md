Elasticsearch & Kibana4 Playbook
===
[Ansible]()を使用してElasticsearch1.4.0とKibana4.0.0 BETA2をUbuntu 14.04に対してプロビジョニングするためのPlaybookです。

Vagrantでも動作させることができ、WindowsやMac、LinuxなどVagrantが動作する環境であれば簡単に使用することができます。

# 使い方

## Vagrantを使用する

`vagrant up`すると、`ubuntu/trusty64`を使用した新しいVMを起動し、Ansibleを使用してプロビジョニングします。

AnsibleはVMにインストールされるため、ホストにAnsibleをインストールする必要はありません。

ElasticsearchとKibanaを動作させるため、VMにはメモリーを2GB割り当てる設定となっています。

また、Vagrantで起動するVMはプライベートネットワークとして`192.168.33.10`を使用します。もし、IPアドレスが衝突する場合は`Vagrantfile`を書き換えて使用してください。

## Playbookとして使用する

Ansible Playbookとして使用する場合は、インベントリーファイルである`hosts`ファイルを編集します。

デフォルトではVagrantで起動するVM上で動作させるため、`127.0.0.1`が登録されていますので、コメントアウトするなり、削除するなりして無効にしてください。

対象のホスト名とユーザー名、ログインに使用する秘密鍵など、ご利用の環境にあわせて変更したあと、以下のコマンドを実行することで、対象のサーバーがAnsibleによってプロビジョニングされます。

```
ansible-playbook -i hosts playbook.yml
```
