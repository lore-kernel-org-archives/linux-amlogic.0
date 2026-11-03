Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C0606EE99
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hbnR/7c1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ykXO+VRIdEI6AzxM/xVabPbIm77gBWcvsq4XOLp/j6k=; b=hbnR/7c14sB+zqFq6SV0yel5ox
	akwVQ+sIKFj98OVc+TvQEe2cbXBI+XWOSOUE1LfAPeyptWKUYZUJhhNnx9voaWEsGLG36yIme0WZD
	RTSemiMgZ27EmPhvCJyPY1d1P6fPMFRNMuCsKl1yC0+7Km3IqkkuMeDn5mfMhn42iTTiN4NS28xV+
	PUzyQWgPKvsN8YHYaZqSmexydkiMUzKnx2PKg+CLHlQMExAjF4NSWAiIzqXrfZQpEqOjJsZU6JLkh
	tbjpJD6PAERb7mtrTENu6cL96zk+Av9jLS8e/fDG9q4toI+lLKqgaiVCLX/9OKhlzU2E6+kCt+bh7
	k2UZp04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHW3-000000039ui-1FpK;
	Tue, 03 Nov 2026 16:37:43 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVm-000000039Z9-3i8L
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:28 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3443478f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723845; x=1794328645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=2PjaW+NhbngnrgvO5/uIz3C9VBeavfaCbcg0QAC72tMKGd6Os7xqoQICLwAeX5UZkP
         wn9iWMrH6Lwcf/BAEVujxc4n6gcm6JDJNZ1Ks9ubOgkMyNIGIarYunXm1kZwaaJq1IQf
         BbCP1Vx34ZPzsk8cNVR5YEUcaYJErbULzrO3KD7z60G/R/LDzUhwWVkwFxtaUbqfChQU
         CvnszJj6Gr1xhC2fHgiSqakE8ejD9RtDu1yPnS04Du4tB1qCvlqRkLtptAOt/sUfuYTr
         jWL067ufYwxrj2Xg6d0Yx8gPzfze8Y9rhgczXQ34eijrNnc8swNH8mMlo7fLjrdzMMIU
         j8KQ==
X-Forwarded-Encrypted: i=1; AKwUvByB0O4o5hQPaM6wuKu5JQB72MQpFLpbbV+xW0yAYzK7aU46HSC6ar1/kIMN0N+xaVZXXXpEvF8lX/ZptuF7@lists.infradead.org
X-Gm-Message-State: APuU4Z/yxIvnM4YshW+1YMTo2D1t3xfalDNzOehPpcxaKKwHQw1fB78/
	S54k8Dwfu3yWZ8Cyh5z9s7REOTEeKsCZ8bA/BAtR+s0Glsdha7laZPcM
X-Gm-Gg: AYBFou0B5lAFuxJgghwM3nC79HxhxP67uK15hGiivqV/O3DG+qya0MUrwPZYT11k9Zb
	aGiQAYKZvOaL2kfYicsprd9JxmfA6gywDrMc4HzqFnE97e5Yn+7hKsY8VM+B1A7Eh9FOxXD9tXR
	W3+G6zmbeteAm2zDFGhVG/7YZufBWG0K99xLbcYvEjuSF67nP3TUjBznW4WPAjnhAnP0CwEEuBx
	zqUlzDQ/SJ4sQf0cICsYUqRuoo1BKlJY+8h+OGy5YnSItnsI6Lfm96euuOe29EgqGDb79xOIUvt
	rTc6MlLL4KMP73q24vF/IycIcrb9J7GlENTmZYX3NPh82yTgMixcb16yjQx8uGe2DnmMWxUrtVW
	8mFTsY+nMD3xJhdE0Yk8CIhbYrDffLDRllR2biBQiGNRO6fj0OjuJY64qRUf7CG+xXUyL0Y5naF
	ctTCFvcXL6kWGApN3FSwt773vc19Pz6t84gVDqqp+XGdw7FPHT12MBwKWIiJDpJcHLPwy4L+ysy
	lWRe5Jr2tA6GMzspljx9qhF2BURdUVqL+JI8d7FSQ5nZTYXUczU94C+AXdfRa7n0vCUdsPcs+H6
	aTSutgvyIGQUrX8acli50P68LTkOAGWgGAWEvf43+ebue9bIXeQyy5+0ih6ToByXwc1VTwFCwXA
	26l6nPQ+D025JD9WuwpXh085h0L29owvvuxxtJzD+GLeDrVc=
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr28996710f8f.32.1793723844739;
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
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
Subject: [PATCH v5 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Tue,  3 Nov 2026 16:37:15 +0000
Message-ID: <20261103163715.385394-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083726_953877_78DAFEAD 
X-CRM114-Status: GOOD (  10.73  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
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
+&eth_phy {
+	status = "okay";
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
