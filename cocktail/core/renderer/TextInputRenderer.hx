/*
	This file is part of Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package cocktail.core.renderer;

import cocktail.core.dom.Node;
import cocktail.core.event.Event;
import cocktail.core.event.EventConstants;
import cocktail.core.event.FocusEvent;
import cocktail.core.event.KeyboardEvent;
import cocktail.core.geom.Matrix;
import cocktail.core.html.HTMLElement;
import cocktail.core.css.CSSValueConverter;
import cocktail.core.geom.GeomData;
import cocktail.core.layer.CompositingLayerRenderer;
import cocktail.core.layer.LayerRenderer;
import cocktail.core.layout.LayoutData;
import cocktail.core.font.FontData;
import cocktail.core.graphics.GraphicsContext;
import cocktail.port.NativeTextInput;
import cocktail.core.css.CSSData;

/**
 * This is an input renderer in charge of
 * rendering a text input form control
 * 
 * @author Yannick DOMINGUEZ
 */
class TextInputRenderer extends InputRenderer
{
	/**
	 * A reference to a class wrapping a native, 
	 * runtime specific text input
	 */
	public var nativeTextInput(default, null):NativeTextInput;
	
	/**
	 * class constructor
	 * @param	node
	 */
	public function new(node:HTMLElement) 
	{
		super(node);
	}
	
	/**
	 * Instantiate a text native input
	 */
	override private function createNativeInput():Void
	{
		nativeTextInput = new NativeTextInput(domNode);
		nativeInput = nativeTextInput;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN PRIVATE RENDERING METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Overriden to update the native text input display
	 */
	override private function renderSelf(graphicContext:GraphicsContext, clipRect:RectangleVO, scrollOffset:PointVO)
	{
		super.renderSelf(graphicContext, clipRect, scrollOffset);
		updateNativeTextInput(scrollOffset, clipRect);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// PRIVATE METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Update the display of the native text input
	 */
	private function updateNativeTextInput(scrollOffset:PointVO, clipRect:RectangleVO):Void
	{
		//set the style of the text input text using the CSS applying to it
		//Based on the platform not all of those style might be taken into account
		
		nativeTextInput.fontFamily = CSSValueConverter.getFontFamilyAsStringArray(coreStyle.fontFamily)[0];
		nativeTextInput.letterSpacing = coreStyle.usedValues.letterSpacing;
		nativeTextInput.fontSize = coreStyle.getAbsoluteLength(coreStyle.fontSize);
	
		var bold:Bool = false;
		switch (coreStyle.fontWeight)
		{
			case KEYWORD(value):
				switch(value)
				{
					case LIGHTER, NORMAL:
						bold = false;
						
					case BOLDER, BOLD:
						bold = true;
						
					default:
						throw 'Illegal keyword for bold style';
				}
				
			case INTEGER(value):
				bold = value > 400;
				
			default:
				throw 'Illegal value for bold style';
		}
		
		nativeTextInput.bold = bold;
		nativeTextInput.italic = coreStyle.getKeyword(coreStyle.fontStyle) == ITALIC;
		nativeTextInput.letterSpacing = coreStyle.usedValues.letterSpacing;
		nativeTextInput.color = coreStyle.usedValues.color.color;
	}
}