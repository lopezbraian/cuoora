Class {
	#name : #UsuarioCTest,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
UsuarioCTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	user := UsuarioC new: 'pedro' conPass: '123456'.
	"______________NUEVA PREGUNTA______________"
	user
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: 'Pharo'.

	"______________NUEVO TOPICO DE INTERES______________"
	user
		agregarTopicoDeInteres: (Topico nombre: 'Musica' descripcion: 'Topico de musica').
		
	"______________SEGUIR A USUARIO______________"
	user serFollowerDe: (UsuarioC new: 'OO2' conPass: '123456')
	

]

{ #category : #tests }
UsuarioCTest >> testAgregarPregunta [
	self
		assert: user preguntas first titulo equals: 'Colecciones en pharo';
		assert: user preguntas size equals: 1
]

{ #category : #tests }
UsuarioCTest >> testAgregarTopicoDeInteres [
	self
		assert: user topicos first nombre equals: 'Musica';
		assert: user topicos size equals: 1
]

{ #category : #tests }
UsuarioCTest >> testSerFollower [
	self assert: user seguidos first usuario equals: 'OO2'.
	self assert: user seguidos size equals: 1
]
