# taller_cloud_syrincones

## CREACION DE UNA APLICACION FASTAPPI "HELLO WORLD" 
<>
## Gestion de contenedores
<h4> utilizamos el comando <i>docker ps</i>, para consultar los contenedores que tenemos activos</h4>

![image](https://github.com/user-attachments/assets/5ac26ff4-e660-4239-9a4c-c8b3a41c0d4d)

<h4> utilizamos el comando <i>docker stop {container_id or name} </i>, para detener el contenedor que tenemos activos con ese id</h4>

![image](https://github.com/user-attachments/assets/9ee75f14-47e6-4433-b4fe-a3932126243a)

<h4> utilizamos el comando <i>docker ps -a </i>, para consultar los contenedores que tenemos detenidos </h4>

![image](https://github.com/user-attachments/assets/42dede3d-8c9d-4cb7-acbb-6af015c81834)

<h4> utilizamos el comando <i>docker rm {container_id or name} </i>, para eliminar el contenedor que tenemos con ese nombre, recuerden que para poder eliminar un contenedor debemos tener ese contenedor detenido </h4>

![image](https://github.com/user-attachments/assets/266770be-3a5c-4cea-ad9f-42783598d0ef)

<h4> para publicar la imagen en docker hub primero debemos darle un tag </h4>
<h4> utilizamos el comando <i>docker tag {name}/{nombre directorio} {nombre usuario dockerhub}/{nombre directorio}</i> </h4>

![image](https://github.com/user-attachments/assets/3fbd76cd-91af-4359-afd1-a2774ca6d119)


<h4> luego debemos iniciar sesion con el comando <i> docker login </i> </h4>

![image](https://github.com/user-attachments/assets/d09a254e-f6eb-40cc-948d-3fc1769ab04b)

<h4> luego hacemos un pull de nuestra imagen con el comando <i> docker push {usuario_dockerhub}/{nombre directorio} </i> </h4>




