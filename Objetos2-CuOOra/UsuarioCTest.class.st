Class {
	#name : #UsuarioCTest,
	#superclass : #TestCase,
	#instVars : [
		'user',
		'user2'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
UsuarioCTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	user := UsuarioC new: 'pedro' conPass: '123456'.
	user2 := UsuarioC new: 'maria' conPass: '123456'.

	"______________NUEVA PREGUNTA______________"
	user
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: 'Pharo'.
	user2
		agregarPreguntaConTitulo: 'Seaside'
		Descripcion: 'que es seaside?'
		Topicos: 'Seaside'.


	"______________NUEVO TOPICO DE INTERES______________"
	user
		agregarTopicoDeInteres: (Topico nombre: 'Musica' descripcion: 'Topico de musica').

	"______________SEGUIR A USUARIO______________"
	user serFollowerDe: (UsuarioC new: 'OO2' conPass: '123456').
	
	"______________NUEVA RESPUESTA A PREGUNTA______________"
user
		agregarRespuestaAPregunta: user2 preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'.
	
]

{ #category : #tests }
UsuarioCTest >> testAgregarRespuestaAPreguntaContenido [
	self assert: user2 preguntas first respuestas size equals: 1.
	self
		assert: user2 preguntas first respuestas first content
		equals: 'Es un framework para realizar aplicaciones web'.
	self assert: user2 preguntas first respuestas first user equals: user
]

{ #category : #tests }
UsuarioCTest >> testAgregarTopicoDeInteres [
	self
		assert: user topicos first nombre equals: 'Musica';
		assert: user topicos size equals: 1
]

{ #category : #tests }
UsuarioCTest >> testBorrarPregunta [
	| p |
	p := user preguntas first.
	user borrarPregunta: p.
	self assert: user preguntas size equals: 0
]

{ #category : #tests }
UsuarioCTest >> testSerFollowerDe [
	self assert: user seguidos first usuario equals: 'OO2'.
	self assert: user seguidos size equals: 1
]

{ #category : #tests }
UsuarioCTest >> testagregarPreguntaConTituloDescripcionTopicos [
	self
		assert: user preguntas first titulo equals: 'Colecciones en pharo';
		assert: user preguntas size equals: 1
]
