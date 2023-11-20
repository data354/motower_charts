# motower-stack
### CHART NAME = OCI-STACK
### RELEASE = 1.0.0
### COMPONENTS 
    - AIRFLOW : 2.7.0  
    - POSTGRESQL: 15
    - PGADMIN: 4
    - MINIO: RELEASE.2023-07-07T07-13-57Z
    - TRINO : 0.2.0

### DESCRIPTION
This git repo contains all the files for creating a helm chart to facilitate the deployment of the next stack (except powerBI) on k8s:

![project archi](/images/archi.png)

## HOW TO DEPLOY

    - standalone postgresql with 500Gi pvc with nodeport service ( default 30005)
    - pgadmin with 10 Gi with nodeport service (default 30005)
    - cluster minio with 3 nodes to 500 Gi and nodeport type for the consoleservice 
    - cluster airflow with 3 Executors and nodeport service for airflowUI. The cluster reads DAGS on gitlab. We must have an user and password or personal token (for github)


helm install datastack --set pg.primary.service.nodePorts.postgresql="un-nodeport-disponible",minio.consoleService.nodePort="un-nodeport-disponible",pgadmin.service.nodePort="un-nodeport-disponible",gitSync.username="gitlab-username",gitSync.username="gitlab-password",airflow.dags.gitSync.repo="reponame-with-https",airflow.dags.gitSync.branch="repo-branch",airflow.dags.gitSync.subPath="dags",airflow.webserver.service.ports.nodePort="un-nodeport-disponible"     url-de-la-chart --debug


NOTE: All others args are already configured