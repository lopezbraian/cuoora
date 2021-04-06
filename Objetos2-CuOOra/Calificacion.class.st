"
Representa una Califacion para una entradas 


Instance var creacion user like
"
Class {
	#name : #Calificacion,
	#superclass : #Object,
	#instVars : [
		'creacion',
		'user',
		'like'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Calificacion class >> newFrom: aUser like: aBool [

|c|

c:=self new.
^c user: aUser; like: aBool ; creacion: DateAndTime now.
]

{ #category : #accessing }
Calificacion >> creacion [
	^ creacion
]

{ #category : #accessing }
Calificacion >> creacion: anObject [
	creacion := anObject
]

{ #category : #accessing }
Calificacion >> like [
	^ like
]

{ #category : #accessing }
Calificacion >> like: anObject [
	like := anObject
]

{ #category : #accessing }
Calificacion >> user [
	^ user
]

{ #category : #accessing }
Calificacion >> user: anObject [
	user := anObject
]
