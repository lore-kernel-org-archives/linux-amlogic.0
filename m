Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C50C432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 18:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8052B206D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 18:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUmsXOT8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZcJa5SN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8052B206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Nvkm89BocvOCSFH/riEJMTTcASmcIQHRNPh414Y70U=; b=VUmsXOT8Foluo4
	Fwgq6DehK7gf5Xd4fUy14BTqGqIuE+Kn7IhFaeNXMNf2fpo/kE8zgnsTrO1uZUfttbu0nxZEyk9de
	kxzDrzX8/GqUry9ouc8zNZaHWB54LqbCLQifcJodb8KV45vCLIng2VDCpL2Ha3kkmmf9yaobGFQ4y
	UuMnJaeis3Wzbf7SQIvtw8+hjN5DSsXMwEiwac2CjnkPUcjsu1hJtwiIbOXl+BsN2dHCFP4CTXDEl
	teirM+vQLCitbiZZdcKc6brYQ8FjonJQInVP7ewxNwH85YxxR1vPqHoC/rh/k+qZJr0AAI2Pl5PKH
	t00C1/X7FJuJulUlfb7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXrKM-0005cA-Uj; Thu, 21 Nov 2019 18:37:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXrKK-0005bp-Jn; Thu, 21 Nov 2019 18:37:13 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5EBB20672;
 Thu, 21 Nov 2019 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574361431;
 bh=bvBt/Z3IcnbICHqI86zDLVlsM35yTFdoVqsRRTB0fyk=;
 h=From:To:Cc:Subject:Date:From;
 b=NZcJa5SNue4TX21Z/7clNxhT6htYrnii9lAAOTqbZ2/hYlXzd6Vy4Ae6SgUjeBpdL
 l8L61V+30siHIs77rllCs4s3daq01vSI4paG1cWuNu7tIkzyT2Z+NS5/R02yyB60sW
 3XwBnNinCWQLg4pOtI6pLyaDVVtslx2oPzcHiXQQ=
From: Kevin Hilman <khilman@kernel.org>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 1/1] arm64: dts: meson-sm1-sei610: gpio-keys: switch to IRQs
Date: Thu, 21 Nov 2019 10:37:11 -0800
Message-Id: <20191121183711.19785-1-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_103712_668855_0F47C580 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

Switch the GPIO buttons/switches to use interrupts instead of polling.
While at it, add the mic mute switch and the power button.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 5bd07469766b..2c90f4713d0e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -46,25 +46,47 @@
 	};
 
 	gpio-keys {
-		compatible = "gpio-keys-polled";
-		poll-interval = <100>;
+		compatible = "gpio-keys";
 
 		key1 {
 			label = "A";
 			linux,code = <BTN_0>;
 			gpios = <&gpio GPIOH_6 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio_intc>;
+			interrupts = <34 IRQ_TYPE_EDGE_BOTH>;
 		};
 
 		key2 {
 			label = "B";
 			linux,code = <BTN_1>;
 			gpios = <&gpio GPIOH_7 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio_intc>;
+			interrupts = <35 IRQ_TYPE_EDGE_BOTH>;
 		};
 
 		key3 {
 			label = "C";
 			linux,code = <BTN_2>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio_intc>;
+			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
+		};
+
+		mic_mute {
+			label = "MicMute";
+			linux,code = <SW_MUTE_DEVICE>;
+			linux,input-type = <EV_SW>;
+			gpios = <&gpio_ao GPIOE_2 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio_intc>;
+			interrupts = <99 IRQ_TYPE_EDGE_BOTH>;
+		};
+
+		power_key {
+			label = "PowerKey";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio_intc>;
+			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
 		};
 	};
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
