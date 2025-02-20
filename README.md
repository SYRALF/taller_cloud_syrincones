 <img src="https://github.com/user-attachments/assets/b17e2b4f-b3aa-41ff-9069-c471aa237101" width="850px" height="400px">

<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">

# 1. Creación del directorio del proyecto
 > Cree un nuevo directorio para su proyecto y, dentro de este, un archivo main.py que contenga una aplicación FastAPI básica que responda con “Hello World” en la ruta raíz.
 >
> para crear un directorio por consola usamos el siguiente comando `--> mkdir {nombre de carpeta que desees}`
> 
 > ![image](https://github.com/user-attachments/assets/4814f2c4-1f90-4f72-8775-b860d0ee6767)
>
 > una vez creado nos movemos a ese directorio con el siguiente comando ` cd {nombre del directorio}` y crear dentro el archivo main.py  con el comando `--> mkdir main.py`que luego editaremos con VSCode
> 
 > ![image](https://github.com/user-attachments/assets/c43f74ab-42ad-4ab5-a34e-fe9bfc490a44)
>
> Editamos el archivo main.py con el siguiente script:
> ```
> from fastapi import FastAPI
>
> app = FastAPI()
>
> @app.get("/")
> def read_root():
>    return {"message": "Hello World"}
> ```
>
> dentro de este mismo directorio vamos a crear un entorno virtual e instalar FastAPI y Uvicorn usando los siguientes comandos
> ```
> python -m venv venv
> venv\Scripts\activate
> pip install fastapi uvicorn
> ```
> el comando ` python -m venv venv`
> crea un entorno virtual llamado venv.
> Un entorno virtual es un espacio aislado donde puedes instalar paquetes sin afectar la instalación global de Python en tu sistema.
> La opción -m venv indica que se usará el módulo venv de Python para crear este entorno.
> El último venv es simplemente el nombre de la carpeta donde se guardará el entorno virtual.
>
> el comando ` venv\Scripts\activate`
> activa el entorno virtual recién creado.
> Al activarlo, cualquier paquete que instales con pip quedará dentro del entorno y no en el sistema global.
>
> y por ultimo el comando ` pip install fastapi uvicorn`
> Este comando instala ambas herramientas (fastapi y uvicorn) dentro del entorno virtual si está activado.


# 2. Construcción de un Dockerfile para la Aplicación
> En el mismo directorio del proyecto, cree un archivo Dockerfile que:
  > 
> • Utilice una imagen base de Python adecuada.
  > 
> • Instale las dependencias necesarias.
  >     
> • Copie el código de la aplicación al contenedor.
  > 
> • Configure el contenedor para ejecutar la aplicación utilizando un servidor ASGI como Uvicorn
  >
> Para este paso vamos a necesitar abrir el directorio que creamos anteriormente con vscode y creamos un archivo Dockerfile, y le ponemos como contenido lo siguiente:
> ```
> # Usar una imagen base de Python
> FROM python:3.9
> 
> # Establecer el directorio de trabajo dentro del contenedor
> WORKDIR /app
> 
> # Copiar los archivos del proyecto al contenedor
> COPY . /app
> 
> # Instalar dependencias
> RUN pip install --no-cache-dir fastapi uvicorn
> 
> # Exponer el puerto de la aplicación
> EXPOSE 8000
> 
> # Comando para ejecutar la aplicación
> CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
> ```
# 3. Construcción de la imagen Docker
>  • Utilice el comando docker build para construir la imagen Docker a partir del Dockerfile, asignándole un nombre que incluya su nombre de usuario institucional.
> 
> Para construir nuestra imagen debemos usar el siguiente comando `docker build -t {nombre image} .`
>
> ![image](https://github.com/user-attachments/assets/3a0334cf-4766-4081-a5cc-e6c28deeb0a9)
> ![image](https://github.com/user-attachments/assets/7a924f91-feb5-4c72-a073-893fec07ca14)
>
> Para comprobar si la imagen se creeo correctamente podemos usar el comando `docker images`
> 
> ![image](https://github.com/user-attachments/assets/313e8426-40a5-4d0b-b74e-61414137efc1)
>
> ## Explicacion del comando 
> `docker build `: Este comando le dice a Docker que construya una imagen usando un Dockerfile.
> 
> `-t`: Esta opción permite asignarle un nombre y una etiqueta a la imagen.
> 
> `.` el punto, indica que el contexto de construcción está en el directorio actual, donde debe existir un Dockerfile.

# 4. Ejecución y prueba del contenedor
> • Inicie un contenedor basado en la imagen creada utilizando docker run.
> 
> > Para iniciar el contenedor usamos el comando `docker run -d -p 8000:8000 usuario_institucional/fastapi_app`
> > ![image](https://github.com/user-attachments/assets/1f13e258-b1fa-4b52-9eb2-016e38bbc681)
> >  ## Explicación del comando
> > `docker run`: Este comando le dice a Docker que inicie un nuevo contenedor a partir de una imagen.
> > 
> > `-d`: esta opción significa que el contenedor se ejecutará en segundo plano (background), sin bloquear la terminal.
> > 
> > `-p 8000:8000`: Aqui asignamos el puerto del contenedor al puerto de la máquina host.
> > 
> > `usuario_institucional/fastapi_app` este es el nombre de la imagen
> > 
> • Verifique que la aplicación responde correctamente accediendo en su navegador a http://localhost:8000 o al URL que le correspon
> 
> > ![image](https://github.com/user-attachments/assets/22eee0ea-6f41-4ebf-b3c0-ce37fe5d0606)

# 5. Gestion de contenedores
> • Liste los contenedores en ejecución y detenga el contenedor de la aplicación.
> > En docker para consultar los contenedores que tenemos activos usamos el siguiente comando `docker ps`
> >
> > ![image](https://github.com/user-attachments/assets/5ac26ff4-e660-4239-9a4c-c8b3a41c0d4d)
> >
> > Utilizamos el comando `docker stop {container_id or name}`, para detener el contenedor que tenemos activos con ese nombre o id
> >
> > ![image](https://github.com/user-attachments/assets/9ee75f14-47e6-4433-b4fe-a3932126243a)
> >
> > Utilizamos el comando `docker ps -a` para consultar los contenedores que tenemos detenidos
> >
> > ![image](https://github.com/user-attachments/assets/42dede3d-8c9d-4cb7-acbb-6af015c81834)
>
> • Elimine el contenedor detenido.
> >
> > Utilizamos el comando `docker rm {container_id or name}`, para eliminar el contenedor que tenemos con ese nombre, recuerden que para poder eliminar un contenedor debemos tener ese contenedor detenido
> >
> > ![image](https://github.com/user-attachments/assets/266770be-3a5c-4cea-ad9f-42783598d0ef)



•
<>
# 6. Publicación de la Imagen en Docker Hub
> • Etiquete la imagen Docker con su nombre de usuario de Docker Hub.
>
> > Para publicar la imagen en docker hub utilizamos el comando `docker tag {name}/{nombre directorio} {nombre usuario dockerhub}/{nombre directorio}`
> >
> > ![image](https://github.com/user-attachments/assets/3fbd76cd-91af-4359-afd1-a2774ca6d119)
> 
> • Inicie sesión en Docker Hub desde la terminal.
> 
> > Para iniciar sesion usamos el comando `docker login`
> >
> > ![image](https://github.com/user-attachments/assets/d09a254e-f6eb-40cc-948d-3fc1769ab04b)
> 
> • Suba la imagen al repositorio de Docker Hub utilizando docker push.
> >  luego hacemos un pull de nuestra imagen con el comando `docker push {usuario_dockerhub}/{nombre directorio}`
> > 
> > ![image](https://github.com/user-attachments/assets/ebf3c7d8-1757-4573-88ab-d30984e6121a)
> 



