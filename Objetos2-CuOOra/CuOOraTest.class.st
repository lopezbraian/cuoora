Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'luis',
		'maria',
		'topicoPharo',
		'topicoSeaside'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Para los test toma en cuenta los datos cargados en dataTest, aparte de estos nuevos datos"

	cuoora := CuOOra new.
	luis := cuoora crearUsuario: 'luis' conPass: '12345'.
	maria := cuoora crearUsuario: 'maria' conPass: '12345'.
	cuoora agregarTopico: 'Juegos' conDescripcion: 'Topico Videojuegos'.
	"-------------- CREAR TOPICOS ---------------"
	topicoPharo := OrderedCollection new.
	topicoPharo
		add: (Topico nombre: 'Pharo' descripcion: 'Topico de pharo').
	topicoSeaside := OrderedCollection new.
	topicoSeaside
		add: (Topico nombre: 'Seaside' descripcion: 'Topico de seaside').

	"--------------- AGREGAR PREGUNTAS -------------"
	luis
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: topicoPharo.
	luis
		agregarPreguntaConTitulo: 'Variables en pharo'
		Descripcion: 'Variables local o globales'
		Topicos: topicoPharo.
	maria
		agregarPreguntaConTitulo: 'Seaside'
		Descripcion: 'que es seaside?'
		Topicos: topicoSeaside.

	"---------------- AGREGANDO TOPICOS DE INTERES ----------------"
	luis
		agregarTopicoDeInteres: (Topico nombre: 'Musica' descripcion: 'Topico de musica').

	"---------------- AGREGANDO FOLLOWERS -----------------------"
	luis serFollowerDe: maria.
	maria serFollowerDe: luis.
	"---------------- AGREGAR RESPUESTA --------------------"
	luis
		agregarRespuestaAPregunta: maria preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'.
	luis
		agregarRespuestaAPregunta: maria preguntas first
		contenido: 'Es útil para el lenguaje Smalltalk'
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoconDescripcion [
	self assert: cuoora topicos size equals: 4.
	cuoora agregarTopico: 'Musica' conDescripcion: 'Topico musica'.
	self assert: cuoora topicos size equals: 5
]

{ #category : #tests }
CuOOraTest >> testCrearUsuarioConPass [
	self assert: cuoora usuarios size equals: 5.
	cuoora crearUsuario: 'maria' conPass: '12345'.
	self assert: cuoora usuarios size equals: 6
]

{ #category : #test }
CuOOraTest >> testLoginWithUsernamePass [
	| userlog |
	userlog := cuoora loginWithUsername: luis usuario pass: luis pass.
	self assert: userlog usuario equals: 'luis'.
	userlog := cuoora loginWithUsername: maria usuario pass: maria pass.
	self assert: userlog usuario equals: 'maria'.
	userlog := cuoora
		loginWithUsername: maria usuario
		pass: 'contraseñaincorrecta'.
	self assert: userlog equals: nil
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasDeTopico [
	| preguntasDeTopicos |
	preguntasDeTopicos := cuoora obtenerPreguntasDeTopico: topicoPharo first.
	self assert: preguntasDeTopicos size equals: 2
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasRelevantesPara [
	"pedro solo sigue a maria que tiene una pregunta"

	self
		assert: (cuoora obtenerPreguntasRelevantesPara: luis) size
		equals: 1.
	"pedro es el unico q tiene preguntas con este topico por lo que no deberia alterar el resultado"
	luis agregarTopicoDeInteres: topicoPharo.
	self
		assert: (cuoora obtenerPreguntasRelevantesPara: luis) size
		equals: 1.
	"pedro solo sigue a maria que tiene dos preguntas"
	self
		assert: (cuoora obtenerPreguntasRelevantesPara: maria) size
		equals: 2.
	"pedro es el unico q tiene preguntas con este topico y maria ya lo sigue por lo que no deberia alterar el resultado"
	maria agregarTopicoDeInteres: topicoPharo.
	self
		assert: (cuoora obtenerPreguntasRelevantesPara: maria) size
		equals: 2
]

{ #category : #test }
CuOOraTest >> testObtenerRespuestaAPregunta [
	| rta1 rta2 |
	rta1 := maria preguntas first respuestas first.
	rta2 := maria preguntas first respuestas last.
	maria agregarCalificacion: true aEntrada: rta1.
	luis agregarCalificacion: true aEntrada: rta1.
	maria agregarCalificacion: false aEntrada: rta2.
	self
		assert: (cuoora obtenerRespuestaAPregunta: maria preguntas first) size
		equals: 2.
	self
		assert: (cuoora obtenerRespuestaAPregunta: maria preguntas first) first
		equals: rta1.
	self
		assert: (cuoora obtenerRespuestaAPregunta: maria preguntas first) last puntaje
		equals: -1
]

{ #category : #test }
CuOOraTest >> testPreguntasDe [
	self assert: (cuoora preguntasDe: luis) size equals: 2.
	luis
		agregarPreguntaConTitulo: 'Ayuda con TestCase'
		Descripcion: 'cómo simplificar los test'
		Topicos: topicoPharo.
	self assert: (cuoora preguntasDe: luis) size equals: 3
]

{ #category : #test }
CuOOraTest >> testPuntajeDe [
	self assert: (cuoora puntajeDe: luis) equals: 140.
	self assert: (cuoora puntajeDe: maria) equals: 20
]

{ #category : #test }
CuOOraTest >> testRespuestasDe [
	self assert: (cuoora respuestasDe: luis) size equals: 2.
	self
		assert: (cuoora respuestasDe: luis) first user usuario
		equals: 'luis'.
	luis
		agregarRespuestaAPregunta: luis preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'.

	"si se responde a si mismo no debe considerarse la rta"
	self assert: (cuoora respuestasDe: luis) size equals: 2
]
