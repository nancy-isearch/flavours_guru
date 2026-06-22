<?php echo $header; ?>
<div class="modal fade" id="legal_text" tabindex="-1" role="dialog" aria-labelledby="legal_text_label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="legal_text_label"><?php echo $text_terms; ?></h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default cancel" data-dismiss="modal"><i class="fa fa-times"></i> <?php echo $button_close; ?></button>
			</div>
		</div>
	</div>
</div>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<ul class="breadcrumb bull5i-breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li<?php echo ($breadcrumb['active']) ? ' class="active"' : ''; ?>><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
			<div class="navbar-placeholder">
				<nav class="navbar navbar-bull5i" role="navigation" id="bull5i-navbar">
					<div class="nav-container">

						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bull5i-navbar-collapse">
								<span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<h1 class="bull5i-navbar-brand"><i class="fa fa-angle-double-down fa-fw ext-icon"></i> <?php echo $heading_title; ?></h1>
						</div>
						<div class="collapse navbar-collapse" id="bull5i-navbar-collapse">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#settings" data-toggle="tab"><!-- ko if: general_errors() --><i class="fa fa-exclamation-circle text-danger hidden" data-bind="css:{'hidden': !general_errors()}"></i> <!-- /ko --><?php echo $tab_settings; ?></a></li>
								<li><a href="#ext-support" data-toggle="tab"><?php echo $tab_support; ?></a></li>
								<li><a href="#about-ext" data-toggle="tab"><?php echo $tab_about; ?></a></li>
							</ul>
							<div class="nav navbar-nav navbar-right btn-group">
								<?php if ($update_pending) { ?><button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_upgrade; ?>" class="btn btn-info" id="btn-upgrade" data-url="<?php echo $upgrade; ?>" data-form="#sForm" data-context="#content" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_upgrading; ?></span>"><i class="fa fa-arrow-circle-up"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_upgrade; ?></span></button><?php } ?>
								<button type="button" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_apply; ?>" class="btn btn-success" id="btn-apply" data-url="<?php echo $save; ?>" data-form="#sForm" data-context="#content" data-vm="ExtVM" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_saving; ?></span>"<?php echo $update_pending ? ' disabled': ''; ?>><i class="fa fa-check"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_apply; ?></span></button>
								<button type="submit" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_save; ?>" class="btn btn-primary" id="btn-save" data-url="<?php echo $save; ?>" data-form="#sForm" data-context="#content" data-overlay="#page-overlay" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_saving; ?></span>" <?php echo $update_pending ? ' disabled': ''; ?>><i class="fa fa-save"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_save; ?></span></button>
								<a href="<?php echo $cancel; ?>" class="btn btn-default" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_cancel; ?>" id="btn-cancel" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_canceling; ?></span>"><i class="fa fa-ban"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_cancel; ?></span></a>
							</div>
						</div>

					</div>
				</nav>
			</div>
		</div>
	</div>

	<div class="alerts">
		<div class="container-fluid" id="alerts">
			<?php foreach ($alerts as $type => $_alerts) { ?>
				<?php foreach ((array)$_alerts as $alert) { ?>
					<?php if ($alert) { ?>
			<div class="alert alert-<?php echo ($type == "error") ? "danger" : $type; ?> fade in">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="fa <?php echo $alert_icon($type); ?>"></i><?php echo $alert; ?>
			</div>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		</div>
	</div>

	<div class="container-fluid bull5i-content bull5i-container">
		<div id="page-overlay" class="bull5i-overlay fade in">
			<div class="page-overlay-progress"><i class="fa fa-refresh fa-spin fa-5x text-muted"></i></div>
		</div>

		<form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" id="sForm" class="form-horizontal" role="form">
			<div class="tab-content">
				<div class="tab-pane active" id="settings">
					<div class="panel panel-default">
						<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-cog fa-fw"></i> <?php echo $tab_settings; ?></h3></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12">
									<fieldset>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="es_status"><?php echo $entry_extension_status; ?></label>
											<div class="col-sm-2 fc-auto-width">
												<select name="es_status" id="es_status" data-bind="value: status" class="form-control">
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												</select>
												<input type="hidden" name="es_installed" value="1" />
												<input type="hidden" name="es_installed_version" value="<?php echo $installed_version; ?>" />
												<input type="hidden" name="es_as" data-bind="value: as" />
											</div>
										</div>
										<div class="form-group" data-bind="css: {'has-error': bottom_pixels.hasError}">
											<label class="col-sm-3 col-md-2 control-label" for="es_bottom_pixels"><?php echo $entry_bottom_pixels; ?></label>
											<div class="col-sm-2 col-md-2 col-lg-1">
												<input type="text" name="es_bottom_pixels" id="es_bottom_pixels" data-bind="value: bottom_pixels" class="form-control" />
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 error-container" data-bind="visible: bottom_pixels.hasError && bottom_pixels.errorMsg">
												<span class="help-block error-text" data-bind="text: bottom_pixels.errorMsg"></span>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_bottom_pixels; ?></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="es_use_fade_in1"><?php echo $entry_use_fade_in; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="es_use_fade_in" id="es_use_fade_in1" value="1" data-bind="checked: use_fade_in"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="es_use_fade_in" id="es_use_fade_in0" value="0" data-bind="checked: use_fade_in"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_use_fade_in; ?></span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="es_use_back_to_top1"><?php echo $entry_use_back_to_top; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="es_use_back_to_top" id="es_use_back_to_top1" value="1" data-bind="checked: use_back_to_top"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="es_use_back_to_top" id="es_use_back_to_top0" value="0" data-bind="checked: use_back_to_top"> <?php echo $text_no; ?>
												</label>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="es_use_more1"><?php echo $entry_use_more; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="es_use_more" id="es_use_more1" value="1" data-bind="checked: use_more"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="es_use_more" id="es_use_more0" value="0" data-bind="checked: use_more"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_use_more; ?></span>
											</div>
										</div>
										<!-- ko if: use_more() == 1 -->
										<div class="form-group" data-bind="css: {'has-error': use_more_after.hasError}">
											<label class="col-sm-3 col-md-2 control-label" for="es_use_more_after"><?php echo $entry_use_more_after; ?></label>
											<div class="col-sm-2 col-md-2 col-lg-1">
												<input type="text" name="es_use_more_after" id="es_use_more_after" data-bind="value: use_more_after" class="form-control" />
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 error-container" data-bind="visible: use_more_after.hasError && use_more_after.errorMsg">
												<span class="help-block error-text" data-bind="text: use_more_after.errorMsg"></span>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_use_more_after; ?></span>
											</div>
										</div>
										<!-- /ko -->
										<!-- ko ifnot: use_more() == 1 -->
										<input type="hidden" name="es_use_more_after" data-bind="value: use_more_after" />
										<!-- /ko -->
										<div class="form-group">
											<label class="col-sm-3 col-md-2 control-label" for="es_use_sticky_footer1"><?php echo $entry_use_sticky_footer; ?></label>
											<div class="col-sm-9 col-md-10">
												<label class="radio-inline">
													<input type="radio" name="es_use_sticky_footer" id="es_use_sticky_footer1" value="1" data-bind="checked: use_sticky_footer"> <?php echo $text_yes; ?>
												</label>
												<label class="radio-inline">
													<input type="radio" name="es_use_sticky_footer" id="es_use_sticky_footer0" value="0" data-bind="checked: use_sticky_footer"> <?php echo $text_no; ?>
												</label>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_use_sticky_footer; ?></span>
											</div>
										</div>
										<div class="form-group" data-bind="css: {'has-error': max_items_per_load.hasError}">
											<label class="col-sm-3 col-md-2 control-label" for="es_max_items_per_load"><?php echo $entry_max_items_per_load; ?></label>
											<div class="col-sm-2 col-md-2 col-lg-1">
												<input type="text" name="es_max_items_per_load" id="es_max_items_per_load" data-bind="value: max_items_per_load" class="form-control" />
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 error-container" data-bind="visible: max_items_per_load.hasError && max_items_per_load.errorMsg">
												<span class="help-block error-text" data-bind="text: max_items_per_load.errorMsg"></span>
											</div>
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 help-container">
												<span class="help-block help-text"><?php echo $help_max_items_per_load; ?></span>
											</div>
										</div>
										<!-- ko if: _sas() == 1 -->
										<div class="form-group">
											<div class="col-sm-offset-3 col-md-offset-2 col-sm-6 col-md-5 col-lg-4">
												<select class="form-control" data-bind="selectedOptions: _as" multiple>
													<?php foreach ($stores as $store_id => $store) { ?>
													<option value="<?php echo $store_id; ?>"><?php echo $store['name']; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>
										<!-- /ko -->
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="ext-support">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#support-navbar-collapse">
									<span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<h3 class="panel-title"><i class="fa fa-phone fa-fw"></i> <?php echo $tab_support; ?></h3>
							</div>
							<div class="collapse navbar-collapse" id="support-navbar-collapse">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
									<li><a href="#faq" data-toggle="tab" title="<?php echo $text_faq; ?>"><?php echo $tab_faq; ?></a></li>
									<li><a href="#services" data-toggle="tab"><?php echo $tab_services; ?></a></li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="general">
									<div class="row">
										<div class="col-sm-12">
											<h3>Getting support</h3>
											<p>I consider support a priority of mine, so if you need any help with your purchase you can contact me in one of the following ways:</p>
											<ul>
												<li>Send an email to <a href="mailto:<?php echo $ext_support_email; ?>?subject='<?php echo $text_support_subject; ?>'"><?php echo $ext_support_email; ?></a></li>
												<li>Post in the <a href="<?php echo $ext_support_forum; ?>" target="_blank">extension forum thread</a> or send me a <a href="http://forum.opencart.com/ucp.php?i=pm&mode=compose&u=17771">private message</a></li>
												<!--li><a href="<?php echo $ext_store_url; ?>" target="_blank">Leave a comment</a> in the extension store comments section</li-->
											</ul>
											<p>I usually reply within a few hours, but can take up to 36 hours.</p>
											<p>Please note that all support is free if it is an issue with the product. Only issues due conflicts with other third party extensions/modules or custom front end theme are the exception to free support. Resolving such conflicts, customizing the extension or doing additional bespoke work will be provided with the hourly rate of <span id="hourly_rate">USD 50 / EUR 40</span>.</p>

											<h4>Things to note when asking for help</h4>
											<p>Please describe your problem in as much detail as possible. When contacting, please provide the following information:</p>
											<ul>
												<li>The OpenCart version you are using. <small>This can be found at the bottom of any admin page.</small></li>
												<li>The extension name and version. <small>You can find this information under the About tab.</small></li>
												<li>If you got any error messages, please include them in the message.</li>
												<li>In case the error message is generated by a VQMod cached file, please also attach that file.</li>
											</ul>
											<p>Any additional information that you can provide about the issue is greatly appreciated and will make problem solving much faster.</p>

											<h3 class="page-header">Happy with <?php echo $ext_name; ?>?</h3>
											<p>I would appreciate it very much if you could <a href="<?php echo $ext_store_url; ?>" target="_blank">rate the extension</a> once you've had a chance to try it out. Why not tell everybody how great this extension is by <a href="<?php echo $ext_store_url; ?>" target="_blank">leaving a comment</a> as well.</p>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="alert alert-info">
												<p><?php echo $text_other_extensions; ?></p>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="faq">
									<h3><?php echo $text_faq; ?></h3>
									<ul class="media-list" id="faqs">
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">Why isn't the extension working in store front end?</h4>

												<p class="short-answer">Verify that VQMod is working. If you are using a custom theme please make sure you have properly integrated the extension with your theme. Check for any <a href="#" class="external-tab-link" data-target="#about-ext">license issues</a>.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#not_working" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="not_working">
													<p>There may be several causes due to which the extension may not appear to be working in the store front end.</p>

													<ol>
														<li>
															<p>Verify that VQMod is working (for the store front end), proper VQMod cached files are being generated and none of the <?php echo $ext_name; ?> VQMod script files are reporting any errors in the VQMod error log files.</p>
															<p>If VQMod reports errors then these must be addressed. In case proper VQMod cached files are not being generated then VQMod installation needs to be fixed.</p>
														</li>

														<li>
															<p>If you are using a custom theme please make sure you have properly integrated the extension with your theme. See <a href="#theme_integration" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="theme_integration">"How to integrate the extension with a custom theme?"</a> FAQ below.</p>
														</li>

														<li>
															<p>If you have a multi store installation, you need to verify that proper amount of licenses have been purchased. Check the <a href="#" class="external-tab-link" data-target="#about-ext">About tab</a> License section to see whether <?php echo $ext_name; ?> is activated on all of your stores.</p>
															<p>In case <?php echo $ext_name; ?> is inactive on some of your stores, you will need to purchase additional licenses for each inactive store you wish to enable the extension on.</p>
														</li>
													</ol>

													<p>In case none of the above helped you to get the extension working please contact me on the support email given on the <a href="#" class="external-tab-link" data-target="#general">General Support</a> section.</p>
												</div>
											</div>
										</li>
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">How to translate the extension to another language?</h4>

												<p class="short-answer">All translatable strings for the store front end can be found in the <em>/vqmod/xml/endless_scroller.xml</em> VQMod script file.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#translation" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="translation">
													<h5 class="text-muted">Translating <strong>admin</strong> panel module files</h5>
													<ol>
														<li>
															<p><strong>Copy</strong> the following language file <strong>to YOUR_LANGUAGE folder</strong> under the appropriate location as shown below:</p>
															<div class="btm-mgn">
																<em class="text-muted"><small>FROM:</small></em>
																<ul class="list-unstyled">
																	<li>/admin/language/english/module/endless_scroller.php</li>
																</ul>
																<em class="text-muted"><small>TO:</small></em>
																<ul class="list-unstyled">
																	<li>/admin/language/YOUR_LANGUAGE/module/endless_scroller.php</li>
																</ul>
															</div>
														</li>

														<li>
															<p><strong>Open</strong> the copied <strong>language file</strong> with a text editor such as <a href="http://www.sublimetext.com/">Sublime Text</a> or <a href="http://notepad-plus-plus.org/">Notepad++</a> and <strong>make the required translations</strong>. You can also leave the files in English.</p>
															<p><span class="label label-info">Note</span> You only need to translate the parts that are to the right of the equal sign.</p>
														</li>
													</ol>

													<h5 class="text-muted">Translating <strong>store front end</strong> module files</h5>

													<ol>
														<li>
															<p>The store front end translatable strings are located inside the VQMod script file <em>/vqmod/xml/endless_scroller.xml</em>, so <strong>open the <?php echo $ext_name; ?> XML file</strong> with a text editor (<strong>not</strong> with a word processor application such as MS Word) and <strong>search</strong> for a <em>file</em> block that edits the <em>/catalog/language/english/common/header.php</em> language file. It should look similar to the following:</p>
															<pre class="prettyprint linenums"><code class="language-xml">    &lt;file name=&quot;catalog/language/english/common/header.php&quot;&gt;
                &lt;operation&gt;
                        &lt;search position=&quot;before&quot;&gt;&lt;![CDATA[
                        ?&gt;
                        ]]&gt;&lt;/search&gt;
                        &lt;add&gt;&lt;![CDATA[
$_[&#039;text_back_to_top&#039;]  = &#039;Back to Top&#039;;
                        ]]&gt;&lt;/add&gt;
                &lt;/operation&gt;
        &lt;/file&gt;</code></pre>
														</li>

														<li>
															<p>Make a <strong>copy</strong> of the whole <em>file</em> block, <strong>replace</strong> <em>english</em> with <em>YOUR_LANGUAGE</em> in the file path and <strong>translate the string(s)</strong>. You can also leave the strings in English.</p>

															<p><span class="label label-info">Note</span> If you want to quickly familiarize yourself with the simple <a href="https://github.com/vqmod/vqmod/" target="_blank">VQMod</a> script syntax, please check out the <a href="https://github.com/vqmod/vqmod/wiki/Scripting" target="_blank">official Wiki page</a></p>

															<p>The end result would look similar to the following example:</p>

															<pre class="prettyprint linenums"><code class="language-xml">    &lt;file name=&quot;catalog/language/english/common/header.php&quot;&gt;
                &lt;operation&gt;
                        &lt;search position=&quot;before&quot;&gt;&lt;![CDATA[
                        ?&gt;
                        ]]&gt;&lt;/search&gt;
                        &lt;add&gt;&lt;![CDATA[
$_[&#039;text_back_to_top&#039;]  = &#039;Back to Top&#039;;
                        ]]&gt;&lt;/add&gt;
                &lt;/operation&gt;
        &lt;/file&gt;

        &lt;file name=&quot;catalog/language/YOUR_LANGUAGE/common/header.php&quot;&gt;
                &lt;operation&gt;
                        &lt;search position=&quot;before&quot;&gt;&lt;![CDATA[
                        ?&gt;
                        ]]&gt;&lt;/search&gt;
                        &lt;add&gt;&lt;![CDATA[
$_[&#039;text_back_to_top&#039;]  = &#039;YOUR_LANGUAGE_TRANSLATION&#039;;
                        ]]&gt;&lt;/add&gt;
                &lt;/operation&gt;
        &lt;/file&gt;</code></pre>
														</li>

														<li>
															<p>Now, repeat steps <strong>1</strong> and <strong>2</strong> for the blocks that edit the following language files:</p>
															<ul class="list-unstyled">
																<li>/catalog/language/english/product/category.php</li>
																<li>/catalog/language/english/product/search.php</li>
																<li>/catalog/language/english/product/manufacturer.php</li>
																<li>/catalog/language/english/product/special.php</li>
															</ul>
														</li>
													</ol>
												</div>
											</div>
										</li>
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">How to integrate the extension with a custom theme?</h4>

												<p class="short-answer">If you are using a custom theme and the extension is not working out of the box then the first thing to do is to make a copy of the <em>vqmod/xml/endless_scroller_default_theme_patch.xml</em> VQMod script file and change the theme name to point to your custom theme folder.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#theme_integration" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="theme_integration">
													<p>In order to integrate the <?php echo $ext_name; ?> extension with your custom theme you need to make a copy of the <em>/vqmod/xml/endless_scroller_default_theme_patch.xml</em> file and give it a different name (eg. <em>endless_scroller_custom_theme_patch.xml</em>). Then open the copied VQMod file with a text editor such as <a href="http://www.sublimetext.com/">Sublime Text</a> or <a href="http://notepad-plus-plus.org/">Notepad++</a>, find the blocks that edit the default theme template files and change the theme name from 'default' to your custom theme (folder name).</p>
													<p>If changing the theme name does not make it work, then your custom theme structure must differ in some way from the default theme. In this case you need to further tailor the VQMod search &amp; replace/insert patterns for the template files to deal with the structural peculiarities of your custom theme.</p>
													<p>As due to the very nature of a custom theme there does not exist a universal solution. Replacing the pagination can be very much theme specific. Many custom themes have a different way of displaying product lists. Take a look at the changes made to the default theme and work out adjustments to the search &amp; replace patterns to suit your theme.</p>
													<p>If you do not know how the VQMod script works, I kindly suggest you read about it from the VQMod <a href="https://github.com/vqmod/vqmod/wiki" target="_blank">wiki pages</a>. VQMod log files (<em>vqmod/logs/*.log</em>) are helpful for debugging. They will tell you where the script fails (meaning which VQMod search line it does not find in the referenced file), so you need to adjust that part of the script.</p>
													<p>Should you find yourself in trouble with the changes I can offer commercial custom theme integration service. Please refer to the <a href="#" class="external-tab-link" data-target="#services">Services</a> section.</p>
												</div>
											</div>
										</li>
										<li class="media">
											<div class="pull-left">
												<i class="fa fa-question-circle fa-4x media-object"></i>
											</div>
											<div class="media-body">
												<h4 class="media-heading">How to upgrade the extension?</h4>
												<p class="short-answer">Disable the extension, overwrite the current extension files with new ones and click Upgrade on the extension settings page. After upgrade is complete enable the extension again.</p>

												<button type="button" class="btn btn-default btn-sm" data-toggle="collapse" data-target="#upgrade" data-parent="#faqs">Show the full answer</button>
												<div class="collapse full-answer" id="upgrade">
													<ol>
														<li><strong>Disable</strong> <?php echo $ext_name; ?> <strong>extension</strong> on the module settings page (<em>Extensions > Modules > <?php echo $ext_name; ?></em>) by changing <em>Extension status</em> setting to "Disabled".</li>

														<li>
															<p><strong>Upload</strong> the <strong>extension archive</strong> <em>EndlessScroller-x.x.x.ocmod.zip</em> using the <a href="<?php echo $extension_installer; ?>" target="_blank">Extension Installer</a>.</p>
															<p><span class="label label-info">Note</span> Do not worry, no OpenCart core files will be replaced! Only the previously installed <?php echo $ext_name; ?> files will be overwritten.</p>
															<p><span class="label label-danger">Important</span> If you have done custom modifications to the extension (for example customized it for your theme) then back up the modified files and re-apply the modifications after upgrade. To see which files have changed, please take a look at the <a href="#" class="external-tab-link" data-target="#changelog,#about-ext">Changelog</a>.</p>
														</li>

														<li>
															<p><strong>Open</strong> the <?php echo $ext_name; ?> <strong>module settings page</strong> <small>(<em>Extensions > Modules > <?php echo $ext_name; ?></em>)</small> and <strong>refresh the page</strong> by pressing <em>Ctrl + F5</em> twice to force the browser to update the css changes.</p>
														</li>

														<li><p>You should see a notice stating that new version of extension files have been found. <strong>Upgrade the extension</strong> by clicking on the 'Upgrade' button.</p></li>

														<li>After the extension has been successfully upgraded <strong>enable the extension</strong> by changing <em>Extension status</em> setting to "Enabled".</li>
													</ol>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="tab-pane" id="services">
									<h3>Premium Services<button type="button" class="btn btn-default btn-sm pull-right" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_refresh; ?>" id="btn-refresh-services" data-loading-text="<i class='fa fa-refresh fa-spin'></i> <span class='visible-lg-inline visible-xs-inline'><?php echo $text_loading; ?></span>"><i class="fa fa-refresh"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_refresh; ?></span></button></h3>
									<div id="service-container">
										<p data-bind="visible: service_list_loading()">Loading service list ... <i class="fa fa-refresh fa-spin"></i></p>
										<p data-bind="visible: service_list_loaded() && services().length == 0">There are currently no available services for this extension.</p>
										<table class="table table-hover">
											<tbody data-bind="foreach: services">
												<tr class="srvc">
													<td>
														<h4 class="service" data-bind="html: name"></h4>
														<span class="help-block">
															<p class="description" data-bind="visible: description != '', html: description"></p>
															<p data-bind="visible: turnaround != ''"><strong>Turnaround time</strong>: <span class="turnaround" data-bind="html: turnaround"></span></p>
															<span class="hidden code" data-bind="html: code"></span>
														</span>
													</td>
													<td class="nowrap text-right top-pad"><span class="currency" data-bind="html: currency"></span> <span class="price" data-bind="html: price"></span></td>
													<td class="text-right"><button type="button" class="btn btn-sm btn-primary purchase"><i class="fa fa-shopping-cart"></i> Buy Now</button></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="about-ext">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#about-navbar-collapse">
									<span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<h3 class="panel-title"><i class="fa fa-info fa-fw"></i> <?php echo $tab_about; ?></h3>
							</div>
							<div class="collapse navbar-collapse" id="about-navbar-collapse">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#ext_info" data-toggle="tab"><?php echo $tab_extension; ?></a></li>
									<li><a href="#changelog" data-toggle="tab"><?php echo $tab_changelog; ?></a></li>
								</ul>
							</div>
						</div>
						<div class="panel-body">
							<div class="tab-content">
								<div class="tab-pane active" id="ext_info">
									<div class="row">
										<div class="col-sm-12">
											<h3><?php echo $text_extension_information; ?></h3>

											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label label-normal"><?php echo $entry_extension_name; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><?php echo $ext_name; ?></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label label-normal"><?php echo $entry_installed_version; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><strong><?php echo $installed_version; ?></strong></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label label-normal"><?php echo $entry_extension_compatibility; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><?php echo $ext_compatibility; ?></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label label-normal"><?php echo $entry_extension_store_url; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static"><a href="<?php echo $ext_store_url; ?>" target="_blank"><?php echo htmlspecialchars($ext_store_url); ?></a></p>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 col-md-2 control-label label-normal"><?php echo $entry_copyright_notice; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static">&copy; 2011 - <?php echo date("Y"); ?> Romi Agar</p>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-3 col-sm-9 col-md-offset-2 col-md-10">
													<p class="form-control-static"><a href="view/static/bull5-i_es_extension_terms.htm" id="legal_notice" data-modal="#legal_text"><?php echo $text_terms; ?></a></p>
												</div>
											</div>

											<h3 class="page-header"><?php echo $text_license; ?></h3>
											<p><?php echo $text_license_text; ?></p>

											<div class="form-group has-success">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_active_on; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static" data-bind="text: asn"></p>
												</div>
											</div>
											<div class="form-group has-error" data-bind="visible: iasn() != ''">
												<label class="col-sm-3 col-md-2 control-label"><?php echo $entry_inactive_on; ?></label>
												<div class="col-sm-9 col-md-10">
													<p class="form-control-static" data-bind="text: iasn"></p>
												</div>
												<div class="col-sm-offset-3 col-md-offset-2 col-sm-9 col-md-10 error-container">
													<span class="help-block error-text"><?php echo $help_purchase_additional_licenses; ?></span>
													<a href="<?php echo $ext_purchase_url; ?>" class="btn btn-sm btn-danger" target="_blank"><i class="fa fa-shopping-cart"></i> <?php echo $button_purchase_license; ?></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="changelog">
									<div class="row">
										<div class="col-sm-12">
											<div class="release">
												<h3>Version 1.8.4 <small class="release-date text-muted">03 Mar 2016</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-info">Fixed:</em> Support for OpenCart 2.2.0.0</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
														<li>vqmod/xml/endless_scroller_default_theme_patch.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/language/en-gb/module/endless_scroller.php</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.8.3 <small class="release-date text-muted">30 Aug 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-info">Changed:</em> Some code refactoring and UI improvements</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/javascript/es/custom.min.js</li>
														<li>admin/view/stylesheet/es/css/custom.min.css</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>system/helper/es.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
														<li>vqmod/xml/endless_scroller_default_theme_patch.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.8.2 <small class="release-date text-muted">30 Mar 2015</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Compatibility with OpenCart 2.0.2.0</li>
														<li><em class="text-info">Changed:</em> Moved theme integration into separate VQMod</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/view/javascript/es/custom.min.js</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>catalog/view/theme/default/template/product/*_products.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>vqmod/xml/endless_scroller_default_theme_patch.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.8.1 <small class="release-date text-muted">16 Dec 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Grid view for products with long names</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/javascript/es/custom.min.js</li>
														<li>admin/view/stylesheet/es/css/custom.min.css</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.8.0 <small class="release-date text-muted">05 Oct 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Lazy image loading</li>
														<li><em class="text-success">Fixed:</em> Next page is not loaded if initial page is displayed without scrollbars</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/javascript/es/custom.min.js</li>
														<li>admin/view/stylesheet/es/css/custom.min.css</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>catalog/view/theme/default/template/product/category_products.tpl</li>
														<li>catalog/view/theme/default/template/product/manufacturer_products.tpl</li>
														<li>catalog/view/theme/default/template/product/search_products.tpl</li>
														<li>catalog/view/theme/default/template/product/special_products.tpl</li>
														<li>system/helper/es.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>catalog/view/javascript/es/custom.min.js</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/stylesheet/es/fonts/*</li>
														<li>catalog/view/theme/default/image/loading_circle.gif</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.7.2 <small class="release-date text-muted">08 Mar 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Changelog on module settings page under About tab</li>
														<li><em class="text-success">Fixed:</em> Double page load on some occasions when fade in was used</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.7.1 <small class="release-date text-muted">17 Feb 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Undefined constant notice on PHP &lt; 5.4.0</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/view/javascript/es/custom.min.js</li>
														<li>admin/view/stylesheet/es/css/custom.min.css</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>system/helper/es.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.7.0 <small class="release-date text-muted">10 Jan 2014</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Revamped admin interface</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/static/bull5-i_es_extension_terms.htm</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>admin/view/javascript/es/*</li>
														<li>admin/view/stylesheet/es/*</li>
														<li>system/helper/es.php</li>
													</ul>

													<h4><i class="fa fa-minus text-danger"></i> Files removed:</h4>

													<ul>
														<li>admin/view/image/es/*</li>
														<li>admin/view/static/es/bull5-i_es_extension_help.htm</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.6.1 <small class="release-date text-muted">27 Jul 2013</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> A few microscopic errors</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.6.0 <small class="release-date text-muted">07 May 2013</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Endless scrolling on Special Offers page</li>
														<li><em class="text-success">Fixed:</em> Scrolling while store goes to maintenance mode</li>
														<li><em class="text-success">Fixed:</em> Scroll location jumping on new page load</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>catalog/view/theme/default/template/product/special_products.tpl</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.5.3 <small class="release-date text-muted">04 Dec 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Removed forced number coercion from URL parameters and added space preservation</li>
														<li><em class="text-success">Fixed:</em> Occasional corrupted URLs</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.5.2 <small class="release-date text-muted">23 Aug 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> JavaScript error when category had no products</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.5.1 <small class="release-date text-muted">22 Aug 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> A Tiny HTML layout issue</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.5.0 <small class="release-date text-muted">17 Jun 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Endless scrolling on manufacturers page</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>catalog/view/theme/default/template/product/manufacturer_products.tpl</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.4.3 <small class="release-date text-muted">04 Jun 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Issue with SEO URLs</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.4.2 <small class="release-date text-muted">24 Apr 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Conflict with Custom Image Titles (CIT) extension</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>catalog/view/theme/default/template/product/category_products.tpl</li>
														<li>catalog/view/theme/default/template/product/search_products.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.4.1 <small class="release-date text-muted">01 Apr 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-success">Fixed:</em> Pagination issue if the start page was not the first one</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.4.0 <small class="release-date text-muted">31 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Stateful scrolling</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>catalog/view/theme/default/template/product/category_products.tpl</li>
														<li>catalog/view/theme/default/template/product/search_products.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.3.0 <small class="release-date text-muted">30 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> "Back to Top" scroll button</li>
														<li><em class="text-primary">New:</em> Optional "More" button to load the next page instead of auto loading</li>
														<li><em class="text-primary">New:</em> Optional sticky footer showing the current progress</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>admin/language/english/module/endless_scroller.php</li>
														<li>admin/view/template/module/endless_scroller.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.2.0 <small class="release-date text-muted">28 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Graceful degradation to traditional pagination when Javascript is turned off</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.1.0 <small class="release-date text-muted">27 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li><em class="text-primary">New:</em> Endless scrolling on product search page</li>
													</ul>

													<h4><i class="fa fa-pencil text-primary"></i> Files changed:</h4>

													<ul>
														<li>admin/controller/module/endless_scroller.php</li>
														<li>catalog/view/theme/default/template/product/category_products.tpl</li>
														<li>vqmod/xml/endless_scroller.xml</li>
													</ul>

													<h4><i class="fa fa-plus text-success"></i> Files added:</h4>

													<ul>
														<li>catalog/view/theme/default/template/product/search_products.tpl</li>
													</ul>
												</blockquote>
											</div>

											<div class="release">
												<h3>Version 1.0.0 <small class="release-date text-muted">27 Mar 2012</small></h3>

												<blockquote>
													<ul class="list-unstyled">
														<li>Initial release</li>
													</ul>
												</blockquote>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript"><!--
!function(e,t,s){var o,r=<?php echo json_encode($errors); ?>,i=<?php echo json_encode($stores); ?>;e.texts=t.extend({},e.texts,{error_ajax_request:"<?php echo addslashes($error_ajax_request); ?>",error_positive_integer_zero:"<?php echo addslashes($error_positive_integer_zero); ?>",error_positive_integer:"<?php echo addslashes($error_positive_integer); ?>"}),e.load_service_list=function(e){var e=e!==s?1*e:0,r=t.Deferred();return o.service_list_loaded()&&!e||o.service_list_loading()?r.reject():(o.service_list_loading(!0),t.when(t.ajax({url:"<?php echo $services; ?>",data:{force:e},dataType:"json"})).then(function(e){o.service_list_loaded(!0),o.service_list_loading(!1),o.clearServices(),e.services&&t.each(e.services,function(e,t){var s=t.code,r=t.name,i=t.description||"",a=t.currency,n=t.price,_=t.turnaround;o.addService(s,r,i,a,n,_)}),e.rate&&t("#hourly_rate").html(e.rate),r.resolve()},function(e,t,s){o.service_list_loaded(!0),o.service_list_loading(!1),r.reject(),window.console&&window.console.log&&window.console.log("Failed to load services list: "+s)})),r.promise()};var a=function(e){isNaN(parseInt(e))||parseInt(e)<0?(this.target.hasError(!0),this.target.errorMsg(this.message)):(this.target.hasError(!1),this.target.errorMsg(""))},n=function(e){isNaN(parseInt(e))||parseInt(e)<1?(this.target.hasError(!0),this.target.errorMsg(this.message)):(this.target.hasError(!1),this.target.errorMsg(""))},_=function(e,t,s,o,r,i){this.code=e,this.name=t,this.description=s,this.currency=o,this.price=r,this.turnaround=i},c=function(){var s=this;this.status=ko.observable("<?php echo $es_status; ?>"),this.bottom_pixels=ko.observable("<?php echo (int)$es_bottom_pixels; ?>").extend({numeric:{precision:0,context:s},validate:{message:e.texts.error_positive_integer_zero,context:s,method:a}}),this.use_fade_in=ko.observable("<?php echo $es_use_fade_in; ?>"),this.use_back_to_top=ko.observable("<?php echo $es_use_back_to_top; ?>"),this.use_more=ko.observable("<?php echo $es_use_more; ?>"),this.use_more_after=ko.observable("<?php echo (int)$es_use_more_after; ?>").extend({numeric:{precision:0,context:s},validate:{message:e.texts.error_positive_integer_zero,context:s,method:a}}),this.use_sticky_footer=ko.observable("<?php echo $es_use_sticky_footer; ?>"),this.max_items_per_load=ko.observable("<?php echo (int)$es_max_items_per_load; ?>").extend({numeric:{precision:0,context:s},validate:{message:e.texts.error_positive_integer,context:s,method:n}}),this._sas=ko.observable(0),this._as=ko.observableArray(JSON.parse(atob("<?php echo $es_as; ?>"))),this.as=ko.computed(function(){return btoa(JSON.stringify(s._as()))}),this.asn=ko.computed(function(){var e=[];return ko.utils.arrayForEach(s._as(),function(t){i.hasOwnProperty(t)&&e.push(i[t].name)}),e.join(", ")}),this.iasn=ko.computed(function(){var e=[];return t.map(i,function(t,o){-1==s._as().indexOf(o.toString())&&e.push(t.name)}),e.join(", ")}),this.general_errors=ko.computed(function(){return s.bottom_pixels.hasError()||s.use_more_after.hasError()||s.max_items_per_load.hasError()}),s.service_list_loaded=ko.observable(!1),s.service_list_loading=ko.observable(!1),s.services=ko.observableArray([]),s.addService=function(e,t,o,r,i,a){s.services.push(new _(e,t,o,r,i,a))},s.clearServices=function(){s.services.removeAll()}};c.prototype=new e.observable_object_methods,t(function(){var s=window.location.hash,i=s.split("?")[0];o=e.view_model=new c,e.view_models=t.extend({},e.view_models,{ExtVM:e.view_model}),o.applyErrors(r),ko.applyBindings(o,t("#content")[0]),t("#legal_text .modal-body").load("view/static/bull5-i_es_extension_terms.htm"),t("body").on("shown.bs.tab","a[data-toggle='tab'][href='#ext-support'],a[data-toggle='tab'][href='#services']",function(){e.load_service_list()}).on("keydown","#es_status",function(e){if(e.altKey&&e.shiftKey&&e.ctrlKey&&83==e.keyCode){var t=ko.dataFor(this);t._sas(0==t._sas()?1:0)}}),e.onComplete(t("#page-overlay"),t("#content")).done(function(){e.activateTab(i)})})}(window.bull5i=window.bull5i||{},jQuery);
//--></script>
<?php echo $footer; ?>
