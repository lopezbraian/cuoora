Class {
	#name : #EntradaComponent,
	#superclass : #WAComponent,
	#instVars : [
		'data'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
EntradaComponent class >> setData:aData [.

 ^ self new data:aData.
]

{ #category : #accessing }
EntradaComponent >> data [
	^data
]

{ #category : #accessing }
EntradaComponent >> data:aData [
	data:=aData
]

{ #category : #accessing }
EntradaComponent >> disLike [
]

{ #category : #'as yet unclassified' }
EntradaComponent >> goToDetail [
]

{ #category : #initialization }
EntradaComponent >> initialize [
	super initialize.
]

{ #category : #accessing }
EntradaComponent >> like [
]

{ #category : #rendering }
EntradaComponent >> renderContentOn:aCanvas [
	
	aCanvas anchor class:'pregunta'; 
	callback:[self goToDetail ];
	with: [ 
		aCanvas paragraph class:'title-pregunta' ;with: data titulo.
		aCanvas span: 'Realiza por '.
		aCanvas paragraph class: 'nombre-user';
								with:data user usuario.
		aCanvas span:[
			aCanvas text: ' | '.
			aCanvas text: data respuestas size	
		].
		aCanvas paragraph:[
			aCanvas text: data likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: data likes	.
			aCanvas text: ' Dislike '.
			
		].
		aCanvas anchor
			class: 'btn-calif';
			callback: [self like];
			with: 'Like'.
		aCanvas span: '| '.
		aCanvas anchor
			class: 'btn-calif';
			callback: [self disLike];
			with: 'DisLike'.
	].
	aCanvas horizontalRule.
	
	 
	

]

{ #category : #hooks }
EntradaComponent >> style [ 
^'.title-pregunta{
		font-style: italic;
	}
	.pregunta { 
		display:block;
		text-decoration:none;
		color:black;
	}
	.nombre-user{
		display:inline;
		font-weight:bold;
 	}
	.btn-calif { 
		text-decoration:none;
		margin-right:4px;
	}
'
]
