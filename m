Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A40C63777
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 00:26:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5DD20809
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 00:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o8jmnDEp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="boTNXx86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5DD20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QafiIWjFQay5Uon5mjZLYbqLxXlTEUkMHLH/IpFYkuE=; b=o8jmnDEpnryu5oi8tllNQmzAo7
	+Ul61OxVtpYHmh++ZXEnLogfmTO+5zCHYafck7/jJw0JHtk5o+X+SwMMqL8MQLBfRrQr/1OQBrVtm
	/Gs9hKYjDjcJ6JDzBmfr6rAqrL5Y5IftMn7YFMwu3l0O2y9wFMUMX7owTlE23EDr+hD52LJD4/brf
	JQ5xWU69g8qU51bOjvABIFY1dWdh2C7K/4apzs3BREXY6yxM8wq1CClePCaGHj+jqiYG4YIj3/GIU
	VYoEX4jHKcP4t3QCMPpzdPjlYxIXGZwtyQJm0O+CtVn/RNc3LqWSBSnxruVzmODIfh5RDG568m+HQ
	Qz5K23Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjtUT-0006YB-B3; Tue, 01 Dec 2020 00:25:57 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjtUQ-0006Xm-Q5; Tue, 01 Dec 2020 00:25:55 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5::979])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 475505C072A;
 Tue,  1 Dec 2020 01:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1606782351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=KS8mEizFb71H5F58oXI23doUtIDgwBwc4nDVzFsr1GQ=;
 b=boTNXx86+d6LfiIEM/Jwsm9QLSOWO013Ncwju9egxzB+BRaSWkZqTjLi9Fh1sNb2ETgBsT
 H0oBiRa5+NeSOcjD2d9rx7S0V1ZgiJdinuou9bRoYsRjFog6biP6UO6f19Jd+QqzKKffwD
 JCKSWImKeQQyNK6G5k8RTxPDLLYNwY8=
From: Stefan Agner <stefan@agner.ch>
To: robh+dt@kernel.org,
	khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson: fix PHY deassert timing requirements
Date: Tue,  1 Dec 2020 01:25:50 +0100
Message-Id: <e4df74aed2a7cff09366e72c87d408f41317907f.1606782187.git.stefan@agner.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_192555_194095_141E45E7 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According to the datasheet (Rev. 1.4, page 30) the RTL8211F requires
at least 50ms "for internal circuits settling time" before accessing
the PHY registers. This fixes an issue where the Ethernet link doesn't
come up when using ip link set down/up:
  [   29.360965] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
  [   34.569012] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
  [   34.676732] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
  [   34.678874] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
  [   34.687850] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed

Fixes: 658e4129bb81 ("arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line")
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 6982632ae646..a5652caacb27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -413,7 +413,7 @@ external_phy: ethernet-phy@0 {
 		max-speed = <1000>;
 
 		reset-assert-us = <10000>;
-		reset-deassert-us = <30000>;
+		reset-deassert-us = <50000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 
 		interrupt-parent = <&gpio_intc>;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
