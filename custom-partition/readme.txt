How-to use IGEL custom partitions
IGEL custom partitions are delivered as a zip archive.  The archive has the following content:
-igel : folder containing patches and UMS profiles
-target : folder containing Custom Partition (inf and tar.bz2 files)
-disclaimer.txt : disclaimer note
-readme.txt: Worthless, except to give you the URL of the video installation guide

Steps to deploy the Custom Partition

1.	Copy the contents of the folder target into the ums_filetransfer folder on the UMS Server (e.g C:\Program Files (x86)\IGEL\RemoteManager\rmguiserver\webapps\ums_filetransfer)
2.	Check the accessibility of the data using Internet browser. (e.g: https://<ums-server>:8443/ums_filetransfer/make_raceboard.inf
3.	Import the profile (profiles.zip) into the UMS via: "System->Import->Import Profiles". The imported profile should now appear in UMS under Profiles.
4.	Import the firmware customizations archive (fwcsExport.zip) into the UMS via: "System->Import->Import Firmware Customizations". The imported profile should now appear in UMS under Firmware Customizations.
5.	Watch this video:
	https://web.microsoftstream.com/video/bc938ae6-779a-41eb-8b20-71cbee488752

Note: CP archive (.tar.bz2) needs to be built without parent 'raceboard' directory until the scripts can be correctly re-based to /custom/raceboard.


