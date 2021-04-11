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
	self session user agregarCalificacion: false aEntrada: data
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
self session user agregarCalificacion: true aEntrada: data. 
]

{ #category : #rendering }
EntradaComponent >> renderContentOn: aCanvas [
	aCanvas anchor
		class: 'pregunta';
		callback: [ self goToDetail ];
		with: [ aCanvas paragraph
				class: 'title-pregunta';
				with: data titulo.
			aCanvas paragraph
				class: 'topico';
				with: [ aCanvas text: 'Tópicos: '.
					aCanvas
						span: [ data topicos
								do: [ :t | 
									aCanvas text: t nombre.
									aCanvas text: ' / ' ] ] ].
			aCanvas span: 'Realizada por '.
			aCanvas paragraph
				class: 'nombre-user';
				with: data user usuario.
			aCanvas
				span: [ aCanvas text: ' | '.
					aCanvas text: data respuestas size.
					aCanvas text: ' respuestas ' ].
			aCanvas
				paragraph: [ aCanvas text: data likes.
					aCanvas text: ' Likes '.
					aCanvas text: ' | '.
					aCanvas text: data dislikes.
					aCanvas text: ' Dislike ' ].
			aCanvas anchor
				class: 'btn-calif';
				callback: [ self like ];
				with: 'like'.
			aCanvas span: '| '.
			aCanvas anchor
				class: 'btn-calif';
				callback: [ self disLike ];
				with: 'dislike' ].
	aCanvas horizontalRule


]

{ #category : #hooks }
EntradaComponent >> style [
	^ '.title-pregunta{
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
