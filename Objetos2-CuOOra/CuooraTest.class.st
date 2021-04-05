Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	cuoora := CuOOra new.
	cuoora crearUsuario: 'pedro' conPass: '12345'.
	cuoora agregarTopico: 'Game' conDescripcion: 'Topico Juegos'
	
	
	
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoconDescripcion [
	self assert: cuoora topicos size equals: 1.
	cuoora agregarTopico: 'Musica' conDescripcion: 'Topico Musica'.
	self assert: cuoora topicos size equals: 2
]

{ #category : #'as yet unclassified' }
CuOOraTest >> testCrearUsuarioConPass [
	self assert: cuoora usuarios size equals: 1.
	cuoora crearUsuario: 'maria' conPass: '12345'.
	self assert: cuoora usuarios size equals: 2
]
