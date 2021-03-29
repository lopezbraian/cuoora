"
Representa a una Respuesta de Cuoora que hereda de Entrada
Instance var pregunta
"
Class {
	#name : #Respuesta,
	#superclass : #Entrada,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
Respuesta class >> newPreguntaConcontenido:aText from:aUsuario [

|r|
r:= self new.
r content: aText ; user: aUsuario.
]

{ #category : #accessing }
Respuesta >> pregunta [
	^pregunta
]
