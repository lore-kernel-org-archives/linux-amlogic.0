Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C288CAC587
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Sep 2025 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87BvFgynWEnunEF98zSLPLWjKlHGyyw5nS0tAIw3wAU=; b=hsuPuePar5MMeI
	VA80EQbfN7e6WYdLad3nbc/ZeOSQ80oJZPJoUZs3tTo9D2xD/W0CD2hDDvc6PXmV6sFbkxqGpn7aC
	6IhyluDfS/FtKw2ffi2NDTdBQoJslh+mY0s2qZCmSD7pIFNH+AxIgEtn6LoilsKDAHVqRLTGblh/I
	xGDkZfKyJnomHHQI6wpi19sfiRkypNXFlpgLYUoWrPMVkXh5k0mak51LKaA4Pgpi6cS7S5A+91Xdi
	ZzjEe2Ef78O+RL7BR2bSwA0vy1oxunCLebUU61k8AZciwAxoH2HDVfRK7j+4jiK/N2NzvtmVVK+H0
	94UYlEV4QsjaDmmSJZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvudY-00000005xz6-1VrI;
	Tue, 09 Sep 2025 09:27:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsnL-00000005AMD-1AQc;
	Tue, 09 Sep 2025 07:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F7BD6019D;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2157AC4CEF8;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402978;
	bh=cauIuu3t3nXyrpfWxbbzIxeCXogR2ZYnkCIvBtpd90A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aJjGRusIkFkez0cgwDn/9b6cfhjKmLl2cb7LZg9bERRszHwycMCz5LoBPKrwpqPp5
	 s/FvUfIH7qRBqDqirQn9GSgVKDqVlkdZ2x3SQEzE94dbkDuL9CkcIEn0+rzS3X9oIr
	 8jnrGKNvoE0lrwQhThHyaJG8MLjzMzAVng6D3k6renPRsc804AGDzbxoqdzL46MK94
	 Ws4by6UC9dJXV5aNQ+XBTugD/vjhuHevUccJ8UCa5KMy10I+H9+abB1gvLVPVQwitV
	 z3+07IGYhVxzxpeJkbYz2p27TNTdSmH4vi5O4DmeZG2UHLBPMqj0PFmhpeftv6rVfv
	 ov+DXJfvx0GEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFBFCA0FED;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 09 Sep 2025 15:29:11 +0800
Subject: [PATCH v4 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
MIME-Version: 1.0
Message-Id: <20250909-add_video_clk-v4-1-5e0c01d47aa8@amlogic.com>
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
In-Reply-To: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757402973; l=1224;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=slpmx/KfVVq60h+CXDXC7IwZgqak4zePml0fpt3Y4+4=;
 b=gO5dTZsUoIpIzbuoYVrT/Xd4KYCf0kds59m28nMGG8953yhHU8LpJJS8J73YA4Tpa/BfYL0Dy
 A15wpJ+8PRoDLkT6bgpLyYTasu0TlMphLMnmgs8nbHoKIIbQ8m6zg33
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add indices for video encoder, demodulator and CVBS clocks.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
index 861a331963ac..b0fc549f53e3 100644
--- a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
@@ -232,5 +232,16 @@
 #define CLKID_HDCP22_SKPCLK_SEL		222
 #define CLKID_HDCP22_SKPCLK_DIV		223
 #define CLKID_HDCP22_SKPCLK		224
+#define CLKID_CTS_ENCL_SEL		225
+#define CLKID_CTS_ENCL			226
+#define CLKID_CDAC_SEL			227
+#define CLKID_CDAC_DIV			228
+#define CLKID_CDAC			229
+#define CLKID_DEMOD_CORE_SEL		230
+#define CLKID_DEMOD_CORE_DIV		231
+#define CLKID_DEMOD_CORE		232
+#define CLKID_ADC_EXTCLK_IN_SEL		233
+#define CLKID_ADC_EXTCLK_IN_DIV		234
+#define CLKID_ADC_EXTCLK_IN		235
 
 #endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
