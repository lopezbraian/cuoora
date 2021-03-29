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
p titulo: aText ; descr: aText2 ; topicos: aTopico ; user: aUsuario .
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

{ #category : #accessing }
Pregunta >> respuestas [
	^ rtas
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
	topicos add: aTopico 
]
