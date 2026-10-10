Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459C7CA9EC0
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ojb007Eeyk5PPWz45sdU2rvsk5fBQBfJzdl97cv40Ns=; b=3KNq8RdMKHW6i2
	Z1Ep501BLgXafLdnikBeEbMc2NXM3+JbnU09sp2Dg+bHCa/ogSXwKy5JkF3eT2T6Rrvij2ojMI7Pt
	0O6w/ISr2IaU9jezAtA1XYEPiC7xgKmAVNV9EumsArTxfHegP48Wd/f2xup2krr2T5FbgVAiPJFcH
	o2PzFgd73K5p5b7WhZZVpmuOKU1jNyKPk4odWEh+8NkG/SgAkmxvC8ppZFHw6121b6ku+siTh+xeS
	sXnqMyB6J2pPgSi2VMcrjYMJQ0615E51tlBx0RXndzVYZ6vvlROsPhhfn76s06KLs4Bs7IRhKCuX8
	vMgAFmPQwzNU8l0bVPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnD-00000007s0Z-0izw;
	Sat, 10 Oct 2026 10:59:07 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnA-00000007rzB-3ROv
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:06 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-487048857f6so510264f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629943; x=1792234743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/Tw8zZUSYGRUw5ihGSIUwYOzEBFsG+6HaKAhA2ORMw=;
        b=mccutrWHP9602KLosUb/GfrK2t/nE1U/jRedfZkrvXFN5hh2l/A6I3UVpPRIYjq9u+
         FxOVofegL99odfnKrJCPJmQfaMStrlEfZ73z6cZ0cgX0xF2S8o5rA7Fw/4ZJpdZAmnV9
         +HHVZde9U9WjBhXPTnbH46CSOoc8vlkvOaPcl7mZLOHrpUJHuwbpfpjILye32y1staql
         KQf6dJWOHyKWL63Ec8zQboWJ1GeMvKmHWswr/zwCMNPX4l5pHVmspXEMhRM+HvqU6hlr
         8wqXPIMCYeFxQMq/YJ506oQeb/ns+48EnmListh7Hs2RzgxAZACBjuoO8Yo/H25/uiHh
         LlPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdbSf9kVDlMxPYUh/kuOUa9BLKRMblj08Ls0MxnDXN3o1SU2XPA96s2feA2DcA5WeVeU17LUtylHQVdByM@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5o/28Ee8WKwbGcBunEwuT2xjp7/A8khjAv2pPUE+ilWyw8GOM
	9s11n/Sc1nyMaNGuV2hfPxcsbrLLWXZpWYUfOYg7Mb/hZ/stZmcQZddc
X-Gm-Gg: AYBFou0NQxqvN0bnUIbNbQBRZc+47QmYpE19L+7xfe1NML2DFF8TI6cB88VurworxUv
	LXxPcUMfUlL1oWFd2bnyGb/SehD2c5WNKGrIpj4nOMdV//FnIt6mr4BUVhrgtXewfNfd5e6G+MD
	II71fXJhYseobjMYJaYdDj8tOUpZ9NTdvnHHD1hivneYQroJVZYQ8ZpUVnSOjLlJ2Wl13W2Np3z
	+IxlZqWW96UE9eKdpT5Kpk563cmeAmdOl4m+gn1MRWUI9nr7P4pvczWKN5fH8/1kZKg0B1UdFbG
	oSMT8qzKnYV7W4/tccQi7JiFqQgn3RdvnqXbHK0gPnxd5lJp8XQxEBQWa56Lmzq957XXBn+nrue
	vQ46eFOuSOLyJ3BEpzc6l/YoeiZPeVj/VKBAPmbigk66v64p384D+WqzA75dONs4JG+WwsTLzvj
	3UDTlJ2Am2rgLlkP9ZbNghBaoN+68r4UE1wiIfhWanCn6c7Va7IpJoC1TMEcvFilE6Obd2ilGS1
	KLZ/lvPb/TziHSpyBKK9Icn0BDum+gD6qY=
X-Received: by 2002:a5d:6547:0:b0:48a:fd58:a7df with SMTP id ffacd0b85a97d-48dbace0061mr6574489f8f.47.1791629942561;
        Sat, 10 Oct 2026 03:59:02 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:01 -0700 (PDT)
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
Subject: [PATCH v3 0/8] Add ethernet support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:52 +0100
Message-ID: <20261010105900.247342-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035904_863835_41DB897C 
X-CRM114-Status: GOOD (  17.10  )
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
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Two clocks set the T7 apart from the G12A. The controller reaches DRAM
through a pipeline stage with a gate of its own, sys_ampipe_eth;
nothing else claims it, so clk_disable_unused switches it off and
transfers stop. The glue registers sit in a block gated by sys_ethphy,
so far owned only by the MDIO multiplexer, which probes after the
controller has programmed them. Every write to PRG_ETH0/1 was lost and
the port ran on the bootloader's values; v2 passed my tests only
because a debug knob rewrote the register later. The T7 node now owns
that clock as "pclk", which the stmmac core enables before any glue
code runs.

The RGMII delays stay as in v2: phy-mode describes the board, so the
VIM4 is rgmii-id, and the controller adds the transmit delay because
the RTL8211F transmit delay does not work on this board. A sweep of the
controller's receive delay against the CRC counter puts the PHY receive
delay where it should be, about 2.2ns, while the transmit side never
gave a clean link. As Andrew asked, this logic now lives in a T7-only
path, so no other board changes behaviour.

Patch 8 is generic: a table in the informative section of
ethernet-controller.yaml showing who adds each delay for every phy-mode
and property combination. It is independent of the rest and can be
taken separately.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top: 933/935Mbit/s with iperf3,
5s each way, no CRC error in 432k frames, nothing written by hand.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. I will drop or rebase whatever overlaps once we agree.

Changes since v2:
 - the controller-side delays are applied on a T7-only path instead of
   changing every Amlogic board (Andrew); the PHY mode left over comes
   from phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps is checked against the four values the hardware
   has, in the binding and in the driver, instead of being truncated
   (Sashiko)
 - amlogic,tx-delay-ns and amlogic,rx-delay-ns are not valid for the T7
   (Neil, Andrew)
 - the on-chip PHY no longer carries max-speed, phylib reads what the
   chip reports (Andrew); same for the RTL8211F on the VIM4
 - the PHY interrupt line, GPIOH_6, is described on the VIM4 (Sashiko)
 - new: the T7 node owns sys_ethphy as "pclk", see above
 - new patch 8: the delay ownership table in ethernet-controller.yaml
 - no longer RFC
 - Conor's Acked-by dropped from patch 2 and Neil's Reviewed-by from
   patch 6, as both patches changed. Patches 1, 3 and 5 only moved in
   the series, so their tags stay.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (8):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: apply the RGMII delays the T7 way
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
  dt-bindings: net: ethernet-controller: tabulate who adds the RGMII
    delays

 .../bindings/net/amlogic,meson-dwmac.yaml     |  86 ++++++++++---
 .../bindings/net/ethernet-controller.yaml     |  18 +++
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  20 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 120 ++++++++++++++----
 5 files changed, 291 insertions(+), 41 deletions(-)

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
