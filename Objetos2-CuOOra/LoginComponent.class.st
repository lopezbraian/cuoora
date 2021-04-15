"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: 'login'.
application sessionClass: SessionWithUserAndModel.

"
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

{ #category : #callback }
LoginComponent >> login [
	| user |
	user := self model loginWithUsername: username pass: password.
	user
		ifNil: [ ^ false ]
		ifNotNil: [ self session user: user.
			self session model: self model.
			^ self call: (PageComponent withComponent: PageHomeComponent new) ]
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

{ #category : #callback }
LoginComponent >> registerNewUser [

self call: (RegisterComponent new).
]

{ #category : #'as yet unclassified' }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas paragraph
		class: 'title';
		with: 'CuOOra'.
	aCanvas form
		class: 'form-login';
		with: [ aCanvas label: 'Usuario'.
			aCanvas textInput
				placeholder: 'user@cuoora.com';
				on: #username of: self.
			aCanvas break.
			aCanvas break.
			aCanvas label: 'Contraseña'.
			aCanvas textInput
				type: 'password';
				placeholder: '**********';
				on: #password of: self.
			aCanvas break.
			aCanvas button
				class: 'btn-login';
				callback: [ self login ];
				with: 'Iniciar Sesión' ].
	aCanvas break.
	aCanvas break.
	aCanvas horizontalRule.
	aCanvas div
		class: 'login-btn-register';
		with: [ aCanvas paragraph: 'No tienes una cuenta?'.
			aCanvas button
				callback: [ self registerNewUser ];
				with: 'Regístrate' ]
]

{ #category : #hooks }
LoginComponent >> style [
^'
.title{
	font-size:2.5rem;
	margin:5px;
}
.form-login{ 
	margin:50px;
	margin-bottom:0px;
}
.form-login > label { 
	display:inline-block;
	width:100px;
	font-weight:bold;
}
.form-login > input { 
	border:2px solid black;
}
.btn-login { 
	margin-left:100px;
	margin-top:20px;
	background-color: #0098EF;
	height:40px;
	border:none;
	color:white;
}
.login-btn-register{
	width: 150px;
	margin:0 auto;
	text-align:center;
'
]

{ #category : #accesing }
LoginComponent >> username [
	^username 
]

{ #category : #accesing }
LoginComponent >> username: aUsername [
	username:=aUsername
]
