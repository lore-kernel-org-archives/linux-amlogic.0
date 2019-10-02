Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC80FC35280
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 16:07:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9006B21A4C
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 16:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IDSchcr1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xqXgGJ9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9006B21A4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=54MY4DdA2TnI/WXu/VkZvGlF7fI9o3J31tmOs6mX9g8=; b=IDSchcr1o/UufpHvFOq3CtBx/O
	uHfigq7ppadds9QqtiW5U49fj6Gkl6zN3gbBbU+9C4eU5Iq1/dg/yWOw1LbRXIDkRiPhldOldZCL4
	4RR6T81X3JNiJ5j+cTunP5Tw6qXG10kLBi+er9Vgl1qtD8eBAEoPOvvIYSW1aA22GPdV7vsNaBi4J
	IGWnW7YrhjkfioKU1pW97XgqbcajG+uEaCwwgUVyCtWDVj4rfb9QnaFatY3c1cBw5poRSGtWpiFAe
	LKwL2kuClBzTkFpkhaGj8lRB+mQ97jsvUYC3JY+FT+OZDW7O/y1kj9xIVf3wbR8Y7WzXCULm1mY+q
	CHPmXyHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFhAG-0001qi-8O; Wed, 02 Oct 2019 16:07:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFh9e-0001Id-Gc; Wed, 02 Oct 2019 16:07:08 +0000
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1851222BE;
 Wed,  2 Oct 2019 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570032426;
 bh=mQPcQHUPwO41tj6eZFL6xjysxPvRcXAHP637dM6rPBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xqXgGJ9vZy7bk8yuGyGyCZ7HwYOrs+sZX0ScjPpHW2skiKsRVVRbzRGyQcfqtu4D8
 sDlbVfZP8EPCOarDCvgd/OoIf7Cf8wm0Dk0jsfDjrCD4nx9pQtHbxNAKOrgy5zMzDi
 vbSyChOYqADcyyWF+Gryao3inEuvv8/IJSvZMhXw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/3] ARM: dts: exynos: Rename power domain nodes to
 "power-domain" in Exynos4
Date: Wed,  2 Oct 2019 18:06:32 +0200
Message-Id: <20191002160632.11140-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002160632.11140-1-krzk@kernel.org>
References: <20191002160632.11140-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_090706_602522_11270107 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The device node name should reflect generic class of a device so rename
power domain nodes to "power-domain".  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4.dtsi    | 14 +++++++-------
 arch/arm/boot/dts/exynos4210.dtsi |  2 +-
 arch/arm/boot/dts/exynos4412.dtsi |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 433f109d97ca..d2779a790ce3 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -111,28 +111,28 @@
 			syscon = <&pmu_system_controller>;
 		};
 
-		pd_mfc: mfc-power-domain@10023c40 {
+		pd_mfc: power-domain@10023c40 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C40 0x20>;
 			#power-domain-cells = <0>;
 			label = "MFC";
 		};
 
-		pd_g3d: g3d-power-domain@10023c60 {
+		pd_g3d: power-domain@10023c60 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C60 0x20>;
 			#power-domain-cells = <0>;
 			label = "G3D";
 		};
 
-		pd_lcd0: lcd0-power-domain@10023c80 {
+		pd_lcd0: power-domain@10023c80 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C80 0x20>;
 			#power-domain-cells = <0>;
 			label = "LCD0";
 		};
 
-		pd_tv: tv-power-domain@10023c20 {
+		pd_tv: power-domain@10023c20 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C20 0x20>;
 			#power-domain-cells = <0>;
@@ -140,21 +140,21 @@
 			label = "TV";
 		};
 
-		pd_cam: cam-power-domain@10023c00 {
+		pd_cam: power-domain@10023c00 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C00 0x20>;
 			#power-domain-cells = <0>;
 			label = "CAM";
 		};
 
-		pd_gps: gps-power-domain@10023ce0 {
+		pd_gps: power-domain@10023ce0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023CE0 0x20>;
 			#power-domain-cells = <0>;
 			label = "GPS";
 		};
 
-		pd_gps_alive: gps-alive-power-domain@10023d00 {
+		pd_gps_alive: power-domain@10023d00 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023D00 0x20>;
 			#power-domain-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index f220716239db..ff9a3fb21a85 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -90,7 +90,7 @@
 			};
 		};
 
-		pd_lcd1: lcd1-power-domain@10023ca0 {
+		pd_lcd1: power-domain@10023ca0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023CA0 0x20>;
 			#power-domain-cells = <0>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index d20db2dfe8e2..1c40bd56ce00 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -206,7 +206,7 @@
 			};
 		};
 
-		pd_isp: isp-power-domain@10023ca0 {
+		pd_isp: power-domain@10023ca0 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023CA0 0x20>;
 			#power-domain-cells = <0>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
