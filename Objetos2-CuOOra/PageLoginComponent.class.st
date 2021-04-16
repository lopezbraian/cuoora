"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: 'login'.
application sessionClass: SessionWithUserAndModel.

"
Class {
	#name : #PageLoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
PageLoginComponent class >> conUser: aUsername Pass: aPassword [
^	self new
		username: aUsername;
		password: aPassword yourself
]

{ #category : #initialize }
PageLoginComponent >> initialize [ 
	super initialize .
]

{ #category : #callback }
PageLoginComponent >> login [
	| user |
	user := CuOOra soleInstance loginWithUsername: username pass: password.
	user
		ifNil: [ ^ false ]
		ifNotNil: [ self session user: user.
			^ self call: (LayoutComponent withComponent: PageHomeComponent new) ]
]

{ #category : #model }
PageLoginComponent >> model [
	^ CuOOra soleInstance .
]

{ #category : #accesing }
PageLoginComponent >> password [ 
	^password 
]

{ #category : #accesing }
PageLoginComponent >> password: aPassword [
	password:=aPassword .
]

{ #category : #'as yet unclassified' }
PageLoginComponent >> renderContentOn: aCanvas [
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
]

{ #category : #hooks }
PageLoginComponent >> style [
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
PageLoginComponent >> username [
	^username 
]

{ #category : #accesing }
PageLoginComponent >> username: aUsername [
	username:=aUsername
]
