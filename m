Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE07FCA600D
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bUGkh7UVdHX+BLk+JXa87BmsB6CzT7D9FFwO9YxLtE=; b=lPJe6ij5yD3Eqn
	za1ImhCwRzFUWBI/uWUa5jAIFuA/h/ttcWnCivEq1aaNpB+mCLKGwU8ZJMEOE0mCveAq2viHMaH+n
	TFzLaBkvGtQwc5VtYN6iL+4hkJ5nnkQICTWlSPpYuGjALnnsnMmj2bTyB2ZBv8ZvMl27aCInot8sL
	LzFM3RMQLYrkapqPuSmpDNlvz9tdNs8f97wD6SyZcOmspHT3+9MuvRpgawLlE3pUc096AjEyIfVbA
	pWUShnQrP5rAsyZWIc2zGOQ6rss5Nlon016Wwu8wAQZ5r0zx5ozKUlk/Z5guacLdF1llpdQrhFNeO
	NWIo5dLb0DVASEC+KObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz7-00000001wcd-18qv;
	Wed, 07 Oct 2026 08:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz2-00000001wX0-0EKF
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Oct 2026 08:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=; b=jgHqG/wtd4bBWL/1cebORS5yD7
	bDWgbUh+6lJ85tIhe+ewZGDeuUhyVjHN9iZC+pGzYP13XK5rGwTHyM/ipmvcSzDIf1ieqk2l/bPwl
	4KqAjL9dWeb/SJdIT5EuQOEW8lG9plIxNYySmyjZbHuk384Auc+cmtwlB7YN3DT8CZHCJe25e33sf
	rD1fYWtPfhXRYuskti4U7SrIM775denAuU1k0Dgo6IrgstXxvAZQe3jfd8vwClwjgN21TyBPvZywG
	RgnmG3tYaUOh9PqczqTJ3Sgnh9GVbuSRKgCdlgih7QlGhtktdWDBoYRY2Etb2aaAPSx1W3FxtU+uL
	w/5W+vPA==;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEMyw-00000009L12-1daN
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3780005f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361593; x=1791966393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=AQZ7wQMrzEBQSCwzTiLGZEZLz8hx/iRz+WA9j37Cexwkmeq6aj9QqvcA1Hc/+MkcZm
         yZCGtsd7a/5CbWIOGY8ayxpWDNjlX6rNIHL8Ze74XHMm6olGYkzuZBmokzoju2SmDKxd
         QeJfqv+7/NckmwctA8rY/87QkNfadO9jimAu9cRVJcnumqp1WPGFi6Q3tYCED4BgJiSn
         qR5yr+QnMyZto4RqnWQZau9bcQspxvdVwTht2aPB47lIcvcvx7EaiPPnnaQctefT4Znb
         Q6jwFGD8JNe2wQa05mkQ7XsWhfH9DXWg62sQ9UEBFM8N9LXCWCXdQaoqlUmTu4KfDYd8
         FQPg==
X-Forwarded-Encrypted: i=1; AKwUvBynYMXD8i9/RbPuDbElMZohMBjBJHz6+kt1g2so10Vnv88QIO3H5ftiAWX5g+leAS2iEe5VoOE9DwN/yNC7@lists.infradead.org
X-Gm-Message-State: AFq9FYIZJiM3Diu08QW1ZtfKI1AC/jB7cgZ6+ol84MI1HiqcoxxQ92TB
	TtIzi/M9F+UYY5JNPrjVgPAUUdn4vGEYBCYFbaWpl1INtEZAttPLsl63
X-Gm-Gg: AYBFou2Mo5cmSfUd+yWgHTHJyHtoMNuzdqP3lrL2D3GRr0qLkobtgrWfH85KnuB8rmy
	Bv/k//nyxz/8OY7Jq1MEh62P4oGKLL7VBVrvLy7q9hi06SAlC7mgKo0WQ/DG9sQh5XKOXpLrbRZ
	7n3ns38sQJgPl+tk4nyw+zkXmD6c35QNLh+utuU45sS11Gc8ldoCfAN98SPi8gnSmV+JZmI5foP
	RM7So4uVr90gxP9malN+RlfFR0rxATWWOcGpgRUsx/npm2cMrjDy6kQ246M5eAcADEWMg/z827p
	jkajG2oHXkyEo1Yz0HalJfzslGLuUlrH1784zoiR9tHf5caccRoTMDtUyXvuneRV2SN6ANxP1Ag
	u8YuHVdgyUcYR5Bh1mB5NOxeyZOMcmT3s+lPxq7D7b1jBLIbGQdmUdnfCkFScqGHSxCLvrUMqTH
	fwhvLJS1xNsY17IiYFm9vV4cIdZQORYa8kjR288Rg/QKnHPhb1oB+ASRpgXkq89xcnzqGGVUNNz
	A0khHdgpjdnv2jFdmGKHd0/L3DpfB5RTxk=
X-Received: by 2002:a05:6000:989:b0:48c:6955:a603 with SMTP id ffacd0b85a97d-48c7278fd23mr2475124f8f.13.1791361593220;
        Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
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
Subject: [RFC PATCH v2 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Wed,  7 Oct 2026 09:26:25 +0100
Message-ID: <20261007082627.63807-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092634_596334_D2AEAC5E 
X-CRM114-Status: GOOD (  11.73  )
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
