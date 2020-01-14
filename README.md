Desarrolle la app en Rails (5.2.4) porque es lo que mas conozco y con lo que mas
trabaje. La version de ruby usada es 2.6.3

Alcance:

El alcance que supuse es solo una pantalla de carga de datos y un mensaje al final.
Logre usar todos los endpoints dados, creo que el unico "error" (nose si es tal)
es que al final el estado del issue es siempre "new", nunca obtengo error o 
aprobado por ejemplo, pero no suena tan mal dado que esa info puede ser analizada
por alguien o algo y luego cambiar de estado.
Diseñe una interfaz de usuario, con un formulario con validaciones, y al final 
muestra el estado del issue y un msj.

Estructura

Hay un controlador (users_controller) que maneja la logica. Un modelo usuario,
que no se persiste (no implemente BD), un formulario (use la gema reform), un
objeto que hace la conexion con la api (para eso use Faraday), guarde las
variables de entorno en el application.yml (use figaro, aunque con un solo env
no era tan necesario, pero es buena practica para las claves), para las vistas 
use el template de AdmiLTE y un pesenter que carga la pantalla final.

TODO

Me hubiera gustado refactorizar un poco mas, sobre todo UserBitexManager,
pero era demasiado tiempo ya, a mi parecer.
Para el formulario hubiera usado React o algo similar, pero al desconocer casi
por completo como funciona, no me parecio viable.
Usar Docker, para que no les sea necesario instalar las gemas y demas para poder
probar el desarrollo.
Ademas, me hubiera gustado testear, usando rspec con factoryBot, pero, otra vez,
no disponia del tiempo.

TIEMPO DEDICADO

Sumando a los errores que hablamos por mail, analisis y desarrollo, el tiempo
estimado es de 8 hs

RESUMEN

Fue muy entretenido y creo que salio algo bastante bien en relacion timpo/calidad
jeje