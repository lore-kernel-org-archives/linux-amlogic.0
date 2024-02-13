Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E2EC4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4YfHKXkgsrR+a7hpjUb5TBsM8HjnDf4DvzZ+pGrLH0=; b=QGlyd1xK7uGF6K
	UCLeuCD1lKv0hwS4tsEDCvOVH29y6NM2qinF+pC6jYp8gDBo/+lxmZ8jTk9nz4m4XfOMTpTm4DJFr
	lTsE87tKa4iuFB8RoImylL5KFPC+PO3kiXrnkQM7QKgpTtW/U2+gL6Z46fdxbcukAT0Rkvoa9Wof6
	p0+dqEGq2HxbgXxSLRgbATZX3VKZzTj10OoRvlD7W1jNTMzTonFlBgTyjAbnqLNRlmql+HnBL51ca
	cDXL13XF7Z3UcTW+yyOVOfyeWZMtVgpzK8GG5dsXH8zE9ybtjIPILgO1sCx5dSEtzq6mfup4Kio9A
	XQEXyuGMrDmYcZhZgfLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpmC-00000008mQO-1P8t;
	Tue, 13 Feb 2024 10:12:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZpm9-00000008mOQ-1yqM;
	Tue, 13 Feb 2024 10:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECC8D61336;
	Tue, 13 Feb 2024 10:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8CCC433F1;
	Tue, 13 Feb 2024 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707819148;
	bh=ywd10UsSv5X9PzwqZG/+YKBc+M0eD2jqf72bCCzxHWk=;
	h=From:To:Cc:Subject:Date:From;
	b=K5QajlV1GWq4RfRrLAujUEthGfd1J4/FV2WEAhnBYNNYS83VXXKZZVK9zlpZSWVP4
	 spDptzhPgge/ohUOgNZJCavEXt2CVrTDosHIWs6o2LgQfPp/Dfgd9fHRelSs0EMT7s
	 6EG+p3qHVJil9fOuZfFcQEMAGTw/cjPSFaoom6UKV+8L/i4JFgdEXzT3KXo+IRAJuW
	 c+2Fge13nZ26rX96sAbnQVXoYyGo3hsbktzqCf1NoeN15BOqRNA3GqhNnIHZQ87IjE
	 JKC9YYTujQWktn83sCyNQNvoaRDQr0xmrgrJTsUkKvjn+lgz24AOT5beYT4fVQQZbX
	 rkmuRxgmeY7Lw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 11:11:38 +0100
Message-Id: <20240213101220.459641-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_021229_634828_AF4BB028 
X-CRM114-Status: GOOD (  12.66  )
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

From: Arnd Bergmann <arnd@arndb.de>

Casting between incompatible function types causes a warning with clang-16
because it breaks control flow integrity (KCFI) rules:

sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  243 |                                        (void(*)(void *))clk_disable_unprepare,
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
  406 |         __devm_add_action_or_reset(dev, action, data, #action)
      |                                         ^~~~~~
sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  274 |                         (void(*)(void *))clk_disable_unprepare,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
  406 |         __devm_add_action_or_reset(dev, action, data, #action)
      |                                         ^~~~~~

These two meson drivers cast clk_disable_unprepare() into a different type
in order to have it automatically called from the driver relase. Add
trivial helpers to do the same using correct types.

Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/meson/aiu.c   | 9 ++++++---
 sound/soc/meson/t9015.c | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 7109b81cc3d0..211f360df284 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
 	[MCLK]	= "spdif_mclk_sel"
 };
 
+static void aiu_clk_disable(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int aiu_clk_get(struct device *dev)
 {
 	struct aiu *aiu = dev_get_drvdata(dev);
@@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       aiu->pclk);
+	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);
 	if (ret)
 		dev_err(dev, "failed to add reset action on pclk");
 
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 9c6b4dac6893..e0f9a603a5e9 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
 	.max_register		= POWER_CFG,
 };
 
+static void t9015_clk_disable(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int t9015_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-			(void(*)(void *))clk_disable_unprepare,
-			priv->pclk);
+	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
 	if (ret)
 		return ret;
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
