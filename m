Return-Path: <SRS0=w9Vw=XD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0206C4332F
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2019 13:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01C82082C
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2019 13:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqxbWOiH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YIGG+kJs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01C82082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bQgnv2zSwl81JhjUwq6VvFS2sQ37FEaFEMIHjEcpCiI=; b=kqxbWOiHhJk+2BpwRX5GtEHrw7
	fm8yZ5JxbcW/PmRuYVLqA3JBxCGVs43UiB1odbabBx0vuQPdviz3KasFNloi5wXz7Tv1dtnhltGac
	+0ywc5wjntEGUcQ35onlWySaT47j8oCatbqWJhwfAoZTrpVwc/B99fe5JooHnpFIGABRi7Wkmtfgd
	rDLcCRSDOLY/eFh2ypEcLFmh+dh8NCWIefLOCGnRknO9LiCU5sMg3jua2vvzh6Sa7L3EmD9N1772e
	rKVh0u/07C9rFIF4eQ6TR2TUDQ2V3mIJvVGtLSA3yo3AVOq8QwQc3ZOLdgcpfhIbuQrVeRnmAiS+k
	n5mrF4zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6xU5-0006No-AI; Sun, 08 Sep 2019 13:44:05 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6xTC-0004rR-Qv
 for linux-amlogic@lists.infradead.org; Sun, 08 Sep 2019 13:43:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id k2so10911652wmj.4
 for <linux-amlogic@lists.infradead.org>; Sun, 08 Sep 2019 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QWP79fY1JKJ4Q8J2pghEAh/SdWHmEms4TAuDdfokLg8=;
 b=YIGG+kJsJiFhCq3dqmypto366EH9ax3zhx8JVdur/EKxb+SmXYRhG28v5Z63pHp8zN
 OCBmiFSYfe7EbgzmvvQaWF4jBUbNCHjb9U0uhY77dUiOkRvq2CMyuS33EiGQ1utr7OIc
 FSZ93GRxpYLtF1fMwZa+LFkGEvZhyMQY8xVOcASm877jwvppWgo75O/hfqkKQO9lGgMA
 YU3yblmv3OwAATFQ7hetuxDEb7YPDEjN6U0gFc2BopqhFn6UIR0AkAOHbFOuRMJSyIwx
 OV9fpvur/5+VTfiqO6r29dWMVSjemOfYtPgj6bolH2f9y307wxErNay27xD8B2Elh0Vp
 qhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QWP79fY1JKJ4Q8J2pghEAh/SdWHmEms4TAuDdfokLg8=;
 b=Zc89Ebuvv3gkShkKKEA95H/BmbsC25lc0LzYVwJ3lfFyWNtjKJxwNwQqXdF06/0TTF
 fTNjPToG9Onpwux8yrCW62WyR11vKXHB+2ru8XY6lr5JZzOl9jB8GwF/mY18T0/nTOaH
 Zu6gemcKm+6i3Z9WmNPk/G+nFHVPiZXuheq/QcBp0vzq7eK0YJVkuq8VamY5RLOtOSCq
 cBUBIZn5+Yd65cSFYe4EfLbDY/xD6luA0P+l/YCWz2VHJHVcDxDS8JlV9dyGNUfo8N0V
 A+YFl2pbrJ99bFzGo8ePGKqMjFDgzNxmCvtKGkyT2sJ/WKNkjLSG/t3fNUB2S6GkRTML
 s+Ew==
X-Gm-Message-State: APjAAAXEmm5jQP22iX77aqkS2jO1rz3oM1YIwROXGmYhGaKSutyDGjUf
 D7uG/UJgiyd5K8npjRd20KXQ+//ASgM=
X-Google-Smtp-Source: APXvYqwdzoUJ+xfSz6GH/LJMRb9Td9tMK7kXH9Jy2I+h19yDQS7ztmE9hdHBq8Oox4JtUbGCGnVL4w==
X-Received: by 2002:a1c:ca02:: with SMTP id a2mr16087461wmg.127.1567950189470; 
 Sun, 08 Sep 2019 06:43:09 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id t203sm14313902wmf.42.2019.09.08.06.43.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 08 Sep 2019 06:43:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, bhelgaas@google.com, lorenzo.pieralisi@arm.com,
 yue.wang@Amlogic.com, kishon@ti.com
Subject: [PATCH 5/6] arm64: dts: meson-g12a: Add PCIe node
Date: Sun,  8 Sep 2019 13:42:57 +0000
Message-Id: <1567950178-4466-6-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190908_064310_871505_C16C585F 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org,
 linux-kernel@vger.kernel.org, repk@triplefau.lt, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the Amlogic G12A PCI Express controller node, also
using the USB3+PCIe Combo PHY.

The PHY mode selection is static, thus the USB3+PCIe Combo PHY
phandle would need to be removed from the USB control node if the
shared differentil lines are used for PCIe instead of USB3.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 852cf9cf121b..7330dc37b7a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -95,6 +95,39 @@
 		#size-cells = <2>;
 		ranges;
 
+		pcie: pcie@fc000000 {
+			compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
+			reg = <0x0 0xfc000000 0x0 0x400000
+			       0x0 0xff648000 0x0 0x2000
+			       0x0 0xfc400000 0x0 0x200000>;
+			reg-names = "elbi", "cfg", "config";
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x0 0xff>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
+				  0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
+
+			clocks = <&clkc CLKID_PCIE_PHY
+				  &clkc CLKID_PCIE_COMB
+				  &clkc CLKID_PCIE_PLL>;
+			clock-names = "general",
+				      "pclk",
+				      "port";
+			resets = <&reset RESET_PCIE_CTRL_A>,
+				 <&reset RESET_PCIE_APB>;
+			reset-names = "port",
+				      "apb";
+			num-lanes = <1>;
+			phys = <&usb3_pcie_phy PHY_TYPE_PCIE>;
+			phy-names = "pcie";
+			status = "disabled";
+		};
+
 		ethmac: ethernet@ff3f0000 {
 			compatible = "amlogic,meson-axg-dwmac",
 				     "snps,dwmac-3.70a",
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
