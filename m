Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F732C00306
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E8420828
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzpQ6Hkd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="hCBA9Ukj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E8420828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=iX5oljyvWHwnjnmgPc/BRj2z/QcAQ1MzkTS09QIRyVs=; b=Tzp
	Q6HkdiCwH4iYq3MatApcaLcfNAmgmfd83XVVxuJYBMR09/PlE72pD72PEQ0PM38gYtje8IqbnBeRb
	l3YUAqh8mQ9vLbRXkfDi681mQaXer2NCOX9U4U5L+RhwdtnkmPNqR0ipNspwUm+j6X2jDCp2+aXLd
	AB9Tdm5cmcKNaqZOivH/b2hBO32fQLH2Bnq5Kw6O80FjcaXTonX94iJBhZHo+WQXwpwuierxQbyW1
	khg/FI934pMPj9sfpZw8TtGmuIQB6t2++S9sjJRDXd0w/oiuLZkCBOmiZgiS0LYIv1nVIz1FtdhVT
	fVFaPTHC/lwA5NXkROqBidEsJ6IN0nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5vil-0000eW-WA; Thu, 05 Sep 2019 17:39:00 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5vii-0000bb-Bo
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 17:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WFBeTA29e2jCHqdiLUMn88CIIBnDmGqeVSrZy3nUF9U=; b=hCBA9UkjMJCE
 fKgCdAZBM3zzT4+vPDfzhVfBwq8g33sJyG8Tr8rr8DdQ4D6f+AfJREsIYem65eF3mIheit7x9qdeq
 ewzLjglxCZkMQRXXCYDX6inDdzePHyuHoJHMkBQp8CVYaeG4Whjxk+PssZfUDK+4xBHTdnaD7s3Zw
 ls5u8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vie-0005Gh-LH; Thu, 05 Sep 2019 17:38:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0CE5A2742D22; Thu,  5 Sep 2019 18:38:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: tdmin: expose all 16 inputs" to the asoc tree
In-Reply-To: <20190905120120.31752-6-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173852.0CE5A2742D22@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:38:52 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_103856_432219_CEF57564 
X-CRM114-Status: GOOD (  11.43  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: tdmin: expose all 16 inputs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From cde9f12e5f0d288d516c810f95c2ee4c171e0245 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 5 Sep 2019 14:01:17 +0200
Subject: [PATCH] ASoC: meson: tdmin: expose all 16 inputs

The TDMIN component, as it, has a maximum of 16 input. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected inputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190905120120.31752-6-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-tdmin.c | 47 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index cb87f17f3e95..973d4c02ef8d 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -43,7 +43,8 @@ static const struct regmap_config axg_tdmin_regmap_cfg = {
 };
 
 static const char * const axg_tdmin_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 5",
+	"IN 0", "IN 1", "IN 2",  "IN 3",  "IN 4",  "IN 5",  "IN 6",  "IN 7",
+	"IN 8", "IN 9", "IN 10", "IN 11", "IN 12", "IN 13", "IN 14", "IN 15",
 };
 
 /* Change to special mux control to reset dapm */
@@ -164,12 +165,22 @@ static int axg_tdmin_prepare(struct regmap *map,
 }
 
 static const struct snd_soc_dapm_widget axg_tdmin_dapm_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 0",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 1",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 2",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 3",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 4",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 5",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 6",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 7",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 8",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 9",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 10", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 11", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 12", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 13", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 14", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 15", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0, &axg_tdmin_in_mux),
 	SND_SOC_DAPM_PGA_E("DEC", SND_SOC_NOPM, 0, 0, NULL, 0,
 			   axg_tdm_formatter_event,
@@ -178,12 +189,22 @@ static const struct snd_soc_dapm_widget axg_tdmin_dapm_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route axg_tdmin_dapm_routes[] = {
-	{ "SRC SEL", "IN 0", "IN 0" },
-	{ "SRC SEL", "IN 1", "IN 1" },
-	{ "SRC SEL", "IN 2", "IN 2" },
-	{ "SRC SEL", "IN 3", "IN 3" },
-	{ "SRC SEL", "IN 4", "IN 4" },
-	{ "SRC SEL", "IN 5", "IN 5" },
+	{ "SRC SEL", "IN 0",  "IN 0" },
+	{ "SRC SEL", "IN 1",  "IN 1" },
+	{ "SRC SEL", "IN 2",  "IN 2" },
+	{ "SRC SEL", "IN 3",  "IN 3" },
+	{ "SRC SEL", "IN 4",  "IN 4" },
+	{ "SRC SEL", "IN 5",  "IN 5" },
+	{ "SRC SEL", "IN 6",  "IN 6" },
+	{ "SRC SEL", "IN 7",  "IN 7" },
+	{ "SRC SEL", "IN 8",  "IN 8" },
+	{ "SRC SEL", "IN 9",  "IN 9" },
+	{ "SRC SEL", "IN 10", "IN 10" },
+	{ "SRC SEL", "IN 11", "IN 11" },
+	{ "SRC SEL", "IN 12", "IN 12" },
+	{ "SRC SEL", "IN 13", "IN 13" },
+	{ "SRC SEL", "IN 14", "IN 14" },
+	{ "SRC SEL", "IN 15", "IN 15" },
 	{ "DEC", NULL, "SRC SEL" },
 	{ "OUT", NULL, "DEC" },
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
