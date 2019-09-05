Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADADC43331
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426072070C
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQEsvQgg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="mowcuX34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426072070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=ycJ85VnyIEbsT7dw48x1y3puYsgs69OTdcVgp0WKRjo=; b=XQE
	svQgg3aGgqsMOxoqc2NHkhPnJLW79adjZ0j7PI7SOxgg/gCshYmJaPh/CzgDC5egoQ6docR01wEwx
	2si7uRnIjpdxxtr2fx+3Cv3lKyfy1M+iF8BVH1s/ek9QH2F7sczIcHduTQcn5jx+BAnOB8b6EA+L7
	W+E+FjUyj0PmwUg783t2sgkk9VweTsmCm2MZJ8iYVlE+/MOZLXWbP2SdT/Vx9XwiNpXjbTlHT85ZX
	fqLFEB/sHVZ1FMwIVD+ALBa4IKC2BOJ/IV9fFNPGOmldejkrwby9/8zU99Wa/CI5AQL5RJKAv1/mr
	BZ/E+yiL50wi6KTAz0yy9n8gXUVy9Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5viw-0000v2-PX; Thu, 05 Sep 2019 17:39:10 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5vij-0000cn-VV
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 17:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Kw7Sc8/OUQI+XpZIlQtPa4/jzKwmZbnxhfallE10YPc=; b=mowcuX34XcKt
 v+4geV1ZMQnB+/NsSasJjxDooP6ryicAAxa2GfxQOvQXvY5uXFahofnXDH0mkfgyl2LucPgBKTx54
 apbFNdNeEZoGMNZouDybLLDbQ5SHMZbKY9WDLP08+JlXLpIFY0Zba52Mk5gufIa7JXA4wMYv5Fxvq
 Q6FHU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vih-0005HM-B8; Thu, 05 Sep 2019 17:38:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CD1272742D1C; Thu,  5 Sep 2019 18:38:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: add sm1 compatibles" to the asoc tree
In-Reply-To: <20190905120120.31752-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173854.CD1272742D1C@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:38:54 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_103858_012185_BADD4F03 
X-CRM114-Status: GOOD (  11.68  )
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

   ASoC: meson: add sm1 compatibles

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

From f466309534b6f21304e1ee0573a60df9c4590272 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 5 Sep 2019 14:01:13 +0200
Subject: [PATCH] ASoC: meson: add sm1 compatibles

Document the compatible strings of the audio devices of the sm1 SoC
family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190905120120.31752-2-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt  | 4 +++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt   | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt         | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt        | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt  | 4 +++-
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt       | 3 ++-
 6 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4330fc9dca6d..4b17073c8f8c 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-toddr' or
 	      'amlogic,axg-toddr' or
 	      'amlogic,g12a-frddr' or
-	      'amlogic,g12a-toddr'
+	      'amlogic,g12a-toddr' or
+	      'amlogic,sm1-frddr' or
+	      'amlogic,sm1-toddr'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - interrupts: interrupt specifier for the fifo.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index 73f473a9365f..b3f097976e6b 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-pdm' or
-	      'amlogic,g12a-pdm'
+	      'amlogic,g12a-pdm' or
+	      'amlogic,sm1-pdm'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 0b82504fa419..62e5bca71664 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifin' or
-	      'amlogic,g12a-spdifin'
+	      'amlogic,g12a-spdifin' or
+	      'amlogic,sm1-spdifin'
 - interrupts: interrupt specifier for the spdif input.
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index 826152730508..d38aa35ec630 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout'
+	      'amlogic,g12a-spdifout' or
+	      'amlogic,sm1-spdifout'
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
   * "pclk" : peripheral clock.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 8835a43edfbb..5996c0cd89c2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-tdmin' or
 	      'amlogic,axg-tdmout' or
 	      'amlogic,g12a-tdmin' or
-	      'amlogic,g12a-tdmout'
+	      'amlogic,g12a-tdmout' or
+	      'amlogic,sm1-tdmin' or
+	      'amlogic,sm1-tdmout
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index aa6c35570d31..173a95045540 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -1,7 +1,8 @@
 * Amlogic HDMI Tx control glue
 
 Required properties:
-- compatible: "amlogic,g12a-tohdmitx"
+- compatible: "amlogic,g12a-tohdmitx" or
+	      "amlogic,sm1-tohdmitx"
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
