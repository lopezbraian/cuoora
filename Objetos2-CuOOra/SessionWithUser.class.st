Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user',
		'model',
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #accessing }
SessionWithUser >> user [
	^user.
]

{ #category : #accessing }
SessionWithUser >> user: aObject [
	user:=aObject
]
