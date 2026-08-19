Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE8CC5DF88
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 19:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcCSd1ON2sHlRVhqtk61j8EmjNSQA/oZUcDuJTrvZVQ=; b=KT+v3NaQfA0rHp
	mNQyYmunO71nBSWtRgFngZ4VnChfThfyiL5Sm6ZsEE9ZolHcZipyvDm8DkqBX1xXSt5t1xDjLVglR
	NMFkyISXw4s3swPeJBfw3tX5IALhhgkAOUCXj0COCPk+4cSI5WRw1LvudftZ4PHhjZxq5RkFEvlcy
	kgGzA2DwSfaTUHxMaB3lHCIHRpNGxCyHKFeurZUJ84NPM/rAGBqtkFyzLRHKy3T1pAn5Vt/b9bTaS
	5NOdmYtQhrn0OxVZgCJAsxOP4qsyI95b9Uf0AoEbVBTOcPT1y8INt3DiQ6JUDnGM9imQC4yPSv1bd
	fkXYZQCO1sHWryJIZ//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlby-0000000APxf-3kzT;
	Wed, 19 Aug 2026 19:06:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlbw-0000000APwO-3hVf;
	Wed, 19 Aug 2026 19:06:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F6F543315;
	Wed, 19 Aug 2026 19:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F01F00A3E;
	Wed, 19 Aug 2026 19:05:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tero Kristo <kristo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is fully initialized
Date: Wed, 19 Aug 2026 21:05:17 +0200
Message-ID: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
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

ltc428_clk_provider_setup() does not fill in any parent clocks, and
assumes that init.num_parents is NULL.  However, the latter in
uninitialized, and thus may cause a crash.

Make sure all members are fully initialized, to fix such bugs, and to
avoid future breakage when converting drivers to a different method for
specifying the parents.

Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/hwmon/ltc4282.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index b1675dc5b3c7fd2f..54ba4b8542e94b7b 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1106,7 +1106,7 @@ static const struct clk_ops ltc4282_ops = {
 static int ltc428_clk_provider_setup(struct ltc4282_state *st,
 				     struct device *dev)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_COMMON_CLK))
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
