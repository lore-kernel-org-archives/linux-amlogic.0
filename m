Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826EFC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF422065C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGxyF/HU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lW/beOL3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF422065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RoZZ5BNyKAqlB5qjwKUcym/is9OxP9fgcgbbDlrFIEA=; b=kGxyF/HUw6MhWTQ0dSXj/99nb
	aXrPIjTmcjLl27mcHUdEb5UZSczYBOlpzoudjqnUCIM8mdLJTxG7QWiP2Wy5Svxh5H4XU8MDmsveF
	V4V+BKYob5BZeYeHlwMlK9ScWYZ3C4iBkMA81b5tWVzC/Bi+QYV4eS/E9juciWHhI1eB2R0x6HqM3
	A0Cag8MKeHl7CXldCZANTj3766iJt4+Q9C/R/mACmOJqCTs/YsVe3f09HP0eyu5DWMqwxOtFcEvMT
	EU9ETo7w9HUckG2gCjAUAqbgamLDNNgZ4wNENL7TraoceyCgx1wEnwbDrSJRSyK4fBC9hnxkn8OQ3
	82DAyITzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInuK-0000YH-Js; Thu, 17 Sep 2020 07:00:40 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIntl-0000Lm-F6
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 07:00:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id z1so799700wrt.3
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 00:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+DywmJboSNUNdQ2uZXss10ZspnBgEtSObT6BaOsYuU=;
 b=lW/beOL3XA50ods5obfOlL1dVy/tZBu/kxr17RwS+DsUR2pKeIq9zso0GGCWkx9NQ2
 fSI2bLvOyM/STfJjZub70ytbqqVRlUveC73rzwBk9bP7DWkVGH1C6utZmbmbgowqVWHB
 jrnAn5Hvj5TetikiiBPLMvL3WJEs9BijPJveO5LjfTFqYFagIzYRipupJFYzWPjEO8EI
 djSpZc3OrzRY3KTHLwYhgvO7M6DsqzMh/hIMuFAH1R4jjWomJ9qF3kaQozA+DY8vQcQ5
 r4vfqZk19knZ/sPSD525pqW9tzMhw+5V0v0VhIL37p0NIGCV+NyNP3R87hrR2o7R5Cdk
 TXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+DywmJboSNUNdQ2uZXss10ZspnBgEtSObT6BaOsYuU=;
 b=cQGLPT5Mh68u3eFGxsjy9eFAMXzWyHMj86+hH4ozD0OmJCTChi7Jd4lDUt9NzEhnuz
 RitsVeYa80eqjGNlVXh+F9BfBt4Wciz9ahjDTrXA/dydD3xnO+aizPqDEn4VwzV17a1Z
 KFiaCFs6Q5jQOGQzsX/UnqFtNdkZg4xaxwyoyG8vKRJ9aSPfWoA4RMxH08apxOsWlsFN
 QOZdD2WY8g3NM7OU6JUfGhM/SZUANdkbs5KZfwrM7dfQyA+2I8jVqizDotnLFFp0Ko9J
 BX8Kp+1gWKU+ZpbakJKhkYSuzLUlr6gtC3lHHZb4U7WshY1v3prBw2nvG4baSkBYKqbB
 MjRQ==
X-Gm-Message-State: AOAM53327j2Nvu6gCEV2TipGMHLq98JD6hoReMl8WFU3H/PP1i9FfJCo
 HOBWJX0FakSg0I3PEZPKUPdkiA==
X-Google-Smtp-Source: ABdhPJwECOk8wlkQy6PMVw8pFFC5HSF/3EfVuOGPHmRJS9Hqhvn+vAyLeHVIlckru2yuDvcc8cBcsw==
X-Received: by 2002:a5d:414b:: with SMTP id c11mr29380507wrq.181.1600326004238; 
 Thu, 17 Sep 2020 00:00:04 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.17.00.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 00:00:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 4/5] arm64: dts: meson-axg: add USB nodes
Date: Thu, 17 Sep 2020 08:59:48 +0200
Message-Id: <20200917065949.3476-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_030006_511141_9E990272 
X-CRM114-Status: GOOD (  10.83  )
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
index 9ae6db16b8e6..d047779a3dc3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -171,6 +171,46 @@
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
@@ -1734,6 +1774,16 @@
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
