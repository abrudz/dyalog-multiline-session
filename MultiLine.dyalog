 {script}←{space}MultiLine input;level;Has;Trim;Ind;types;Dfn;Code
 :If 900⌶⍬
     space←#
 :EndIf
 level←0
 script←0⍴⊂''
 types←'(namespace|class|interface|if|while|repeat|for|select|with|hold|trap|disposable)'
 Has←{≢⍵ ⎕S 3⍠1 Code ⍺}
 Code←'''[^'']*''|⍝.*'⎕R''
 Dfn←+/∘⍎'0','\{' '}' '.'⎕R' 1' ' ¯1' ''∘Code
 Trim←'^ *'⎕R''
 Ind←''↑⍨4∘×
 :Repeat
     :If ~×≢input
         ⍞←Ind level
         input←Trim⍞
     :Else
         input←Trim input
     :EndIf
     →0⍴⍨input Has'^→ *$'
     level-←input Has'^:end|^:until'
     script,←⊂input,⍨Ind level
     level+←input Has'^:',types
     level+←Dfn input
     input←⍬
 :Until 0=level
 :Trap 0
     :If ⊃':(n|c|int)'('{|:',types,'|')⎕S 3⊃script
         space.(⍎⎕FX)'_Multi_Line_Wrapper_' '⎕EX''_Multi_Line_Wrapper_''',script
     :Else
         script space.⎕FIX⍨1+×≢(':',types,' *')'\w'⎕R'' '&'Code⊃script
     :EndIf
 :Else
     ⎕SIGNAL⊂('EN'(500+⎕DMX.EN))('EM'⎕DMX.EM)('Message'⎕DMX.Message)
 :EndTrap
