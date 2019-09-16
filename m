Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13529C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:53:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58A6214AF
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGvZDaYF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="biQL4vPt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C58A6214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GN+CkqqC9Z4fuAPPB0v9TQ/CsnLBDIMtSA6xGQvldjs=; b=HGvZDaYFHUvQ98
	1tWdvkSc3lwd/jKQAnqe0Xo3MDUx+dh28Ph7lMfg/n6NsGICbIpOzg0gYRsniFUNmEZQVBA5eEKGT
	vgy6y6OqJR1u8Vm/WySbX8OpcjIExz8cP1hmicahK8xShLNbTjN3FeC6UCluMZ5K5AFrdN5LlDy0v
	iyPzQ2RXnB0TZMVzmQoZZOsnM2+ajB0TxDv1liAU85SxqNte5xgmWZc5ZCLOxyOWtmHV6abek7rny
	13DHx5gcYvSWZEhNkHZkyOAg33Qkqi0FisYXaDnRo4fNfoVUZDHDxnLZEMMtO7PCSMnOHEWzCbvTH
	I+IdQ5Jfh7G8VUpHetoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qVU-0004pV-Vp; Mon, 16 Sep 2019 12:53:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qSd-0002qA-ES
 for linux-amlogic@lists.infradead.org; Mon, 16 Sep 2019 12:50:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id b9so5162974wrs.0
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2019 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+4tUhg/FYSoCjPdeGmyIF23gJp8e0cOaQveyAhmml58=;
 b=biQL4vPtAO/eRyWG2pyM/1VRI6KGVgdG5RnuFyTEFhuLwWJ0kLQemGQgyafw5Yb0gJ
 aeb3+1ZecPorUyn8KoLfh4DVYmhqryNYpNytuFGtbGL5IkmAVY87xaB8jOFJRRRPOtjc
 1d5beDepFLUIB8is3UjvUbQLHyfvb5KztvPpqTVVRw2GOaOugDnrSYHhYMBkJoSnTQBl
 4pjLcbCERC5yomdTYxsqApKyrp7RAZjbWTigH2zqTGkgV+VBlqZZhDo2BJRyK8tdtqTr
 D6nW5MmlWgGz59KjXp9S80X7hDeXR/LVifjFQ1vGMdUTiFgEjCF0fGNl7Tt3STp8oVDV
 d8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4tUhg/FYSoCjPdeGmyIF23gJp8e0cOaQveyAhmml58=;
 b=SuwGFbXb8oOeeccfKn3u0cdB3jq8uQ+07kqSq3T0AtEmEz2Um+Ji0rtur4GnuCNll4
 uRPMXpHbl6XDO4rMBIYxySRe2CqSGDeYMRsoMBYuwpPQekErsj6wNeOs5niP9BD/T8D4
 iAzgws3WbeVfaaQJN2iSfnCWiL5vaz1DU+9wkIJNPInoXLWiYo72aC7coin/pD6nb8s7
 2VGxl6vEAtPuYWxb5UFYk5GJ8YUV4/rA5TlPtD0IggJ/cWSfNjn3T5pn8IvFkuWR9Vzw
 CKxFbDi78u47ultYPAvb1ij9dl8Z0WgpwS2hNFsh+bvx2LcHyaHAwjS7rjteUQ49LUjT
 tg1A==
X-Gm-Message-State: APjAAAVzlozZWQnf/G2kyYuQuv8eyw7arxUba0s+jEvqe2AQvisl7vCZ
 SpZTtV0PvOwf9zGdYu5ALM0k1g==
X-Google-Smtp-Source: APXvYqy1hNq5WUJY3HgMK8Ka9tQQvMhhGJR9MlmF5V00NBgLlsE0SBGYjU7dlURi2Bms3zgjzUlcIQ==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr20030170wrm.26.1568638230051; 
 Mon, 16 Sep 2019 05:50:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o12sm15109960wrm.23.2019.09.16.05.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 05:50:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lorenzo.pieralisi@arm.com, kishon@ti.com,
 bhelgaas@google.com, andrew.murray@arm.com
Subject: [PATCH v2 5/6] arm64: dts: meson-g12a: Add PCIe node
Date: Mon, 16 Sep 2019 14:50:21 +0200
Message-Id: <20190916125022.10754-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_055031_487710_E1DCED6D 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: gouwa@khadas.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-pci@vger.kernel.org, nick@khadas.com, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, repk@triplefau.lt, maz@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the Amlogic G12A PCI Express controller node, also
using the USB3+PCIe Combo PHY.

The PHY mode selection is static, thus the USB3+PCIe Combo PHY
phandle would need to be removed from the USB control node if the
shared differential lines are used for PCIe instead of USB3.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 33 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  4 +++
 2 files changed, 37 insertions(+)

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
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 91492819d0d8..ee9ea3c69433 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -135,6 +135,10 @@
 	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
 };
 
+&pcie {
+	power-domains = <&pwrc PWRC_SM1_PCIE_ID>;
+};
+
 &pwrc {
 	compatible = "amlogic,meson-sm1-pwrc";
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
