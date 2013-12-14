JSONRW_VERSION = master
JSONRW_SITE = https://github.com/aragua/jsonrw.git
JSONRW_SITE_METHOD=git
JSONRW_LICENSE=GPLv3	
JSONRW_AUTORECONF=YES

$(eval $(autotools-package))
