"
Representa a una Pregunta de Cuoora que hereda de Entrada
Instance var titulo topicos rtas
"
Class {
	#name : #Pregunta,
	#superclass : #Entrada,
	#instVars : [
		'titulo',
		'topicos',
		'rtas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Pregunta class >> newConTitulo: aText descripcion: aText2 topico: aTopico from: aUsuario [

|p|

p:= self new.
^p titulo: aText ; descr: aText2 ; topicos: aTopico ; user: aUsuario .
]

{ #category : #accessing }
Pregunta >> agregarRespuesta: aRespuesta [
	rtas add: aRespuesta 
]

{ #category : #initialization }
Pregunta >> initialize [
	super initialize.
	topicos:= OrderedCollection new.
	rtas:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Pregunta >> obtenerRespuestasDe: aUsuario [
	^rtas select: [ :r | r user == aUsuario ]
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ rtas
]

{ #category : #'as yet unclassified' }
Pregunta >> tieneTopico: unTopico [

^topicos includes: unTopico .
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]

{ #category : #accessing }
Pregunta >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]

{ #category : #accessing }
Pregunta >> topicos: aTopico [
	topicos addAll: aTopico
]
