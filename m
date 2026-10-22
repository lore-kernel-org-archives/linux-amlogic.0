Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359360A2625
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NhalM7Qp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/bUGkh7UVdHX+BLk+JXa87BmsB6CzT7D9FFwO9YxLtE=; b=NhalM7QpSdd/Fku3zRMtxFMsbV
	AFvU3xKmpIW5gZSEPD+XKNsiWkbXJWAidsj7w5/mzUFfMQG/fYIf/V3up6HQqqn3aHqZTg1M2c8RJ
	esuPBKxzl0+t5E7qElgmAZtOJqHvV7YcWfGRgTIwMdJ4GYX+UQ6F9AlbxAiZpDzTd78cp6edVZBG9
	6IZo9H8hKcMv97GPynXtQGMx8+U23X8xPRFZIFGkFCg9Cw3Fn5/5p8fuK9CfRszYqXtH6lZ6Jtwzt
	vN+rFfuRrr+rjcRt6ZQmyCuVY+8s/XUwneaXcFIelpc7GVl99SwOnUz1RRiCMQYD/mEVtJsshsl1c
	eCiaEMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3z-0000000EtDc-45cp;
	Thu, 22 Oct 2026 20:07:00 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3t-0000000Et55-161Q
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:54 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so1634525e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699611; x=1793304411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=KCe6hOAbm7/Od5hYxtuOzWZPFv6WFIaIa94asSIJk0IwSsrPQJFVuv3RBElRbAjRZC
         S7vY0QUyj46gMv7ORnvwd3v9JY5FKy8P1yXHI5VPTQqVEp9KGJHyn1YGyy3fCr25hfJL
         c+exacHcTwGH1ssIydmKDa6IssLphM0R70bSGhBkLwUT53w+r5erJFDZMXVXB47nApUF
         j7NNa8BHP3UB/4VfkZDEhESZtYkaoQsuqwQVIPwnTZt0X2WeisVZvQsslehxLYFHmNls
         rANrlCmHXYAG6GohoUBzMN2uzyu9Fu99vM/1mMJGqjSR1U1z9Quw+sDjZiofYA90xSjw
         CHMA==
X-Forwarded-Encrypted: i=1; AKwUvBzD+I6v0poc6Fh0OmE2w8djBPu69l4z2emVtedXvxQgPo5msQT/Iwk7+qU3VNAkc1XU2byCGA7hNR1iN6QG@lists.infradead.org
X-Gm-Message-State: AFq9FYIxE+x12J6EY1l/60+69/n9BqZOHM+BR9N8YNgjxC4xJYweAnV1
	lGn9fQmYOkZvnpKdw5gsg8RqjU9fWrBrCbkNgccEGld2kU5tUgBwbvza
X-Gm-Gg: AYBFou3wzAKRy5mY1iRsY736HvKYqTa4mhDDUX3h6Q9189jmIxBHeUzV9/XeyF3Vga/
	tLVltgb9IADfZBH+q3pzSMt+CBqyTIpqaw4JGSjxAiqQTDiFzwc4MRu27IsPsfLBrw78NrR1Wzk
	lvtjK1wEkXbIEHsTotYSo+PQrh5/g3hhlxNWKmTIVpiw0YXl5l12GKQSg+sE8NuZ1h+GbonBi91
	lHr3zMSLe4XmE7ktx+vHGOpaLexj6efneyjQPHrLJ1WyG21Iie7tNFOP8888y0OoMndZVZf6CzL
	Jyyn8Yc006x1QvGAjsdTH+84wbT6PJ2hiiJcTPQ9j+5Ph77s/dtfgF+5BKnKUGiX6cSE1jAGlBg
	vMlDqJpeG2FUlM3pH1AujzjpGZAOkLdIXjqEOF6sVwy57s172psirBbqafE+EhYXrmFPIWNRfd4
	kqRaG8R1Hw4gfNwXzf28YTn6AZo9colYNFxvykktSoKxboziWHqIR1NcbaYtBKxVTH4W/hRJ6Jf
	3dPOITFQPxs4HCBRHS6pGPLrBm8vcewKQuyp0CMsJtiOT2GMhtbCCD/L8RaFZyxhaYqejbZuK0B
	+hjnuCMDCirzc4eAqGIsx23rerlMO7PnmpHe
X-Received: by 2002:a05:600c:1d0a:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a211f08fedmr1687545e9.24.1792699611517;
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
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
Subject: [PATCH v4 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu, 22 Oct 2026 21:06:38 +0100
Message-ID: <20261022200640.3101932-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130653_334257_EDFF8A13 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
