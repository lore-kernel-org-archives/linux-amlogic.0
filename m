Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F70606D81E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PVkLPg8o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hsS63ZFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=36ljIhR1CLvme19v0FtKKlh9i00VgTMlHg1m/urIev4=; b=PVkLPg8oHxPg8v7j8tdO2QdZTR
	VkdNc4msO8KrlNN/e4YifH9FdpVTInHV8xLJQT6QzsVkht/59df/3PeOLpeRlrcztCXyeP6rxVJzf
	hRo3ZFaQbJnEA45+bIbNZxVq+sMl2XEv6ElkVIaIfnJOQCkb/gzOhiALlaDLg72dq0pXKn1mtVDC6
	Ho/hHrRTfHPIgjDcFy+BIZFiS1ckCp6evVjSHV0isjEEAeTm6w/7Ys9R80FpPhMubNQQaKOQb0+A2
	7rLjgpKwhwIYdzRiCvRIgUQ9/7XdZPovuVCje6RasyAHSEVqFe2ZfYq9hlEL77XtL9+m0anfhZM+m
	jFfnR7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLM-0000000BZjH-2X9P;
	Fri, 06 Nov 2026 08:30:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLH-0000000BZdA-36wG
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so190532f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953834; x=1794558634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=hsS63ZFMYrCsFiZwU8OshiNaKUSMJ3Uc7sLKuEAnmvUX2CTLEzK+oe0NBIi0MXAgwu
         jazpGUTVCbfIXNKQrwJib5zl7wNSj3FakGec499DkNt5CQV0ddaMm8FA4qtZcEU/QTEP
         6yYlAv6K8xm0aBZC0Ky4eNGTWS4LfxpdBV9q80YLsLK96P4EU9RZpLP6WG00UqOavYgh
         6/0zHnVVctRFvcjsm5m3eYpkmtGW5Hn/Tb2LUkIWf2dlM1bVyR1Ww3Tj1vlQUBhAmyMY
         6YlLphsb+60Gf0WBrHhOsoSkm26Y32ZdN9Yb3TDLnUkbJXJpaq3v516KVULwiPnCtET5
         clQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953834; x=1794558634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=is8UAOoSA3ajTz4drkhKJiTY14KCRdM7nVFfvgiNu2Gb4DgT44/NK0b8Ry25wWD65p
         1uM8T30hqiDj16eEhHth8fV0t7oMEJG0f8BP9QKqc41+EFGv3uphFJuZnImm5Ad/2ICT
         IMvyL5nraNYMI9MfD7mYT3R1wUoqMyC6x7IiWBCYcshhMWoGCMaHGUfDMcQoRMl+T/bf
         hShL69kWh7b56uC97qE/y8b1NIY0CAeJDAC/5SZZhrW3y9IrBiUR6p8dLwjK5bikNf6f
         rorkbJz6cAOnUUepa0I0HcIeR458MMIX3bNP0MOhYtgF90tRswC3ivLQdrQlvvyd2c9A
         34wA==
X-Forwarded-Encrypted: i=1; AKwUvByhsh7zBsmyY7V7glyYXjk5ZUx1WT0m7BMqBhbm/hNaC2m865yH8Do/c/7l8VJA/H4ND+s25CatAql2zX+d@lists.infradead.org
X-Gm-Message-State: APuU4Z8o+BTJFqozD+jxVW8+S89dN+M6UavHlaNx+min6zjQ0HMA2D3O
	VListDte0Qed1oZEl4X5k3hUgM3a/zmi1pkV9GSda5TfJXAwlizoh8Z7gAzeS0x0OF0=
X-Gm-Gg: AYBFou0ZWS5e0nJm7IuEP0rm3L17m7FKjlIUekMdvrrWKHB8fZE59wEYqNyREC3G+t8
	Owk2XydEeXW6fNz549/QbfZDxoDo77oYX9WNvvkyrpSdVOSYGP0o0SdLPj1aXfJoxfJZ7c7NDzI
	AAHKu/tcKUqs9dQsj1FxzoI1nmKoIhvQMNkOGk5FLpBORmd2k0EJ9PL2Zljh6Wdv0PWRnVguX9K
	R6Ut2NBQq0F6Anhv7KjL9NaBOFE+ouzKg6kpO7WpZ7pwdClYJ/cOGmVCBNyGFWdE59kzLwqAHVy
	N8FjM1BFXsVjXaQzOxNf5+m0QIvkefZyFJOVhaAc1DPL27fTJxtGYtnGjMO9NbJxxeIni3k/l4L
	zCqYDbzZxZiibNV0/W+OxKGtE0Alo2THD/QzMaoHvB5X9ZmL/k+z2P9eARkw7tm9FDoO0PK3IaV
	lRcYFKOUJq1VlMwK9VEjoedUGiZfsyDbrKV4BQ1JFuK5mGvma4DxnAqigkJOluGZDqucbbbKOct
	vG9Dqm0BNijPhIIbR1gRagsiMrkyFxFPLGMIYcbEX9r7UzkNtx0ivXdwNnfZaYWDHcwwASV9sP/
	MbADXqAQC2TP2GwH5nH7+9VnvkOtm0xAzVCldpm6ETNjWgk79xcqCGqP3d0nH7k9PT7g43s0+CF
	AiHqRNKReqfiph8DoRiyTskknXs4k64zdrgR104icV4/Udg==
X-Received: by 2002:a05:600c:34ca:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b6deb5ff00mr24355375e9.22.1793953833711;
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:24 +0100
Subject: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003035_826879_92AF4802 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 firmware exposes clocks through SCMI, including sources needed
by the other clock controllers.

Define their identifiers so devicetree can reference these
firmware-provided clocks.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
new file mode 100644
index 000000000000..10d7caa5d1e2
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __AMLOGIC_S7_SCMI_CLKC_H
+#define __AMLOGIC_S7_SCMI_CLKC_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __AMLOGIC_S7_SCMI_CLKC_H */

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
