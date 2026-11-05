Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB885606D806
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N5YtJ+1N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DfN7JNXYBCxU7ShJFE/LglT8BttT86nnaC8uGut5PcY=; b=N5YtJ+1NxTmoab1HW8RVylfmPq
	fonEhB7LAhTxf3Qp0sCGvDcYpnWckDBKQB4zrW6qnQWbYcxXgosd51r1YYkJXjiVY7e6sFdbTV/cF
	wUHKUHJPDVQ5/TlruVWuugdp+m1fAwKKNnBtr4vD345CHvpifkAEu2AEuHg/+S/2/EOF8rvwL4Sey
	RvFWiFdie3A777vj//RJj/ewm3Z3ySfwgG9ew9EzGBoQcXa5t3kIIZR2QMsJagMizBZa/4UlPq19H
	TIUcThejvzygwEWsDtSpcXbygUPPFniSN5/UKHf0l9Z4StDm2oHoVbQD6loo0VM77FiOIxa2NZ7dY
	I0Le3N1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJe-00000008OBh-2zhX;
	Thu, 05 Nov 2026 10:03:30 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJb-00000008O8v-2lHp
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:29 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so14431205e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 02:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873005; x=1794477805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6cyamQMSGS+vKmEK5CyaNiN3MV88pM7I1W9QX3v1mg=;
        b=x5BEIAAqSIolo17mXEs7RNA1ee9HY8AYdFhrfTW984O+YRIf4Hm56HYwqkfwgvGE44
         DQl9SVva+TArY674aKqoMEs4Nh6qNpB+lOf57G48JL0d+w9ivQxHO6uwISbWn/8jNUML
         o0tsnaDFG93Es5jrwkBXOyniV4GDtVqWk8YxbeDWhnQWR99Oc9shBSvgbDQ9FRXE6vrN
         ozw/o/IbVgiN2nVfqIJ+k62gJ5PJw6UOSa/YNbY/vIAflJt22wAPkjq1WqZQx5aZ+dFv
         SmDHzP2i+vNCSyQFT5h1VOuXp9ERs5L4V478z/BrIYam/tGvVYUad7BmNzjyaC0fdu64
         xISQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL8I6yFKS0K15A+ebuUM9pMdLMnM066qyiqczaFkVPO/lxgrdxMkH5KCB6vhlpWaY7l5q0tnpynnotgPZF@lists.infradead.org
X-Gm-Message-State: APuU4Z92l3oZMlxm1JUNQ7nHXoFLSkRIoC+xGLo9cywx05nwzwKFJbGX
	LhoqYBcnqd3RUufLBy5wl0hQxu+aTqouft36dDppwGPo3BpGzbR3V6sm
X-Gm-Gg: AYBFou1YjtbDT1onPegjBYEZbp9vzE+LfCTGxZbZKKG+BRPjB0R3LyCH6U8aq4fV4J8
	P3ZB+7jb0ZR/37tffU/Rs4fhJBeT3qavPyH7oVGOuiOpxUGpcWWHIpYEna522xHqsL/kW0iMgOR
	HLOWlkfn3urHsCL3RlWrWAfUnKidkW0jsBYsleACKpAdMPzSWHZL4tP+b++/4DCcrJOneG6QTka
	bm+EZV4Z9HHdu8V6QYzf/iILSGMI4zfOng4cyf5rjfimscG+BnkrYJfffirKI6yjSAq68pMYvV2
	kr+akzDFX0m/l4oGV07/lqa8dXRMZouTnIznZ1vPdd4Vaew547qJx9bDOuAcdioqprxxu6P3IFs
	X4bvQ/oPTTXPtS+LjcwllIRd6ZGXUsaReYk54AJTaWvQyraEdey0mX1FHXeTOYLsS007bjF5+US
	o2NkRixpyBQaMa/hb0ertrU1n8nC2jtKLc1nihPnJZih6ouVd0g1337X+w+v6RAioTBHaCO2l4e
	M/Q/WRp3xiWVF0fu1B6Gs2FWnwlGyWLuiIw61+OuGlsjeDYlHrQdIv+ATtjwP0/KRzLmp2krfmg
	unagNm9AtjET+4nMn5o8+p+cBMGmb36Wdyyi14dRyZf/uQDw/QiOa7pZz0s5YQCDY1tA/HBzxlH
	PyitUnjG9dxBO78YGmGSGTuaieg==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr211533235e9.29.1793873004567;
        Thu, 05 Nov 2026 02:03:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:23 -0800 (PST)
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
Subject: [PATCH v6 0/7] Add ethernet support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:15 +0000
Message-ID: <20261105100322.37816-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020327_706559_DCD636BB 
X-CRM114-Status: GOOD (  15.78  )
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

The T7 has the same ethernet glue as the G12A. This adds the binding,
the driver support and the device tree nodes, and enables the port on
the Khadas VIM4.

Two clocks are new. The pipeline stage between the controller and the
DRAM has its own gate, which nothing else claims. The glue registers
sit in a block gated by sys_ethphy, so far claimed only by the MDIO
mux, which probes after the glue is programmed: every write to
PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".

The delays follow ethernet-controller.yaml: phy-mode is never changed,
the PHY adds the 2ns, and the T7 accepts only rx-internal-delay-ps, as
fine tuning. Its TX side is a quarter-period phase selector with no
small step, so tx-internal-delay-ps is not valid for it. The VIM4 is
plain rgmii-id.

Tested on v7.4-rc1 on the Khadas VIM4: 940/941Mbit/s with iperf3, no
CRC error.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

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

Lucas Tanure (7):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 78 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 90 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 ++++++++++++-
 4 files changed, 236 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
