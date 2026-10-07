Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA62CA5FF1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvWXZuCI32COO3Joem9V63QY3Dg7XwrbXAkXfZLMkpk=; b=325P4dzHiDhWhp
	wgtiLvSO432BS+fmC98NQs144gotoW3u9A2Dk+8n1D0Ar1ekHJ3fqjdesuNjzhNZKp4ICPf7GUWD5
	M+u5VVQxyXToSYqma7zvkFLLX89XZwky6bIRPvdLws56PdRM7PoXLZMd20tpA6yTJsd9zJPvX34BY
	gm+V6BDGHpHSbqDPGiI7PHClIQ1aGbJ7Rtutgb20KFbyvzRdHdim0jvTR5n9XRhD4qZ8gfLh5zxuA
	4keB8Vd2UyJOabKsDCNpwM286iZ0VNh8HmPd6uy6SmKiWyUwyeVg2CqTFbhERQvLcD/bxl9nnPrBa
	vWyS6LjEGIOkEnXxk2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz7-00000001wd2-1Ztd;
	Wed, 07 Oct 2026 08:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz2-00000001wXL-1xf9
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Oct 2026 08:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rz1uNP1/6zGDpEzl8JcWI5dNkU1Wh/FOy/3g1YXciIM=; b=IG7LQJsF5QmhlCwpEUk/jMo72O
	XeMWo1kpkDJCoihOimanIzBqjL5OwjpfksATLiZYLNESQ03nL+4c1dneVo7j00ybMnwCk81y46k1F
	hhWCC8KCCpmByuFG3dTsE7aqX8vH5/EfId76DSn6LKsjk8YjQo5sUrHGDGhUkoIkPBHEMcn4uCWYk
	KUr3YEIXqn4LC9DqLeuiCJZdND0DUtqDhFJwZvzwrJaLL4DfSMLu5CnBdMtBbbUxFlNsKGqEulthg
	itghY6bDXAeWVTJ8RvUN8f72loHKWf9zv8HViM3SW74gPeHMX49pztpiOdZbFddoGbwqXh0opUapO
	gdyyPxKQ==;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEMyx-00000009L1a-49VE
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:38 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48870973bddso946335f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361595; x=1791966395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rz1uNP1/6zGDpEzl8JcWI5dNkU1Wh/FOy/3g1YXciIM=;
        b=kZp0nQz/CLzHk0zvXRIeEwEaoZx8co0fYnoxQEzgo+gicBra1tRv+aive0S3kJrn89
         j4Gh0c7QFWcn3kf7Rq24ixOGfyBpqsnsYJDG4bdQcsoTlj2GqnLdK+eQel71/D1gnc1R
         Usf9z65CW2u0xNJFwfqcmQa5q5Lq6M7ymlX4xR9viD1lNEAB7MOl4ReQs8esmg5xG9Uo
         BoaUaTAxjfNitSAfiwgPkPTtvh5FxVp9UJZTpgrSa3R1YgIpVdU6HOmXNhlutoiHtZH7
         yXG1Z/HXTT4PPjg164zeBM/q9gWiLHKffqXdxfeAIplGrZlt3Mav5wOhsl9cPIDeAJeH
         n13w==
X-Forwarded-Encrypted: i=1; AKwUvBzv8suhxKneTcilnqaM77y/5eax1YYaWZ61UAceeErlL5QLfUH4WY6GyxFp8jd+hN6Sv/97KwlPDp84YqH8@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1bkFN7kqVIOd+nRStJnq2oW+RS1j8tpdpTl/2k2ZwmuJAvFeF
	tTS5dPeqVGaa6zpPAVlzY7Hf16uqxEhRzwojIvAFhw3Wh5f2APOiEFtW
X-Gm-Gg: AYBFou1CILVURpf9fXvreWkwLVLUKuZeYGS4kY6l581gSpqPbOL3bxyGQGTdmliMcnp
	qC/pk7YdhLia4KqMMS+4yl87blJORqWCSl3AbLkboN6Lz9Gq3QDDCSdVJabgDo7jQoIZnZ1BNrP
	NGy/mBnA1oIFTuAKO6/LdxwCkv48Zj8FvumLxZodxmE6T4Fg64L6Obh1uGpIp8LZB+7IUo6L1q9
	YzY5XaSNt2+zlEI6dOYI2L4SWvC9A/UBXBed7nxTBCzFP2DnpWNKVblX2qrdQcvtmVh7Usa9X61
	nY0EhfyTUhTUOzYZMGcijpxXbOWicevAJD6zTB9yk/7lYgPFR/9b3sdeNXMyPPGYhnoIfxdtpQE
	ZQCzjQemwGOIlsZqBtyKRrW9oOgrvJ04u7kwM2b7SlWu/Y57Pp71ZBM0YBQZVabct75AtF4rOJd
	V/ZF5mnn4QRbgJ/P6f/1yAev8X9UoIHeWc6c15Cw7lYNStHS5RMxS58Ys5IAzDig0BUtEfhvvg7
	Pm+wTJCQmCPm0fkNppBwHrXKhZdYRwkPKU=
X-Received: by 2002:a05:6000:454f:b0:488:7892:1932 with SMTP id ffacd0b85a97d-48c7256fa0bmr2028288f8f.0.1791361594943;
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
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
Subject: [RFC PATCH v2 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Wed,  7 Oct 2026 09:26:27 +0100
Message-ID: <20261007082627.63807-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092636_736100_6A1D99AB 
X-CRM114-Status: GOOD (  14.82  )
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
both come from inside the chips, not from the board tracks. The PHY
adds the one on receive. Its transmit delay does not work here, so the
controller adds that one.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4a2b0b563655 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,27 @@ xtal: xtal-clk {
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
+		max-speed = <1000>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* RGMII_INT on GPIOH_6 */
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
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
