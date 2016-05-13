From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 13 May 2016 15:46:00 +0200
Subject: [PATCH 1/2] mmc: Add Amlogic Meson driver
In-Reply-To: <1463056902-8533-2-git-send-email-carlo@caione.org> (Carlo
 Caione's message of "Thu, 12 May 2016 14:41:41 +0200")
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
 <1463056902-8533-2-git-send-email-carlo@caione.org>
Message-ID: <m2lh3e2hrb.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Carlo Caione <carlo@caione.org> writes:

> From: Carlo Caione <carlo@endlessm.com>
>
> This is a port / rewrite of the Amlogic driver shipped whithin the
> Amlogic SDK for the Meson GXBaby (S905) SoC.
>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>

[...]

> +static const struct udevice_id meson_mmc_match[] = {
> +	{ .compatible = "amlogic,meson-mmc" },
> +	{ /* sentinel */ }

IIUC, this controller is different between meson8* and gxbb.  If that's
the case, this compatible should probably be more specific.

Kevin
