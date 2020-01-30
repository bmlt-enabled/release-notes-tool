
CHANGELIST
----------
***Version 2.14.6* ** *- December 10, 2019*

- Geocoding does not work well in all parts of the world, so automatic geocoding of meetings is now optional. It is enabled by default, and can disabled by adding `$auto_geocoding_enabled = false;` to `auto-config.inc.php`.
- When `$county_auto_geocoding_enabled = true;` is set in `auto-config.inc.php`, the County field becomes read-only and is automatically populated by geocoding when a meeting is saved.
- When `$zip_auto_geocoding_enabled = true;` is set in `auto-config.inc.php`, the Zip Code field becomes read-only and is automatically populated by geocoding when a meeting is saved. 
- Added additional strings for Polish translation.

***Version 2.14.5* ** *- December 7, 2019*

- Added Polish translations to the administration UI.
- The "Other" tab in the meeting editor user interface can now be translated.
- Forward slashes are now unescaped for JSON semantic endpoints.
- The meeting editor's meeting search page now has a "Check All" and "Uncheck All" checkbox for selecting service bodies.

***Version 2.14.4* ** *- November 11, 2019*

- Added Polish formats.
- Added a data migration so that existing root servers will have the farsi formats.

***Version 2.14.3* ** *- November 3, 2019*

- Fixed an issue where the install wizard could not be completed when a permissions issue prevented writing of `auto-config.inc.php`.
- Added Farsi formats.
- When there is a problem with the Google API Key, a more descriptive error message is now shown in the UI.

***Version 2.14.2* ** *- October 14, 2019*

- Server administrators can now import service bodies and meetings from a NAWS-provided export in the Server Administration section of the UI. Service bodies, users, and meetings are created. If any of the provided service body world IDs or meeting IDs already exist in the root server, no changes are made.
- Refactored the installation wizard's NAWS import functionality, and increased its performance by leveraging a database transaction.
- Fixed possible concurrency issues with meeting saves by leveraging database transactions.

***Version 2.14.1* ** *- October 11, 2019*

- Fixed an issue that prevented data imports from a NAWS export from working when using PHP 7.0.

***Version 2.14.0* ** *- September 30, 2019*

- The installation wizard now allows you to prime a database with a NAWS export. All meetings and service bodies are created, and a service body administrator user is created for each service body. Meetings that are missing data for required fields are not imported. Required fields are: CommitteeName, AreaRegion, Day, Time, Address, City. 

***Version 2.13.7* ** *- September 23, 2019*

- The No Smoking format is now automatically mapped to the appropriate NAWS format.

***Version 2.13.6* ** *- September 22, 2019*

- Changed JSONP mime type to `application/javascript`.
- Rename "Get A NAWS Format Dump" to "Get A NAWS Format Export" in the semantic workshop.
- Fixed an issue where the admin user interface could falsely think a meeting had been edited.
- Place name_strings from unmapped formats in the Room field of NAWS Exports.
- Fix for NAWS format drop-down not sorting correctly in the root server administration.
- Updated to the latest BMLT Satellite Base Class.
- Added new NAWS formats CH (Closed Holidays), GP (Guiding Principles) and NC (No Children).

***Version 2.13.5* ** *- August 15, 2019*

- Fix for NAWS format types not saving correctly in the root server administration.

***Version 2.13.4* ** *- August 5, 2019*

- New meetings are now published by default. This is configurable by adding `$default_meeting_published = false;` to `auto-config.inc.php`.
- Added server version to login screen.
- Fixed a bug that caused changes to meeting start times and durations to not show up in the change history.

***Version 2.13.3* ** *- July 7, 2019*

- When saving a change to a meeting, the edit screen for that meeting is no longer closed. This makes it easier for the user to keep their place in the user interface.
- When the published checkbox is unchecked in the meeting editor UI, a note is displayed: "Unpublishing a meeting indicates a temporary closure. If this meeting has closed permanently, please delete it."

***Version 2.13.2* ** *- July 4, 2019*

