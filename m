Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF060A2630
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZSIIeg5H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G4WJXTXUBBUdBg0Y5NAnmMZ5r7ug6FpAjdsyh5ohNBU=; b=ZSIIeg5HXZftBzsyz58ady0OtP
	SOUengliRcPFehA+tEQ0SZ8zX6sn+GIgviQW+XiZCBtEjDqWiCeefLr5sbwYhccFmJCPQahNcZdYk
	z8g89HollLxKBSlEGOSCkD4OdEzlrDFUc9UHcc2CGrCAOeBNVlRSTyKTq2ES0wbDr1OXSs7BpnuTB
	4NgO+nFSrkq23QE1U1EANuCVim+n85ggmgkv75ez7pM77fh14NkS9vbjO8yxd+2qhp/HwrtBzRWh2
	BDt+06ReKvE9LWHu9qvpZywZNQ1Q236q3nghyJ8IDqJvhn8p7kMj92lnO7VL0YVAWxdfHjODrTBdW
	L+71YX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz44-0000000EtNc-3v8Q;
	Thu, 22 Oct 2026 20:07:06 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3v-0000000Et7I-0PT7
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:56 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8424505e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=;
        b=22PXvWoplSS9tbe5/cntrwvBcpRRCVHwHaGMVXGmOOKZaMsOPoWcZGMy3+EJyx20Ot
         psTW/ZFkwYtFY2+rQjy7e11ld/EkNa6VsiabOw0ipgD5bAYoj5p/giKMMxnhEWFVB98K
         lY/i4ANsS8Dw9jOgATvBajYJJyLdfp6nKdxKTMlrvtKa+aonHEHg1UAULGCBBhXP1KeP
         MmXC2cu3hqEFotiAYmKQUYnjvX4l+TeEQv6PFk3jiXCLpNhiAv4RmgU17usLCyyjfFUN
         qsnhbxtGDbAxHYXvXX29Vqn1xutTIhMXTSNY6XvuENKAZkHmG48GiAzFZv6EN9qqM/g0
         E/Yw==
X-Forwarded-Encrypted: i=1; AKwUvBw1YfzkAv0rTrzBaI/oeUeZipV6QAmMJnpVbL8Y/yKTh8KH1pA313xskoFS6Ed+07DOWqvJ2yTMf1PtprL0@lists.infradead.org
X-Gm-Message-State: AFq9FYId4AySmt00VZBjRiboUDjDkKrvgrjVxXCnLYWX1kIyMKaeceiW
	F4J0T0raJStRYWuzc+LxQKRVHo7e5yrdfY2ZLGxhXn7xGqdl6AezfkLS
X-Gm-Gg: AYBFou3wW6/kaW5yVztIeYY0EkeJtazV//dhzoQwDy2PeOeq/Ci2ZVX9lrbsgskv/zf
	VNj6ay1yo9sxPL6Nt7NtEtrp1Rhjf6Lx60Z1Ix7CYuivD5uSK0RjPk6pxWCY0j57dZlmPnedxTN
	M4D17dD4xKomJWUvVHuyB4cg2wKtP1H/UryJlrxpEAKna2MtsDVjFTikOMF9w7THKW1tiY6CXEF
	VJWy3g5PFlEtxHTiNb9I4CJtJ6sE5YyEnH9+dKAmVnzHXNcMoOri8jk6EontGOyHVzK+u2KdDOw
	hpwq9qah7XTKEYaPbT0ZbO90YlszutWQr9yIDayPrjHt73CTh1qRoLrWcxVto6spd7ShF4GTTJs
	SViXnDCPgPeGPSwvuCgAt0vn+1vX/pgR6EPFoPK+7H6evFCbMUSGZGnIah3cYdSYGt7zcV3o0Wg
	ofePJjfG4e5mA01ohnhPwxhLSum+svNIUCNGwaK8QRdlS5NEKlZvk+AgPfKAFA7Epgkkm6r3ekP
	0x0WVjeWlY791AfJYYTDaNDX62Y99FT7N6Sriu2YL2dTh/6o1bLaf/BRy23TK5S1QQzTvgM3Nq6
	u1cSjXN5Q77//Nc=
X-Received: by 2002:a05:600c:3b0a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a211c869d9mr2350165e9.16.1792699613390;
        Thu, 22 Oct 2026 13:06:53 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
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
Subject: [PATCH v4 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu, 22 Oct 2026 21:06:40 +0100
Message-ID: <20261022200640.3101932-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130655_288850_8A4D82AB 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -0.7 (/)
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4914b0dff8a8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,24 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
