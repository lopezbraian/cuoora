Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #creation }
Topico class >> nombre: aName descripcion: aText [
|t|

t:=self new.
^t name: aName; descripcion: aText 
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Topico >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #accessing }
Topico >> nombre: anObject [
	nombre := anObject
]
