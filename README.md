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

## 3. Codigo

### 1. Design

Para la tercera parte del tutorial se realizo un codigo como primer ejemplo.

```SystemVerilog
module module_counter #(
  parameter COUNT = 13500000
)(
  input  logic       clk,
  input  logic       rst,         
  output logic [5:0] count_o
);

localparam int WIDTH_COUNT = $clog2(COUNT);

logic [WIDTH_COUNT-1:0] clk_counter = '0;
logic [5:0]             led_count_r;

  always_ff @(posedge clk) begin
    
    if (!rst) begin
      led_count_r <= '0;
      clk_counter <= '0;
    end
    
    else if (clk_counter == COUNT) begin
      clk_counter <= '0;
      led_count_r <= led_count_r + 1'b1;
    end
    
    else begin
      clk_counter <= clk_counter + 1'b1;
      led_count_r <= led_count_r;

    end
  end

  assign count_o = ~led_count_r;

endmodule
```
En este codigo vemos como mediante el uso de los leds de la fgpa se crea un contador

### 2. TB

Después de crear el Modulo Top del diseño , se procedió con la creación de un tb que funcionaria como medio de pruebas para comprobar el funcionamiento del código 
```SystemVerilog
`timescale 1ns / 1ps

module module_counter_tb;

logic clk;
logic rst;
logic [5 : 0] count_o;

module_counter # (10) COUNTER (
    .clk ( clk),
    .rst (rst),
    .count_o (count_o)
);

initial begin

    clk = 0;
    rst = 1;

    #30;

    rst = 0;

    #30;

    rst = 1;

    #30000;
    $finish;
end

always begin

    clk = ~clk;
    #10;
    
end

initial begin
    $dumpfile("modulr_conta_tb.vcd");
    $dumpvars (0,module_counter_tb);
end




endmodule

```
### 3. Constr

Una vez creado el Diseño del código y el tb se establecieron las constraints o salidas a usar en el dispositivo.

![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/18.PNG )


### 4. Makefile

Finalmente se modificó el makefile para poder ejecutar el programa y el banco de pruebas , además de definir el archivo para generar la gráfica de las señales.


![image Alt]( https://github.com/joan000001/Tutorial-/blob/main/Imagenes/17.PNG )



### Mediante este tutorial se comprueba que el funcionamiento tanto de la fpga como de los programas instalados funcionan adecuadamente y se realizó con éxito el primer codigo


