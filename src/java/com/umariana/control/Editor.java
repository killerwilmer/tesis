/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.umariana.control;

import java.util.ArrayList;
import java.util.List;
 
import com.ckeditor.CKEditorConfig;
import com.ckeditor.EventHandler;
import com.ckeditor.GlobalEventHandler;

/**
 *
 * @author usuarui
 */
public class Editor {   
    	public static CKEditorConfig createConfig() {
		CKEditorConfig config = new CKEditorConfig();
		config.addConfigValue("height","400");
		return config;
	}
        
}
