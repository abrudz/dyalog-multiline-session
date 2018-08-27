# Multi-line Session in Dyalog APL
*Enable input over multiple lines in Dyalog APL session*

## Usage
To activate, execute the following (were `<path>` is the location of MultiLine.dyalog):
```
#.⎕TRAP∪⍨←⊂2 'E' '⎕THIS ⎕SE.MultiLine ⎕IO⊃1↓⎕DM'⊣2⎕SE.⎕FIX'file://<path>/MultiLine.dyalog'
```
You can now use multi-line input in the session, for example:
```
      f←{
          ⍺+⍵
      }
      2 f 3
5
      :if 1
          'one'
      :else
          'zero'
      :endif
one
      2{
          ⍺+⍵
      }3
5
      :namespace foo
          goo←+
      :endnamespace
      2 foo.goo 3
5
```

To cancel input, enter a lone `→`.

## Limitations

Does not handle `:Until` followed by `:AndIf`/`:OrIf`.

Does not handle diamonds (`⋄`); use newlines instead.

Errors are re-signalled with error number `500+⎕EN` and the code line will have the trap statement instead of the offending line.
