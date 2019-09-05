Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BBAC43140
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F7D2070C
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 17:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTGJZZjR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="wuY8kl0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38F7D2070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=f586h7X6zhwWtyM+2XxocNrRjSUIre9l8VAgr+gvjLY=; b=KTG
	JZZjRACblh8preUdll10JzDXi26mBdEN0PSoR+JLVtnE7yRcbw9hV9/5zNztGWdgND0upcw2Qlkc0
	eyCkOG7BCjjUJiqGvWJ+tVIHGZj5k5zHGExWE4FBA59HX07eM0xZNPlCD2fsvy6LzvTDh1ayqESTq
	3qCPGgNWV+UIU9uuanFaWumrZawRHmBKuJwGYc0TdvTTYlLGeUYEISfTCwf19TogjlBX1kaicFKpL
	wUQrttiH+URO+2PZA7XYUbtDmNud0vXyclCOzUje3unP2W+BmvzB8/zvMpLRRRAKa5rhi2J/GVMBD
	lr8ZlWiXHkwv1wFJXtR5Mu4FNl18RQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5vir-0000m5-Kw; Thu, 05 Sep 2019 17:39:05 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5vij-0000cl-Pv
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 17:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DwBokQZNNtRg9EVjpvNf70nDH91xn3+otVOKWRMwdXc=; b=wuY8kl0AYbf/
 rK3iK07pefHy6TlZiqwwBdBDJeWbDCWsR6Gc5gG1qUhhWk5uQ6Fpr+wUgecS4dAoLyyIduAutXULf
 XYwhfM6yzy8mSgXQaiQldp/FS3OFjIqMqiX4OMRhYi2wX+DcV5vzp56dQBA/EMyn6JLAemXS+tXfH
 cYAXs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vih-0005HK-6Z; Thu, 05 Sep 2019 17:38:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9BF082742D17; Thu,  5 Sep 2019 18:38:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: add reset binding" to the asoc tree
In-Reply-To: <20190905120120.31752-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173854.9BF082742D17@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:38:54 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_103857_835091_1D1FD836 
X-CRM114-Status: GOOD (  16.57  )
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

   ASoC: meson: add reset binding

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

From 6b59b8f8222146fc1912e0b783c81e4122e240ac Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 5 Sep 2019 14:01:14 +0200
Subject: [PATCH] ASoC: meson: add reset binding

The g12a audio subsystem, which is a derivative of the axg subsystem,
provides a dedicated reset line for each of the audio components.

The axg did not provide that and it is unclear if/when these reset are
required. The reset already helped solve a channel mapping issue on the
tdm formatter devices. Let's add the reset binding for the other
components, so we can describe this in DT. We'll use it later on
in the driver when/if needed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190905120120.31752-3-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt | 5 ++++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt  | 3 +++
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt        | 3 +++
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt       | 3 +++
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt      | 2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4b17073c8f8c..3080979350a0 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -12,7 +12,10 @@ Required properties:
 - interrupts: interrupt specifier for the fifo.
 - clocks: phandle to the fifo peripheral clock provided by the audio
 	  clock controller.
-- resets: phandle to memory ARB line provided by the arb reset controller.
+- resets: list of reset phandle, one for each entry reset-names.
+- reset-names: should contain the following:
+  * "arb" : memory ARB line (required)
+  * "rst" : dedicated device reset line (optional)
 - #sound-dai-cells: must be 0.
 
 Example of FRDDR A on the A113 SoC:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index b3f097976e6b..716878107a24 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -13,6 +13,9 @@ Required properties:
   * "sysclk" : dsp system clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the pdm input.
+
 Example of PDM on the A113 SoC:
 
 pdm: audio-controller@ff632000 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 62e5bca71664..df92a4ecf288 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -11,6 +11,9 @@ Required properties:
   * "refclk" : spdif input reference clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the spdif input.
+
 Example on the A113 SoC:
 
 spdifin: audio-controller@400 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index d38aa35ec630..28381dd1f633 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -10,6 +10,9 @@ Required properties:
   * "mclk" : master clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the spdif output.
+
 Example on the A113 SoC:
 
 spdifout: audio-controller@480 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index 173a95045540..4e8cd7eb7cec 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -6,6 +6,7 @@ Required properties:
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
+- resets: phandle to the dedicated reset line of the hdmitx glue.
 
 Example on the S905X2 SoC:
 
@@ -13,6 +14,7 @@ tohdmitx: audio-controller@744 {
 	compatible = "amlogic,g12a-tohdmitx";
 	reg = <0x0 0x744 0x0 0x4>;
 	#sound-dai-cells = <1>;
+	resets = <&clkc_audio AUD_RESET_TOHDMITX>;
 };
 
 Example of an 'amlogic,axg-sound-card':
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
