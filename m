Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA2ACA5FF9
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoK1BWxaI+9IPjQ8yP/+oqz86gN3hOsp2QRHgCJS/rY=; b=XOKdBYWiB+UBAl
	kSVMVcX2NI1zS1UJ98n2Q7Epi64FvzrTtyR0FOJdJly3PZDDVWZNjrkypCk/hjl2rrQVvCGiHCYGE
	D7AQA6MeEzPBH1sHhrHfjEVfiwNRW+y5aKvSX/nOu4QM/0hTQ33N8XzRHIc7SwSk8dgswoUpZP9Rs
	5GHQ9/9AiZ7hF0n/al5BOHcYrPdbe9tIlCqA7fRlDnLViUQH2tl0kVYFySTp/6mBTBrTW+7mB+Uvv
	O53PouaEhDkSjEy+RN3IVK9/SiunsXuww04mkh4xFIXO+Nx+Tms/dbMkaEtBeVkcuZNZpZNXmSyPX
	qr8+4yaZXpyuibSU0Hmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOd-0000000EvMR-0FTw;
	Sun, 04 Oct 2026 14:40:59 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOZ-0000000EvFg-17NE
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:56 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6913625e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124853; x=1791729653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WnY2f3qUDmMEIrOsugmwhw1biyWqEpaCp+l7ISDYX0=;
        b=orHDhZBK2lKXJuTzZmkRsjctvVT43N80RKEzT8PbjeEniLOOPp1uIUtFYbtGlimJkS
         5qh5lQoYr0Ph/KaUm8HAgK7Bc/bXUML39dkQeiamLmND+ePtQTqfR8K/4v5xk6kw7oVc
         oL4Q2rcrP5hW0FkgKSqNU5bfrTg5U5K2kuGehFgeydycfn8JuyVfoesUc9Aadx+zz8Ww
         p5MTQGGXv72ADBknTQu6wlcRR1tUzpFBqw/CysaBGtqKekpRwdTMlkp7Ej6y6FWGxejf
         hz2bAkEoxf4MZoIP60ScR+VEfwwobYy1TlhQoRevxd9po17hCXipBtpeo6iB9BYRkIjV
         lhuw==
X-Forwarded-Encrypted: i=1; AKwUvBzLPjisS8QCwF2K7HRvIUSnLyp3x0pYZ6cWTlu0IZam0NdhcHHX3v1Zo4vNMk3MdEnfv9wO/JT4CDdLebc1@lists.infradead.org
X-Gm-Message-State: AFuF++mOKqTNTE/okTmB7fKu9JMwzmo7lgFjrcaSwvChgFD1MNYc+LRM
	WmReP4isr75oRYUAry3f1AIjl4h8of4dlmLjKESbDOUHkO+FFTEKF1MG
X-Gm-Gg: AYBFou0GiU02CY/neMWiS7ZQnum2WJ+LVrG1aVD0bnHrbv6jk0N+GenL3ztZDUBy5Gq
	Y2Ml0V90Yb897cz5oozDjP2cHX9a1y5hrkAIXCgWkEg18n1vYwX4BXk19qfYolRFGFo8qt8Sl7i
	JJ2QKxz/o6axk83lhP39BX9JLsO05MNSArgI2XencqFJxJSmYshDPmypRu0tVXkyN4wKn0uNcRg
	+fV6XIw+vwlar+3F4ILlephnmHl7a7WfePy5mZ+PRqAQi2oGtdCtFYIvoZzySljHaaQHvaDCRrH
	1JpZM6WjVC46gq0ZPsLcdOsffVsLEC/OtU/BzXRICPeg1ijCl+cmX7O1nis4D7dnd+DWFZ2zUB+
	ihBrE0kc56Tu2mveeKFOohr27tDwRWjQ2XTReDKgVc9t4zKIfiH+KH2iAKtqzuRUXTGFP02xJWh
	jkxExj+otLp0VRDTUY9smrY/0qTSog8S7yqn/osjBvkEnDEWuA0wjL1RdHEX7IgvL+4nymG1cq6
	JwaKiYD6IDsia3dLVRS20TZKdsQ8BCMUA==
X-Received: by 2002:a05:600c:1d07:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a168068ef8mr79507265e9.0.1791124853178;
        Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 4/6] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sun,  4 Oct 2026 15:40:44 +0100
Message-ID: <20261004144046.391444-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074055_361701_0F540488 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
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
