Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71F7C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:11:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E19860F0F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 20:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E19860F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SohW+X0Wf1fQ4kktNUMlYDJDhuvaMSNiKpPmHyHMozQ=; b=ocEKdCReOhFafG
	+wTCQlVrMyHZcmqwhM55FQftpn98+yyTvg0LIEHIwvB+Gzo6yO5G6nDvnp+jMwIpMKB/6sK5vjTDP
	0U5+80V38nW6zQxcOGOMCZumcriM0/sNKLJ9CcqaDz9EFN9X2H6KUivyUQbAc/jgnMJ+OSMKu7fHC
	GzV8845tsUMgN2wBZZKxpq2IgkZ3r+Ukw566nw/C/6x2TbYlFembYKp9Tp9mHtbAVoCKtmLe9giHx
	t+mV0wjmd1ldFDlRQHQbFerX9qRAonl/paEWVEUTPPeYJicSY+BeaoAdlTFDlpen9tEgV64XkDu3I
	vPvlNq26DbFsv0eU9TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9CNc-005nni-6b; Thu, 29 Jul 2021 20:11:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9CNM-005njM-Eb; Thu, 29 Jul 2021 20:11:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so11322114pjd.0; 
 Thu, 29 Jul 2021 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuibBDljza9+RanigNcsGbAD/Bl63vVbtTN8yokwV00=;
 b=KJTLA5BADvsEc4snFUUYn0AqkGNtsRftFI8d/hubfBe0MsnO5KAfuQzKkMcWrgG5jz
 VNXcs1ccs+nVVGb6/YA6jlqOxnORL1+qZAYk4abhc0SbjFcuzP1cEHJaVqlHqxBmR7+W
 MB1dun1i1H1Wg01eKdMCvBj+AX4Cv2aqVoAPE982Y9Yo6SqZne8y//+xaQmOibKRfXFQ
 lmm6affl0PS5lRD6q7Xc8U0D0In1Q1ZJE3MnAFfWb/78h0ZbnfMD0WXMwZlmkEXsDREe
 1ILX5IpiE9TvrsL6gTeFhlGL6QRP0TbXkWtVgyGCMz9CSZqMPHBheaky7EFazV11vPsa
 KYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuibBDljza9+RanigNcsGbAD/Bl63vVbtTN8yokwV00=;
 b=cgoOWAJedVoAP1pvMkD7LZttN9vPtyoo18/m1InfSNy1P9jRYou8PIKc3uLVC08+zJ
 ME57kFzBy/U6U/9WDZ6D1uxVKfxW9Jy+x/RtGxTxe2c4G53EARBCAJazwIr2WVt4peHG
 BS5Am94wSYLvkDY0+9NFPlU12eJvB1UQozO/cbPE506/hiZY6KVORZQpSLKiuxFty8n7
 TqRWM6BCUxEvLCLfCGdRyajGUxDk0EntrFEWQZabCnEgRg0FnR+D/P/igfQvvYZgncKd
 z9Pp9tP8jNS+YQwPE+Sj8RNVMlaxtD4Un7/UFdQbQLZ/D7plowJ7GSlkUFfAB8+jDMZS
 e58A==
X-Gm-Message-State: AOAM53261KtEaaDQUB2y/q3HTdqa4N4EOLaDwjQVeMsi1zra8fOJemHE
 Z0g1UfckFKakZHx6S0XPlmY+Y36ftZhwAw==
X-Google-Smtp-Source: ABdhPJxFrMpP2T7mTwT1/NZWyi0QSLLwXHv3nNxFg5K1uwnPr5fLpHAgkSkXf0tzZ/xV4F5/yMLS9g==
X-Received: by 2002:aa7:80d9:0:b029:2ed:49fa:6dc5 with SMTP id
 a25-20020aa780d90000b02902ed49fa6dc5mr6718675pfn.3.1627589487476; 
 Thu, 29 Jul 2021 13:11:27 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: [PATCHv1 1/3] arm64: dts: amlogic: add missing ethernet reset ID
Date: Fri, 30 Jul 2021 01:40:50 +0530
Message-Id: <20210729201100.3994-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_131128_538102_65C6BD60 
X-CRM114-Status: GOOD (  12.68  )
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

Add reset external reset of the ethernet mac controller,
used new reset id for reset controller as it conflict
with the core reset id.

Fixes: f3362f0c1817 ("arm64: dts: amlogic: add missing ethernet reset ID")

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 3f5254eeb47b..da3bf9f7c1c6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -280,6 +280,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "ethreset";
 			power-domains = <&pwrc PWRC_AXG_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 00c6f53290d4..c174ed50705f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -230,6 +230,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "ethreset";
 			status = "disabled";
 
 			mdio0: mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6b457b2c30a4..717fa3134882 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-gxbb-power.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -582,6 +583,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "ethreset";
 			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