- Fixed an issue where the wrong service body could be displayed in the "Service Body Administration" section of the Admin UI when a Service Body Administrator is the Primary Admin of only one service body.
- Service Body Admins can now use the new "Server Administration" section of the UI, allowing them to upload the spreadsheet returned by NAWS to batch update the World IDs for their meetings.
- Removed the "Delete Permanently" capability when deleting meetings as a Server Admin. The "Delete Permanently" checkbox caused a meeting to be deleted with no change record. Abuse of this feature made it difficult for NAWS to reconcile its meeting list with the BMLT. All deleted meetings now result in a change record.

***Version 2.13.1* ** *- July 2, 2019*

- Semantic Administration is now enabled by default on install wizard.
- Fixed a bug with JSONP endpoint emoting incorrect mime type.
- Added format_type to the definition of formats.  This allows satellites to distinguish between classes of formats, and handle them differently (e.g. languages displayed with flags).
  - The following types are defined:
    - `'FC1'  =>  'Meeting Format (Speaker, Book Study, etc.)',`
    - `'FC2'  =>  'Location Code (Wheelchair Accessible, Limited Parking, etc.)',`
    - `'FC3'  =>  'Special Interest and Restrictions (Mens Meeting, LGTBQ, No Children, etc.)',`
    - `'O'    =>  'Attendance by non-addicts (Open, Closed)',`
    - `'LANG' =>  'Language'`
- Added the ability to specify languages for formats that are not included in the languages for which the server admin console has been translated.  This lightweight style of adding languages allows meeting lists to be generated if a satellite has been translated (much less work than the entire server admin).
  - To do this you would add an additional setting in your `auto-config.inc.php` 
    - Ex. `$format_lang_names = ['fa'=>'Farsi'];`
- Added database migration system with database schema versioning, and added dbVersion to GetServerInfo endpoint.
- Formats are now sorted alphabetically in the root server administration, as well as NAWS format dropdown.

***Version 2.13.0* ** *- April 28, 2019*

- Added new "Server Administration" section to the user interface, allowing server admins to upload the spreadsheet returned by NAWS to batch update the World IDs for meetings.
- Added warning when attempting to delete a service body to remove any existing meetings or transfer them to another service body so they don't become "orphaned".
- Fixed a bug where calculated field `root_server_uri` would get written to the database and subsequently reported in change history.

***Version 2.12.8* ** *- April 24, 2019*

- Fixed some PHP warnings in the POI/CSV, KML, and GPX endpoints.
- Fixed some PHP warnings in the GetChanges endpoint.
- Fixed some PHP warnings that occurred when saving meetings.
- Fixed some PHP warnings in the server_admin_strings.
- Fixed a PHP warning with headers being sent twice for NAWS dump.
- Fixed a PHP warning in the GetFieldValues endpoint.
- Fixed a PHP warning that occurred when modifying a user.
- Replaced deprecated PHP function `ereg` with `preg_match`.

***Version 2.12.7* ** *- April 21, 2019*

- The installation wizard now has more intuitive error handling.
- The installation wizard now writes `auto-config.inc.php` automatically, so you don't have to.
- Fixed a couple of warnings that show up in error logs when performing a NAWS Export.

***Version 2.12.6* ** *- February 24, 2019*

- Added meetings by location and day option to bmlt.js.
- Simple GetFormats response is now sorted.
- Added $default_minute_interval to override the minute interval for Start Time and Interval on the Admin UI.
- Fixed issue with Admin UI not returning noon meetings when searching for afternoon meetings.

***Version 2.12.5* ** *- December 24, 2018*

- Added user name to sign out link for the administration UI.
- Added the ability to display a fixed set of counties when editing meetings in a dropdown menu rather than a freeform text field with a new `$meeting_counties_and_sub_provinces` setting.
- Added Danish translations.
- Fixed some minor issues with the /html/ endpoint.
- Fixed some more issues with running the root server behind a reverse proxy.

