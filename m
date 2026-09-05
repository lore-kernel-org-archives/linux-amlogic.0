Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB8BC79F94
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=im4PMVvw4UB5ZlzXs7N+SyXvdCm3LsayBeFBXMPYsl4=; b=PgCHbjJ8DNiiaD
	93CSV/fQpAlBcCKUN47PAVlXthXEN8D5v9ozpHqa0DW6o6Tq6thg0xiLXZLqRVCyscPx829y5pZJP
	kggiUwE1pm/PBr31EW25xBucehwreDlBKnnyARnlkUsrAe+m+XjcQiDYtC6KnMW4ArbFVSGpCRYEe
	+HRZM+XIF+K7rP4VW4nhw4Lth8aEsnyL5/V4HVIPvfEfKIu9M5aSNmCUBmy472yHtZNliB3f/sAtq
	G4ZHx1g5CAM5kcuqWkKez5QoOVjvNfpOhrsjjd0seIvBAEDMmTXq74NrtA6xU79pdpYvi1XD051pa
	OgqT0RwD1VKzam/ZojRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNp-00000004Cnd-0oMh;
	Sat, 05 Sep 2026 15:32:45 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNk-00000004Cir-346V
	for linux-amlogic@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:41 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e4998d28so1511964f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 05 Sep 2026 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622359; x=1789227159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9Z1qKT7EogtF26L5TwSpOWlLsafa9aGvAtJ1Qh1QBg=;
        b=DP/f5XvM7s21b0p+w0XgcX5mr6sTHycEVQ4ZXZAKVy8VmDgLQ6Qs1tjPqV1bywmdDt
         GcUNlXaksXOT25CsY2OKnUj2f2v/Pr6S2Brr85RjcBfVV1DPQIQ1/X6rjJj5bOcHsu7z
         HNgwiczDADwMbvf7iAbmzxRFWWIzjRCuveGcoi1ub3lZbNKC5yGEcR4HCDeX84J4y9gc
         DyzvfqPEW2/Dtt2K4AZsbuppcq7mulwnBc2h7pWRTNJKEWM7e1/QGzui2/+TaBCnjCyB
         y+F5OMP1XeQsvZiTP28MldkYEzyBDkLFGkKk9DKEQS7Y+Nbg6w4m8UnhiuFtasfPjzEP
         1uqw==
X-Forwarded-Encrypted: i=1; AKwUvByA6sF6ktkyfSdAnbxwJe7CcrgMjcpFpK5LXpbcqDFrNaDysXuxRXd+RGAVs7G+P0paDmlq6SVfoiGFTfB7@lists.infradead.org
X-Gm-Message-State: AFuF++ldJ7Py94s8uEFkUBEgmCetuKhpV7r2/uSFRFyD6GEOS8DJ2Wez
	4rw4Ui53go6PzrBfU/fwN4M61UX1JAitVVzyB1grJDFp0e5E5KcfKgQb
X-Gm-Gg: AYBFou2dFI27alNudTPKzeanaI+Px4SSZtWYu4oyyWdiYi0k6nyA9J23riQ8GJTWDBx
	kIvzwqhkasAXb9hfk+fSoEglOIFF3T3L+iU7/IXE/EzRp1//zD4wYHlOqP6dhZgESXaB54ZiO1Z
	+RCZdXHKcKoSb7ATvqiwwlo78mwZda/vlsNKv21pCW1GhLxVap4Tn+gSALdjz1u0qHIzaXgC4vN
	8topPPBprMEn7W7hyEED2k41WvnLBfmGGBh4Nln1Mg91EJ8mLFmoMCqkblMNQGSVyotUzsM30BK
	yuZpkNzBgYUmro5kcfZcWdVbYPn6XDNDjFofV3LiJnyEVLAp7dDlAL2cRc0dI80DlbePxVrVhxr
	yR07eLO8Vt8drrLrbDWtaV9EQQ/i/xIGB4Q6G7kfYdKMHr+pm+PbxWKfsWv3pkrJrezS9m4ella
	p1hOf9yeHF38uun/AjGKFsrL52ChyO2TA8N3K3mv9/tgND83Cw6EPkifIg7zdMA7uU3PsiVmSiv
	QpI/N2V07FvyJ/+AXzs2279Vg==
X-Received: by 2002:a05:600c:a0a:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49cf820ccdcmr130205405e9.7.1788622358693;
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Sat,  5 Sep 2026 16:32:33 +0100
Message-ID: <20260905153234.133217-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083240_798364_F42AB368 
X-CRM114-Status: UNSURE (   9.70  )
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

The SD/eMMC controllers reach the DRAM through a pipeline stage that
the hardware design inserts in the bus path to the NIC_MATRIX fabric,
clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
controller that starts a DMA transfer can never complete it.

Reference the clock from the three MMC controller nodes so the driver
keeps it running, instead of relying on the clock being marked critical
in the clock controller.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..dbb4a95652c6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -730,8 +730,9 @@ sd_emmc_a: mmc@88000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -744,8 +745,9 @@ sd_emmc_b: mmc@8a000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -758,8 +760,9 @@ sd_emmc_c: mmc@8c000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
