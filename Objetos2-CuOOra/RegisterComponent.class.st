Class {
	#name : #RegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
RegisterComponent >> initialize [ 
	super initialize 
]

{ #category : #accessing }
RegisterComponent >> model [ 
	^CuOOra soleInstance .
]

{ #category : #accessing }
RegisterComponent >> password [ 

	^password .
]

{ #category : #accessing }
RegisterComponent >> password: aPass [

	password:= aPass.
]

{ #category : #'tools registry' }
RegisterComponent >> register [
	self model crearUsuario: username conPass: password.
	self call: (LoginComponent conUser: username Pass: password) .
]

{ #category : #rendering }
RegisterComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Registro'.
	aCanvas
		form: [ 
			aCanvas paragraph: [ aCanvas label: 'Usuario'. aCanvas textInput on: #username of:self ].
			aCanvas paragraph: [ aCanvas label: 'Contraseña'. aCanvas textInput on: #password of:self ].
			aCanvas
				button callback: [self register];
				with: 'Registrarse'
			 ].
]

{ #category : #accessing }
RegisterComponent >> username [
	^username
]

{ #category : #accessing }
RegisterComponent >> username:aUsername [
	username:=aUsername.
]
