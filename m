From: thierry.reding@gmail.com (Thierry Reding)
Date: Mon, 20 Aug 2018 11:32:42 +0200
Subject: [PATCH] pwm: meson: fix mux clock names
In-Reply-To: <20180801105720.23999-1-jbrunet@baylibre.com>
References: <20180801105720.23999-1-jbrunet@baylibre.com>
Message-ID: <20180820093242.GC8242@ulmo>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Aug 01, 2018 at 12:57:20PM +0200, Jerome Brunet wrote:
> Current clock name looks like this:
> /soc/bus at ffd00000/pwm at 1b000#mux0
> 
> This is bad because CCF uses the clock to create a directory in clk debugfs.
> With such name, the directory creation (silently) fails and the debugfs
> entry end up being created at the debugfs root.
> 
> With this change, the clock name will now be:
> ffd1b000.pwm#mux0
> 
> This matches the clock naming scheme used in the ethernet and mmc driver.
> It also fixes the problem with debugfs.
> 
> Fixes: 36af66a79056 ("pwm: Convert to using %pOF instead of full_name")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/pwm-meson.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180820/ac1cf1bd/attachment.sig>
