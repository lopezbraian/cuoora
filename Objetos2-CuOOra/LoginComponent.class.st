Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
LoginComponent class >> conUser: aUsername Pass: aPassword [
^	self new
		username: aUsername;
		password: aPassword yourself
]

{ #category : #initialize }
LoginComponent >> initialize [ 
	super initialize .
]

{ #category : #'private protocol' }
LoginComponent >> login [
	|user|
	user:=self model  loginWithUsername: username pass: password.
	
	user 
	ifNil: [ ^ false] 
	ifNotNil: [
		self session user: user.
		self session model: self model.
		^self call: HomeComponent new 	
	].
	

]

{ #category : #model }
LoginComponent >> model [
	^ CuOOra soleInstance .
]

{ #category : #accesing }
LoginComponent >> password [ 
	^password 
]

{ #category : #accesing }
LoginComponent >> password: aPassword [
	password:=aPassword .
]

{ #category : #'as yet unclassified' }
LoginComponent >> registerNewUser [

self call: RegisterComponent new
]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas label: 'Usuario'.
					aCanvas textInput on: #username of: self ].
			aCanvas
				paragraph: [ aCanvas label: 'Contraseña'.
					aCanvas textInput on: #password of: self ].
			aCanvas button
				callback: [ self login ];
				with: 'Iniciar Sesión' .
	aCanvas horizontalRule.
	aCanvas paragraph: 'No tienes una cuenta?'.
	aCanvas button
		callback: [ self registerNewUser ];
		with: 'Regístrate'].
]

{ #category : #accesing }
LoginComponent >> username [
	^username 
]

{ #category : #accesing }
LoginComponent >> username: aUsername [
	username:=aUsername
]
