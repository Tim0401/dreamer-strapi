# 復旧手順

## minikube起動

```
sudo minikube start
```

## mongoDBのレプリカセット構成

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

この段階で  
```
sudo kubectl get pods
```
で正常に立ち上がっていることを確認。  

## バックアップデータの復旧

~/backup以下の最新zipファイルを  

```
/tmp/hostpath-provisioner/strapi-pvc/
/tmp/hostpath-provisioner/mongo-restore-pvc/
```

に解凍。(unzipコマンドでOK)  

## mongoDB リストア

```
sudo kubectl get job
sudo kubectl delete job mongo-restore
sudo kubectl apply -f mongo-restore-job.yaml
```

終了。  
