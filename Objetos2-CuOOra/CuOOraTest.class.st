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
	cuoora agregarTopico: 'Juegos' conDescripcion: 'Topico Videojuegos' .
	
	pedro := cuoora usuarios first.
	maria := cuoora usuarios last.
	"-------------- CREAR TOPICOS ---------------"
	topicoPharo:= Topico nombre: 'Pharo' descripcion: 'Topico de pharo'. 
	topicoSeaside := Topico nombre: 'Seaside' descripcion: 'Topico de seaside'.
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
		contenido: 'Es un framework para realizar aplicaciones web'
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
	
	|preguntasRev|
	
	preguntasRev := cuoora obtenerPreguntasRelevantesPara: pedro.
	
	^preguntasRev.
]

{ #category : #test }
CuOOraTest >> testObtenerRespuestaAPregunta [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
CuOOraTest >> testPreguntasDe [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
CuOOraTest >> testPuntajeDe [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
CuOOraTest >> testRespuestasDe [

	self flag: #toImplement.
	self assert: false
]
