Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C16CC67872
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 12:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E0A2145D
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 12:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YF/sFJI1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Txbvjk5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E0A2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=FuemK6VMnbzeJv6OCSvx2lm9ps50iLWKZcYYzTjUjxA=; b=YF/
	sFJI1EylRzYbFF946KfotC/lwHVDLEkGihIBxC8lRaVAMn9E9moCsNmR3tOar8Y8dALiZVFOz44z/
	fAYZVdjKj+5RePN7lJEXcIfgXK0STe6r1y4ZFgVIdpRQ4DaEqrxDZjNiazPfurJe0/C/jJYfsIP58
	dg7MPhni9qENfxeTF8uEmobbxfB2afWz+bak9ZmF3FC2JPtZdzmO0bVew2oJCtZPDkC0QcfpwKcMX
	2ZmaPcv5Y2CvCn0I6IwVbxktplZLrGuEYGr0oUbyKxaVSW8wxWJb07s0DZ1bWqI4rdmSd5BFe5YP7
	C9i3iLM7xilhJ86ZIgjJkh6Hb1LzESA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXPnb-0007gg-JH; Thu, 13 Dec 2018 12:09:03 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPnX-0007VC-7v
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 12:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IxTRNukDKABFeyuNYETUnkxqv/pjSeC320eG86XAj/Q=; b=Txbvjk5Ibt2Y
 hFuKRJ0PbHnBK40iZa5MAefH+8knM2nVzpvX37ZsixHBjEYROlyRtkHkNiIKc1O0P2sgtWANn6ilD
 Ti9JdMxQxmcyQmuYZLsQMy7ORXsxqHcS7pm7A2i6KYaXFm8qDFvE82hkKCTj10RUSTbKnZe+hy7Sg
 F0tQ4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gXPnH-0000y0-RN; Thu, 13 Dec 2018 12:08:43 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 876CB11254D1; Thu, 13 Dec 2018 12:08:43 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: add axg spdif input DT binding documentation"
 to the asoc tree
In-Reply-To: <20181211134713.4908-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20181213120843.876CB11254D1@debutante.sirena.org.uk>
Date: Thu, 13 Dec 2018 12:08:43 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_040859_436931_55399FB9 
X-CRM114-Status: GOOD (  12.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: add axg spdif input DT binding documentation

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

From 18dc4665fb6f3bb617c2e6d7da3f19586d06ab17 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 11 Dec 2018 14:47:11 +0100
Subject: [PATCH] ASoC: meson: add axg spdif input DT binding documentation

Add the DT binding documentation for axg's SPDIF input.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/amlogic,axg-spdifin.txt    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
new file mode 100644
index 000000000000..2e6cb7d9b202
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -0,0 +1,22 @@
+* Amlogic Audio SPDIF Input
+
+Required properties:
+- compatible: 'amlogic,axg-spdifin'
+- interrupts: interrupt specifier for the spdif input.
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "pclk" : peripheral clock.
+  * "refclk" : spdif input reference clock
+- #sound-dai-cells: must be 0.
+
+Example on the A113 SoC:
+
+spdifin: audio-controller@400 {
+	compatible = "amlogic,axg-spdifin";
+	reg = <0x0 0x400 0x0 0x30>;
+	#sound-dai-cells = <0>;
+	interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+	clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+		 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+	clock-names = "pclk", "refclk";
+};
-- 
2.19.0.rc2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
