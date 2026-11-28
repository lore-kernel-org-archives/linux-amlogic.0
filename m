Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3C606A31F
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2026 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y+7wfWW/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tcFfaOOKBICygOg8vAIMVWAI2aznCw7J8CPfTtzhOfQ=; b=Y+7wfWW/Y3uYz7UggNgtpwLdIu
	r9BMOTLtAPosoqQIfodFBSQMDAxvkNw8Bqjif9g0G/JQWGsapJsGON4ITcKeTF9L124h0yvjf0WTZ
	VADG8dOyZaHsBM0Da0VGr6iBOCK0Tg16+N7urx9Tf2u5xwi6wHhOhTKMPAz/HyDFT2uH7a+mZT7jr
	D4hlTGXMcnw2c1V/damwjYOpCC3YbiY8LViHB9TB8wLEbMGNofdmmbCzP6ly6jOZ+d8v3BNwZPoTa
	BH0Pob4oWfiy+HairL82eb91zgaSdwt0iEL9uvNqROzfD/nSlTUdf9QTvyXB7sjes9wiPA3vEhnab
	30kJcBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfm-00000000RPO-1OFQ;
	Sat, 28 Nov 2026 07:16:38 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfQ-00000000RKu-1KE9
	for linux-amlogic@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:17 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so61239755e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 23:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850174; x=1796454974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=Nq2MPch0oISN93gNIW0h+/HBSKnX9kLItXGE8k+y4i16RGvfXU1us5bvAabBQNw3j/
         CqRoYKKYcwk+9sCQohD8UWyieQxvAAyi4mD8/wB/8XVK7488I/I0vYF+DrbVFIn7LC/G
         2HX2fgKOoAnWQzyAhdfNIycEShJVoP1GSkq/y1K9iD5T6Mvh2z9jUh9MsvoTo+eDbK/1
         XsUYOIYv2aa2wyqO51oZxodKqdY98nd17D/nkyk8or8dh3gEPnoq0QDjir8AnY0vfY5Z
         pTbfLJmpV1mKEN45ly7WL+KC0Q/pyHfEwvwyemIJNRAtX2hi14GPd6eHUS5xE7M3SPkE
         xkjA==
X-Forwarded-Encrypted: i=1; AL+hErHvwxqy0yQstk/Kc5wBpqJN+0CHW4YsdQxjW9upUZezCoLx9QX8LE5FDnrzNW6jHQftIqv/pkqmIR7dp/OL@lists.infradead.org
X-Gm-Message-State: APuU4Z+Uo8ScGN4Yyn6i8Wi2JJGLgXXrcQT0+ULvJfzQNw89U/3iNDQs
	Tzd12rk96hPbqJtliY7Z8/fLjIvIRy4fdXZ2VaaojICsOv2SH29mltn2
X-Gm-Gg: AZFdTZflW78YoFJ8wSs2wi2e9qyZYB7sf337W0fg6t7auokjwQqCSr/eoyNccFaW2AX
	gw/OfifL5zOtFJwBScY3A84qtxw2W246zJfR4XUtzMIs44b1u33OYWAB11cjahki7Xtf8bT0NKz
	d1dlMAQmbsK9GAOoN+sfau8kMMy8L+K3tzkVURWmS9+bsrfUdXZpYb1mdM7Frf2kxg6lFz0X5hg
	EefIrxT2nCPtCdmuKqVEitFd65Z/qkVQz0+RuO7kyuR3EzGQ9+RqSFX57Z59WNKlQfs6KdNv7Md
	QghtaUs55Zueb/+zHEed0y1rZaHu9SwVPE4rxNw6qsgOSSsvKXyBqt3yRa52UBlrzodCYkDERLh
	51idkvJD+o9p72ZQJyqTWBIHTHwx83EBUoelQbY0kO1oc+oFcXuekUIGPCuvaJ36clqVHQELlsn
	lRDwLnrRJecxlbAMubMAwKGvH1e/MMR08428Cxy12joyPIbwM8UyX19HbwjmtSTzKbr5rUm4DwO
	qHEBjYu4K8vsOFZPYfSJ3+Vcy05CZP24J0FMr4zrX9/r08lLVOAMxL+Z4+sYLarAtZgQHk6vyFO
	uuxxazSRpsyvklRm20Be5gFuaCpqiqc94vInAt8WFtqiTRIeT4XSWPA4K9g2uBRN2f2tYxHRGWr
	Nkb7wwtk051QkR670WqbgEby+SSCfNhBWDRfmjcMCBslc
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr570429285e9.4.1795850174257;
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:13 -0800 (PST)
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
Subject: [PATCH v9 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 28 Nov 2026 07:16:08 +0000
Message-ID: <20261128071610.27855-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231616_407702_AF2F3958 
X-CRM114-Status: UNSURE (   8.27  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
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
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
