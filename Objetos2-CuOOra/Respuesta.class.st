Class {
	#name : #Respuesta,
	#superclass : #Entrada,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Respuesta class >> newConDescripcion: aText from: aUsuario [

|r|

r:=self new.
r descr: aText; user: aUsuario 
]
