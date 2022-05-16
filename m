Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A1C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 May 2022 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ps4Upu7vk2JFYgK5iX/fQgxd4YlOttQvITJQfsSQD3U=; b=BaEtPL6H6bMKOK
	ofGauGMB4zNmVoHjFFgBgYc+ZWSRph6zeBszBfv3nwMG7FEOqoDRmET0oX1VFBqCDxUyuDzqUytaC
	DmBSYRlGSGOLaO9HSp8SfWXAABIVfexbC4aMwx0olafoffgyPAz6Gd69hOc5Xad8pPnVEdo/heAQ8
	Rp/8sDDSNVg04nNcih4OCcJLENI8rdPkPxfEbKCFX0M79ctlaRAArRv68ToAd7Fkqn5cSuy+1E9/3
	bxMnSiWMVXEQoXn2MIC9YPdhqKCswooIXMc+TVGHycbv+lf9MqPc1823+kg4ggZ2rs30TWFHKgcxs
	g8xxrErh5wfq3bGLuQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqZ0a-007Kx9-JC; Mon, 16 May 2022 11:35:28 +0000
Received: from mail.manjaro.org ([116.203.91.91])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqZ0X-007Kuo-8m; Mon, 16 May 2022 11:35:27 +0000
From: Furkan <f.kardame@manjaro.org>
To: christianshewitt@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 strit@manjaro.org, Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH 1/1] arm64: dts: meson: add gpio-fan control to GS-King-X
Date: Mon, 16 May 2022 14:34:09 +0300
Message-Id: <20220516113408.32830-1-f.kardame@manjaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_043525_500931_DB5196EC 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

From: Furkan Kardame <f.kardame@manjaro.org>

GS-King-X has a single speed GPIO fan which is always-on by default. If
we add controls for the fan and a trip point, the fan stays off most of
the time, reducing background noise from the unit.

Signed-off-by: Furkan Kardame <f.kardame@manjaro.org>
---
 .../boot/dts/amlogic/meson-g12b-gsking-x.dts  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
index 6c7bfacba..243410913 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -19,6 +19,15 @@ aliases {
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
 	};
+	
+	gpio_fan: gpio-fan {
+		compatible = "gpio-fan";
+		gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+		/* Using Dummy Speed */
+		gpio-fan,speed-map = <0 0
+		                      1 1>;
+		#cooling-cells = <2>;
+		};
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
@@ -131,3 +140,20 @@ &tdmout_a {
 &tohdmitx {
 	status = "okay";
 };
+
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu_active>;
+			cooling-device = <&gpio_fan 1 THERMAL_NO_LIMIT>;
+		};
+	};
+};
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
