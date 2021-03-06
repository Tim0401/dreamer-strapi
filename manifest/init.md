# k8s初回立ち上げ時の作業

## mongoDB初期起動時のレプリカセット構成

```
kubectl exec -it mongo-sts-0 -- /bin/bash
mongo mongo-sts-0.mongo-svc
config = {
   _id : "rs0",
   members: [
      { _id: 0, host: "mongo-sts-0.mongo-svc:27017" },
      { _id: 1, host: "mongo-sts-1.mongo-svc:27017" },
      { _id: 2, host: "mongo-sts-2.mongo-svc:27017" },
   ]
}

rs.initiate(config)
rs.status()
```

## pv削除時の挙動変更

```
kubectl get pv
kubectl patch pv <your-pv-name> -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
```

pvcを削除するとデータが飛ぶので注意
バックアップとるのでどちらでもいい

## バックアップ

/tmp/hostpath-provisioner/strapi-pvc/
ホストPC内で圧縮してバックアップフォルダにコピー

/tmp/hostpath-provisioner/mongo-backup-pvc
1日1回圧縮されたDBデータが入るのでバックアップフォルダに移動

## mongoのレプリカ数変更時の処理

* mongo-statefulset.yamlでのレプリカ数変更
* mongoコンテナ内でレプリカセットの構成変更
* strapi-deployment.yaml/mongo-backup-job.yamlでのホスト名変更

## image/manifestの更新

適用したら更新される。
イメージタグを変えれば新しいものを使ってくれる。
