Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos',
		'preguntas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarPreguntaConTitulo: aTitle Descripcion: aText Topicos: aTopico de: aUsuarioC [
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: aName conDescripcion: aText [
	topicos add: (Topico nombre: aName descripcion: aText)
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: aUser conPass: aPass [
	usuarios add: (UsuarioC new: aUser conPass: aPass)
]
