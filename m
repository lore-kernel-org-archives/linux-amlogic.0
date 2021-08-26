Return-Path: <SRS0=cVb0=NR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128B0C4320E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Aug 2021 03:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96AD9610C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Aug 2021 03:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96AD9610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ABHCcls+bGTwhlHkQVmSSNC/vCbYdaMDZ6t/NZZvShM=; b=kB5leQCRJZsmUF
	AIG58eaa0E78X5apVHORX1gYgrv8M/wuXOdxM8UjmIrttAlS7JIZ1/BTICyERduirIROv/CpGrIb3
	mPmb45eNsZpNUHaHpx2EWuEKQWAjjBRW5e0A4c7qybd3Lyc+qYIPj6sW5BpXTVmPNo+RVSKaiuZJ0
	gERQE9WnqGaMvDtTLt6+d8+9I0L8C1yfymRzqUFAsRzJ1aWpCMlwTkoQLWJzyiqZqBX96vk5w50tS
	fNmSGnWQ1OYa/bejbtBzKJFyFciPhQ7q+aRechl1SniXvpWO315bav9RoLHaSo/+1BPlLnHMLorTd
	CVqGs4jmFxA8B4IL5qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ65e-0094IL-RI; Thu, 26 Aug 2021 03:30:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ65Q-0094A7-VX; Thu, 26 Aug 2021 03:29:54 +0000
Received: by mail-pg1-x533.google.com with SMTP id e7so1905007pgk.2;
 Wed, 25 Aug 2021 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=XtPfIMAUlTL7iDQoQvHB8+nZAxqrvLZEj9yQzJVKyuI=;
 b=aMkAaEnCl/7RVWlXQgdSIUOVDeucvFNXh1W7GIwr6Wi77qHBV6jDkYsZdYmjj7LXjx
 HpoC6ClJubwRPvqM3UD+L/f9oRzdEXO6jDssMoggWKHrpmiUGbUmibOEFfeB9EYBUlat
 Xnz7FOlMNL1BBuAAqU17Iz9NucgWLCxJYMgBzFs4PQ/SL2TG2ziAjtjmtfaSRlfh3Svm
 Oezz/Y0HRkgv93yHHEH7cM8PJzz7Gc1J8jKWEcrtzZM38X6Ry+tDDa7goZ6wgElGWiMz
 OehUtmeu0D3D7SBvuulfmHUL9Ulw8J6+jXPj9k8c4xvol1VHX60r04w6SSeL6rTQhea9
 bKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=XtPfIMAUlTL7iDQoQvHB8+nZAxqrvLZEj9yQzJVKyuI=;
 b=SMBZGR1/Ss105ZlQfV6WgIN3hPAWlNdIwfywXJuQ7i1KoUZbfsXlfvl67mbtyJy/Cd
 Q2urGxW45ojHIyEoqSHNxYmpbRiSC7uqxTLTTeRoV23NEq8p726LM44zcfjbaRqW9nwI
 stvEP05sifrXV91gkJi2Tkx+Yj6X/xOJm1KrWeHCmaAHunEPFQlk9GQTJmMpiB1UyCr9
 UoQQLF6Qf30UT3s+pJuIbEVmgeZf3loXK3kkHQ/bGKQX/jNR4BmO5FIVeX6igFZFOLRu
 s+OX8P5KKksqEgGy7fy/AJajGARhbgtc/nDJ7OPR3G2I/4GDRJfohxi2S0fOYgLXXDg3
 pZ1Q==
X-Gm-Message-State: AOAM530zdiVYtNmTjDnSvlO0wgLeWRp4g4NCBguyCSbNghc05IM1En23
 Rqm+sRct0NhdtEuCDQfwubc=
X-Google-Smtp-Source: ABdhPJy7D7ZZZbObXJ/oELYx4GyEUqtSa5Gauz5XIuF7o64Gh6T5tJU3oIb9j0reAx70EYFXDo90KA==
X-Received: by 2002:a62:32c7:0:b029:3cd:fba0:3218 with SMTP id
 y190-20020a6232c70000b02903cdfba03218mr1668755pfy.52.1629948590503; 
 Wed, 25 Aug 2021 20:29:50 -0700 (PDT)
Received: from anyang-linuxfactory-or-kr ([106.250.177.234])
 by smtp.gmail.com with ESMTPSA id p18sm1441194pgk.28.2021.08.25.20.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 20:29:49 -0700 (PDT)
Date: Thu, 26 Aug 2021 12:28:32 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: sm1: add Ethernet PHY reset line for
 ODROID-C4/HC4
Message-ID: <YScKYFWlYymgGw3l@anyang-linuxfactory-or-kr>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_202953_061689_C98924A9 
X-CRM114-Status: GOOD (  12.55  )
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

This patch is to fix an issue that the ethernet link doesn't come up
when using ip link set down/up:
   [   11.428114] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
   [   14.428595] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
   [   14.428610] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
   [   14.428974] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
   [   14.711185] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed

This fix has been referred two commits applied for ODROID-N2 (G12B).
    commit 658e4129bb81 ("arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line")
    commit 1c7412530d5d0 ("arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requirements")

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index d14716b3d0f1..1230beba04aa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -256,6 +256,10 @@ external_phy: ethernet-phy@0 {
 		reg = <0>;
 		max-speed = <1000>;
 
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
 		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
