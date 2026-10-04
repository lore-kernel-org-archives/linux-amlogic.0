Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DDCA5FF0
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uDWC8psv5IsjDpf9SIAPlvpM2DhAUm0n21L94uAdhw=; b=apDZHy33VK+hcI
	HY/cjpTEAuzaGnAySUhLRLS2wBEq/MRtlRMF2A08beT1BrODUQ9rUuWvh5RNtut1mWGW4cCn6deSf
	Bt6brKqY73a/wrNE2gMdlBTIg3AuUJNhSwb1O/nI0wEkxqG7ZdXKmCfWd8hR+QA09M2n/9Fcki77E
	3CcpMxP1LZ8ppG0ItpjrpfE/T9yNLOPl9ED6rOomI1r6SExQJSAqgi1AGs7mGPtOy2AxkhG5JwvAN
	z5fKbTdYJxL1bUOV2Ivj/NHyATn07BnifDCYS4rWbguiwyfd1+9+Ra3WvVe+R4R+RvrEGv+SuAo/G
	KUxUfvLcSkQIk8jk+kEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOd-0000000EvNP-1k37;
	Sun, 04 Oct 2026 14:40:59 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOb-0000000EvHs-0aab
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:58 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so3877285e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124855; x=1791729655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPOuNv0irDtQ/vuxlu7cI6Ij9jweTS2TW7/WIglbMeA=;
        b=HC4L0uIxzFRQTKq0VRmiE9mlFmCFxF3y8df1FFE7cKtAUlJUg1hBrArSQoS306NM0n
         3Ac+vTi36XrAOluY7e1X/HRqImygN+P2pNTMjw/AYJrlay+zdE9NsbiVYESN2md3Hyf4
         zuMdtjvM/0w04e4kbKFT7EM1DYtSuTEzJZ/7wU+Y+Rmp2BlwIc6pya1zQk3pPpQL325u
         /t1jF26i66owL/gW25ztNZ5fL8ZSPd+Ae+ywaTKJGhmFurIaHsJ+yTEFRZW8m9rifdwe
         BlbXuG2pIYWxhbHwG9WMskDBnQ504rcST4y/bNLEE5CbFzip9YzW7MuuQdAqSZFYJwju
         IWbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgB2nGxatJ8d/602pzsRrNUkfxZ9X0J11YmsFh32M6w4Fg+lPA+PVnonz/UmZ8rWtOWGvtf1iqKBddhb+k@lists.infradead.org
X-Gm-Message-State: AFuF++lkbh0w1VxY7LknbwPj1P5msAPMtxxRS4JsSE9c4tdEy1Kk4WF0
	hRqLTNNQTrz65HobrVsFBA7FXmobNGtCxPrYD0ieRkFLk7w75FXaXLF7
X-Gm-Gg: AYBFou13CThOho+++P/79FOZCtzOU+USXhjha5ZAU0puxgtm1FEbPPUH6w8TpjBcmfN
	6y7h3KbkXF5n/mgMrZuidj28yuMEQpW8dFY9BpQir9FLWHuKgI9wNUChCv3DMHF/+XR/+kMHtSa
	Wt5AJIg3AQk+ajb5YbG1/L9flhTATzKwDZTNUTpvmNy61IV2jFQ51GbG7aOMu0xLPJKu76zRv2S
	BHHo97hGE39TrEKEpvZ4rRUQOzYSuhNslOQsCI7zGe/4AUqGnWOmJUEHxXe8vrQ/YwcgH6bOZJQ
	TfX13NcjaRJMAFd3FeoD8YKBmd0O0YVet5B4K9V7T/XU3iJNykGNQwBTOsZlpt3EvG7yggTpV/4
	NIQoS0FsARlxGsdrqYPVONH6suZxIlsvvJvQQ2uX9oi/8Y+3j06RQNo3/+JzBO4BsY5av9ZRaXi
	HtAnoODhgUYPXwGqLV9Picz1a5xCne/KQ7+z3CxB3FY8EZ+XMsqWkH4qZi1GF6ICueSqtfivGjD
	EdvD8d2DgJcl4bTp3T4xqXT+3rFNPo7qg==
X-Received: by 2002:a05:600c:530e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a027534c46mr153735405e9.6.1791124855450;
        Sun, 04 Oct 2026 07:40:55 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
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
Subject: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sun,  4 Oct 2026 15:40:46 +0100
Message-ID: <20261004144046.391444-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074057_437821_EE014DBB 
X-CRM114-Status: GOOD (  12.91  )
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
PHY. The clock delays RGMII needs are supplied by the MAC rather than
the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
kernel programs.

The PHY interrupt output is wired to GPIOH_6, so describe it and let
link changes be reported instead of polled. The PHY reset pin is driven
by an RC network on the board, not by the SoC, so there is no reset line
to describe.

Tested at 930Mbit/s sustained receive over a minute, with no MAC error
counters moving in either direction.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..5d0365ddde72 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,33 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+
+	/*
+	 * The RGMII clock delays are added by the MAC, so the PHY is
+	 * asked for the mode that adds none.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+	rx-internal-delay-ps = <2000>;
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
