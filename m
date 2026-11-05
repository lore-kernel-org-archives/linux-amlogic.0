Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D186D606A331
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YILRTuzw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/bUGkh7UVdHX+BLk+JXa87BmsB6CzT7D9FFwO9YxLtE=; b=YILRTuzwZ+BC5Bz6fX/T+333G+
	cYENk//lMiUYWb5gFNZs6lg3xsHoQJNztFnEUklZUXehecaqkHhb5ZFebXDj5GnSMt0rfhsH7bsm8
	oXfbgyEZ5fojrQ2VLyUtJ8YU+4xxkBYDA+Y+bab9/OPU5w1pHlXPFM2dFUbXMRJ2Qwf7rhwa+DgNA
	mzI5TBPe1KpLs5+iz0MbtEygw6E/Ij811cQ0F1wqSXZtkiQjowEKiAo2aIM4VOeBzgmnMzaeJlrI4
	BYOwl72lM5Aw+Fyk/9Oh7hMsTtZxzv1hppmGTVwtjYFDiEPwZTzY3HHqta5Iitd7WAwcTMIfW19+x
	noE70vVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJv-00000008OUb-1csD;
	Thu, 05 Nov 2026 10:03:47 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJh-00000008OCq-20Vc
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:35 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12133135e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873011; x=1794477811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=fHPWPV0TeAH0cDAf8UPKkLGMA0CPMDOVYO5cp/oFIzmk2tzjPBvBGC0Z6GzMPIsesz
         JB0IE/KiE6CZorMrIA4ecuuRvzDwzeRenevJB1ID6rtQrsTGavS68w/QUyLtDOA6pZHX
         wo5DaFnJpXR1BWgb2JNGJYxg9BkZ5iUqOC448Wh8dMa0kWrozZt7iat6eqAgLGIx13N3
         CF84KHZ7Cj+YhXO+OB7UTyvL4lXlZ/6Xtk5dtDZJpodeSUBaAJfYRxHe7OvJ5ZIqWcr/
         mD6U0x6zt8o7CL4Y5ZP3p8DvFfCxR2ED4FyL66lm9UTEXvDm9ntzPIOJTsToF+yVHLa8
         dSAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKGCFhKC2gbSezq3Ts0LgVAcs0+rOOCfQsx13d4ZFTtjPJjKWERBb5+mfZ/y0NNdFPe3rK1jpj4mkslihn@lists.infradead.org
X-Gm-Message-State: APuU4Z/jx8yjj0W+EFyTPf9/cMnzFqEYF89CMk3pWwINagaCx3tgpni3
	hKd4iY1OHvlKU2uXHvj660Hu5RGZg70sto+ssoB2c/YzGLcZdqFK3uMp
X-Gm-Gg: AYBFou2fGiTaLgu1eYGIIA5umltRQ6tligawlDjabtcMZDl6dnabFInEpZCBX2Bvx0l
	rtk1pbKwg6NF6b0yWoHq3uEvQZpw0rOijLja36WzD2Cg+k7HTpzoQg94CFB5lZuH0geuq7042lt
	HcZv5AGdZfHm8sYJf0oAGuankF7yQ7X23GI+TBMBCl6Aq2LjGJOtPeSIAtjChFJJ8BHcei+L5l2
	7JeVtg5CSY0lLhnRTtBnJ7x5gfYwuYQcgrKU7has0/wEVExaYK4IgvwO4TK80M76Qt7TEtuJI6W
	VyJ5u/0Qgk9jIhiRx/R/Ay4bXd+mDnLM4MC8TGuUndqetTHkww8K6KbH+4doq/oVeNzm9iqVdqn
	g/q3Sm785F4PJhS+SgXM0W3CLY4tPpurtDNsDkTfZ9e/zKQ2PLyfXQL9mV2iGA/V9y7Od//RaTw
	af+k/oFw8gVPzfuM78ZqUZQgm7nEw+UfrBNsowy1MI9UFhCKJXWSfHmymPk0TZunnWx5jNCJfCy
	+gp/BNvBXFuJLWDYz9tejV3uKvnqrCVBbxBrRBpCAN2bc062ZY6MIukxHh4lyWsz8mCKAJkkxxj
	LEpE35KxcfNgAoR8OIIdTZaKkDtOQ5393IWbSBeJd6/7731gKlnx2z1/oHlgKrkeVgtHGQlf3Fk
	a0IZYxJIlG656HXFpP4WDhGqd6Q==
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr430949735e9.13.1793873011464;
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
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
Subject: [PATCH v6 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu,  5 Nov 2026 10:03:20 +0000
Message-ID: <20261105100322.37816-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020333_597344_4CFE6BF0 
X-CRM114-Status: UNSURE (   9.35  )
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
