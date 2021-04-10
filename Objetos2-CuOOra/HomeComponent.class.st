Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
HomeComponent >> initialize [ 
	super initialize .
]

{ #category : #accessing }
HomeComponent >> model [ 
	^ CuOOra soleInstance .
]

{ #category : #rendering }
HomeComponent >> renderContentOn:aCanvas [
	self session user.
	self renderHeaderOn: aCanvas.
	self renderFeed: aCanvas.
]

{ #category : #rendering }
HomeComponent >> renderFeed: aCanvas [
	|collectionPreguntas|
	"collectionPreguntas := self session model obtenerPreguntasRelevantesPara: self session user."
	collectionPreguntas := self session user preguntas.
	aCanvas heading: 'Ultimas preguntas'.
	aCanvas
		unorderedList: [ collectionPreguntas
				do: [ :each | aCanvas listItem: each titulo  ] ].
]

{ #category : #rendering }
HomeComponent >> renderHeaderOn:aCanvas [
	aCanvas
		div class: 'header-wrapper';
		with: [ self renderHeaderTitle: aCanvas . self renderHeaderUser: aCanvas].
	aCanvas horizontalRule.
]

{ #category : #rendering }
HomeComponent >> renderHeaderTitle:aCanvas [
	aCanvas
		div class: 'header-title';
		with: [ aCanvas heading:'cuOOra'].
]

{ #category : #rendering }
HomeComponent >> renderHeaderUser: aCanvas [
	aCanvas div
		class: 'header-user';
		with: [ aCanvas paragraph: self session user usuario.
 aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Logout' ] ]		
	


]

{ #category : #hooks }
HomeComponent >> style [
	^'.header-wrapper {
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
		.header-user button { 
			border:none;
			background:none;
			cursor:pointer;
		 }
		.header-title {
			text-align:left;
			width:100%;
		 }
	'
]
