<!DOCTYPE html>
<html lang="en">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="ACT Government DocVert trial">
		<meta name="developer" content="Matthew Holloway">
		<meta name="author" content="ACT Government">
        <title>Docvert&thinsp;&mdash;&thinsp;Web Service</title>
        
        <link rel="stylesheet" type="text/css" href="static/actgov/normalize.css">
        <link rel="stylesheet" type="text/css" href="static/actgov/bootstrap.min.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,600italic,300,600' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="static/actgov/screen.css">
        <script type="text/javascript" src="lib/jquery/jquery-1.5.min.js"></script>
        <script type="text/javascript" src="static/actgov/jquery.dropp.js"></script>
        <script type="text/javascript" src="static/actgov/index.js"></script>
    </head>
    <body onunload="" class="index-page">
    	<ul id="menu">
    		<li><a href="mailto:pascal.klein@act.gov.au">Contact</a></li>
        	<li><a href="tests">Tests</a></li>
		    <li class="current"><a href="#menu">Web Service</a></li>
		</ul>
        <h1>Doc<span class="syllable">vert</span> <span class="version">5.1</span></h1>
        <div id="content">
        	<div id="introduction">
        		<p class="what">Welcome to the <acronym title="Australian Capital Territory">ACT</acronym> Government&rsquo;s <acronym  title="Microsoft">MS</acronym> Word <code>.docx</code> &rarr; <acronym title="HyperText Markup Language">HTML</acronym> conversion system.</p>
        		<p>A few notes about this system:</p>
        		<ul>
        			<li>input files must make proper use of Word “styles” to designate document hierarchies</li>
        			<li>input files must be prepared for publication&thinsp;&mdash;&thinsp;<strong>do not</strong> upload documents not intended for public dissemination</li>
        			<li>this conversion system is open source software</li>
        		</ul>
			</div><!-- closes #introduction -->
			<form method="post" action="web-service" enctype="multipart/form-data">
            	<div id="page">
            	    <fieldset id="upload_fieldset">
            	        <legend>Upload Documents</legend>
            	        <div id="upload_documents">
            	            <div id="upload_from_file" class="upload_button">
            	                <label for="upload_file"><span>From File</span></label>
            	                <input type="file" name="upload_file[]" id="upload_file" multiple="multiple">
            	            </div>
            	            <div id="upload_from_web" class="upload_button">
            	                <label for="upload_web"><span>From Web</span></label>
            	            </div>
            	        </div>
            	        <h2 class="upload_list">Documents to Convert</h2>
            	        <ul id="upload_list">
            	        </ul>
					</fieldset>
					<fieldset id="pipelines">
            	        <legend>Theme (<acronym title="Extensible Markup Language">XML</acronym> Pipeline)</legend>
            	        <label for="pipeline">
            	        	<select name="pipeline" id="pipeline">
% for pipeline in sorted(pipelines):
            	            	<option value="{{pipeline['id']}}">{{pipeline['name']}}</option>
% end			
            	        	</select>
            	        	Select an output format. For <acronym title="HyperText Markup Language">HTML</acronym> select <em>Web Standards</em>
            	        </label>
            	    </fieldset>
            	    <fieldset id="autopipelines">
            	        <legend>
            	            <input type="hidden" name="break_up_pages_ui_version" id="break_up_pages_ui_version" value="2">
            	            <input type="checkbox" name="break_up_pages" id="break_up_pages"/>
            	            <label for="break_up_pages">Break over multiple pages?</label>
            	        </legend>
            	        <div id="autopipelines_options">
            	            <p class="note"><span>Please note that some pipelines don&rsquo;t support multiple pages.</span></p>
            	            <select name="autopipeline" id="autopipeline">
% for auto_pipeline in auto_pipelines:
            	                <option value="{{auto_pipeline['id']}}">{{auto_pipeline['name']}}</option>
% end			
							</select>
						</div>
					</fieldset>
					<div id="upload_from_web_dialog">
						<input type="text" name="upload_web[]" id="upload_web">
					</div>
					<fieldset id="advanced">
						<legend><a href="#advanced">Advanced <span class="showHide">&#9654;</span></a></legend>
						<div class="inner">
							<p id="afterconversion">
            	                <label for="after_conversion_preview"><input type="radio" id="after_conversion_preview" name="afterconversion" value="preview" checked="checked">Preview conversion</label> &nbsp;
            	                <label for="after_conversion_zip"><input type="radio" id="after_conversion_zip" name="afterconversion" value="zip">Download .ZIP</label>
            	            </p>
            	        </div>
            	    </fieldset>
            	    <div id="submit_error">
            	        <span>Please choose a file or web <acronym title="Uniform Resource Locator">URL</acronym> to convert</span>
            	    </div>
            	    <div id="button_tray">
            	        <input type="submit" value="Submit" id="upload_submit">
            	    </div>
				</div><!-- closes #page -->
				<div id="libreOfficeStatus" class="libreOfficeStatus_{{libreOfficeStatus}}">LibreOffice <span></span></div>
			</form>
		</div><!-- / closes #container -->
	</body>
</html>