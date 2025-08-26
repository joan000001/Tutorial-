# Tutorial 

# Joan Franco Sandoval




## 1. Instalación de las herramientas

### 1. Introducción

Con el objetivo de establecer un entorno funcional para el desarrollo, simulación y programación. Se realizó la instalación y configuración de diversas herramientas de software. A continuación, se detalla el procedimiento llevado a cabo, incluyendo los recursos utilizados y los aspectos técnicos relevantes.

### 2. Instalación de Visual Studio Code

Se descargó e instaló la aplicación Visual Studio Code desde su sitio oficial.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/1.PNG )


### 3. Instalación de Extensiones en Visual Studio Code
#### 3.1 Lushay Code

Una vez instalado VSCode, se procedió a instalar la extensión Lushay Code. Esta extensión permite la integración de herramientas como Yosys.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/2.PNG )

#### 3.2 Verilog-HDL/SystemVerilog

Además, se incorporó la extensión Verilog-HDL/SystemVerilog, que proporciona funcionalidades de resaltado de sintaxis, autocompletado y validación para dichos lenguajes.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/10.PNG )

### 4. Instalación de OSS-Cad-Suite

Se descargó el paquete OSS-Cad-Suite desde el repositorio oficial de YosysHQ.

El archivo descargado fue descomprimido, generando una carpeta llamada oss-cad-suite, que contiene todos los ejecutables necesarios.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/3.PNG )

### 5. Configuración de Lushay Code

Dentro de VSCode, se configuró manualmente la ruta de acceso a la carpeta bin de la OSS-Cad-Suite, mediante las opciones de configuración de la extensión Lushay Code.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/5.PNG )

### 6. Instalación y Configuración del Controlador USB (Zadig)

Se instaló el programa Zadig para reemplazar el controlador USB correspondiente a la interfaz JTAG de la FPGA. Una vez conectada la placa, se seleccionó el dispositivo JTAG Debugger (Interface 0), y se reemplazó el controlador.


![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/6.PNG )

### 7. Instalación de GNU-Make

Se descargó e instaló GNU-Make desde el sitio de GnuWin32. Para permitir el uso de Make desde cualquier terminal o consola integrada en VSCode, se agregó manualmente la ruta de la carpeta bin de GnuWin32 a la variable de entorno PATH del sistema operativo. Esta operación se realizó a través del editor de variables de entorno de Windows.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/7.PNG )

## 2. Uso de la cadena de herramientas para diseño en FPGA

### 1. Archivo 

Mediante el uso de la herramienta git se procedió a crear un clon del archivo correspondiente para utilizar en este tutorial

git clone https://github.com/DJosueMM/open_source_fpga_environment.git

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/8.PNG )



### 2. Inicialización del entorno

Se abrió el proyecto en Visual Studio Code (VSC) y se usó la extensión FPGA Toolchain para abrir una terminal OSS-CAD-Suite.
La instalación fue verificada con:

yosys

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/9.PNG )

### 3. Simulación del diseño

Se procedió a ejecutar la ruta mediante la terminal para poder acceder a la carpeta build donde se ejecuta el programa.


Una vez accedido a la carpeta se ejecuta una prueba del programa.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/11.PNG )


Al terminar la ejecución de la prueba se procede a ejecutar una simulación de las señales con el fin de crear un gráfico de estas.Se abrió GTKwave para visualizar los diagramas de tiempo.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/12.PNG )
 
 
### 4. Síntesis e implementación

Se ejecutaron las etapas de diseño desde RTL hasta hardware:

Síntesis:

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/13.PNG )



Place & Route:

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/14.PNG )



Bitstream:

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/15.PNG )


Carga en la FPGA:

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/video.gif )


→ El diseño fue cargado exitosamente en la Tang Nano 9K.

También se validó el comando global:

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/16.PNG )



Mediante esta tutorial se comprueba que el funcionamiento tanto de la fpga como de los programas instalados funcionan adecuadamente.
