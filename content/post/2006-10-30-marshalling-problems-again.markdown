---
date: 2006-10-30T23:06:19Z
title: Marshalling problems, again
url: /2006/10/30/marshalling-problems-again.html
---

<p>Since past week, I'm writing a socket server to enable IPC between .NET-based clients and Linux acquisition servers. TCP/IP multi-threaded server isn't the problem, but clients are, why? Because of .NET's marshaling. What's my idea? this idea is the basic "<em>header-data</em> message", you know, use the <em>header</em> to set details related to data, so I will have header { server-code, data-length, timestamp, etc, data }, and data will change depending on the server. Implementing that in C/C++ or any other not-managed programming language is easy, neither unmanaged nor managed C# code are working, I have already solved the problem, but it's <em>hack-like</em>, and I want a prettier, better and nicer solution.</p>
<p>I'll try to post samples as sooner as possible to show this problem, maybe testing same code with gmcs may work, I'll figure it out tomorrow.</p>
