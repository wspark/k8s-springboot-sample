### k8s에서 배포하기
```text
# namespace 생성
kubectl create namespace wspark

# deployment 생성
kubectl create deployment springboot-demo --image docker.io/wspark83/springboot:sample-v1.1  -n wspark

# 외부접속용 svc nodeport 변경
kubectl expose deployment springboot-demo --port 8080 --target-port 8080 --type NodePort -n wspark

# nodeport 확인
kubectl get svc -n wspark
NAME              TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
springboot-demo   NodePort   10.101.65.210   <none>        8080:31236/TCP   2d1h


[root@wspark-kube-mas01 springboot-sample]# kubectl get svc -n wspark
NAME              TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
springboot-demo   NodePort   10.98.183.180   <none>        8080:31236/TCP   14d
[root@wspark-kube-mas01 springboot-sample]# curl 10.65.41.81:31236
hostname : springboot-demo-6b9fc99f58-7vlfr!, os : Linux![root@wspark-kube-mas01 springboot-sample]# 
```