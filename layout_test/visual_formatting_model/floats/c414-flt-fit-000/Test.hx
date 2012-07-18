/*
This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/

package ;
import js.Lib;


class Test 
{
	public static function main()
	{	
		new Test();
	}
	
	public function new()
	{
		//var test = '';
		//test += '<div>';
		//test += 	'<p>There should be five numbers, in numerical order, below: on the first line 1, 2 and 3, on the second, 4 and 5.</p>';
		var test = 	'<div style="margin:10px; padding:1em; width:14em;">';
		test +=			'<p style="margin:0; float:left; width:5em;">';
		test +=				'1';
		test +=			'</p>';
		test +=			'<p style="margin:0; float:left; width:5em;">';
		test +=				'2';
		test +=			'</p>';
		test +=			'<p style="margin:0; float:left; width:5em;">';
		test +=				'4';
		test +=			'</p>';
		test +=			'3 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		test += 	'</div>';
		//test += '</div>';
		
		Lib.document.body.innerHTML = test;
		//Lib.document.body.style.marginTop = "0";
		//Lib.document.body.style.marginLeft = "0";
		//Lib.document.body.style.marginRight = "0";
		//Lib.document.body.style.marginBottom = "0";
	}
}