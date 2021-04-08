Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'pedro',
		'maria',
		'topicoPharo',
		'topicoSeaside'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	cuoora := CuOOra new.
	cuoora crearUsuario: 'pedro' conPass: '12345'.
	cuoora crearUsuario: 'maria' conPass: '12345'.
	cuoora agregarTopico: 'Juegos' conDescripcion: 'Topico Videojuegos'.
	pedro := cuoora usuarios first.
	maria := cuoora usuarios last.
	"-------------- CREAR TOPICOS ---------------"
	topicoPharo := Topico nombre: 'Pharo' descripcion: 'Topico de pharo'.
	topicoSeaside := Topico
		nombre: 'Seaside'
		descripcion: 'Topico de seaside'.
	"--------------- AGREGAR PREGUNTAS -------------"
	pedro
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: topicoPharo.
	pedro
		agregarPreguntaConTitulo: 'Variables en pharo'
		Descripcion: 'Variables local o globales'
		Topicos: topicoPharo.
	maria
		agregarPreguntaConTitulo: 'Seaside'
		Descripcion: 'que es seaside?'
		Topicos: topicoSeaside.

	"---------------- AGREGANDO TOPICOS DE INTERES ----------------"
	pedro
		agregarTopicoDeInteres: (Topico nombre: 'Musica' descripcion: 'Topico de musica').

	"---------------- AGREGANDO FOLLOWERS -----------------------"
	pedro serFollowerDe: maria.
	maria serFollowerDe: pedro.
	"---------------- AGREGAR RESPUESTA --------------------"
	pedro
		agregarRespuestaAPregunta: maria preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'.
	pedro
		agregarRespuestaAPregunta: maria preguntas first
		contenido: 'Es útil para el lenguaje Smalltalk'.
	
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoconDescripcion [
	self assert: cuoora topicos size equals: 1.
	cuoora agregarTopico: 'Musica' conDescripcion:'Topico musica'.
	self assert: cuoora topicos size equals: 2
]

{ #category : #tests }
CuOOraTest >> testCrearUsuarioConPass [
	self assert: cuoora usuarios size equals: 2.
	cuoora crearUsuario: 'maria' conPass: '12345'.
	self assert: cuoora usuarios size equals: 3
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasDeTopico [
	|preguntasDeTopicos|
	preguntasDeTopicos:=cuoora obtenerPreguntasDeTopico: topicoPharo .
	
	self assert: preguntasDeTopicos size equals: 2 .
]

{ #category : #test }
CuOOraTest >> testObtenerPreguntasRelevantesPara [
	"pedro solo sigue a maria que tiene una pregunta"
	self
		assert: (cuoora obtenerPreguntasRelevantesPara: pedro) size
		equals: 1.
	"pedro es el unico q tiene preguntas con este topico por lo que no deberia alterar el resultado"
	pedro agregarTopicoDeInteres: topicoPharo.
	self
		assert: (cuoora obtenerPreguntasRelevantesPara: pedro) size
		equals: 1.
	"pedro solo sigue a maria que tiene dos preguntas"

	self
		assert: (cuoora obtenerPreguntasRelevantesPara: maria) size
		equals: 2.
	"pedro es el unico q tiene preguntas con este topico y maria ya lo sigue por lo que no deberia alterar el resultado"
	maria agregarTopicoDeInteres: topicoPharo.
	self
		assert: (cuoora obtenerPreguntasRelevantesPara: maria) size
		equals: 2.
	

]

{ #category : #test }
CuOOraTest >> testObtenerRespuestaAPregunta [
	| rta1 rta2 |
	rta1 := maria preguntas first respuestas first.
	rta2 := maria preguntas first respuestas last.
	maria agregarCalificacion: true aEntrada: rta1.
	pedro agregarCalificacion: true aEntrada: rta1.
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
	self assert: (cuoora preguntasDe: pedro) size equals: 2.
	pedro
		agregarPreguntaConTitulo: 'Ayuda con TestCase'
		Descripcion: 'cómo simplificar los test'
		Topicos: topicoPharo.
		self assert: (cuoora preguntasDe: pedro) size equals: 3.

]

{ #category : #test }
CuOOraTest >> testPuntajeDe [
	self assert: (cuoora puntajeDe: pedro) equals: 140.
	self assert: (cuoora puntajeDe: maria) equals: 20.
	
]

{ #category : #test }
CuOOraTest >> testRespuestasDe [
	self assert: (cuoora respuestasDe: pedro) size equals: 2.
	self
		assert: (cuoora respuestasDe: pedro) first user usuario
		equals: 'pedro'.
		
	pedro
		agregarRespuestaAPregunta: pedro preguntas first 
		contenido: 'Es un framework para realizar aplicaciones web'.
	
"si se responde a si mismo no debe considerarse la rta"

self assert: (cuoora respuestasDe: pedro) size equals: 2.
	
]
