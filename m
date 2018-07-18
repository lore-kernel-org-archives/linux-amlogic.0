From: broonie@kernel.org (Mark Brown)
Date: Wed, 18 Jul 2018 12:50:54 +0100
Subject: [PATCH RESEND 02/15] ASoC: meson: add axg fifo base driver
In-Reply-To: <20180717154304.9973-3-jbrunet@baylibre.com>
References: <20180717154304.9973-1-jbrunet@baylibre.com>
 <20180717154304.9973-3-jbrunet@baylibre.com>
Message-ID: <20180718115054.GI5700@sirena.org.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Jul 17, 2018 at 05:42:51PM +0200, Jerome Brunet wrote:

> +	return !status ? IRQ_NONE : IRQ_HANDLED;

Please just write normal conditional statements, it makes things a lot
easier to read (the ! isn't helping either here).
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180718/88f02bc3/attachment.sig>
