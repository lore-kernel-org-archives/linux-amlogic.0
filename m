Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDD9C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66DF21924
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 01:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTF3aZvp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItvJyX73"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A66DF21924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtzJ3b9gzi5yJAW9+nQQ+exEGH5yIrr/O3jHpTghdGs=; b=iTF3aZvp9d6dQ5
	gIaLoKDOWSeF7RtgAPstbrB4yMmSxkUCnIKPhcWWSyH07AAum6aAxq0Vwr5mtcr4XBpF8LW2HZ1tu
	deZ48gkNDt52RoiZk+hJk2uC5C4Ii1X0hXlL4Mo9F0mhj9UjIiehqUg/qUt3/63WenVWyCoNA0yOJ
	LRRHokm9AjGRifjUwU6dDNGQzG+pfIf+0GgLMWTgfs/qWFvAkjMvkmLgu35KtTXq4cVvaA5Tcochz
	1dPIgnwXPWokeEU9uocsJaiXqVLF2EsB4a4rdQv/We4EKTpYUWcsC9Ql8IGCV1dYUZlkeDbNhna2a
	UbQrQPWX/awhvHuGDJpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljnL-0001e0-08; Thu, 18 Jun 2020 01:56:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jljI9-0007j8-5Y; Thu, 18 Jun 2020 01:24:35 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 598F720B1F;
 Thu, 18 Jun 2020 01:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443472;
 bh=QbIGw/jiOSfbvEKhAOJ2lypPnKKDpd2gP0REuOEMobQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItvJyX73e8P7j6J2zokd96BdmlM//kJrUKn9P1LegKz6LWQqy4Kktq6Rr1H77CsSO
 U8zpnOtqp0YzIQYAGp9s1h34RjP++SkPGJZyNX1TuTAKMzV8zkoXWsPCpY4POYiP9f
 qKdl5ibkE+vabsbbP744uNx76+J5SvjjtTsyFdio=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 103/172] ARM: dts: meson: Switch existing boards
 with RGMII PHY to "rgmii-id"
Date: Wed, 17 Jun 2020 21:21:09 -0400
Message-Id: <20200618012218.607130-103-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_182433_516364_93E072D0 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 005231128e9e97461e81fa32421957a7664317ca ]

Let the PHY generate the RX and TX delay on the Odroid-C1 and MXIII
Plus.

Previously we did not know that these boards used an RX delay. We
assumed that setting the TX delay on the MAC side It turns out that
these boards also require an RX delay of 2ns (verified on Odroid-C1,
but the u-boot code uses the same setup on both boards). Ethernet only
worked because u-boot added this RX delay on the MAC side.

The 4ns TX delay was also wrong and the result of using an unsupported
RGMII TX clock divider setting. This has been fixed in the driver with
commit bd6f48546b9cb7 ("net: stmmac: dwmac-meson8b: Fix the RGMII TX
delay on Meson8b/8m2 SoCs").

Switch to phy-mode "rgmii-id" to let the PHY side handle all the delays,
(as recommended by the Ethernet maintainers anyways) to correctly
describe the need for a 2ns RX as well as 2ns TX delay on these boards.
This fixes the Ethernet performance on Odroid-C1 where there was a huge
amount of packet loss when transmitting data due to the incorrect TX
delay.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Link: https://lore.kernel.org/r/20200512215148.540322-3-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 3 +--
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 8fdeeffecbdb..368b1dd57aec 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -113,9 +113,8 @@ &ethmac {
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 
-	phy-mode = "rgmii";
 	phy-handle = <&eth_phy>;
-	amlogic,tx-delay-ns = <4>;
+	phy-mode = "rgmii-id";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index 6ac02beb5fa7..feac69264ba3 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -63,9 +63,7 @@ &ethmac {
 	pinctrl-names = "default";
 
 	phy-handle = <&eth_phy0>;
-	phy-mode = "rgmii";
-
-	amlogic,tx-delay-ns = <4>;
+	phy-mode = "rgmii-id";
 
 	snps,reset-gpio = <&gpio GPIOH_4 0>;
 	snps,reset-delays-us = <0 10000 1000000>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
