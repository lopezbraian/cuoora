Class {
	#name : #LayoutComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component',
		'headerComponent'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
LayoutComponent class >> withComponent: aComponent [
	
	^ self new component: aComponent new.
]

{ #category : #hooks }
LayoutComponent >> children [ 
|collection|

collection:= OrderedCollection new.

collection add: headerComponent .
collection add: component.

^collection.
]

{ #category : #accessing }
LayoutComponent >> component [
	^component
]

{ #category : #accessing }
LayoutComponent >> component:acomponent [
	component:= acomponent.
]

{ #category : #initialization }
LayoutComponent >> initialize [
	super initialize.
	headerComponent:= HeaderComponent new.
]

{ #category : #rendering }
LayoutComponent >> renderContentOn: aCanvas [

	aCanvas div
	class: 'wrapper';
	with: [ 
		aCanvas render: self children 
		 ].
	
	
	
]

{ #category : #hooks }
LayoutComponent >> style [ 
^'	
	html { 
		font-family: sans-serif;
	}
	.wrapper { 
		padding:0 25px;
	 }
	li { 
		list-style:none;
	}	
	'
]
