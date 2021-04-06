Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'pedro',
		'maria'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	
	cuoora := CuOOra new.
	cuoora crearUsuario: 'pedro' conPass: '12345'.
	cuoora agregarTopico: 'Game' conDescripcion: 'Topico Juegos'.
	cuoora crearUsuario: 'maria' conPass: '12345'.
	pedro := cuoora usuarios first.
	maria := cuoora usuarios last.
	pedro
		agregarPreguntaConTitulo: 'Colecciones en pharo'
		Descripcion: 'diferencias entre detect/includes'
		Topicos: 'Pharo'.
	maria
		agregarPreguntaConTitulo: 'Seaside'
		Descripcion: 'que es seaside?'
		Topicos: 'Seaside'.
	pedro
		agregarTopicoDeInteres: (Topico nombre: 'Musica' descripcion: 'Topico de musica').
	pedro serFollowerDe: maria.
	maria serFollowerDe: pedro.
	pedro
		agregarRespuestaAPregunta: maria preguntas first
		contenido: 'Es un framework para realizar aplicaciones web'
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoconDescripcion [
	self assert: cuoora topicos size equals: 1.
	cuoora agregarTopico: 'Musica' conDescripcion: 'Topico Musica'.
	self assert: cuoora topicos size equals: 2
]

{ #category : #tests }
CuOOraTest >> testCrearUsuarioConPass [
	self assert: cuoora usuarios size equals: 1.
	cuoora crearUsuario: 'maria' conPass: '12345'.
	self assert: cuoora usuarios size equals: 2
]
