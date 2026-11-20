Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9660A5BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aD6mrKBK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pVHY+S0u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xN0NkHE6+BmuGTuYQA0oFNLHGPNI0PsmgHsNvRVCU9Y=; b=aD6mrKBKK2aN5lwRZ1NZWdg0iE
	bi4yzYnSh1YzhE9pdImdGkAg5EDesKc3X2+PEua8nhW/O6b+SG7nLQ9qzFod3hmm/Grr0w9QWGKPh
	XfmAWmJtrDluh4d8Ed2v/Bt80vmby1K8lxxWN5wxeaRUCOzWDEyKaOyemE13a+WDpnzpO7ElRRACz
	ow0i9CgmM6zBKQ35jTDIkwANuZAFs2jF62rUwMSs9mOw+GaS708u187pN1hQqdjPmXOfoiQL+UUTl
	WvRyn4boSnvIR7bn2UeBpI5tfK+sy6lMn3RRtTwR1higU/KGWGm9hhEvY6E6SgWdvP3JCmC1jQ8y1
	VpsQC5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOo-0000000F3eS-2jWK;
	Fri, 20 Nov 2026 13:11:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOk-0000000F3aI-3Kp7
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Nov 2026 13:11:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so6633355e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2026 05:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180284; x=1795785084; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=pVHY+S0uzjJsBvf2cqoUx/UrZ/+vYC2HAONqEGfOjgUL3jhElRQQ9OMcYKk0Icc8Bh
         eIBcTAroFRstOv/Z/ae0coLkFYjJq0F3Kqpm+BBLufq17A01Xif1ltJw51klQUJ3JoKe
         LCeN/TrpNQmW94tRcptvKipLHBa/c5QRsbhplglupNKroSAd9O3Oo1T58xKGU4CuB/tB
         pIWgr3DisYBjljA/5p2HzFf4cFlAtSN7kmlLFQH1x2RFKfc225Z3unnIOtdaakIXdX8G
         2EDPXrgkoQsKu9V6LoGQZTY27Q4we6sH/azJ5zLeAUWlJ9qBx+sG7/oTF9VLrTS6XwYI
         7BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180284; x=1795785084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=Eja+5Kb6y9Gpt9+hkEsGGjU1qRgzBdwzVd+AMnUxyz90t7I++dZc+xq3Db4c8HsM85
         +Z7Tu44iTMYiyKueLKKVLC8BYKRmK9fHlSvTFlcvyuoBnKBOAnmxsLuM/QChoftxutzU
         T+ZrDefvoejQuRSDOZ57mh4DS+zfiYGNCqq0GsSfbYGaQQbdXlqGUDZypFtxIybj3ZvL
         2Qca8QkSiyr0fab/PwgGi43hmOtB+4hcCTzVsqcskuvPJr6LMWreIo6EMdRMstTr33hb
         /Bu1AyV6CsCxpmm38xuFk+NlLtGNFRU0U0eUCUDFcriwRTTCSCt1Lu9yB56t2BplTBAG
         pfDQ==
X-Forwarded-Encrypted: i=1; AL+hErHZMDBTnSL3AkHtu9AWUEcBxaHEp990/7g9W9wVQzO0CNZdnS5z4v0qvo4+S1I2yFWPiT0HqdRYzAvergNe@lists.infradead.org
X-Gm-Message-State: APuU4Z9FimTxYQ7S1cH08+S7lp+TUboI33T68vxfAZ0T77OKPzIxoR1J
	8sYTvXaX28DP60sszkbLDuQQ2zSWbydNOPuKynrArASHYfAN3SpbgKPzclF4RR5BxGg=
X-Gm-Gg: AYBFou0SyT4SZjGL6nb5kKvlxmylizmQIg4MWI0KrqXmjqmDeypQzRKAZWPuQ0opoxA
	k1XwrvEzHKrCNShGRuAC+NFRR2GlMyIVl6v630kWyAdY1IsKT4j1Rn8zCadHwbo0u0315ATaZwV
	B95/ayPleftIrujyfLhKadDjHWWN0PuvhzQV8vMIIN41CRerAY1u+qq1bTHrVD3vb6qr1VRuf6u
	HD2kWTCs/ApJEZm91SnFL1VAqtNqwEJKSdbOkgPydb/Ngp5DHaUgGnVJGay+OzsbGSnZjaHa243
	kRMvhugDlTk5lFPPW6r1Gj+fbNc5VwtVf7gTupmHlgIwYvA7MYG8ultW3MFM7Jh/PppuXkQ/fsS
	PJIpW8b2NpvECcuE1+03fL6d03fapYINPXu0xEF+ppyYQJcE2XDGmf9mFDKMs1VlIuujh2UmRlU
	iiR8LyKYGKdgbPvvSfUz/dPoDdXZiTRHrRgwqd8AWOmO3bgkvPyNNUJvUUuLG2VrKCbftG1FJHK
	/PWPw6wy8KV8rpBLMtSukD3EsiZnxVmDet6RzkG3c2+KMKwt6w7JXg1lFB+0tN5Os4JETiXhu4A
	+UNhAKMtfd8n1w0TcnCzG4OQTqzXZNbaFi7exKD1Ya52J1chD6vivacceBjPoARiAKqUfk7DELt
	dvQAcwMPS3DuSZJqiHAzBMiZMAjBMNeTAEA3apC6LSIya3g==
X-Received: by 2002:a05:600c:6749:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb8881b52dmr64713635e9.23.1795180284211;
        Fri, 20 Nov 2026 05:11:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:22 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Date: Fri, 20 Nov 2026 14:11:03 +0100
Message-Id: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WOyw6CMBBFf4V0bU1bQklc+R+GRR9TGeVlW4iE8
 O8WMHHhYhZncueeWUgAjxDIJVuIhwkD9l0CccqIqVV3B4o2MRFMSJ6GjkOIHlRLQ0lN86S50yB
 dnstCWJKuBg8O33vjrTo4jPoBJm4134SH15hU8RerMcTez/sfE9+2h5Kzf+XEKaOlLRi3UkjB3
 VWruUHt4Wz6llTrun4AhMrrGdgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_051126_860853_294B3EC6 
X-CRM114-Status: GOOD (  10.46  )
X-Spam-Score: -2.1 (--)
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

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the PLL clock controller and the peripherals clock
controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

---
Changes in v2:
- Drop the SCMI clock IDs patch: the IDs move to the DT series and the
  binding examples use raw SCMI clock cells (Conor, Jerome)
- Use exclusive or for the active-low reset (Jerome)
- Use absolute addresses in the binding examples (Conor)
- Rename the HIFI PLL to HIFI0, as in the datasheet (Jerome)
- Model div0p5 of the GP0, HIFI0 and HIFI1 PLLs as a read-only divider
  instead of a fixed /2 (Jerome)
- Swap the VCO and div0p5 clock IDs of each PLL, so the VCO init runs
  before the div0p5 divider reads its register (Jerome)
- Drop CLK_MESON_PLL_NOINIT_ENABLED from the HIFI0 and HIFI1 PLLs (Jerome)
- Declare one clock per line in the fclk macros and drop the default
  GP0 frac_max (Jerome)
- Clarify the fclk_en and HDMIPLL_CTRL2 comments (Jerome)
- Say why PWM H and J are read-only (Jerome)
- Fold the video and eth_rmii clocks with the composite helpers and
  local macros (Jerome)
- Add Conor's Acked-by and Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com

---
Carlo Caione (6):
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  125 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   71 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   51 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 1637 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  696 +++++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 10 files changed, 2885 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
