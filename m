Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C157606A68F
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cH4IMPKQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OIRjrsTgcNQJzJmXkp0cQenqaisgM4EnlkHY1tGvfdw=; b=cH4IMPKQp3EhgyWLN9KJJZZd7A
	2W7/9sNf3xkM1O0vs0/X0wZQ9OWHQ2OgSMGdiio5ZxNIM97XLJ9jaEX8yJ2UVBDTqYYrB28NyLYi2
	zT68C8nR3ou6keQOHauFklfFd2N6vBqh7gRlAErg/7t9ojx0jeomNhE3NKleUQZJcpLd9Xa3eI/mt
	f8ygj4mN4PxxI1TR4c/2mrLUEau1DFGr3bQDAizrSBKcVdSO+OhJVzVpFytSeOKxXOJtFRKEMzCfI
	enyUEVSfhS0FeTsr9XCNXMqMuvY/6/gukNZaq7ikBCG/skZUF1/rIQkMmUd6QpOSfunhlICj61wiL
	MTH+2/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfw-00000000LWj-1YZv;
	Sat, 21 Nov 2026 21:31:12 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfq-00000000LTi-2Xfs
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:11 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1805578f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296665; x=1795901465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C93fQcPXxnOGbGKaXQAkMtOoh58jzuHpLH1rCb798RU=;
        b=JKi91jQY84oliC7Prp/L4XEb+4VCgK3v81ozod3LumFo2s5hOKqi562kmBIk7lZ276
         lWk+KjwaKTjltn6fTOHYkjFUrcTTXRf14YPCCGw+aj2JpRobzE/Nco3wvwCXmdeP6IkC
         n3FkGTMEtFdnTk8QMQvWTM9/ktnbPUSkrsRU4N9eLu9ciGJbYfpSonomfF7/HM+7/JDX
         c41OzsIyU+CKQFZTkttuaaAEGKT0d9+rOjnYQ0NikfSPWWD1iXty4QT1PzT1D80COBLE
         XdCVfYhNhf0P0YuxS4I2xU4ZpXMvwP8wq+JzrU7NL3ZYrRH+GV3bkbht1u5xHHuYmlHx
         cxkQ==
X-Forwarded-Encrypted: i=1; AL+hErHf8Le4VRKX+WVyqYgDxPRsYdiZuZ5LcR8VjKNG7aOXYeDiLUCc/S3iefuvMpgUzl+q6yyKu0W+yVErMnA5@lists.infradead.org
X-Gm-Message-State: APuU4Z8ntoALHoUHsvNxMElGN4rGjuWERxKYnV0q/WVbCorpAF+nAKzM
	zA9wRnZJzarJe/PNKU/N9oJ14uUfZhGevxbkNOzJ3aCqjSnvjZXO/44p
X-Gm-Gg: AZFdTZeUmQOo5oqG0InKaizevRllP2dYFJzwSCmR/aw+qje/yUvg3ZTvZyXzFhRIL0/
	pVJrLzc/HbfetNQbfhDoq1YyPIu+MycaN74PEdwbDmeLiqu0eH/gveA70GmVELNIei1FzLIPK5B
	AMEqo8QS8j5WwYVsfDHBfdebTA4mcpJfhcl1x7DaQTJIyfLaWDbjembXJrXWaXNeJK5qA10F9gN
	SEw1hrZSR1TSE30ObfVXs+4ZuDWacUOIDDFJhv5ZEXQ9lk1+07Lm+IIHl7f76zju0AaOcK5Rh7M
	NvIvTsUBrNXUbZmuBsZPaXfoSAKyQZioZEAgc7I0EL2Ok4D5Ce32sS8IV/Gn8J8NeZfJJLWyw6z
	7mx3kS9s0MDse2Cfo+rvJwSx0mrpDS+JO4/iHgM7er53pK5rec6oAHUZMD+NbmiQuQLGvFA00g8
	TiZhsvUhs+VpcHHONvH0ZjGaNVrypYQVe8MIIocT7h1Blaqni3Dk6Ex59SUn2w7/bTpbyFPWD7i
	uhTZjimJU15Bi09e82LLTAcVpIIFXlHKQaxWBAST+jUChybcM/JWaiOjYMAE47SQ8H4UGIoCa7k
	pInC0JDlrrYzU9MllmAobSwoe0XgY1XYRQ3+KnyLNownX+qaali2P3A1NoiHzwVAfY8j4zyC5Vx
	jycr9vez2CJGCLswHorsqlUI=
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr167527095e9.26.1795296664478;
        Sat, 21 Nov 2026 13:31:04 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:03 -0800 (PST)
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
Subject: [PATCH v8 0/4] Add ethernet support for the Amlogic T7
Date: Sat, 21 Nov 2026 21:30:58 +0000
Message-ID: <20261121213102.143130-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133109_859644_37C1AB0C 
X-CRM114-Status: GOOD (  21.60  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patches 1 to 4 of v7, the bindings and the driver, are in net-next:

  2297f88ce0b8 dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
  18029931478b dt-bindings: net: add amlogic,t7-dwmac
  c4c851a3325e net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  4fdc7da7e13d net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7

This version carries the rest: a new binding patch for the MDIO
multiplexer, and the three device tree patches. Patch 1 is for netdev,
patches 2 to 4 for the Amlogic tree; the device tree patches build
without the driver part.

The T7 has the same ethernet glue as the G12A. The glue registers sit
in a block gated by sys_ethphy, so the controller node lists that
clock as "pclk", and the pipeline stage between the controller and the
DRAM has a gate of its own, listed as well. The MDIO multiplexer gets a
T7 compatible with the G12A one as fallback. The VIM4 is plain
rgmii-id, with the PHY at the address its pins strap.

Tested on v7.4-rc2 on the Khadas VIM4 with the PHY at address 1:
941/944Mbit/s with iperf3, no error. A scan of the bus shows the
PHY at 0 and at 1 and nothing else.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v7:
 - patches 1 to 4 of v7 are in net-next and are not resent; the
   numbers below are the new ones
 - new patch 1: the MDIO multiplexer binding gets "amlogic,t7-mdio-mux"
   with the G12A compatible as fallback, and patch 3 uses it in the
   multiplexer node (Martin)
 - patch 4: the VIM4 PHY node uses address 1, where the PHY is strapped;
   address 0 only worked through the RTL8211F broadcast address (Martin)
 - patch 2: Martin's Reviewed-by

Changes since v6:
 - no Assisted-by trailer (Krzysztof)
 - patch 2: the T7 gets a binding file of its own (Rob, Sashiko); the
   pclk description names the glue registers (Krzysztof);
   rx-internal-delay-ps as constraints, default 0, maximum 3000,
   multipleOf 200 (Rob); tx-internal-delay-ps stays false, the
   meta-schema refuses "not" on a top-level property, so the reason is
   a comment above it (Rob); "snps,dwmac" dropped from the compatible
   list (Rob)
 - patch 6: "snps,dwmac" dropped from the node (Rob)
 - patch 4: Andrew's Reviewed-by

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (4):
  dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,g12a-mdio-mux.yaml   |  6 +-
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 88 +++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
