Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB0FC43331
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5075120828
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XEVLmi9I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="bLL1SkEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5075120828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=1RtEdMrVusGru53dpK5d0sh2/jhb1xSU3pFiISEpPGM=; b=XEV
	Lmi9I0PNYlRr1NxnqozSYMjOKaMl++/efjZ7yvJ4gH4NMNY4Ex2Mi09JuFCJBtKOX15bPPSPzCM7n
	BL7jzOrAGJyQ8gqUD2qUdYey8PCRZfCIfpSLfF1/30g7v0N0/LuhOGW6HSYhfkQ7wubAICm1jp87p
	CAQtBSNp9VzxB1TSnSnAJMqzJ6gl9RgHJVt3aXPhsBfxS2hgJ2fLfde9ZwMITZ32gXXM+sZ2LX3pe
	pb8JEONW/NQR6FsrgNDk2PvozPYmw2Y4xzTwikIrke1qOZxkfMsYj9JgcIzV4KRAsvbbDXVLYniDP
	LSB+Z7JN2/eQ1KxwtlQ+DYOm4GTDilw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5viu-0000rz-V8; Thu, 05 Sep 2019 17:39:08 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5vij-0000ck-Ki
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 17:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Xmc+MPzaRfPd7zHJuBoHtw7lAqQfS4jtIcu8iITVun4=; b=bLL1SkEVYkNf
 g9IIsJsaS/W2ZPo4PBPCIkvXyHsr39lh0mX9Pbh2cp9eC8wJOyQLh/I/vqackZC47EgsWMAmuM3C2
 K6VnICzJxIcr2xwrTJzgH/DfSgx8vJ4zHs+lrHvdXsdFy5XLMsxelmde4trw3yNvt6hjKSLhUjR69
 NDWgs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vig-0005HJ-TK; Thu, 05 Sep 2019 17:38:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 66E1C2742D07; Thu,  5 Sep 2019 18:38:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: axg-frddr: expose all 8 outputs" to the asoc
 tree
In-Reply-To: <20190905120120.31752-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173854.66E1C2742D07@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:38:54 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_103857_677412_5042B0C1 
X-CRM114-Status: GOOD (  12.06  )
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

   ASoC: meson: axg-frddr: expose all 8 outputs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 8fcd2d914e786033e589b4eb8cb62d37d0fa9701 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 5 Sep 2019 14:01:15 +0200
Subject: [PATCH] ASoC: meson: axg-frddr: expose all 8 outputs

The FRDDR component, as it, has a maximum of 8 outputs. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected outputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190905120120.31752-4-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-frddr.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 2b8807737b2b..0968e8375000 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 };
 
 static const char * const axg_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3"
+	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4", "OUT 5", "OUT 6", "OUT 7",
 };
 
 static SOC_ENUM_SINGLE_DECL(axg_frddr_sel_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
@@ -120,6 +120,10 @@ static const struct snd_soc_dapm_widget axg_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
@@ -128,6 +132,10 @@ static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
 	{ "OUT 1", "OUT 1",  "SINK SEL" },
 	{ "OUT 2", "OUT 2",  "SINK SEL" },
 	{ "OUT 3", "OUT 3",  "SINK SEL" },
+	{ "OUT 4", "OUT 4",  "SINK SEL" },
+	{ "OUT 5", "OUT 5",  "SINK SEL" },
+	{ "OUT 6", "OUT 6",  "SINK SEL" },
+	{ "OUT 7", "OUT 7",  "SINK SEL" },
 };
 
 static const struct snd_soc_component_driver axg_frddr_component_drv = {
@@ -162,16 +170,12 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 	.pcm_new	= axg_frddr_pcm_new,
 };
 
-static const char * const g12a_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4",
-};
-
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel1_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel2_enum, FIFO_CTRL0, CTRL0_SEL2_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel3_enum, FIFO_CTRL0, CTRL0_SEL3_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 
 static const struct snd_kcontrol_new g12a_frddr_out1_demux =
 	SOC_DAPM_ENUM("Output Src 1", g12a_frddr_sel1_enum);
@@ -211,6 +215,9 @@ static const struct snd_soc_dapm_widget g12a_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
@@ -228,16 +235,25 @@ static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
 	{ "OUT 2", "OUT 2", "SINK 1 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 1 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 1 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 1 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 1 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 1 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 2 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 2 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 2 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 2 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 2 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 2 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 2 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 2 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 3 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 3 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 3 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 3 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 3 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 3 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 3 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 3 SEL" },
 };
 
 static const struct snd_soc_component_driver g12a_frddr_component_drv = {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