***Version 2.12.4* ** *- December 15, 2018*
- Made sorting case-insensitive, for users and service bodies.
- When creating URLs for static content, the HTTP_X_FORWARDED_PORT and HTTP_X_FORWARDED_PROTO headers are now inspected for determining the port and protocol. 
- Added sorting to semantic workshop for service bodies and formats.

***Version 2.12.3* ** *- December 7, 2018*

- The service bodies list under the "Search For Meetings Tab" in the "Meeting Editor" is now sorted.
- The users list under the "Full Meeting List Editors" section of "Service Body Administration" is now sorted.
- Fixed an issue where the default duration time was not selected in the meeting editor.
- The format checkboxes in the Formats tab of the meeting editor are now sorted.
- The initialize database button in the installer wizard is now easier to see.
- The settings in the installer wizard are now displayed only after the initialize database button is pressed.
- Added cache busting to installer wizard's javascript and css files.
- Latitude and longitude input boxes are now read only instead of disabled, allowing users to select and copy the calculated values.
- Fixed an issue where static files in the client_interface/html/ endpoint were not being included.
- The German translations for the administration UI were updated.
- The "Set Map to Address" button in the single meeting editor was removed, as it no longer provides value to the workflow.

***Version 2.12.2* ** *- November 22, 2018*

- Fixed an issue where formats could be wrong in a NAWS Dump for servers that were combined using lettuce.
- Fixed the client_interface/html/ endpoint, which was broken by a change in dependency management in 2.12.1.

***Version 2.12.1* ** *- November 17, 2018*

- Both `$gkey` and `$gKey` are now valid settings in auto-config.inc.php.
- Fixed a minor issue with switching between unsaved users and service bodies in the admin UI.

***Version 2.12.0* ** *- November 12, 2018*

- Saving a meeting now geocodes and sets the latitude and longitude automatically.
- Fixed an issue where the schema migration from 2.11.0 could fail.
- Added meeting states and provinces to the available fields returned by the server info.
- Added the ability to display a fixed set of states/provinces when editing meetings in a dropdown menu rather than a freeform text field with a new `$meeting_states_and_provinces` setting.
- Fixed an issue where the Enter key would not submit the meeting search form when using Firefox.
- Fixed a UX issue where the NAWS Export link was in close proximity to the Delete Service Body button, resulting in accidental deletion of service bodies.
- Fixed an issue where the My Account save button would be incorrectly enabled/disabled (again).
- Added formats and unique value functions, and recursive option to bmlt.js

***Version 2.11.1* ** *- October 1, 2018*

- Fixed an issue where the user would erroneously receive a warning when switching between edited users and service bodies.
- Fixed an issue with cutting/pasting into text fields in the administration UI.
- Fixed an issue with editing meetings where the "Save" button would be enabled even if no changes had been made.
- Fixed an issue where the My Account save button would be incorrectly enabled/disabled.

***Version 2.11.0* ** *- September 28, 2018*

- Added the ability to allow Service Body Administrators to edit their users.
- Added cache busting for the server admin JavaScript, eliminating the need to clear the browser cache after an upgrade.
- There was an exceedingly rare bug in the history display. If a user had been changed for a Service body, and the previous user had been deleted, it would hang the history display.
- Added support for disabling the forced port in the include URIs. Some VM servers misrepresent the ports when forcing SSL.
- Improved code commenting.
- Fixed an inconsistency in time format of defaults for duration time

***Version 2.10.7* ** *- July 27, 2018*

- Improved the password hashing algorithm.

***Version 2.10.6* ** *- July 14, 2018*
- Service body and user dropdowns on the admin interface are sorted alphabetically
- Fixed an issue where leading zeros were being left on meeting time for JSONP interface.
- Fixed an issue with the case for the installer wizard generation of the "$gKey" variable (should be "$gkey").

***Version 2.10.5* ** *- April 19, 2018*

- The Italian localization was missing the label and default text for the Helpline field in the Service Body Editor. This has been fixed.
- Made a fix for the Italian translation to avoid text overlap.
- Fixed an issue where stricter PHP 7 settings were causing problems with user admin.

