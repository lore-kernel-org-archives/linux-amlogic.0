From: trini@konsulko.com (Tom Rini)
Date: Mon, 18 Dec 2017 18:37:44 -0500
Subject: [U-Boot,u-boot] net: phy: meson-gxl: detect LPA corruption
In-Reply-To: <1513091035-32503-1-git-send-email-narmstrong@baylibre.com>
References: <1513091035-32503-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <20171218233744.GO14220@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Dec 12, 2017 at 04:03:55PM +0100, Neil Armstrong wrote:

> From: Jerome Brunet <jbrunet@baylibre.com>
> 
> This patch is ported from the Linux patch posted at [1] and applied to
> net tree as commit f1e2400a80ff.
> 
> The purpose of this change is to fix the incorrect detection of the link
> partner (LP) advertised capabilities which sometimes happens with this PHY
> (roughly 1 time in a dozen)
> 
> This issue may cause the link to be negotiated at 10Mbps/Full or
> 10Mbps/Half when 100MBps/Full is actually possible. In some case, the link
> is even completely broken and no communication is possible.
> 
> To detect the corruption, we must look for a magic undocumented bit in the
> WOL bank (hint given by the SoC vendor kernel) but this is not enough to
> cover all cases. We also have to look at the LPA ack. If the LP supports
> Aneg but did not ack our base code when aneg is completed, we assume
> something went wrong.
> 
> The detection of a corrupted LPA triggers a restart of the aneg process.
> This solves the problem but may take up to 6 retries to complete.
> 
> [1] https://lkml.kernel.org/r/20171208110811.30789-1-jbrunet at baylibre.com
> 
> Fixes: 8995a96d1d67 ("net: phy: Add Amlogic Meson GXL Internal PHY support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171218/043cfb75/attachment.sig>
