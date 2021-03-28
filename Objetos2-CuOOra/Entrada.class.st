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

{ #category : #accessing }
Entrada >> user [
	^ user
]

{ #category : #accessing }
Entrada >> user: anObject [
	user := anObject
]
