Class {
	#name : #UsuarioC,
	#superclass : #Object,
	#instVars : [
		'user',
		'pass',
		'creacion',
		'followers',
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

{ #category : #accessing }
UsuarioC >> fechaDeCreacion [
	^ creacion
]

{ #category : #initialization }
UsuarioC >> initialize [
	super initialize .
	creacion := Date today.
	followers := OrderedCollection new
]

{ #category : #accessing }
UsuarioC >> pass [
	^ pass
]

{ #category : #accessing }
UsuarioC >> pass: anObject [
	pass := anObject
]

{ #category : #accessing }
UsuarioC >> usuario [
	^user
]

{ #category : #accessing }
UsuarioC >> usuario: aUser [

user:= aUser
]
