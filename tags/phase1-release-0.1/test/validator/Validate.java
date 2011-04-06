/*
 * Copyright (C) 2010  Het Kadaster - The Netherlands
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import org.xml.sax.SAXException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.XMLReader;

public class Validate {

	public static void main(String args[]) {

		XMLReader parser = null;

		try {
			parser = org.xml.sax.helpers.XMLReaderFactory.createXMLReader();
			// Turn on validation
			parser.setFeature("http://xml.org/sax/features/validation", true);
			// Ensure namespace processing is on (the default)
			parser.setFeature("http://xml.org/sax/features/namespaces", true);
			parser.setFeature
					("http://apache.org/xml/features/validation/schema", true);
			parser.setFeature
					("http://apache.org/xml/features/validation/schema-full-checking",
							true);
		} catch (SAXNotRecognizedException e) {
			System.err.println("Unknown feature specified: " + e.getMessage());
		} catch (SAXNotSupportedException e) {
			System.err.println("Unsupported feature specified: " + e.getMessage());
		} catch (SAXException e) {
			System.err.println("Error in setting feature: " + e.getMessage());
		}


		if (parser == null) {
			System.exit(-1);
		}

		try {
			System.out.println("Validating: " + args[0]);
			parser.parse(args[0]);
			System.out.println("Validating: DONE");

		}

		catch (Throwable e) {
			System.err.println("parse error: " + e.getMessage());
			e.printStackTrace();
		}
	}
}