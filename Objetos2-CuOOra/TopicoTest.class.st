Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-Test'
}

{ #category : #running }
TopicoTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
|newTopico|

newTopico := Topico nombre: 'Game' descripcion: 'Un topico de juegos' 
]
