Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75832CA9EC0
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eI1R9Ljz3L+Aewy7peCeoAj2OkAvDW3JfKyvh4EkrgQ=; b=BW5++Bc6ojc/ZQ
	IPLfpOtfEKbxviqdyEZqdsOY4Ndh+UClXHf4PKZMqGsaV96bY7/iNv0WNLvtZsCBCNn6b6KI5TOa9
	uW10f7qpqGM90eUUPeGKWJzSpdiBT197atrE5XEKeP5EclzIwWhuu42ngQ3Ky1IcnSSM7sBCf/wkA
	3He9kvtY5zOK1qWh8YS9C/H/YoRBNlvVTQxRzow5YyAAfifoCBK0TcL7r9q8DtdxdtSZa4vJQPni+
	l4UiHW9LCJ9M/6iXr1/TtsbmwonjJfqj41dfczNTzMWMfFhx/M3z9WhkomsmijLk3yx6PiPCGcyx4
	DX1JCJohJIcdvEgXC07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnS-00000007sKn-1MVj;
	Sat, 10 Oct 2026 10:59:22 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnJ-00000007s6K-1V2Y
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:15 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48870973bddso283319f8f.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629952; x=1792234752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBX2EsGilW7uIgdk0tYqFZ4ZqmuLdnOK0NA9yKXMRg=;
        b=u+RpHtobcUrfJFZoyGCYIE/a5L89JTsArUHLnrcgEXIs1WvSYW6MGWbWDsBjYt/Pb/
         atkb6dLy9FazNVV4kTecCWN5x6FjnQwafjXZR4cE+5uqKw8JHQR5r78AsGO3TphfszmK
         mm52II+pn2IyqFOSXx7dGOHAR/bBIWJCUzc/tSVr0sKNgm0TP05TaB3hjeiUmCr1qVTt
         XzUtWo7PUhg27+KXXF+MRXoaJEH3ih6p3LamOmFwEGTphuQKLx/MdHeZrot77J8Qw8Sc
         1amjdK7xfpNiPajmtzpQxeJcA60gBbV6c73w+zYZBli6FhjSopCuKm7/fJhfgbPXwc90
         h6Ug==
X-Forwarded-Encrypted: i=1; AKwUvByE0RIwFZqdsVAWX2sDY6dODQOIRIJaTWgcvcKrTwE+ZSJ7kLeZh/WeT81Oh15iPrVeHGisOXARnd5oljSF@lists.infradead.org
X-Gm-Message-State: AFq9FYK6Xh+DXOV9x9eBsmZp/T9LjzHfmZxePcVoLartGjVRpQWzpzbS
	I2qZbckJFLgN53ZRk8/ZFVnyWNxPyHz5+DUPTBpOGnwP6jULt7GYIDz/
X-Gm-Gg: AYBFou2wGtwTDjDOO7QeL+Gj7hfXXn/EfKbe7672E7oam4Tc0Hevk+CUqJ9yh52vsq5
	JISNV9Jcj9gBNZXnJwi7k64yNfo6BMAv9vx7Qj07X2jw+1d+i218i1EeOlBiM1aW85P9LANkqef
	KzfAqo46rJM7TVyuqYWS3eaz6yzbLiK6RR6F/Eo7rqJddUbwBFJrZDUof9mVxxgFD0ogqV0Mzgt
	GWNSoMbdrUQvRmF1fuCJjOBQ2sbYTuRcCKMAhOWsIsmzE+GT9Lmdx0/g6pcNZ5gjVcpC2Smiz7U
	gDXsN5EBCHPGcKH8YrfgvjCuXLsQkj1GgIV8wqUBfHRmsip4QQIJYy3E4PSy3FyYv30qREGpB08
	WliTpwTZ/4rMmXcqwfdXZ+SKYJVqGuuTTGGYKwApgHfyct7gcylhbDl/XeX0SXASn1bJuVDF9Ti
	ULmR68OWtMLysGp3OBM23FyLSx4emS4fjuHdQZgab4Aaddur5L2BgOe+KrM2XQLATMsCFe/LVCu
	SbWLwBEW1RsnFsY47xM96l4s5lidovEogM=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr7697023f8f.7.1791629951651;
        Sat, 10 Oct 2026 03:59:11 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 10 Oct 2026 11:58:59 +0100
Message-ID: <20261010105900.247342-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035913_916384_C201FC30 
X-CRM114-Status: GOOD (  12.46  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks, and on this board
both come from inside the chips, not from the board traces. The PHY
adds the one on receive. Its transmit delay does not work here, so the
controller adds that one.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..c18bde02ac40 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,25 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+	tx-internal-delay-ps = <2000>;
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
