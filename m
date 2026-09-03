Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FE8C79F82
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVqnIyeF2KXX+koKr2KyzqouZzjRahSxHM+NtZ9yJ0E=; b=eynDWjr7yagCpf
	Vdrdic1fd538RHlhWut4etuQgSJL2kie+fhwv8twA4L4l5LgU0WAwaXFU2EiIuOo6gsdncdxANl9/
	OrqtiAPJTi/ONdzRYdRaJABcd9sjj83LOBUQABMr73KgfGyXUNXEGes64etdbH5RQORLkylaLWn8t
	B+JIb1YCkWf34MOszvGxJWJi8O75rBRfHVhSr+4lwvHlo0aqqJ5U05B9zS70ffIHMN7A1kFr8BM9j
	hMtmKwNtb2wRqJgpamWC19vzc32vvDpyEeMqfmMNax4DooZGqrYrny4bNGN59p4if90/Q2WWkQ/Tx
	RlmDB79nBwmyp3Pv9Hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GPB-00000000k2L-0CUf;
	Thu, 03 Sep 2026 22:59:37 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GP3-00000000jvZ-35va
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 22:59:31 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48584dc164fso374036f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2026 15:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476368; x=1789081168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhGerqxK/QM75//01MhplOsQVgwGpiUbFZaCJT3sfQs=;
        b=gJ0jpD/V5WY18S6Nabq5gRGAwClZmwTCn8X8I+bYl+h5CmBiSpj8OCxwpAjhROpESx
         qiObVQPFsyMC356HryvcdX7iC0ikvu0N/5HyvGM9/d/cjOGoIkxQO3tamKozKOOQFs3C
         QXRwRVMHqhKBkxuHndtaJAfaRG24lEyyYf/CwPO14dn0lBP+swxoKdburtRkrIRRHXni
         BEALkFRZFxTe8Ychud4j4REcJNUfL6rZhF5Zv/Dgs+Tqlack4Ptxpu7NeTbu31B7GiZg
         gGNBUvl/ZQuL80H+PUC0aG4TLKYknDc277XxDFM+wcyGUzKkzpKQyZ1wj1MsVFkTtnWA
         vd/w==
X-Forwarded-Encrypted: i=1; AKwUvBwX3wQF1jf9inwJ6WQykVXvOb3jv3gAS2Y+3/eQc6zQniONnh+Vp8B7KjrFMBgJyAdFa4R0lD+81qyubwq6@lists.infradead.org
X-Gm-Message-State: AFuF++lV1yeZ2GQGCIUxcOAa5m8MlETUF/ZIMz8go/FXBHwF/FfG85os
	ghiBKAedQ6+hEN3TR6qs1kaWy0J/sjSWsAotIQhQh7XMyoM83UagE7F6
X-Gm-Gg: AYBFou1WTzKh8kcCtihtTVU0KfeDeA7NnLB8vvCwWQePcomlqi9+kgzRGHLUvnghA8w
	MUE6bs1jiO/DzohRIZ/wCkdbE9FnSaxHCuwt7q7SAB24IOB6WSO6BX/PrTRY0ifQTLHOVHT559u
	lrG4A7Sb6eh/QHgcItTSp50Wonmby1iJ6qBWbwQOuwvGdYbzHXqRhKEvC5yDSk0W/42dpv6qqeO
	EGCkBwRAGXEVZHrlbxo+oSNz7oy2Mlzwfv54zjaS81FJXnYcqC6HO7xiXVoSHcs+zJd3hNU1XEo
	HuN1rWeZ0w63aZ5FFGIKVybmZZO7iUKg0dmzvSH/XQJ8b+h49yshOdWPiVEux0UVDh4oDn51/cG
	+ERpt6cjxLqxbxZvE9H1hOOTh2nLLcSdP42ZXV6UZ1xQQkIRAA636lQzkMjTaYhyglX3Ygc8bDS
	KjzjOaHy/7jjnBfN8LEsO7p3YRVaGtQ9hHmWzmhrrVfWejPY7L22Im6zjaTHR1AkKNsxO05idKL
	L8TzwDqpcujKLbjq+n6nKWSkA==
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id ffacd0b85a97d-4858a467215mr292343f8f.29.1788476367923;
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Thu,  3 Sep 2026 23:59:20 +0100
Message-ID: <20260903225921.2290441-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_155929_818921_88EE9106 
X-CRM114-Status: GOOD (  10.43  )
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

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 719e111bc3dd..8f3f1c0579a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -762,8 +762,9 @@ sd_emmc_a: mmc@88000 {
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
@@ -776,8 +777,9 @@ sd_emmc_b: mmc@8a000 {
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
@@ -790,8 +792,9 @@ sd_emmc_c: mmc@8c000 {
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
