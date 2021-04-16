Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'user',
		'user2',
		'topicoMusica',
		'topicoSeaside'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
PreguntaTest >> setUp [

	user := UsuarioC new: 'pedro' conPass: '123456'.
	user2 := UsuarioC new: 'maria' conPass: '123456'.
	topicoMusica := OrderedCollection new.
	topicoMusica
		add: (Topico newConNombre: 'Musica' descripcion: 'Topico de musica').
	topicoSeaside := OrderedCollection new.
	topicoSeaside
		add: (Topico newConNombre: 'Seaside' descripcion: 'Topico de Seaside').
	"______________NUEVA PREGUNTA______________"
	user
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: topicoMusica.
	user2
		agregarPreguntaConTitulo: 'Seaside'
		Descripcion: 'que es seaside?'
		Topicos: topicoSeaside.

	"______________NUEVA RESPUESTA A PREGUNTA______________"
	user
		agregarRespuestaAPregunta: user2 preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'
	
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuesta [
	self assert: user2 preguntas first respuestas size equals: 1.
	user
		agregarRespuestaAPregunta: user2 preguntas first
		contenido: 'Es un framework para realizar aplicaciones'.
		
	self assert: user2 preguntas first respuestas size equals: 2
]

{ #category : #tests }
PreguntaTest >> testObtenerRespuestasDe [
	| respuestasUser |
	respuestasUser := user2 preguntas first obtenerRespuestasDe: user.
	self assert: respuestasUser size equals: 1.
	user
		agregarRespuestaAPregunta: user2 preguntas first
		contenido: 'Es un framework para realizar aplicaciones'.
		respuestasUser := user2 preguntas first obtenerRespuestasDe: user.
	
	self assert: respuestasUser size equals: 2
]

{ #category : #tests }
PreguntaTest >> testTieneTopico [
	self
		assert: (user2 preguntas first tieneTopico: topicoSeaside first)
		equals: true.
	self
		assert: (user2 preguntas first tieneTopico: topicoMusica first)
		equals: false
]
