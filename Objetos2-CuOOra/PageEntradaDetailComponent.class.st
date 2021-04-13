Class {
	#name : #PageEntradaDetailComponent,
	#superclass : #PageComponent,
	#instVars : [
		'entrada',
		'btnComponent'
	],
	#classInstVars : [
		'data'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'instance creation' }
PageEntradaDetailComponent class >> newWithData: aData [
	^ self new entrada: aData yourself
]

{ #category : #initialization }
PageEntradaDetailComponent >> children [ 

^ Array with: btnComponent .
]

{ #category : #accessing }
PageEntradaDetailComponent >> entrada [
	^ entrada
]

{ #category : #accessing }
PageEntradaDetailComponent >> entrada: anObject [
	entrada := anObject
]

{ #category : #initialization }
PageEntradaDetailComponent >> initialize [ 
	super initialize.
	
	btnComponent := BtnComponent withContent: 'Agregar Respuesta'.
]

{ #category : #'as yet unclassified' }
PageEntradaDetailComponent >> nuevaRespuesta [

self call: (PageAnswerComponent newWithData: entrada).
]

{ #category : #'as yet unclassified' }
PageEntradaDetailComponent >> pregunta: aCanvas [
	aCanvas paragraph
		class: 'title-pregunta';
		with: entrada titulo
		.
	aCanvas paragraph
		class: 'topico';
		with: [ aCanvas text: 'Tópicos: '.
			aCanvas
				span: [ entrada topicos
						do: [ :t | 
							aCanvas text: t nombre.
							aCanvas text: ' / ' ] ] ].
	aCanvas span: 'Realizada por '.
	aCanvas anchor
		class: 'nombre-user';
		callback: [ self profileOfUser: entrada user ];
		with: entrada user usuario.
	aCanvas
		span: [ aCanvas text: ' | '.
			aCanvas text: entrada respuestas size.
			aCanvas text: ' respuestas ' ].
	aCanvas
		paragraph: [ aCanvas text: entrada likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: entrada dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada:  entrada ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada:  entrada ];
		with: 'dislike'.
	aCanvas horizontalRule
]

{ #category : #rendering }
PageEntradaDetailComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self pregunta: aCanvas.
	self respuestas: aCanvas.
	aCanvas paragraph
		class: 'center';
		with: 'No hay más respuestas'.
	aCanvas div
		class: 'wrap-btn-detail';
		with: [ aCanvas anchor
				class: 'center';
				callback: [ self nuevaRespuesta ];
				with: [ aCanvas render: btnComponent ] ]
]

{ #category : #'as yet unclassified' }
PageEntradaDetailComponent >> respuestas: aCanvas [

	aCanvas
		unorderedList: [ entrada respuestas do:
					[ :each | aCanvas listItem: [ aCanvas render: [aCanvas span: 'Respuesta de '.
	aCanvas paragraph
		class: 'nombre-user';
		with: each user usuario.
	aCanvas text: ' '.
	aCanvas paragraph 
		with: each content.
	aCanvas
		paragraph: [ aCanvas text: each likes.
			aCanvas text: ' Likes '.
			aCanvas text: ' | '.
			aCanvas text: each dislikes.
			aCanvas text: ' Dislike ' ].
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: true aEntrada:  each ];
		with: 'like'.
	aCanvas span: '| '.
	aCanvas anchor
		class: 'btn-calif';
		callback: [ self session user agregarCalificacion: false aEntrada:  each ];
		with: 'dislike'.
	aCanvas horizontalRule] ] ] ].	
			

]
