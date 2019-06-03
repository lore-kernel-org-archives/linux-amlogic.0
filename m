Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DC0C04AB5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:04:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21592806C
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGrJgGqB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LaIe2IKR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21592806C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arBoFgHz7P5znZF+X2E15rnpEedFVSBzqKl92SUfxkE=; b=HGrJgGqBjZg25O
	lGpjOyYH1Bc8bmMindQUAuIQu4IoFfgbcA/08MqFjAyj5QI3Oa6fBBGG3qWmwDYzHG2BS8m3z8uFX
	QZqlQV959zgeLsszrxsDFu8JFvKfGFiaiLoKsW94PS6z0ZkoMSUTssyEfDUJnJUOyaB1Q39Th8/lJ
	6LRmfvzMQ8CildJfN0H45ai+jmY43zUmwA/TpRvPRmfLi9ppT0QeTo45Ldto7P2s7tzuqLSz5UfXc
	09oUuN9nyVNWc53ul2/bcsX27IsAMBpdJi8d9bbB0/1fLKyKchHzTv5XQK9sTfthtUjfPGmnwve5i
	OtKcWjR88RtanpR6qyWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjpI-00072Z-AE; Mon, 03 Jun 2019 10:04:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjov-0006Te-QS
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 10:04:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id n4so8314424wrs.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwPSWWGObMkHXMOeR+gIVa53r6KxHy0rClRR5SSOu0s=;
 b=LaIe2IKRve/90fzL0agIqUjbzlX+PnoIr8C4ZdXb6ufSpMEAPi3+sMsyto+a3Nmapr
 96FD0oG9ZgU9Io3EsEyulge8RBTorN7CTO+dip+1qKE8RdkLQvU2gZrmjC3dZOz5R4oU
 AA2w53Jlk20uuHZS3He4++2BeNtLS2cbykFarzF7DXYXVrOsvTUV3RZd56ey8COZU6Cj
 l7iMn0Mek6XykBR1AQp6D4++P8dNd1VaizxSc4KlQRiZ+pOJWQlOm6PhRO0f6W1n7YG2
 mTTlV4TQO+YIHBG6f0fn1oSYGZbqWjPSS8AW/gbrzLZ09Ui6yblFSk76wVX5t5lruqiO
 eHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwPSWWGObMkHXMOeR+gIVa53r6KxHy0rClRR5SSOu0s=;
 b=nRjk0WxNAXxuOr4xuqf+bWfFrQ01AFEogtzGdDpeZz+UDToAdjkkfg209boBqQbwU1
 ceYqh4nPx4GpMUeIJeGrgMjs9hY1K9FVabXMGkmT/NiEMccuaafGy9MqmDb9q52DCJFl
 1gXPYHe9VfczckT0EYPM7INQTNluwrwjRN5EP+8R1cHU6gnIn211UpyiH9/FJhVOKpdJ
 /9FjpjMV1cd2gpsZ/kKfB5rbkXZNaxf2QtmWx3W5vo4FE9bSi2gWoc7s/KM3I6iKIUmB
 7bSoe4BDaeB0giXG179GLdKs5AAAG+MVGD+bdD6GnNKaHP/00mQhFvW8Gq/tEU2mtmST
 9DXQ==
X-Gm-Message-State: APjAAAWZJ59BiD6SL9miC2vfM+VIewjYRAdBMpxE5PzFA5WVEKvmYZLE
 iO+T3ohaQun9Bf3aZzP+doTUUg==
X-Google-Smtp-Source: APXvYqxyGuUH/KVeKqqLhvxZgkmMQha/6dftUknznXW10S/gBILTtO4dIUOAhBdtBbaazM61NZR8Mg==
X-Received: by 2002:a5d:6745:: with SMTP id l5mr1726471wrw.160.1559556240219; 
 Mon, 03 Jun 2019 03:04:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm11282098wrv.94.2019.06.03.03.03.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 03:03:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/4] arm64: dts: meson: g12a: add SDIO controller
Date: Mon,  3 Jun 2019 12:03:54 +0200
Message-Id: <20190603100357.16799-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603100357.16799-1-narmstrong@baylibre.com>
References: <20190603100357.16799-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_030401_851400_92DB05D0 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

The Amlogic G12A SDIO Controller has a bug preventing direct DDR access,
add the port A (SDIO) pinctrl and controller nodes and mark this specific
controller with the amlogic,dram-access-quirk property.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 840dab606110..9139913387ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1313,6 +1313,30 @@
 						};
 					};
 
+					sdio_pins: sdio {
+						mux {
+							groups = "sdio_d0",
+								 "sdio_d1",
+								 "sdio_d2",
+								 "sdio_d3",
+								 "sdio_cmd",
+								 "sdio_clk";
+							function = "sdio";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdio_clk_gate_pins: sdio_clk_gate {
+						mux {
+							groups = "GPIOX_4";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -2303,6 +2327,19 @@
 			resets = <&reset RESET_SD_EMMC_C>;
 		};
 
+		sd_emmc_a: sd@ffe03000 {
+			compatible = "amlogic,meson-axg-mmc";
+			reg = <0x0 0xffe03000 0x0 0x800>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+			clocks = <&clkc CLKID_SD_EMMC_A>,
+				 <&clkc CLKID_SD_EMMC_A_CLK0>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "core", "clkin0", "clkin1";
+			resets = <&reset RESET_SD_EMMC_A>;
+			amlogic,dram-access-quirk;
+		};
+
 		usb: usb@ffe09000 {
 			status = "disabled";
 			compatible = "amlogic,meson-g12a-usb-ctrl";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
