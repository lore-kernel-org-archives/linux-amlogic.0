Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A519606A33D
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Yo/5g5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/bUGkh7UVdHX+BLk+JXa87BmsB6CzT7D9FFwO9YxLtE=; b=1Yo/5g5oPBa9Q9SVMsyD8bLcme
	lHJu0NUEIl9Xq6mlVyZryh178nPfRf4KgkxKInXNZtyqwILXvvF9D5ig/RKg1qXUDMDOwWzwaMTQ+
	UzOKig0Cjf1U+wHJLq2nrG5lWRtZv0a6s22yfL+rL0dDUYYYvbQcuRc5qGj35UcUFQrZCz9h/oeTh
	lqXd0hYhCdYefFQcSU8m7cBz9ap7DEQR8LUVIQqQ2a1YzTWHyFt5wshEhvXz1bDLN7OAOw1MrkJxT
	FT7XcRKVAXzlXG4xvgFwfROw/Lj9TwO53g9O21UhG844ugrzdlFbIkTd70KJ7JXo2wcljAEUrR+6b
	7v9JaoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVs-000000039lJ-1Qvu;
	Tue, 03 Nov 2026 16:37:34 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVk-000000039W8-2wnU
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:26 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759976f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723843; x=1794328643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=yM8MsZvSGrr0w2fKyC6D4YRtKpOAcFclJX+PdgI/G5Ki5EeNPImevIFyszGfyc3OMD
         JjvhXXr4S2a/GJiZhq6tH14jhH8sWWWBoDyLjqMwIxqzOHszNniO+vZ8X80tg/ytuKQm
         Bt7FqfSp8GcAjvptLJgZ3Lm8vGCufozs+P2kxGqtSStd3dOrsNU6P5WxLA3B7MxS4nM+
         HFjsNf2GJV7pL3dKxzcsdG68b7eesY6JL9Dk1ZNPoXFfuIrZBJggKCqV6eEyr9b0Ll8f
         2IZvcdlzS9FgVS6T1MZ6lnJQMKikeU2zOfIXwylRwR73FIVUZ73DizI57mBYMhAHd6SM
         n2XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF1v4RTiEDToX+Wk5dl3E98IS8eO1rPLJbQgDdZlUEBlmQV9vlLFNfu96u2MptQJLony0hWmDXyFchdFhK@lists.infradead.org
X-Gm-Message-State: APuU4Z+bo7vofUNTKcz1MRsy5iiFsy2vVvOA21wsGH0PnTFnab6+bVwR
	kFTrtO2O0Y6kR5QYbGquIxBbU7aJozj+IaxaSV0WfVTRgsYeJbn9YeUw
X-Gm-Gg: AYBFou2UVpWHj52Qx/J58+YOZ6EusxySMML09TRHfkV7BhxJlnMaQXsr22hwT95MeKz
	hgiq4zw5pqkgzDML1YzpVh+fLYxdjnDmFAa8ogV8QYP/GnozOQ6s8PSJRS9faT9fNZdPqN7kpkD
	ddwpHR2uV+FsgFhSh9PB0jpeJGAvLAsJW8sV7h1pbFW+i2t8AJGi3xygsqr7xSlBItlacFBTPL2
	YurmwYMtzLySRioK+qjIMv2YmB+/Fp9USn4Jn67/oSLk4xRH94lwsnbc2HceHc83rDt/xmVenFj
	dmgpKeN7DgiHRkGhf1rCWg68LWerYCIZKoRSAkk5i1Y/F57mjNZTMTQWcwBrxJ4iYvwPACy6x0S
	9cq2AoAVk4/a2H3pt+6t3LRmr850LbHVAtI1szWGxswXQhkd7bNy+hRlwdMVLZ8BqXS2OGDIzBf
	cYh37kAaa6B7e1+J9ntKAJkBk6zyrJA5B287Hf37iiZOnkeocu/pPy6CFAwGigXbuUCE/a40p30
	dmGudxzCb1Ixk06zSfDBXPEge3IYaSJO1PXo0OIz0dQ9e3Z5aG+u8Ag/xrDgmX0VJQAWJND+PQk
	L5cYyLENPJUxtx+hVhyvaWRw8GYDa5lCVZo+MXrnQ8SizTjyioKK9aUOkUmalnrh1dcYP1hAYXm
	q21x5sjF1sJ9/zMSx/DWl2FAn/w==
X-Received: by 2002:a05:6000:2c0d:b0:48e:661e:8766 with SMTP id ffacd0b85a97d-48e661e88c5mr40422568f8f.17.1793723842657;
        Tue, 03 Nov 2026 08:37:22 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:21 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Tue,  3 Nov 2026 16:37:13 +0000
Message-ID: <20261103163715.385394-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083724_863880_7C237E9A 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
