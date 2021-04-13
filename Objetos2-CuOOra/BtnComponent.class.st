Class {
	#name : #BtnComponent,
	#superclass : #WAComponent,
	#instVars : [
		'content'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
BtnComponent class >> withContent:aContent [ 
^	self new
		content: aContent.
	
]

{ #category : #initialization }
BtnComponent >> content [ 
	^content.
]

{ #category : #initialization }
BtnComponent >> content: aContent [

	content:=aContent.
]

{ #category : #initialization }
BtnComponent >> initialize [
	super initialize.
]

{ #category : #rendering }
BtnComponent >> renderContentOn: aCanvas [
	aCanvas paragraph
		class: 'btn';
		with: [ aCanvas span
				class: 'btn-icon';
				with: '+'.
			aCanvas span
				class: 'btn-text';
				with:  self content]
]

{ #category : #hooks }
BtnComponent >> style [ 
^'
.btn { 
	display:flex;
	align-items:center;
	width:225px;
	justify-content:center;
 }


.btn-icon { 
    width: 30px;
    height: 30px;
    background: red;
    color: white ;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 25px;
    border-radius: 50%;
    margin: 0;
    padding: 0;
	box-shadow: 0px 8px 10px 0px rgb(0 0 0 / 53%);
    -webkit-box-shadow: 0px 8px 10px 0px rgb(0 0 0 / 53%);
    -moz-box-shadow: 0px 8px 10px 0px rgba(0,0,0,0.53);
 }
.btn-text { 
	margin-left:5px;
	font-weight:bold;
 }
		
'
]
