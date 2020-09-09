Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8D6C43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:05:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063EA20639
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ibCx0p2r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VL9tURqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063EA20639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8C1mLWRO72i+aPXHqg9KBYC2mNZR7M92TQsTvMIsYAw=; b=ibCx0p2rtGxzLw+8FDxCJFVfl
	NU9i2m5HrFQgg+CQRy3DCmYmLx4yqXAFaQbPRroNXdYx15CMejpZ5KuhGgc44OYdFnr3sVw9tBC0h
	NbNVs4NF5OPuqYwvq4hRPRNWbfh2dmuteCEeI4Rfhj0FbJ53IRtCrQzlLzad6ibYwkNfYc4AlbKRh
	p7GyF6RXfgkp7ML7lF0/1SQsQDgWGY1o66XHKFLwVty4GUlKXuW/TnKHfYjm41drPinq/TU59jipv
	EvyTMF0dIj/RLNDxUcNuGl0zTEY423mWWXu53tDjOmIVuKO8Fiwpb/SyPBn/QQg+prDHvatwwrQ1l
	eFTcSrKLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2aZ-00021v-Dv; Wed, 09 Sep 2020 16:04:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2a7-0001rX-CK
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 16:04:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id s12so3541704wrw.11
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 09:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Au2QdkdUnP8EeZ4UbPsH8YnCrRkIO2DW1cWc/fcx3ig=;
 b=VL9tURqRXlKVTpETSDPhsp9OXu+mCAJu68RSoKDCw/rICZKm+wxc5o59uYqrarCU37
 PoUPSO/k3gpZ838V7GjhNq8ebmlovfZZmTBTMfoGOCt8E7mRwy0cGY0kfWsUGJG541Vt
 I6n05WVOApPuahc/rZFaqWo4zyTjOLQ+J4Bpz+eLGvT7BFwrjUxRPsZ28baGDk2qRdAH
 1bPUTLnKshQzjbDin5njqmcRZMbKjpHXsnrPEjmDIBJsc9KwDr2xRFXTEhy6I0W0onOt
 tCq17mX7rlvjF3ICuekc3d7SUyvE9u4I9Gpk91gW/aFVpOtXEoCWaekp2VU7ABXdp/Rh
 OKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Au2QdkdUnP8EeZ4UbPsH8YnCrRkIO2DW1cWc/fcx3ig=;
 b=ZiSF1hgyeHzT9mO1bn086Atml9+Bar54pqTyyKMsmOR7tJg6k9Fxl92W4YKCEcrlkF
 45qOlwvDj3GrL1rAbBayEEEZ+shYAZBycw63/AeUP1iW+1RKrNV2y1zDFFk4DJbfiPx0
 1Rb6+fQT/f/e2C931aX536u30HIfHFoRC9ls2jEFlEi5AFRTHy6/s+/cwwOhUSXyK2cD
 6yJ7cEezmlIdMvYSTHZnD2UB8aDQ3ZSDLeR1TycJwoNyyJCoELRZGuiiIRExplyHYlzD
 F6swq/jn2vRDm3xJmC1Y79KjMcI3tenTN6zGyApmYC2fh5HgGsG3P67hfSRDkEVjtifV
 YkMg==
X-Gm-Message-State: AOAM533F48/nGw/ZviVx0b0XRUBKdR44MeKm6vGLXtMjBM/P5/rwZBGK
 EdXoY5cqILzyUKvajs0CxEamRA==
X-Google-Smtp-Source: ABdhPJx0xnUqFOa8xZ+mrYiFHmMSMi9oSnXj2Z9eCllaqjr3+7vHVkBxxcyI9q6RTZGZeOoeqg06wg==
X-Received: by 2002:a5d:6784:: with SMTP id v4mr4476298wru.215.1599667461695; 
 Wed, 09 Sep 2020 09:04:21 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:04:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/5] arm64: dts: meson-axg: add USB nodes
Date: Wed,  9 Sep 2020 18:04:08 +0200
Message-Id: <20200909160409.8678-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_120423_467455_E0B2E435 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the USB Glue node, with the USB2 & USB3 controllers along the single
USB2 PHY node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 9ae6db16b8e6..0b68a383b60f 100644
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
@@ -1734,6 +1774,17 @@
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
+				status = "okay";
+			};
 		};
 
 		sram: sram@fffc0000 {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
