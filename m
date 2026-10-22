Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E847660A380F
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HqLRfhdv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wcq2r5LSyMAAeI0Ixo6ZkJYhHtpeasSdf8LaFQ0SbrU=; b=HqLRfhdvbDoeRN5g8mBCtldCAJ
	zieO75EZIaAziMdsTyTWMR5nN87hb4tfFHOwBPfL056S0Brcti1sOdalJLlilkPucIWDY16dR8ZGT
	kL0sgjZT6V8Q9Ne1+Z7vtR9KzmDRQsciLeQygDY8d1AMPs6Hln1mrAglT7DUCDWV/40cLOsqtI8rO
	CPFIrQfQUPvZtOEXxxYFKM51lnXTipuyK/dN0L/q+auNYsUU/GVEuuRvTGPcL2K/vuNaWiqGvLY3s
	RViml7Zr+XK59NGyf0Oe1508mqbWaPqUuGSlNekbBN63zW3ORbXcB3SDMzrrr4iAcR08ScdwSiA9X
	TJmqi7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3q-0000000Et3a-1SCr;
	Thu, 22 Oct 2026 20:06:50 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3o-0000000Et1s-1iO3
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:49 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20803a757so1050635e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699606; x=1793304406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlLc/FPyLGvA2r8haINizk1+kzXPPQVxnilYmb128Q0=;
        b=Bw/mU1Nr7Yam9x7RY8rtrsdhf4DpzDvfsW07hoLY4DMP+5WtMGPEFjT/vr34O/Fcpe
         PV6dsUlfW1TO5rdh3mPuNYpKMo3qo29BJZRtaMiQdWWr/Q56tB1zUgKj1PRS617CPzJA
         alo3cH0Y74c32suNyoBrSTZs8vKoMlBPWnBi8ww5UmdGWSWbpzLW2UBePzmU5LljCz6Z
         zwffbYs6qcfrEWvRTNaXuRsztv1d60Ksa6iAg3iGZ9k0905oJEdWHTA5Ns6CMptJY106
         6YFZuDCPxUL3kPiyqfqSLp6no6Y15D/jYbmxN1a4TU+9K9Xllw7JlrkrpU4jssIiUnc7
         gxvw==
X-Forwarded-Encrypted: i=1; AKwUvBxt/NJV0TanyAo7XSu2ut9+8qjNEcHyUwcKR5A2PrC1HnUsQu7z5RftoHsRFt+ovmzYSeHyWdWu4Iy9NWBE@lists.infradead.org
X-Gm-Message-State: AFq9FYJm0FMsGcWv0JRX6IrcJbt6g8k5Lzb7CS069ClFfgMGThwYairE
	Ph5t/dDonBVYihhBMb73/hKWGV6+mL2HEBM9B6v1Q2pjYoaovMeetLv4
X-Gm-Gg: AYBFou2TgM2a9RJKxXq1h08CLGh2BE1Kdey6KjTOZcgP2L0goNHZ/zWycuGourjqhMh
	F16OOw04ZXLSTOG/rXG9fy9IPiQ8GM51kG/VieQ+C5mDrYR3tAQRUJ4DpOtj+NAepBZG3g8yCcB
	iyjiz6jD2chx97PuI3LL3pvjZ/dMFIpv3YUOTT1sVfKmC1IBv2EnDoWut7UjWMV32GcgHHOg8CT
	hmnEp1JoErlgwQOuiT2meqFld1FKo5fVQMGJgGdELWggFU19/FdypweOlL04RoIpxT1CMJelQrn
	93Wa3vEZWZImxqmS4SEzzTdw2pdOqt2qk2S7XiBnc0BfQ2p5WpFIaMF56T/cfOcnxwLiDaNm/aZ
	F6FEvOaaoBUerGipi8kGvLE2WJfgu/MbLWCsesupvydWhtIqC2UAWCKldsbaYLhMkCLucWcDncg
	GgAryIcKvEBHVyHBvymHFA+A0KKRmYsFfcCaBRYC8uB2TgcKkdSURYCrFPCrcL8pMp7MICpQPQ/
	+m2iBcgh0BNI1Pbcea2lVYqUq101OJqgYjRgOBn4Wrsa/HS9GGtk6GIK4fM16+9CVqVh2hlRZDa
	m/HgMjFGjn1j8a0=
X-Received: by 2002:a05:600c:3114:b0:4a1:a39b:e75b with SMTP id 5b1f17b1804b1-4a211cb296bmr2188745e9.21.1792699606184;
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:45 -0700 (PDT)
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
Subject: [PATCH v4 0/7] Add ethernet support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:33 +0100
Message-ID: <20261022200640.3101932-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130648_576384_825462B5 
X-CRM114-Status: GOOD (  15.86  )
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
plain rgmii-id. v3 said the RTL8211F TX delay did not work; that test
ran with the glue registers gated, so the bootloader's MAC TX delay
stayed on and the link had 4ns on TX.

Tested on v7.3-4494-g2a08195e4db5 plus "clk: meson: t7: keep the
memory fabric clocks running" (clk-meson-next): 940/941Mbit/s with
iperf3, no CRC error in 421k frames.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7
 - 0 dropped from rx-internal-delay-ps; vendor delay
   properties explicitly false for the T7
 - init_delays callback; the old parsing moved into the older-SoC
   function, marked not for new SoCs; patch 4 renamed
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

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

 .../bindings/net/amlogic,meson-dwmac.yaml     |  89 +++++++++--
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  19 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 139 +++++++++++++-----
 4 files changed, 284 insertions(+), 51 deletions(-)

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
