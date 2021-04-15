Class {
	#name : #LayoutComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
LayoutComponent class >> withComponent: aComponent [

	^ self new component: aComponent.
]

{ #category : #hooks }
LayoutComponent >> children [ 

^ Array with: component.
]

{ #category : #accessing }
LayoutComponent >> component [ 
	^ component.
]

{ #category : #accessing }
LayoutComponent >> component: aComponent [

	component:=aComponent .
]

{ #category : #callback }
LayoutComponent >> homeOfUser [
	^ self call: (LayoutComponent  withComponent:HomeComponent new) .
]

{ #category : #initialization }
LayoutComponent >> initialize [ 
	super initialize.
]

{ #category : #callback }
LayoutComponent >> logOut [ 
		^ self
		call:
			(LoginComponent new)
]

{ #category : #callback }
LayoutComponent >> profileOfUser: aUser [
	^ self
		call: (LayoutComponent withComponent: (ProfileComponent newWithData: aUser))
]

{ #category : #rendering }
LayoutComponent >> renderContentOn: aCanvas [
	self renderHeader: aCanvas.
	aCanvas render: component
]

{ #category : #rendering }
LayoutComponent >> renderHeader: aCanvas [
	aCanvas div
		class: 'header-wrapper';
		with: [ aCanvas div
				class: 'header-title';
				with: [ aCanvas anchor
						class: 'nombre-user';
						callback: [ self homeOfUser ];
						with: [ aCanvas heading: 'CuOOra' ] ].
			aCanvas div
				class: 'header-user';
				with: [ aCanvas anchor
						class: 'nombre-user';
						callback: [ self profileOfUser: self session user ];
						with: [ aCanvas paragraph: self session user usuario ].
					aCanvas anchor
						class: 'a-logout';
						callback: [ self logOut ];
						with: 'Logout' ] ].
	aCanvas horizontalRule
]

{ #category : #hooks }
LayoutComponent >> style [ 

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
