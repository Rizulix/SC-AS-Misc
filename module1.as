void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor('Rizulix');
	g_Module.ScriptInfo.SetContactInfo('https://discord.gg/svencoop');
}

// const string str = '[Module 1]';

// Can't share namespaced functions
shared void HelloWorld()
{
	// ERROR: Angelscript: [directory]/module1.as (11, 56) : Shared code cannot access non-shared global variable 'str'
	// g_Game.AlertMessage(at_console, '%1: "hello_world"!\n', str);
	g_Game.AlertMessage(at_console, '[Module 1]: "HelloWorld"!\n');
}

shared enum MyEnum
{
	DIGIT_0 = 0,
	DIGIT_1,
	DIGIT_2,
	DIGIT_3,
	DIGIT_4,
	DIGIT_5,
	DIGIT_6,
	DIGIT_7,
	DIGIT_8,
	DIGIT_9
}

shared funcdef int callback(int, int);

shared void PrintOperation(int a, int b, callback@ cb)
{
	g_Game.AlertMessage(at_console, '[Module 1]: "PrintOperation": a: %1, b:%2, result: %3!\n', a, b, cb(a, b));
}

// ERROR: Angelscript: Error while validating module 'Module 1': Can't have shared classes, class '::MyClass' is not allowed!!
// shared class MyClass {}

// ERROR: Angelscript: Error while validating module 'Module 1': Can't have shared classes, class '::MyInterface' is not allowed!!
// shared interface MyInterface {}
