Class {
	#name : #PageNewQuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'desarrollo',
		'topicos',
		'topicosSelected'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callbacks }
PageNewQuestionComponent >> cancelar [

^self answer.
]

{ #category : #'as yet unclassified' }
PageNewQuestionComponent >> checkbox:aValue topic:aTopic [
	aValue ifTrue: [ topicosSelected add:aTopic ]
]

{ #category : #accessing }
PageNewQuestionComponent >> desarrollo [
	^ desarrollo
]

{ #category : #accessing }
PageNewQuestionComponent >> desarrollo: anObject [
	desarrollo := anObject
]

{ #category : #callbacks }
PageNewQuestionComponent >> guardar [
	topicosSelected.
	self session user
		agregarPreguntaConTitulo: titulo
		Descripcion: desarrollo
		Topicos: topicosSelected.
	titulo := ' '.
	desarrollo:= ' '.	
	topicosSelected removeAll.
]

{ #category : #initialization }
PageNewQuestionComponent >> initialize [ 
	super initialize .
	topicosSelected := OrderedCollection new.
]

{ #category : #rendering }
PageNewQuestionComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	aCanvas heading: 'Nueva Pregunta'.
	aCanvas horizontalRule.
	aCanvas form
		class: 'wrap-pregunta-form';
		with: [ aCanvas paragraph: 'Título'.
			aCanvas textArea
				on: #titulo of: self;
				columns: 80;
				rows: 1;
				placeholder: 'Escriba aquí el título de la pregunta'.
			aCanvas break.
			aCanvas paragraph: 'Desarrollo'.
			aCanvas textArea
				on: #desarrollo of: self;
				columns: 80;
				rows: 5;
				placeholder: 'Escriba aquí el desarrollo de su pregunta'.
			aCanvas break.
			aCanvas paragraph: 'Topicos'.
			CuOOra soleInstance topicos
				do: [ :t | 
					aCanvas checkbox
						value: false;
						callback: [ :v | self checkbox: v topic: t ].
					aCanvas text: t nombre ].
			aCanvas break.
			aCanvas break.
			aCanvas break.
			aCanvas submitButton on: #guardar of: self.
			aCanvas submitButton
				callback: [ self cancelar ];
				with: 'Cancelar' ].
	aCanvas break
	
]

{ #category : #accessing }
PageNewQuestionComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
PageNewQuestionComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
PageNewQuestionComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
PageNewQuestionComponent >> topicos: anObject [
	topicos := anObject
]
