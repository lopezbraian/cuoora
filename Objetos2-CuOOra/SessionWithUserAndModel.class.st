Class {
	#name : #SessionWithUserAndModel,
	#superclass : #WASession,
	#instVars : [
		'user',
		'model',
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #accessing }
SessionWithUserAndModel >> model [

	^model
]

{ #category : #accessing }
SessionWithUserAndModel >> model: aModel [

	model:= aModel.
]

{ #category : #accessing }
SessionWithUserAndModel >> user [
	^user.
]

{ #category : #accessing }
SessionWithUserAndModel >> user: aObject [
	user:=aObject
]
