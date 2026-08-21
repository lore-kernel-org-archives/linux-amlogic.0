Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69721C5DF87
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ObY2H0gSOD+UYKPh9uEXlocTaBoGT3xHI1g3IK9GMTI=; b=NUSZ4cXttbkfTR
	Segy97PgJ55/ubKRLOlP9Gj5jdIMdsqiRg891I61RCCDvzhR0KNmhcA4vny2l/mKsjBv0oAH+lcwo
	qlMV1dSgeDR7dNF5srh5ExJqYCZuPW9VJ3twxWF0qsdbHxYLYkObP1L+KffFp6ef2+Cajm/sdFlRB
	ZyPGXt/p1yrL1e4ggDDhCXbTSt0dvh5bmbfivavxpZCBeCLMVRVGub5AaSN5L+WpvX3/2FqWuawdy
	0ZfK4mSdf9b+48ya7EZCrMzG2v6nPFhZTXXQWaXZCpL1EKa8HLyXWO1wQrinhCTRl4KEw77N/40mn
	0te/R3vQnPMERW/vYERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM73-0000000D0aC-0nH3;
	Fri, 21 Aug 2026 10:04:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM71-0000000D0Zs-3H90;
	Fri, 21 Aug 2026 10:04:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41E37403BA;
	Fri, 21 Aug 2026 10:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD341F00A3A;
	Fri, 21 Aug 2026 10:04:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] media: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:04:27 +0200
Message-ID: <cover.1787240035.git.geert+renesas@glider.be>
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

This series is the media subpart of Part Two, which fixes remaining
cases that are currently harmless.  These are still fragile, and may
cause future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  media: cec: meson: ao-cec-g12a: Make sure clk_init_data is fully
    initialized
  media: microchip: Make sure clk_init_data is fully initialized
  media: samsung: exynos4-is: Make sure clk_init_data is fully
    initialized

 drivers/media/cec/platform/meson/ao-cec-g12a.c        | 2 +-
 drivers/media/platform/microchip/microchip-isc-clk.c  | 2 +-
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
