Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3763DCA5FF6
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nnVd1u3VMD09ivYdelnDMXEREA9O8I1KztvsozZLMy4=; b=RatT9dgqUuTIUz
	975RyblpWqi+DhQ1hOD6XBLqHJV5/eCgo87O0VhDOroLdzcIi/Dxzr9NFYpfI2yGcxg9hYdSPs+tn
	brdUyw9wDnWv5saivcgBO/YyRNalhiIc8uQ8ufiqLz94PO/Bt0vJg8NDnAd5+xnHl+cIYl+W1gO5L
	4JYrFbmMTxZMOwn6rJpGfWzt/BquMsYu79xO5XiDPDNUNqr1T4tC4Lk/Rkaqfj2GdSILoAzmkIUHl
	mmSFPYhyMVuPhQXnwo2A1Cx0HKkpX1+s2xrZN7kcdPoERtDA06ccbid+5hBtuTklFr9XUoTQdRP0h
	TRymTM3S5cuTiWQlAKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOW-0000000EvEo-49EI;
	Sun, 04 Oct 2026 14:40:52 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOU-0000000EvD2-18ts
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:52 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so10098275e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124848; x=1791729648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rz6cs/vR0NyABn879K1Wzb/x9NhXjaOpqMscA8F5jZQ=;
        b=GXYl6kGjBalk5Ju0B5w5uvN2UXCTMY5gR9h95iVKPpXbv+L5bber/PB4gMaYn2rStk
         Sjubh3sji+L+TL+N3/18R0l3PdQZaV/HJQt5GOCauUCGbnOWTCc8YPRUv4l4tDVgWoiD
         tO58zMi6AUT1e5k1//8zbUc55AkuqeLe1wTv0qyRH4pNz43czoFYSF1j7EtglbRgnTG1
         Cc+8U9Ijw52PT3DhXosh6Wb0D8eXHOXEVoFBOVjLl7gEJxuUlP8BxzufSsZtGB7Pv4YB
         oPLbb0RtUHZORw/aFCB1oSdFDY+1oKJD9GJ3kEEma9zn5kdKsCyMkLpIaM/jTI7oJfZ4
         CM9Q==
X-Forwarded-Encrypted: i=1; AKwUvByRT/n+IMCzIva7C5B2JQA6qFuRndmezqamH9oWVXiV3GuMbk0Etcu4JGkY8QFNOpCfup4kyR1FUjX2Wov7@lists.infradead.org
X-Gm-Message-State: AFuF++lB1fV22AwVVY4wRHi0xDrwNltuIpUmg1E4gPEAiyZHfZXsqtea
	a2jVEBUwLRjfA9akEXIVHNMKyA9jfqCC1GrYcOReUpF3TZ3J3QcVFWZX
X-Gm-Gg: AYBFou3VAvXNcbxdiffXDnnh8/D6yr/uQke/9wDt/apgY5Tpb0dZhOqP8U9MWIngNcq
	ao9jjlJq/9ESp+6ABNoC4nULs9FP88pkFMTMxzzdiLibv9RWEK6wgb16LMBJsn7wcM1QexPsqGg
	moN4kdrf3Z9NL/SeQ/Gnny/myc7a+S4Fw7Oxvzu3xGO8qeWReNnoUrNOclglfgebYT08VrCCPFI
	niRSWmq8ap+5WppDN+XsOlL2KkTRZNMzWIVXZ2NZEi5FSdm/P87LUfs13TEnZ6U1KvNGIbCPZ6A
	ugZqOGpHDTm/973ZcvaaBTUZm/w+x6+Mxgu2YSkWqzYTCR8S+2nB38fiuhbKxsipxVaeCvhcyqq
	rpal2rv/nSfmmwkdwYQ1C4FMs1lyDZrJKqhAoy/Ej1ja2xxG5b8TrEpa/mit251A0SxQSH/nmoC
	AZS+9vP0vLbZ0PpqLceZaTjko/yzZpb6muXp7bfxSUaSrfgZosfyeRGVBDDV8BQQzW3n14u5K4U
	ESLUm/BvgxEm+M/lO+8JDF/B7mJoeSDhg==
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr88402605e9.2.1791124847899;
        Sun, 04 Oct 2026 07:40:47 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:47 -0700 (PDT)
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
Subject: [RFC PATCH 0/6] Add ethernet support for the Amlogic T7
Date: Sun,  4 Oct 2026 15:40:40 +0100
Message-ID: <20261004144046.391444-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074050_329225_F20D50EC 
X-CRM114-Status: GOOD (  13.45  )
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

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it, so the port could not be used.

This adds the binding, the driver support and the device tree nodes, and
enables the port on the Khadas VIM4, which has an external RTL8211F over
RGMII.

What is not like the G12A: the controller reaches DRAM through a
pipeline stage with a gate of its own, sys_ampipe_eth. Nothing else
needs that gate, so clk_disable_unused switches it off and transfers
stop. The T7 therefore gets its own clock list, with the gate as a
fourth entry, and the driver requires it. The MMC controllers on this
SoC have the same arrangement, and that fix is already upstream.

Tested on next-20261002 on a VIM4, with "clk: meson: t7: keep the memory
fabric clocks running" (clk-meson-next) applied on top. That patch is
needed before any DMA on this SoC works. With unused clocks being
disabled normally, the port comes up at 1Gbit/s, 930Mbit/s sustained
receive, and no MAC error counters move.

This overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback,
snps,dwmac-4.00 and three clocks. On my board the MAC reports Synopsys
ID 0x51, which is DWMAC_CORE_5_10 in common.h, and the port does not
survive the unused clock sweep without the pipeline gate. I am sending
this so the code is on the list, not to race, and I will drop or rebase
whatever overlaps once we agree. Patch 1 is the oneOf rewrite Conor
asked for on that thread.

Lucas Tanure (6):
  dt-bindings: net: amlogic,meson-dwmac: spell out the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 77 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 87 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 ++++
 4 files changed, 196 insertions(+), 15 deletions(-)


base-commit: f0406245cb9855e6318335a8a223551354291a46
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
