#. Create .htaccess in document root and add ::
	
	Options +Includes
	XBitHack on

#. In `/etc/apache2/sites-enabled/000-default` change in `Document Root -> Directory -> AllowOverride None` to `AllowOverride All`

#. Change document root to `/var/www/thelinuxacademy` instead of `var/www/` in both places

	and `cgi` path also appropriately similar to ::

	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
    ScriptAlias /register.cgi /var/www/thelinuxacademy/register.cgi


#. Execute as root ::
		
	 a2enmod include

#. Do `chmod +x` to all html files with SSI(Server side include)

#. Now create say `footer.html` and add the common content there, include it as `<!--#include virtual="/footer.html" -->`

#. service apache2 restart

