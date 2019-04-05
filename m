Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD62C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 02:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F272171F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 02:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FsOR0OXa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Jho69nc2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F272171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=Qa7jMsxQHipDt+TqwaeiPDWzxyFXqLVc0qhyZQ0Lcio=; b=FsO
	R0OXat9UlDJJD5G5hIUIRhbQFTiAaI2v83ka++tuwvIOucc04YkKc3AB316b8764rLFmCFuIbF5md
	OvqIW6ZSdqUAUDBwtveHXNBdAZ+UY/nonb0VOBotqkbE2YpJDg1Tli+awaXoZ0dI5Pd97yuuxhfGR
	SS+w/gzmu02SupwFrdPWDdMD5qO0tSJUMaWvmqkbYVoy0oMNWdYdoFssTbQZgzlOOY2b3larxTTi2
	DMPoLb3vTvXdI2IC/5xWnR4hbQxWU6AUfzuQm/aBquY88SaezmCIO4pL+KaPVyGqnjd6L+3hdl8UT
	90VV12iM0SAwnd5WmbzfZpL8b5bmQFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCEpI-0006pp-KQ; Fri, 05 Apr 2019 02:43:32 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCEpE-0006kE-Fq
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 02:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YsmSJtNCxKg43zce1gbaVnEzvg0ut/5r48aLgcV/8r0=; b=Jho69nc2vyHP
 3Jydpw0Jojl44Umfoq+SYMRV5qg41QGi+AYC9iKS+pMOGwDZyIpiq6DL3Piy7FmozhbO8lI/p0TDp
 Bd3EU7z9JwGvsFsod/wu7Wpfu1RLGasIloL0oAPqnQT3liDA8zprDyYi+agRk8sw98zQGm/jFBzsj
 JgQrw=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hCEpA-0005Ey-Sm; Fri, 05 Apr 2019 02:43:25 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 05F3C441D3C; Fri,  5 Apr 2019 09:43:22 +0700 (+07)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: add g12a compatibles" to the asoc tree
In-Reply-To: <20190404111733.28705-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190405024322.05F3C441D3C@finisterre.ee.mobilebroadband>
Date: Fri,  5 Apr 2019 09:43:21 +0700 (+07)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_194328_851321_F51920C7 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: add g12a compatibles

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

From 679f4e6cfd45bcc14bb563576e419ac9e43fad7c Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 4 Apr 2019 13:17:28 +0200
Subject: [PATCH] ASoC: meson: add g12a compatibles

Add new compatible strings for the g12a devices.
Audio wise, the g12a is fairly to close to the axg, yet some differences
need to be handled.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt  | 4 +++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt   | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt         | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt        | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt  | 4 +++-
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 3dfc2515e5c6..4330fc9dca6d 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -2,7 +2,9 @@
 
 Required properties:
 - compatible: 'amlogic,axg-toddr' or
-	      'amlogic,axg-frddr'
+	      'amlogic,axg-toddr' or
+	      'amlogic,g12a-frddr' or
+	      'amlogic,g12a-toddr'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - interrupts: interrupt specifier for the fifo.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index 5672d0bc5b16..73f473a9365f 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -1,7 +1,8 @@
 * Amlogic Audio PDM input
 
 Required properties:
-- compatible: 'amlogic,axg-pdm'
+- compatible: 'amlogic,axg-pdm' or
+	      'amlogic,g12a-pdm'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 2e6cb7d9b202..0b82504fa419 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -1,7 +1,8 @@
 * Amlogic Audio SPDIF Input
 
 Required properties:
-- compatible: 'amlogic,axg-spdifin'
+- compatible: 'amlogic,axg-spdifin' or
+	      'amlogic,g12a-spdifin'
 - interrupts: interrupt specifier for the spdif input.
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index 521c38ad89e7..826152730508 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -1,7 +1,8 @@
 * Amlogic Audio SPDIF Output
 
 Required properties:
-- compatible: 'amlogic,axg-spdifout'
+- compatible: 'amlogic,axg-spdifout' or
+	      'amlogic,g12a-spdifout'
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
   * "pclk" : peripheral clock.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 1c1b7490554e..3b94a715a0b9 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -2,7 +2,9 @@
 
 Required properties:
 - compatible: 'amlogic,axg-tdmin' or
-	      'amlogic,axg-tdmout'
+	      'amlogic,axg-tdmout' or
+	      'amlogic,g12a-tdmin' or
+	      'amlogic,g12a-tdmout'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
