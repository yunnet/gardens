![alt text](http://bacubacu.com/colresizable/githubLogo.png "colResizable jQuery plugin")

# colResizable

colResizable is a free jQuery plugin designed to enhance any kind of HTML table object adding column resizing features by dragging column anchors manually. It is compatible with both mouse and touch devices and has some nice features such as layout persistence after page refresh or postback and compatibility with both percentage and pixel-based table layouts. It is tiny in size (colResizable 1.0 is only 2kb) and it is fully compatible with all major browsers(IE7+, Firefox, Chrome and Opera). 

#### [official website](http://bacubacu.com/colresizable/) &nbsp;&nbsp;&nbsp;&nbsp; [demos](http://bacubacu.com/colresizable/#samples) &nbsp;&nbsp;&nbsp;&nbsp; [documentation](http://bacubacu.com/colresizable/#attributes) &nbsp;&nbsp;&nbsp;&nbsp; [downloads](http://bacubacu.com/colresizable/#download) 

## Features
colResizable was developed since no other similar plugin with the below listed features was found:

* Compatible with mouse and touch devices (PC, tablets, and mobile phones)
* Compatibility with both percentage and pixel-based table layouts
* Column resizing not altering total table width (optional)
* No external resources needed (such as images or stylesheets)
* Optional layout persistence after page refresh or postback
* Customization of column anchors
* Small footprint
* Cross-browser compatibility (IE7+, Chrome, Safari, Firefox)
* Events


## Usage
To use this plugin a script reference must be added to the colResizable.min.js file in the head section of the document once jQuery is loaded. To enhance a table (or collection of tables) point it with a jQuery wrapper and apply the colResizable() method. 

    $(function(){
      $("table").colResizable();
    });


## Attributes


*  **resizeMode**: [type: string] [default: 'fit'] [version: 1.6] [values: 'fit', 'flex', 'overflow']

    It is used to set how the resize method works. Those are the possible values:
    
    * `'fit'`:  this is default resizing model, in which resizing a column does not alter table width, which means that when a column is expanded the next one shrinks. 
    * `'flex'`: in this mode the table can change its width and each column can shrink or expand independently if there is enough space in the parent container. If there is not enough space, columns will share its width as they are resized. Table will never get bigger than its parent.
    * `'overflow'`: allows to resize columns with overflow of parent container.

___
* **disable**: [type: boolean] [default: false] [version: 1.0] 

When set to true it aims to remove all previously added enhancements such as events and additional DOM elements assigned by this plugin to a single or collection of tables. It is required to disable a previously *colResized* table prior its removal from the document object tree using JavaScript, and also before any DOM manipulations to an already *colResized* table such as adding columns, rows, etc.

___
* **disabledColumns**: [type: array of int] [default: []] [version: 1.6] 

An array of column indexes to be excluded, so it will not be possible to drag them manually.

___
*  **liveDrag**: [type: boolean] [default: false] [version: 1.0] 

When set to true the table layout is updated while dragging column anchors. liveDrag enabled is more CPU consuming so it is not recommended for slow computers, specially when dealing with huge or extremely complicated tables.

___

* **postbackSafe**: [type: boolean] [default: false] [version: 1.3] 

This attribute can be used to specify that the manually selected column widths must remain unaltered after a postback or browser refresh. This feature is mainly oriented to those pages created with server-side logic (codebehind), such as PHP or .NET, and it is only compatible with browsers with sessionStorage support (all modern browsers). However, if you are targeting older browsers (such as IE7 and IE8) you can still emulate sessionStorage using sessionStorage.js. It is important to note that some browsers (IE and FF) doesn’t enable the sessionStorage object while running the website directly from the local file system, so if you want to test this feature it is recommended to view the website through a web server or use browsers such as Chrome or Opera which doesn’t have this limitation. Don't worry about compatibility issues, once your site is up on the internet, all browsers will act in exactly the same way.
___

*  **partialRefresh**: [type: boolean] [default: false] [version: 1.5] 

This attribute should be set to true if the table is inside of an updatePanel or any other kind of partial page refresh using ajax. Table's ID should be same before and after the partial partial refresh.

___

* **innerGripHtml**: [type: string] [default: empty string] [version: 1.0] 

Its purpose is to allow column anchor customization by defining the HTML to be used in the column grips to provide some visual feedback. It can be used in a wide range of ways to obtain very different outputs, and its flexibility can be increased by combining it with the draggingClass attribute.
___

* **draggingClass**: [type: string] [default: internal css class] [version: 1.0] 

This attribute is used as the css class assigned to column anchors while being dragged. It can be used for visual feedback purposes.
___

* **minWidth**: [type: number] [default: 15] [version: 1.1] 

This value specifies the minimum width (measured in pixels) that is allowed for the columns.
___

* **headerOnly**: [type: boolean] [default: false] [version: 1.2] 

This attribute can be used to prevent vertical expansion of the column anchors to fit the table height. If it is set to true, column handler's size will be bounded to the first row's vertical size.
___

* **hoverCursor**: [type: string] [default: "e-resize"] [version: 1.3] 

This attribute can be used to customize the cursor that will be displayed when the user is positioned on the column anchors.
___

* **dragCursor**: [type: string] [default: "e-resize"] [version: 1.3] 

Defines the cursor that will be used while the user is resizing a column.
___

* **flush**: [type: boolean] [default: false] [version: 1.3] 

Flush is only effective when postbackSafe is enabled. Its purpose is to remove all previously stored data related to the current table layout to get it back to its original layout preventing width restoration after postback.
___

* **marginLeft**: [type: string / null] [default: null] [version: 1.3] 

If the target table contains an explicit margin-left CSS rule, the same value must be used in this attribute (for example: "auto", "20%", "10px"). The reason why it is needed it is because most browsers (all except of IE) don’t allow direct access to the current CSS rule applied to an element in its original units (such as "%", "em" or "auto" values). If you know any workaround which doesn’t involve iteration through all the styles defined in the site and any other external dependencies, please let me know!
___

* **marginRight**: [type: string / null] [default: null] [version: 1.3] 

It behaves in exactly the same way than the previous attribute but applied to the right margin.
___

 *  **fixed**: [deprecated: use "mode" instead] [type: boolean] [default: true] [version: 1.5 only] 

It is used to set how the resize method works. In fixed mode resizing a column does not alter total table width, which means that when a column is expanded the next one shrinks. If fixed is set to false then table can change its width and each column can shrink or expand independently.

_Note: There is a known issue where the CSS property `table-layout: fixed;` causes a minor conflict with resizing table widths. It is important to note that the `fixed` setting is different from the CSS property and it is encouraged not to apply that style to your tables._


## Events

* **onResize**: [type: callback function] [default: null] [version: 1.0] 

If a callback function is supplied it will be fired when the user has ended dragging a column anchor altering the previous table layout. The callback function can obtain a reference to the updated table through the currentTarget attribute of the event retrieved by parameters

___
* **onDrag**: [type: callback function] [default: null] [version: 1.1] 

This event is fired while dragging a column anchor if liveDrag is enabled. It can be useful if the table is being used as a multiple range slider. The callback function can obtain a reference to the updated table through the currentTarget attribute of the event retrieved by parameters
