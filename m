Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4A7606A31C
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2026 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ncHjSKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wZuDILpaEyQHZww1syPyoUDynxb+r7awOzvRtnExvag=; b=4ncHjSKNP+Sa6OmW7MkREHykA2
	lTflk2pV8/G2Qkq3Cg0TCfWZyM3jajSU9Ex+9voDzEcAt+ATOOkvlzngJiRWHKEgJVuXfnNfuFY5r
	iDkMiS9pZXb0nSV5CYjYoNDgHEBArK9p3tBuOfTsDCMnT9CjOSClTbSYG39gL21M7cB+3Vv30F+1J
	pXYb1k7rThcPTY8d8/b9zoVKvz4Fcg5sKAve0gwMl1yvvY70p+naKPakPOn+WPPOWAg5UCKuOry8Z
	nZXdQ3AZQ/34JYxTvNANHPeE+pDGy0Kzi32xL6NB712uoFzO89yGBnpABEIf1AqjIFEefg9yHLqlq
	fBB4ideg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCge-00000000Rbw-1UPl;
	Sat, 28 Nov 2026 07:17:39 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfS-00000000RLf-2Mdw
	for linux-amlogic@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:21 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso67640805e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 23:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850177; x=1796454977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=utBCO5eH5pQIU30U5tfnrASdVujuqlw6gBWuCKGCioH1h74/VTsb98g246baDJyw3e
         B6MmcdcpEW1itMut2voVZ1YEWcN0t1pxaEnA3oUnbuUFlGOOqeW4U1jRxHUlyB+wjsTT
         7Lm8PHoqTC8ndEKWR+VApxLLS5GzXWbOWZALuEiEEyETnbwsxfByqSPvuJ1P4kDpwtKC
         RdcA8n9X6Ra4NikKw4M7QaudcOtibmrd7rsKXHlX58ALgYn1wrU8b6XCMV/AsvqPnzLY
         T1Y0wsnB6zld00Dr76rlaWL/eQZTDzS06Fcb4lv7ccoa13UBgaK1/IZwUVZvdk1I6K47
         A1DA==
X-Forwarded-Encrypted: i=1; AL+hErF9u8i9Yz/LiHeVtUhD04CGV7pPiOV8fmOdFllnaN7q5wcSSVayS1NyrFXnk7oIUE+jSznE6HciFTK9EbM3@lists.infradead.org
X-Gm-Message-State: APuU4Z+jQ14zQZGMYX3+hH21cSIo6z+DBNWsMRRiv5aI+YMpAf9PbFFS
	r9R//rYQcGyUR6MLlqylgMBIqQDp48QwwaofzMG0HnlZ3diegKu6YQVp
X-Gm-Gg: AZFdTZdOqR7Y/yP0jEWq4/nXVmvn6GPHPb1hOms7yBsc4P3nZo9tn6k+ScL2y1ZkCeC
	7PhfZWbwhteW0LGdW74BcZxQMMHZw+xfdgKLFQ1+czKeOgrEukyVUzTLOGZp6aqSuqNDq6KhiCl
	qhbawXkf4Czw5AmTE+r8qi/aS9P/JLcsoQGOZ56Qvuo8c9PO+jnwifhTGvjraiwYDqYk+u00sGb
	nCK5v4YjuORATH2WOfIsFnQQPpVsW6HWHVw18Anv5aGGfPpHexoH0JVWfkcWrp6krdvuZr8kQ9J
	vXiLI5kr6E5V30YjC+WePA/RpD72gYyWK/XNu8nDDyTjkD8yWeLnCCCoKsMdwrVEQyZudZpkO7N
	zL97lukHtYIZ/t2V2bykTsNHM4vGX3kro7bkLfO0DFTFSDOU55C6Ql882BQPza0+4W5M3STfkI/
	ETM46Y9mCrRdd6t+jirg/8u5+hi/QJ8KUdsIUEqB6DR/spoCjmqGdEOVEZqXLlEzVUReIDA3vBh
	/wwd7TtamfW/3+egDyBHtkBmke9MmDHsSJEqLLa+kA91U29w9IZSAOPCRMKRI+yjBtea1okaZP8
	Vq6oxhDNn0yrlp8mt2D14qDUAprnPZlCa3Fqj8zeUIDunfObPO2CFdyH0bwUZ3GEs/3gafaLG/w
	3k8jT9YVTCAtI+jDzBkUkZ2U=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr615051875e9.29.1795850176695;
        Fri, 27 Nov 2026 23:16:16 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 28 Nov 2026 07:16:10 +0000
Message-ID: <20261128071610.27855-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231619_210714_3CB6896B 
X-CRM114-Status: GOOD (  10.21  )
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
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
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
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
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
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
