Class {
	#name : #UsuarioC,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass',
		'creacion',
		'followers',
		'followed',
		'topicos'
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
UsuarioC >> agregarFollowed: aUsuario [
	followed add: aUsuario
]

{ #category : #'as yet unclassified' }
UsuarioC >> agregarFollower: aUsuario [ 

followers add: aUsuario 
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
	followers := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #accessing }
UsuarioC >> pass: anObject [
	pass := anObject
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
