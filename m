Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D814AC624A4
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 09:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ObnwO/ZkGAdC28z0qhieKeqyjpFHvjbRQ+gfoyzkWc=; b=nkxO3X/h+3QPge
	QDcFswQgFXsT11noHKLKrfS68u2AH9271NRiYrbQ1SqWk0yrDaKrGQzljlDf8o6n2upV55Zhirq+P
	ysSc6Jatmc93rdtzg7koZUtM6XcY41QxFNIneBIFOdBPECKMjq/chScxvk079JUeWfdNh7qE+pXze
	Dj4O5PGtw9R7ufG84a9zqPf+T+0XPEoihAVfGcpe1Wb47ofikQFtVOUb6jlxrYFzuStguCtPhbybL
	Ar6Jh/2/C/n4wks9P1mwIFTc4b5FsvjemWo0Oyn+Hfqgfk3/7FiqP0LS9f9kAX9ijrA2Y4I24hO2Y
	xrSb7HXQ0iaj0YyFBb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23JS-0000000GsLX-1bPh;
	Thu, 03 Sep 2026 09:00:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23JR-0000000GsKy-1pP4;
	Thu, 03 Sep 2026 09:00:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DCA94600C8;
	Thu,  3 Sep 2026 09:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0788C1F000E9;
	Thu,  3 Sep 2026 09:00:44 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next v2 0/3] net: Make sure clk_init_data is fully initialized
Date: Thu,  3 Sep 2026 11:00:38 +0200
Message-ID: <cover.1788425654.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

	Hi all,

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Hence this series aims to make sure all members are fully initialized,
to avoid such bugs, and to prevent future breakage when converting
drivers to a different method for specifying the parents.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This series is the networking subpart of Part Two, which fixes remaining
cases that are currently harmless.  These are still fragile, and may
cause future breakage when converting drivers to a different method for
specifying the parents.

Changes compared to v1[2]:
  - Add Reviewed-by.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
[2] "[PATCH net-next 0/3] net: Make sure clk_init_data is fully
     initialized"
    https://lore.kernel.org/cover.1787240118.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  net: macb: Make sure clk_init_data is fully initialized
  net: mdio: mux-meson-g12a: Make sure clk_init_data is fully
    initialized
  net: phy: air_en8811h: Make sure clk_init_data is fully initialized

 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 drivers/net/mdio/mdio-mux-meson-g12a.c   | 2 +-
 drivers/net/phy/air_en8811h.c            | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
