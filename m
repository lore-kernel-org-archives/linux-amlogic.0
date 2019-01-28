Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80436C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5508521741
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glDjp4+s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a177mkWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5508521741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rSDQ6JIStKfAtdeCw/JbXx3UFxnQBeXUILXimB6+v4=; b=glDjp4+ss/lqd5
	Bo10Skve2EJtU61vMFRSD4ZB7hmvjn+uqL4yfSnOVphJyh9qaCG5616EWeiuNNUaGJNzRKwOZCTRu
	wro5Ww95RNQ51BdFHL5zLDNSJC+XFNrFwr+aMUYu88Jjqouz/5b+c84f0WmUWW0UjO5aXBLqTkq62
	ASuSJVeINoDMFo06tooLchhSkjSVUanqrJWNvDiT+ARtRebmFIL8+LcxrFv8uvfH/iEfoJ++P2Fg8
	tisy9YGUm1x9RFdd5poyeg+M+2wli9qEeSfxLYuJ0+1jIPAYeBgpZ3bV+UGVkBEx+hLmjrmau6dZr
	ea+dKJVl8JCOqrOQ9CLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9B8-00032d-Hg; Mon, 28 Jan 2019 15:50:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9B5-00031v-BZ
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 15:50:28 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D9B52147A;
 Mon, 28 Jan 2019 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548690627;
 bh=o9/ziCyajoX7ITCfqjPz0uizEnrUXo5Ezi+gMnLsG4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a177mkWrn1FgaUAkCsNIAuAkARA4TuO5R1ZIEhdbn0JPXZkdAsHNHvIYihbjBOxmz
 fzVL0mNC5tOEtHtMRe3J29sECFiyFlUpkAoija3EKyjZ9pAhxcFtAHtbm62zYzYnLB
 OcOL8nhl0G1XhSy49MCXBABH9hb67xcqqsgYYFsU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 145/304] arm64: dts: meson: Fix IRQ trigger type
 for macirq
Date: Mon, 28 Jan 2019 10:41:02 -0500
Message-Id: <20190128154341.47195-145-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_075027_437495_D152AA54 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Carlo Caione <ccaione@baylibre.com>

[ Upstream commit 8b3e6f8999f8d704fccce225b9455b3fa639d1c9 ]

A long running stress test on a custom board shipping an AXG SoCs and a
Realtek RTL8211F PHY revealed that after a few hours the connection
speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
the 'macirq' (eth0) IRQ would stop being triggered at all and as
consequence the GMAC IRQs never ACKed.

After a painful investigation the problem seemed to be due to a wrong
defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
EDGE_RISING.

The change in the macirq IRQ type also solved another long standing
issue affecting this SoC/PHY where EEE was causing the network
connection to die after stressing it with iperf3 (even though much
sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
well.

Fixes: feb3cbea0946 ("ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage")
Fixes: 6d28d577510f ("ARM64: dts: meson-axg: fix ethernet stability issue")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..b1a42e99cb67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -143,7 +143,7 @@
 			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000
 			       0x0 0xff634540 0x0 0x8>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
 				 <&clkc CLKID_FCLK_DIV2>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index f1e5cdbade5e..58e6bcaac1d8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -462,7 +462,7 @@
 			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 54954b314a45..f8d1cedbe600 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -143,7 +143,6 @@
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 70325b273bd2..ec09bb5792b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -142,7 +142,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
