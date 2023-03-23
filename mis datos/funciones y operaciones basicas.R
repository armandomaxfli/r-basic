#creación de funciones
# nombre_función = function(variable){func}

miVariable = 4
doble = function(x){2*x}

#función  f(x) = x^3 - (3^x) * sen(x)
f = function(x) {x^3 - (3^x) * sin(x)}

#el nombre de la variable puede cambiar o ponerle cualquier nombre
suma1 <- function(t) {t+1}
suma1(7)
suma1(-8)
#funcion de dos variables
producto <- function(x, y){x*y}

producto(5, 7)
doble(3)
f(35)

g <- function(x,y,z) {
  exp(x^2 +y) * sin(z)
  }

#se pueden crear varias funciones uno debajo de la otra
suma5 <- function(numero){
  numero = suma1(numero);
  numero = suma1(numero);
  numero = suma1(numero);
  numero = suma1(numero)
  suma1(numero)
}
suma5(2)

#enlista las variables o funciones creadas
ls()

#elimina funciones o variables que ya no necesitamos
rm(producto)
ls()

#operaciones basicas
opBasic = function(a,b){
  print(a+b)
  print(a-b)
  print(a*b)
  print(a%/%b)
}

opBasic(5,3)

opBasic2 <- function(a,b){
  print("suma")
  print(a+b)
  print("resta")
  print(a-b)
  print("multiplicacion")
  print(a*b)
  print("division")
  print(a/b)
}
opBasic2(5,3)

opBasic3 = function(a,b){
  print("suma")
  print(a+b)
  print("resta")
  print(a-b)
  print(b-a)
  print("multiplicacion")
  print(a*b)
  print("division")
  print(a/b)
  print(b/a)
}
opBasic3(5,3)

opBasic4 = function(a,b){
  print("suma")
  print(a+b)
  print("resta")
  print(paste(sprintf("%i - %i = ",a,b),a-b))
  print(paste(sprintf("%i - %i = ",b,a),b-a))
  print("multiplicacion")
  print(a*b)
  print("division")
  print(paste(sprintf("%i : %i = ",a,b),a/b))
  print(paste(sprintf("%i : %i = ",b,a),b/a))
}
opBasic4(5,3)

