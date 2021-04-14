Class {
	#name : #PageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callback }
PageComponent >> homeOfUser [
	^ self call: PageHomeComponent new
]

{ #category : #initialization }
PageComponent >> initialize [ 
	super initialize.
]

{ #category : #callback }
PageComponent >> logOut [ 
		^ self
		call:
			(LoginComponent new)
]

{ #category : #callback }
PageComponent >> profileOfUser: aUser [

^self call: (PageProfileComponent newWithData: aUser )
]

{ #category : #rendering }
PageComponent >> renderContentOn: aCanvas [
	aCanvas div
		class: 'header-wrapper';
		with: [ aCanvas div
				class: 'header-title';
				with: [ aCanvas heading: 'CuOOra' ].
			aCanvas div
				class: 'header-user';
				with: [ aCanvas anchor
						class: 'nombre-user';
						callback: [ self homeOfUser ];
						with: [ aCanvas paragraph: self session user usuario ].
					aCanvas anchor
						class: 'a-logout';
						callback: [ self logOut ];
						with: 'Logout' ] ].
	aCanvas horizontalRule
]

{ #category : #hooks }
PageComponent >> style [ 

^'
html {  
	font-family: sans-serif;
}
/* --------- HEADER ------------ */
.header-title {
	text-align:left;
	width:100%;
}
.header-wrapper {
	display:flex;
	justify-content: space-between;
	align-items:center;
}
.header-user {
	text-align:right;
	width:100%;
}
.header-user p { 
	display:inline-block;
	font-weight:bold;
	text-transform: Capitalize;
}
.a-logout { 
	margin-left:5px;
	text-decoration:none;
}
.header-title {
	text-align:left;
	width:100%;
}
/* --------- FIN HEADER ------------ */



/* --------- PREGUNTAS ------------ */
.title-pregunta{
		display:block;
		text-decoration:none;
		color:black;
		font-style: italic;
		font-size: 20px
}
	
.topico{
	font-style: italic;
	color: #9c9c9c
}
.pregunta { 
		display:block;
		text-decoration:none;
		color:black;
		font-style: italic;
		font-size: 20px
}
.nombre-user{
		display:inline;
		font-weight:bold;
		text-decoration:none;
		color:black;
}
.btn-calif { 
	text-decoration:none;
	margin-right:4px;
}

.title{
	font-size: 25px;
	font-weight: bold;
}	
/* --------- FIN PREGUNTAS ------------ */

/* --------- PAGE HOME ----------- */
.wrap-btn-home { 
	float:right;
}
.wrap-btn-home > a { 
	text-decoration:none;
	color:black;
}
/* --------- FIN PAGE HOME ------------ */
/* --------- PAGE HOME ----------- */
.wrap-btn-detail { 
	display:flex;
	justify-content:center;
	
}
.wrap-btn-detail > a { 
	text-decoration:none;
	color:black;
}
/* --------- FIN PAGE HOME ------------ */

.center { text-align:center }
form > textarea { 
	width:100%;
}

/* ------------------- RESPUESTA ------------- */

.container-respuesta{
	display:grid;
	max-width:500px;
	margin: 0 auto;
	grid-template-columns: 110px 1fr;
}
.container-respuesta > form >  textarea { 
	width:100%;
}
.container-respuesta > p { 
	margin: 0;
}
.wrap-button-form { 
	display:flex;
	gap:5px;
	justify-content:flex-end;
}
/* ------------------- FIN RESPUESTA ------------- */
/* ------------------- PREGUNTA ------------- */
.wrap-pregunta-form { 
	
	max-width:500px;
	margin:0 auto;

}

.wrap-button-question{
	gap:10px;
	display:flex;
	justify-content:center;
}
/* ------------------- FIN PREGUNTA ------------- */
'
]