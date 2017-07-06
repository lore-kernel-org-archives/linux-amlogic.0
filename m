From: thierry.reding@gmail.com (Thierry Reding)
Date: Thu, 6 Jul 2017 08:30:33 +0200
Subject: [PATCH] pwm: silently error on EPROBE_DEFER
In-Reply-To: <20170523160503.16920-1-jbrunet@baylibre.com>
References: <20170523160503.16920-1-jbrunet@baylibre.com>
Message-ID: <20170706063033.GD16144@ulmo.fritz.box>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, May 23, 2017 at 06:05:03PM +0200, Jerome Brunet wrote:
> In of_pwm_chip, if we fail to get the pwm chip due to probe defer, we
> shouldn't print an error message. Just be silent in this case.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pwm/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20170706/618718ad/attachment.sig>
