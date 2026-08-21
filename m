Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A80C5DF7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mptrELmlWDOR/RvAVygHf1ON4PxRvNJDcCGcddts1ks=; b=RaR616OKKe1h6l
	Mb4aGLgDm6zQ+tB0TE1U5rW7+AstIJGKVyArML+8X/Wwy2igILbD1hwVOkQlONazlxh87KIgLnpyD
	xSlUh/zjoCjuXT+ofiSqilBHjJYmty0AoOBn18VsVQWV0IAhPp+e054e6rF1MMIVovGy2arjwctxT
	Pj3viZs6HyVmbODUjE5LoNSWSuxIreZQl2NqrP00zpK5slF86o2La8Cm4TfrwY7opl+XhvmSqJ989
	Y08fFHXkTeLFG8x8WZ2wogw+blY5HTkDSFQSkrfch13yEqeQbzA1/nuqe+ZSPs4+9M0wNuIiyFu91
	KPna1NOAaVkT7mB0l64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM78-0000000D0co-2D9N;
	Fri, 21 Aug 2026 10:04:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxM77-0000000D0c4-3Eer;
	Fri, 21 Aug 2026 10:04:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C3F400AB;
	Fri, 21 Aug 2026 10:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0111F000E9;
	Fri, 21 Aug 2026 10:04:38 +0000 (UTC)
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
Subject: [PATCH 2/3] media: microchip: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:04:29 +0200
Message-ID: <85c229d88f297fe32c3f2ea42d727b116bdeb998.1787240035.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240035.git.geert+renesas@glider.be>
References: <cover.1787240035.git.geert+renesas@glider.be>
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/media/platform/microchip/microchip-isc-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-clk.c b/drivers/media/platform/microchip/microchip-isc-clk.c
index 24358d804e75d75c..65d5fb8019b341b8 100644
--- a/drivers/media/platform/microchip/microchip-isc-clk.c
+++ b/drivers/media/platform/microchip/microchip-isc-clk.c
@@ -231,7 +231,7 @@ static int isc_clk_register(struct isc_device *isc, unsigned int id)
 	struct regmap *regmap = isc->regmap;
 	struct device_node *np = isc->dev->of_node;
 	struct isc_clk *isc_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *clk_name = np->name;
 	const char *parent_names[3];
 	int num_parents;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
