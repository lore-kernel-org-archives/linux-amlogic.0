Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B326C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E3A204EA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DGxjw5N5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E3A204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fRA/s9j9EkeNKlMcoCCv92KVoN2yUzMTPQftiSgMuko=; b=DGxjw5N5bI1C31RAgOhT7+ylS
	2t8yOUkJf5xYEEXs+9kwC+9O+ocnlElpflRYY8VSz6ISxNZ1TZJYRcATE/p1cT9jB4x/KD6D+wuNW
	GamXTy1sGCzQVOUworM1WaWml/lRedXp18TP066Mhd96tVnFvFJaazWNLnMcmloqnpNBoCo21JfMB
	wWYEU1T6CIaUBPc7DTCxfulKWnkpvYL4OU8LoyAroOA7Eyt2IiRk+CycRs3N1wmVN/Hwt/1Qbq3wZ
	8NFIc6P3Nxqnei6YhIbaTr0Un5fq0hdqSIeoPgqm46vuI5hq1TZqPf+qFC5pZSQOezJQ/MYi9K7lR
	fLM7c80DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXFi-0007tO-63; Mon, 05 Oct 2020 20:38:34 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDb-0006a4-9I; Mon, 05 Oct 2020 20:36:25 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M7JrG-1kK4681bhc-007kJO; Mon, 05 Oct 2020 22:36:00 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD9-0004X3-UD; Mon, 05 Oct 2020 22:35:56 +0200
Received: (nullmailer pid 10395 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:40 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 11/12] arm64: dts: meson: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:50 +0200
Message-Id: <20201005203451.9985-12-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 9f5b2199e4483c1fbb1603fea470fc05
X-Provags-ID: V03:K1:A4oxbG+VP4keve1usN9ADR72uw0WccVPSSBWokgSTOYr4HO0wXU
 h4RFD7nLJIzovO2Gs4xcpY+0BKCCyDjL8Mjxgi3z2Qh1iU+WASkkhFmghKKTEFF9Q/f9rpM
 +4/nJcVli6ea+DZquPU/7SLA2oHuGw4PxnchPmtnsm62Gi6nxZo4lk2B3bw2RvLv0lA+h58
 0lhR3dJRtVTCUoBXhvr9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ovu7SMkV4Q=:PH7u5YKYkwCKqj8o1agAGk
 rWTBchz6xUWT2uBSBXi4dbo0qLg3hNmYgVIEtS3KljJSK0tQ/ZLNwX0FwAf2o1n6GZV35GHDg
 Jev9Z/2ImNZJWCyjAGly9esRXyLPPGZnlTM+ucRmiyjGDBkdLS1RBRRWm5htpCycF2YDJKD0X
 a7HX+Te79Z9hJoLGOYvYCZcBQKJoVj9kdvnFiAmBUI/joN8vflOmZYlZxvBMaZTtiLpmQUN8X
 NUMVCZaJmNkNjn0GfnEnqR/BAfdulIS4Vbx9bwMIDHotBFwTY/SDyTCTgsWgHD6LSwfWEVFT0
 gMkGvSZPyPfnG0T/xmgRSHDEAcJclkHy5TjCSfKHvpki8FGS1IXA+ealzJ3oZ0FoHMtRyoGMD
 ycuGqk+TUjj1N8lV2KqzWDUEcDtwgPzg44iNfa17ioq0yCrwE0b6Hdzt+CgT2XNTJE3DWUaeu
 C6ZojrgnplPxhZkym+Kg1RhZTYmmkFevC3MXgq0CZ6leahy9wN7F7ahrVVLo7MGWQ5lvvGsC5
 XkeegLfcMAHcVIvcbPvjFy2lFzkylqe7lfcW1H2cVOArjikK0zTArJ1ycQa6XHL+1kERqjZGf
 HLPMbza2Pkdgk/pgtdPI5RWswwsxEfwPO/npXiIuM27iW66XnD43Lo7uWVpNgiDZ2o9dyKgrX
 H00a1LUmLwEaV6nBG+Gi5WnVff118/hBl7bNoRiipRWzQSJR4yAE/yYbkzkqgYJ8dRJ/L8D+A
 G3DHdcyiJ6iDDAMwrXygXjhlNm8BB1dHQVxyDpjin+Ybt5QkGqvLuawPQ/MOZ6aVSH366W1z3
 cpzBuPnSl/RVFuPEsY35bJ/23eZOxWq0BhWdwzPKCXcwJ7t67FnX1VKZ5E3TEhM+ZgiScVK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163623_600344_DC7E2DA8 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Dahl <ada@thorsis.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---

Notes:
    v6 -> v7:
      * added Reviewed-by
      * added another explaining sentence to commit message
    
    v6:
      * added this patch to series

 .../arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts     | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts          | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d0..adfc72500e66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -42,10 +42,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..dcb435af4e0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -81,10 +81,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 5ab139a34c01..039a8d0d1e9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -101,20 +101,20 @@
 		};
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		led-bluetooth {
+		led-1 {
 			label = "sei610:blue:bt";
 			gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 			default-state = "off";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		power {
+		led-2 {
 			label = "sei610:red:power";
 			pwms = <&pwm_AO_ab 0 30518 0>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
