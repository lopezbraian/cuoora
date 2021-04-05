"
Representa una Entrada a la red cuoora



Instance var descr creacion user calificaciones
"
Class {
	#name : #Entrada,
	#superclass : #Object,
	#instVars : [
		'descr',
		'creacion',
		'user',
		'calificaciones'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'as yet unclassified' }
Entrada >> aCalifacion:aBoolean from:aUsuario [

|califPregunta existCalifUser|

califPregunta := self calificaciones.

existCalifUser:=califPregunta detect: [ :each | each user == aUsuario  ] ifNone: [ nil ].

existCalifUser ifNotNil: [
	"califPregunta do:[ :each | each user = aUsuario ifTrue: [ each cambiarValorLike:aBoolean ] ]"
	existCalifUser cambiarValorLike:aBoolean.
].

existCalifUser ifNil: [ calificaciones add: (Calificacion newFrom:  aUsuario like: aBoolean ) ]


]

{ #category : #accessing }
Entrada >> calificaciones [
	^ calificaciones
]

{ #category : #accessing }
Entrada >> creacion [
	^ creacion
]

{ #category : #accessing }
Entrada >> creacion: anObject [
	creacion := anObject
]

{ #category : #accessing }
Entrada >> descr [
	^ descr
]

{ #category : #accessing }
Entrada >> descr: anObject [
	descr := anObject
]

{ #category : #initialization }
Entrada >> initialize [ 

super initialize .
creacion := DateAndTime now.
calificaciones := OrderedCollection new.
]

{ #category : #testing }
Entrada >> isLikedFrom:aUsuario [

|calif|

calif:= self calificaciones find: aUsuario.

^calif.
]

{ #category : #accessing }
Entrada >> user [
	^ user
]

{ #category : #accessing }
Entrada >> user: anObject [
	user := anObject
]
