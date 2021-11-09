#r "System.Net"
#r "System.Net.Http"
#r "System.Runtime"

using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Xml;
using System.Xml.XPath;

using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using R = System.Runtime.InteropServices.RuntimeInformation;

Console.WriteLine(R.FrameworkDescription);
                 
var client = new HttpClient(new HttpClientHandler
{
	Proxy = new WebProxy("localhost:8888", true),
	UseProxy = true
});

var stream = await client.GetStreamAsync("http://httpbin.org/ip");

var sr = new StreamReader(stream);

TextWriter tw = Console.Out;

while (!sr.EndOfStream)
	tw.Write(sr.ReadLine());
