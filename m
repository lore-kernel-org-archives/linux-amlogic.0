Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB32C5DF81
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNSwV/DzZURgYLM6KhXRV/EMLoOoU6lwjD0XGvoJRN4=; b=RA0QiUZS7hG8s9
	TP1fL0WvmfSRoinYDe5NAi0LnV1sM2WxyE05qLj0fTyHB3MFn6mS0DYlCO0D3jz0b9nP5idv6RXcK
	MwQnJzDJ7Pd1pU5rp13Cadx01p7aNTvDIlEeOieYPVc6xYgm1x0NeTE4KYO/r2nnEOBS6/By/lLSX
	G9SgyKw9bz8gQJkVEqSd+9kwR8Pi2qxyy+SGQViyo+z0J13wZ+b28axPwJ56fFYCbnNVhWz+PnvGj
	6XoP5gks4UCQrwUjXxOdJQgn29L+5B56C6+3cQUE8ffuRPvSGTfV08AdPoXrqdC+YwK04ca5FR+1i
	JwrT6JgRmVn0frBOye5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEI-00000008YyW-3imM;
	Tue, 18 Aug 2026 19:12:10 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEG-00000008Yx5-3Tqg
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 19:12:09 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so2440655e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 12:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080327; x=1787685127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0MjCxxweOWbMxqY3PtSk4sO3PpZ21pT7dUMkgSduns=;
        b=cTgW+0NcFZW5VMH+cAvAqP5EgV2HZviUxBLMnwYg3umIX7swOrWDNC06VTkQ5IZIc/
         ml22EifTsdOzKCbuYyOZ1R7gK7G5OgyItPgZmMltw816bR+Q0f746nBS9ya/FNG77Xn1
         gDvkN3/axXrgC9QavTjR282sljasetj9oEWDPBPvWDEgrCsREEBLgdGJXN/cHuMFoknb
         Lu22w2QQFMF32AgbLOqcPcykRdW6YqfCCEm6t9dMuc58IRW9JPYptCu4dRxPAli21G7t
         37mvv1dX965Vpe2yhVHLhgLW/aBmKkTFf0xEx4ffBJiTA29Vlel0luqFvr8cvY4Dk9uw
         UMFw==
X-Forwarded-Encrypted: i=1; AHgh+RrnLfJuBB2QWI1w18rS62Ej4dihSoAtO08WPSautO6dfeBh3TBunZoJdOArD5tBGDz79ofYBz8ol+hyEHmC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7iaYmbn7MdhYyiEIZTI1kRGtIHT8xepMmoGQTN1zrPIolu0MS
	UswkPu3oIKdjOX/qnP6pw0WS3iyFIhMmj8igV7uPiUgas7Jo5DqD/jl+
X-Gm-Gg: AR+sD11cPXbJE1p6DEppVN4KfaJMqFQMbGBmV5wF4OcDDvUpX9hMb4VT4E/HJTmnWAr
	+1M6KC4/0TD57ZgQ4ooEWiPULy59ySM7yBrP4lJWjYz+A1758bnPBnUk81w30w1ZpMwFz8uFX2+
	NRGEjFuu3GLllJQBLDYzDMBBs3ZloBFhvbG+3pP6cS0Lzrk6ld7rDKOzwVxpT1/+Qo3QUW4iUsv
	z2d0nOXxcUAkt6RnS3dYKrT1gRSGcgu8wULJnXt9PEZyETG+/fgYCCzS0HNutgIFhhkKUOqf36u
	unouL8+K9adCM0BlfKCPjZ9dEm6fuo6ruJrCCPoeEIFXxRb1wP8//seTRo3QG5iNkhJ/xpxAyYc
	qBQZisrBVnsSGjfNKL4OQj+D33bywpqay2G0rdUpYNkXBGDIqLGbwSDX9Q2fioMqNs/S0G25Bog
	KWqF1PJGUMMbaSF7Eoe5nHa1Bs80CpinrP3iNkU7wjhCd3n0p0e+WAP5zI8dQJjRo83EVHpmTc6
	wfB85A6A51jvs1SNaOliyQHVFc=
X-Received: by 2002:a05:600c:3151:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499a9052a5amr2327525e9.15.1787080326827;
        Tue, 18 Aug 2026 12:12:06 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:06 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Date: Tue, 18 Aug 2026 20:11:58 +0100
Message-ID: <20260818191159.11523-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191159.11523-1-tanure@linux.com>
References: <20260818191159.11523-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_121208_876474_BC68C817 
X-CRM114-Status: GOOD (  11.36  )
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

uart_a lists the 24MHz crystal for all three of its clocks, because
the T7 clock controller driver did not exist when these boards were
added.

That leaves the real UART bus clock without a user, so the kernel
turns it off when it disables unused clocks at the end of boot, and
the board hangs.

Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
the placeholders from the two board files.

Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index cab2ee9ea0d3..dcbcd08a78b9 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -33,7 +33,5 @@ xtal: xtal-clk {
 };
 
 &uart_a {
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b72..677069e58f30 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -266,6 +266,4 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index cc371fcd1896..7847582e77ed 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -587,6 +587,10 @@ uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
 				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>,
+					 <&clkc_periphs CLKID_SYS_UART_A>,
+					 <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
 
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
