# ast-experiments

## JavaScript AST

https://astexplorer.net/#/gist/d5a713e9c6ac1defeaf31e2d855b2113/latest

```js
var button = document.createElement('button');
var textnode = document.createTextNode("Click me");
button.appendChild(textnode);
button.addEventListener('click', function(evt) {
  alert("Button Clicked");
});
document.body.appendChild(button);
```


## TypeScript AST
```ts
let numbers: numbers[] = [1,2,3];
```

https://astexplorer.net/#/gist/bfa7acbd06ffdf68186f787967017a5e/latest


## Bytecode Interpreter

Like JVM, IL interprete, Javascript bytecode interpreter, IR etc

### JS / Bytecde
```js
function f(a,b,c) {
  var d = c - 100;
  return a + d * b;
}
```

```jsb
LdaSmi #100
Sub a2
Star r0
Ldar a1
Mul r0
Add a0
Return
```

C# / IL
```cs
public int sum(int a, int b) {
  return a + b;
}
```

```il
IL_0000:  ldarg.0     
IL_0001:  ldarg.1     
IL_0002:  add         
IL_0003:  ret 
```
