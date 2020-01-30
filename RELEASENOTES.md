# Release Notes

### 3.6.3 (UNRELEASED)
* Added auto selecting of service body when only one is available to current user. [#377]
* Changed default menu option for dialback to 9.
* Fix for speech gathering option [#372]
* Fix for aligning metrics summary colors with map pins for reports. [#370]
* Fix to prevent Twilio credentials from being overridden mid-call [#375]

### 3.6.2 (January 18, 2020)
* Added simple check for state/province in SMS meeting search. [#369]
* Added toggle switch for recursively running reports [#365]
* Added request caching to improve performance. 
* Fix for filtering out services bodies you don't have rights to in "All" mode for reports [#364]
* Fix for tomato meeting searches on by default.

### 3.6.1 (January 5, 2020)
* Fix for null coordinate responses in map data. [#363]
* Fix for service body name in reports.

### 3.6.0 (January 4, 2020)
* Added favicon.
* Added mapping of call events with POI CSV downloads. [#353]
* Added call event for helpline routing.
* Added setting for using Tomato for meeting searches. [#357]
* Added the ability to add distance results to SMS. [#358]
* Added alerting capability, implemented for cases where reporting webhook not set. [#341]
* Added the service body name in the call events formatting.
* Changed metrics legend to match map legend.

### 3.5.5 (December 25, 2019)
* Fix in regression for status.php datetime formatting.

### 3.5.4 (December 25, 2019)
* Call records are paginated now. [#338]
* Performance improvements for reports.

### 3.5.3 (December 19, 2019)
* Voicemail play link is now an MP3. [#351]

### 3.5.2 (December 15, 2019)
* Fix for large data responses being truncated by MySQL. [#350]

### 3.5.1 (December 14, 2019)
* Added the ability to disable BMLT based authentication in favor of local auth. [#339]
* Added service body IDs in dropdowns on the admin UI. [#349]
* Several reports fixes. [#342] [#343] [#344] [#345] [#346] [#348]
* Fix for Play link not working on Call Handling modal for service bodies. [#347]

### 3.5.0 (December 4, 2019)
* Added database driven call detail records. [#289] [#285]
* Added the ability to "dialback". [#209]
* Added the ability to have custom filters for call routing. [#314]
* Added the ability to random cycle once, and then go to voicemail. [#310]
* Added the ability to have a volunteer answer a call without pressing 1. [#321]
* Added new and improved call blasting with volunteer detection. [#321]
* Added voicemail for call blasting. [#332]
* Added improved routing logic for Tomato based helpling routing [#329]
* Added support for custom campaigns to track metrics down to the phone number level. [#301]
* Added a new setting for the default language for volunteers when none is set.
* Added support for non-BMLT non-admin users.
* Pointing to tomato.bmltenabled.org now for 🍅 things.
* Fix for Language Volunteer routing not working [#325]
* Fix for SMS not properly higlighting addresses for app maps. [#317]
* Fix for SMS caller ID when Forced Caller ID is set. [#307]
* Fix for Helpline Redirect not working on a stock installation.
* Fix for digit map display in Settings in administration portal.
* Fix for Yap 2.x import for single quoted characters. [#318]
* Fix for some JFTs that had an ampersand.
* Fix for potential link blocking on SMS summary links using link rewrites [#328]
* Removed `helpline_search_unpublished` feature which was no longer in use.

### 3.4.0 (September 8, 2019)
* Service body direct dial by ID. [#302]
* Remappable digits for search types. [#292]
* Remappable digits for location search method.
* Allow for a title customization of the login screen. 
* Toll number bias. [#291]
* Query performance improvements. [#284]
* Tomato URL is overridable.
* Fix looping voicemail recordings [#300]
* Fix for JFT Option not disabling JFT text or voice. [#287]
* Fix for documentation deep link 404s. [#303] 
* Fix for Canadian French JFT not working.

### 3.3.1 (June 21, 2019)
* Disable speech recognition menus by default.

### 3.3.0 (June 18, 2019)
* Logo header on the login screen and version number display.
* Packaging improvements to reduce the size of the deployment (always packaging mainline deps).

### 3.2.0 (June 5, 2019)
* User name is now cached and stored in session. [#279]
* Call records are displayed in your local browser timezone now. [#282]
* Better handling of abbreviations with some textual cues. [#219]
* Database user authentication for global administrators.

### 3.1.1 (April 24, 2018)
* Italian translation
* Fix for bad XML encoding for Spanish JFT. [#273]
* Fix for non-working SMS volunteer routing. [#274]
* Fix for an edge case to render schedule ordering correctly [#162]
* Data point added to upgrade-advisor for getting the git hash for each build for QA and Beta users.
* Fix for duration not displaying properly on volunteer records. [#275]
* Fix for missing word in language files. [#276]

### 3.1.0 (April 18, 2019)
* Support for different voices for each languages. [#260]
* Metrics drilldown by service body. [#246]
* Minor tweaks to es-US translation. [#262]
* Fix for prompts not being utilized from service body config overrides. [#268]
* Fix for mobile check caching (it was being called once for each lookup).
* Fix for responder not working on some servers where the session cookie might be treated differently.

### 3.0.3 (April 8, 2019)
* Fix for overridden Twilio credentials that were not being utilized.
* Renamed "Add" to "Create" for creating new groups.
* Fix for Twilio warnings messaging landlines. Added mobile_check option. [#171]

### 3.0.2 (April 4, 2019)
* Added validation for URL fields in Calling Handling. [#228]
* Added language file for Australian English to simplify configuration. [#252] [#253]
* Added configurable initial pause. [#244]
* Fixed forever loading spinner for single service body entitled user. [#263]
* Removed the word "today" in meeting listings, fixes translations issue. [#261]

### 3.0.1 (March 31, 2019)
* Fix for no map link being sent when using include map link option. [#254]
* Added validation for shift time selection to avoid impossible shifts. [#210]
* Fixes for fr-CA translations.

### 3.0.0 (March 23, 2019)
* Call blasting which gives the ability to call all on shift volunteers simultaneously. [#60]
* Language based call routing and volunteers.  This feature allow you to set up a list of volunteers that speak a particular language and route calls to them if that language is selected. [#146]
* Gender based volunteer routing. [#136]
* Shadow feature which all for tandem based training of volunteers. [#144]
* Include location_text field from the BMLT in meeting responses (SMS and Voice Response). [#172]
* Option to disable voice recognition (useful for demos in a noisy room). [#173]
* Volunteer groups, which allow for re-using schedules of volunteers and sharing to other service bodies. [#103]
* Service body based configuration overrides.  This allows you to override any setting in your config.php from within the admin UI.  For example, with this feature you can have multiple Twilio API keys on a single Yap instance. [#223]
* Volunteer calling records with details and duration. [#105]
* Voicemail links are accessible by each respective service body in calling records section. [#105]
* Voicemail can be routed now to any volunteer using the Responder setting. [#211]
* United States Spanish Translation.
* Reporting interface that displays daily numbers of action types. [#110]
* Display name visible now on the Admin Interface (if using the root server >= 2.13.5) [#96]
* New UI theme for Admin interface.
* The SMS Summary option and SMS ask option can now be used together. [#238]

### 2.5.4 (February 2, 2019)
* Added the ability to hide postal code lookups. [#231]
* Minor textual change SMS Summary Page SMS message.
* Added the ability to create custom CSS for SMS summary page.
* Bug fix for "tomorrow" lookups that return no meetings.

### 2.5.3 (January 31, 2019)
* SMS Summary Page responsiveness

### 2.5.2 (January 31, 2019)
* SMS Summary option [#230]

### 2.5.1 (November 18, 2018)
* Fix for results not being filtered out that have passed in time already for the day [#189]

### 2.5.0 (October 24, 2018)
* Custom Query support, return all meetings for example for an isolated geographical area, for instance an island. [#11]
* Meeting results are default sorted starting today and then looping through the week (configurable). [#168]
* Added list view button for schedule rendering.
* Fix on volunteer management single shift add not respecting times. [#167]
* Fix for session initialization issue happening on at least one server. [#165]
* Fix for "jft" SMS gateway responses that were too long and hitting the 1600 character limit. [#163]
* Fix for schedule sorting not being respected in calendar view (still a known issue with time sequencing taking precedence). [#162]

### 2.4.0 (October 18, 2018)
* Support for multiple service body contacts (CSV) for email notifications for voicemail.
* Support for multiple service body contacts (CSV) for SMS notifications for voicemail.
* Show enabled volunteers highlighted in light grey, making non-enabled ones more obvious visually. [#161]
* Added the ability to add 7 day shifts with the same time block.
* Made debug logging disabled by default and added additional logging messages.

### 2.3.3 (October 8, 2018)
* Fix for double usage of "components" in Google Maps API bias. [#157]
* Fix for dealing with bad input as a result of voice recognition on IVR inputs. [#155]

### 2.3.2 (October 2, 2018)
* Hotfix for broken SMS sending of meeting list information due to a Twilio bug. [#150]

### 2.3.1 (September 30, 2018)
* Fixed the voice prompt to "press or say" in conjunction with being able to speak responses on menus.

### 2.3.0 (September 30, 2018)
* Added "jft" response to SMS gateway (support for English, French, Spanish and Brazilian). [#147]
* You can now press or say any option in the IVR menus.  
* Postal codes support speech recognition which assists with letters in Canadian ones. [#142]
* Added French Canadian language support.
* Migrated retired <Sms> to new <Message> TwiML tag.

### 2.2.2 (September 21, 2018)
* Playback link of custom prompts on service body configuration modal. [#143]
* Bug fix for non-default timezone adding for volunteers on single shift entry. [#138]
* Bug fix for top results count when less than the result_count_max property. [#139]
* Regression bug fix for helpline lookup failures not handled properly.
* Retry workflow instead of a hangup when no more meetings found for today for a given lookup.

### 2.2.1 (September 13, 2018)
* Use Redirect twilio verb instead of header function for redirects. [#133]
* Fix for int'l numbers that were not auto-prepending "+" on SMS voicemail notification. [#137] 
* README table of contents fixes

### 2.2.0 (August 28, 2018)
* Introducing helpline SMS routing. [#46]
* Notes field added for each volunteer to help with various metadata. [#127]
* Blocklist for automatically rejecting specific calls or messages. [#125]
* Fix for int'l numbers that were not auto-prepending "+" on SMS volunteer notification. [#124]

### 2.1.3 (August 14, 2018)
* Fix for no volunteers specified in schedule edge case. [#122]
* Phone Numbers page removed from admin portal.
* Security patch to prevent logins from masquerading root servers. 

### 2.1.2 (Aug 4, 2018)
* Tomato helpline routing feature.
* Fixing several bad regressions introduced in 2.1.1 (mostly configuration related). [#116] [#117] [#118]
