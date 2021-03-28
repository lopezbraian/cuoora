Class {
	#name : #UsuarioC,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass',
		'creacion',
		'seguidos',
		'topicos',
		'preguntas'
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
UsuarioC >> agregarTopicoDeInteres: aTopico [

topicos add: aTopico
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
	preguntas:= OrderedCollection new
]

{ #category : #accessing }
UsuarioC >> pass: anObject [
	pass := anObject
]

{ #category : #accessing }
UsuarioC >> preguntas [
	^ preguntas
]

{ #category : #accessing }
UsuarioC >> preguntas: aPregunta [ 
	preguntas add: aPregunta 
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
