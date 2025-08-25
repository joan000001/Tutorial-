# Tutorial 

# Joan Franco Sandoval




## 1. Instalación de las herramientas

### 1. Introducción

Con el objetivo de establecer un entorno funcional para el desarrollo, simulación y programación. Se realizó la instalación y configuración de diversas herramientas de software. A continuación, se detalla el procedimiento llevado a cabo, incluyendo los recursos utilizados y los aspectos técnicos relevantes.

### 2. Instalación de Visual Studio Code

Se descargó e instaló la aplicación Visual Studio Code desde su sitio oficial.

![image Alt](https://github.com/joan000001/Tutorial/blob/7470eb4a9a9d85a3db68f90a37483717a8318ed7/1.PNG)


### 3. Instalación de Extensiones en Visual Studio Code
#### 3.1 Lushay Code

Una vez instalado VSCode, se procedió a instalar la extensión Lushay Code. Esta extensión permite la integración de herramientas como Yosys.

#### 3.2 Verilog-HDL/SystemVerilog

Además, se incorporó la extensión Verilog-HDL/SystemVerilog, que proporciona funcionalidades de resaltado de sintaxis, autocompletado y validación para dichos lenguajes.

### 4. Instalación de OSS-Cad-Suite

Se descargó el paquete OSS-Cad-Suite desde el repositorio oficial de YosysHQ.

El archivo descargado fue descomprimido, generando una carpeta llamada oss-cad-suite, que contiene todos los ejecutables necesarios.

### 5. Configuración de Lushay Code

Dentro de VSCode, se configuró manualmente la ruta de acceso a la carpeta bin de la OSS-Cad-Suite, mediante las opciones de configuración de la extensión Lushay Code.

### 6. Instalación y Configuración del Controlador USB (Zadig)

Se instaló el programa Zadig para reemplazar el controlador USB correspondiente a la interfaz JTAG de la FPGA. Una vez conectada la placa, se seleccionó el dispositivo JTAG Debugger (Interface 0), y se reemplazó el controlador utilizando el botón Replace Driver.

Esta acción fue necesaria para permitir la comunicación entre el equipo y la FPGA a través de la herramienta openFPGALoader.

### 7. Instalación de GNU-Make

Se descargó e instaló GNU-Make desde el sitio de GnuWin32. Esta herramienta es fundamental para automatizar la ejecución de comandos en proyectos de desarrollo, especialmente durante la síntesis y compilación.

### 8. Configuración del PATH del Sistema

Para permitir el uso de Make desde cualquier terminal o consola integrada en VSCode, se agregó manualmente la ruta de la carpeta bin de GnuWin32 a la variable de entorno PATH del sistema operativo. Esta operación se realizó a través del editor de variables de entorno de Windows.

## 1. Prueba de las herramientas







## 2. Segunda Medición

Para la segunda medición se conectaron tres inversores en anillo

![image Alt](https://github.com/joan000001/Primer-Proyecto-/blob/d37ef954bff2eb33884548af25516067fe7d2bd9/tercera.jpeg)



## 3. Tercera Medición


![image Alt](https://github.com/joan000001/Primer-Proyecto-/blob/d37ef954bff2eb33884548af25516067fe7d2bd9/cuarta.jfif)



## 4. Cuarta Medición


Finalmente para la última medición se conecta la entrada con la salida de una compuerta 

![image Alt](https://github.com/joan000001/Primer-Proyecto-/blob/d37ef954bff2eb33884548af25516067fe7d2bd9/quinta.jfif)





