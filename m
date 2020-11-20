Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414A1C5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:32:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70541238E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pQMkQ8J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eAiZZPHa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70541238E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=89INASGpFkkMo5tzws3HiAC5BYFbHcC0+pxzz07uaGI=; b=1pQMkQ8JMR36lUyh65PU6ZUBi
	yTyXOuTofBvrWiGozwRNh7zGV7e3MNpGN7bOQv/lu5WfAkAfj2Vb8zB1qdDjKRRYYfO2WFMNfhIaA
	EyF1kfbE7pR63vhPpVGLp5BCXBGoNpjd2VT3V/PVwn1LQbFrt1fVOipez2Nu+jxvwOdpsaQKBe+Fo
	RGX8lkUJwxYVSrfWzAdYqRFZuXd/OBUaTpHfdQas2PNvCAzGvijDrdvqv0SAdXp279JqJAmAOO9PG
	8ArebBgp9jYNP4AakEFrf1561MOufRUoe7Y0+yYJjbOEdQ0MKNhCa7Dt/y8QAGwj5+1847/JbZhT8
	8tODfzJYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8Oy-0007iI-Nx; Fri, 20 Nov 2020 15:32:44 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8Op-0007eG-OF
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:32:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id r17so10494891wrw.1
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qECUmJ7i37OI126KT2ZCqYFNHb2XPZlIEHKmEDXRy0k=;
 b=eAiZZPHayWxA496THQg2NO4o3xrHZFbzfQv0s0bsYfyepKbenM+hPIcFj7YUU7udiF
 wztzGdNlShDPVvAHia9mKF3ec9ZWCfyf2Cdyq3jCgnOws0ln5bpjxBVksTWWyXwzR0Kj
 xEwQSFz3GzaS4AWdUO6z5zIotRqdGJnvO7cF8rWUffE6XYxuc0GLTY+ACllpCweNSPKu
 CJAKWcf1MtnuvukpwXPuColV2M0V4pjvSoqEKN3OUpqgRIz0w4jLmunLrZSCQIVKcPwX
 2vH4i6IDY5Vp31fefRrpmO2UlKOFgucp1OtbhyqrA33BOweMAp7uCKIIbdTHfZc+MveY
 ZudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qECUmJ7i37OI126KT2ZCqYFNHb2XPZlIEHKmEDXRy0k=;
 b=PSOsvym+cCQFmmBKAwzRVIYvMy7DyN0pmYunLiDIMoOKMfyg5ebCildU2LW7tMC2IR
 7Yg2LgZLKHFYpWwffMK+bxUwbmihxxhz0bOe0LHbxqjWzy/uLYEO8q0MNbSjBESZUz3Y
 CxuxnJECQa8uRDRgQhxZXM+dDC13R9rwuqq+h45PuT72nqJwhK84+gT9sDlYmTIvbTIo
 PKRUUBqwbHOOOvlVz6YWgE6B5EaV4JMYNUXi50NFCZceqN8I9Xj3zQu591Yn3H6I/heX
 pESwCxFHVvuHnBYNIXg7hoyJNMnAH0Z7oRi8TJWxUqfhZjf3vGptllJvMmOCV1h2Igqz
 neJA==
X-Gm-Message-State: AOAM532vXgmH6B8RJhhUrP9/tMndNkDQWEPvL/kzhpTAJ7XuJONHL9BW
 Fg5gLLnTTpapjJ0IAMNlSoAfSQ==
X-Google-Smtp-Source: ABdhPJyhYc/oVgaBEiYn8vj3ptWCf6cMyzmrnejPst3ogZ35ww5mclSng4q5wzZIM0qZL2cPPNB/Yw==
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr16796731wrx.412.1605886354671; 
 Fri, 20 Nov 2020 07:32:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id i16sm5398180wru.92.2020.11.20.07.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:32:33 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/4] arm64: dts: meson-axg: add USB nodes
Date: Fri, 20 Nov 2020 16:32:26 +0100
Message-Id: <20201120153229.3920123-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120153229.3920123-1-narmstrong@baylibre.com>
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103235_939666_0B735A9F 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the USB Glue node, with the USB2 & USB3 controllers along the single
USB2 PHY node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index d811708f8f67..0c4f0cf076ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -172,6 +172,46 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		usb: usb@ffe09080 {
+			compatible = "amlogic,meson-axg-usb-ctrl";
+			reg = <0x0 0xffe09080 0x0 0x20>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1_DDR_BRIDGE>;
+			clock-names = "usb_ctrl", "ddr";
+			resets = <&reset RESET_USB_OTG>;
+
+			dr_mode = "otg";
+
+			phys = <&usb2_phy1>;
+			phy-names = "usb2-phy1";
+
+			dwc2: usb@ff400000 {
+				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+				reg = <0x0 0xff400000 0x0 0x40000>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_USB1>;
+				clock-names = "otg";
+				phys = <&usb2_phy1>;
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@ff500000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff500000 0x0 0x100000>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				maximum-speed = "high-speed";
+				snps,dis_u2_susphy_quirk;
+			};
+		};
+
 		ethmac: ethernet@ff3f0000 {
 			compatible = "amlogic,meson-axg-dwmac",
 				     "snps,dwmac-3.70a",
@@ -1795,6 +1835,16 @@ sd_emmc_c: mmc@7000 {
 				clock-names = "core", "clkin0", "clkin1";
 				resets = <&reset RESET_SD_EMMC_C>;
 			};
+
+			usb2_phy1: phy@9020 {
+				compatible = "amlogic,meson-gxl-usb2-phy";
+				#phy-cells = <0>;
+				reg = <0x0 0x9020 0x0 0x20>;
+				clocks = <&clkc CLKID_USB>;
+				clock-names = "phy";
+				resets = <&reset RESET_USB_OTG>;
+				reset-names = "phy";
+			};
 		};
 
 		sram: sram@fffc0000 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
