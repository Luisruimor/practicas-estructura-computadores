### Ejercicio 1 - Años bisiestos :heavy_exclamation_mark:
Diseñar un programa que determine si un año es bisiesto o no. Para este primer apartado, no utilizar ninguna llamada a procedimiento. Definir una variable en
memoria denominada “year”, que almacene el año a analizar. Mostrar por pantalla si el año elegido es bisiesto o no, por ejemplo:
* Ejemplo 1: “2018 is not a leap year”
* Ejemplo 2: “2020 is a leap year”

[Resolución](ejercicio1.asm)

### Ejercicio 2 - Conversión de mayúsculas en minúsculas :bangbang:
Diseñar los siguientes procedimientos. Diseñar también un programa principal que llame a estos procedimientos y compruebe su funcionamiento. 
- Procedimiento de imprimir enteros: El procedimiento recibe un valor numérico en a1 y lo muestra por pantalla.
- Procedimiento de imprimir cadenas de caracteres. El procedimiento recibe un puntero al comienzo de una cadena, en a1, y lo muestra por pantalla.
- Procedimiento de nueva línea. El procedimiento genera una nueva línea en pantalla.

[Resolución](ejercicio2.asm)

### Ejercicio 3 - Años bisiestos :bangbang:
Repetir el primer apartado, pero ahora estructurando el código que calcula si un año es bisiesto o no en un procedimiento. El procedimiento recibirá un año en el registro a1. Si el año es bisiesto, escribirá un 1 en a0. Si no es bisiesto escribirá un 0 en a0. Guardar y restaurar el contexto en el procedimiento y seguir las normas de estilo descritas anteriormente. Diseñar un programa principal que demuestre el procedimiento creado, y que además aproveche los procedimientos diseñados en el apartado 2). La salida por pantalla deberá ser la misma que la descrita en el apartado 1).

[Resolución](ejercicio3.asm)