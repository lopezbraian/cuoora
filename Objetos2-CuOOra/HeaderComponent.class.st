Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
HeaderComponent >> initialize [ 
	super initialize.
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: aCanvas [

	aCanvas
		div class: 'header-wrapper';
		with: [ self renderHeaderTitle: aCanvas . self renderHeaderUser: aCanvas].
	aCanvas horizontalRule.
]

{ #category : #rendering }
HeaderComponent >> renderHeaderTitle: aCanvas [
	aCanvas
		div class: 'header-title';
		with: [ aCanvas heading:'CuOOra'].
]

{ #category : #rendering }
HeaderComponent >> renderHeaderUser: aCanvas [
	aCanvas div
		class: 'header-user';
		with: [ 
			aCanvas paragraph: self session user usuario.
 			aCanvas anchor
				class: 'a-logout';
				callback: [ self answer ];
				with: 'Logout']
]

{ #category : #hooks }
HeaderComponent >> style [ 
^'
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
'
]
