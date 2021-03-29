"
Representa a un Usuario de Cuoora
"
Class {
	#name : #UsuarioC,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass',
		'creacion',
		'seguidos',
		'topicos',
		'entradas'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
UsuarioC class >> new: aUser conPass: aPass [
	| u |
	u := self new.
	^u
		usuario: aUser;
		pass: aPass
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarPreguntaConTitulo: aTitle Descripcion: aText Topicos: aTopico [

self entradas: (Pregunta newConTitulo: aTitle descripcion: aText  topico: aTopico  from: self )
	
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarRespuestaAPregunta: aPregunta contenido: aText from: aUsuario [


aPregunta agregarRespuesta: (Respuesta newPreguntaConcontenido: aText from: aUsuario )
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarTopicoDeInteres: aTopico [

topicos add: aTopico
]

{ #category : #accessing }
UsuarioC >> entradas [
	^ entradas
]

{ #category : #accessing }
UsuarioC >> entradas: aEntrada [ 
	entradas add: aEntrada 
]

{ #category : #accessing }
UsuarioC >> fechaDeCreacion [
	^ creacion
]

{ #category : #initialization }
UsuarioC >> initialize [
	super initialize.
	creacion := DateAndTime now.
	seguidos := OrderedCollection new.
	topicos := OrderedCollection new.
	entradas:= OrderedCollection new
]

{ #category : #accessing }
UsuarioC >> pass: anObject [
	pass := anObject
]

{ #category : #'as yet unclassified' }
UsuarioC >> serFollowerDe: aUsuario [
	seguidos add: aUsuario
]

{ #category : #'as yet unclassified' }
UsuarioC >> topicos [

^topicos
]

{ #category : #accessing }
UsuarioC >> usuario [
	^user
]

{ #category : #accessing }
UsuarioC >> usuario: aUser [

user:= aUser
]
