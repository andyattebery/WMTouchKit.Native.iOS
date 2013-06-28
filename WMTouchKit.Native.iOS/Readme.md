# Readme.md

## Info.plist Settings

### Required

#### Wrapper

##### WMWrapperBaseProdURL
- String
- Example: http://aspmobile
- Default wrapper base production URL

##### WMWrapperBaseProdURL
- String
- Example: http://192.168.1.101
- Default wrapper base development URL

##### WMWrapperIsProd
- Bool
- Example: NO
- Sets if the production or development base URL is used

### Optional

#### Wrapper

##### WMWrapperApplicationURLScheme
- String
- Example: aspmobile://
- URL scheme for WMWrapperViewController to look for

##### WMWrapperDocumentURLEndpoint
- String
- Example: documents/
- URL endpoint for WMWrapperViewController to look for indicating the URL after WMWrapperApplicationURLScheme + WMWrapperDocumentURLEndpoint should be opened in a document viewer — WMDocumentViewController.
- Example full documents URL: "aspmobile://documents/pathtodocuments/document.pdf". 
- The wrapper base url will replace "WMWrapperApplicationURLScheme + WMWrapperDocumentURLEndpoint" to create a URL such as "http://192.168.1.101/pathtodocuments/document.pdf" which the document viewer will open.

##### WMJavascriptMarkAsWrapper
- String
- Example: setMarkedAsWrapped();
- Javascript to be executed on the application at the wrapper base URL to indicate the application is in a wrapper and needs to handle anything differently.
- This needs to be at the global scope and loaded when the document has finished loading.
- Does not need to return a value.

##### WMJavascriptGetPrimaryColor
- String
- Example: getPrimaryColor();
- Javascript to be executed on the application at the wrapper base URL to get the primary color of the application.
- This needs to be at the global scope and loaded when the document has finished loading.
- The function should return a color hex code such as "23ACB4".
- This color is used as the tint color of the navigation bar on the document viewer.

##### WMJavascriptGetSecondaryColor
- String
- Example: getSecondaryColor();
- Javascript to be executed on the application at the wrapper base URL to get the secondary color of the application.
- This needs to be at the global scope and loaded when the document has finished loading.
- The function should return a color hex code such as "23ACB4".
- This color is used as the tint color of the close button on the document viewer.
