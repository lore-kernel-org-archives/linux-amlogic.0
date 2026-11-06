Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBB3606EEA7
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=garQaCCN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bvIGDCoc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a6jTajjSrtssrBDGp6GSLXIIU7PkhXzclEicH4pYuEU=; b=garQaCCNV+pX/3oXOAloJts1ZF
	2y5MBF3686XTijo8oLjNW2Y+YD1wCzEv9JMog7lCezToWIixiFV2kpA5JfOra8bWWeavuN8EH9W2m
	aviiXHLe0puVVQBpG7vIg90tu5cvTIZQ2M3y/Vpq2q/4I/Da5+E6Qn4WMl2uQFQDFEckzg7KYtWsa
	6dJ3qlDQJxheJDdTwbkPiZcRFD0paQ/Kvio5F6sztxaZ14FA/f77+1nInAYdXrMR3Jfhi2FqCea7i
	MtzlXWq/mub6FpinhHWca4PA0f6ac9zzgcNkSZT/6+5ZJmiY4nxGnn7jrmDnBZc1z+KRq67t1m4GC
	5eIvhYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLL-0000000BZhS-0nPZ;
	Fri, 06 Nov 2026 08:30:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLH-0000000BZcz-36b1
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2602725e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953833; x=1794558633; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=bvIGDCocZBX1Nkc9yZ9ZcONpngNo1ivdE/dbX1+zz3WbloE+6Nss723RjiWUy7L8j0
         XGBiO1CHUd7nDlld3U2R5HkKu6nqc3QExSucFKJCyK/b6r8g5Kb/Ney6aVTPFES+LO1L
         KmNffth9NO9yoWw/K8uzHpmf0BkcNUXeOw0q2IfFu91vlaBL9tUPkYokwuqby5M9zKtl
         a7FzJk9gY+Q2RJsPwWEPnAcV70bpkGu4iKNBbAMfJS9GQYm/0q95dRoDrGNEFQ9OcHPl
         ujWkkfJe2c2k2jHrgvjJgDEISIjMk0FE4heMz/+n8IEHE/cQBdOqmqKGGPtCgD7xFc26
         Kx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953833; x=1794558633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=sSy8Lr7Zs04AGJf4MsDHGG4GwfVFezUNTNyPglapXPpBwmoZMkFY2aStnZ+VtmbMCG
         SIvRRo+Ct9L0Jie8+T1mDJHU0E7ER6BLvwb3JI4KGAB0ORpPd6YX0mZBnOUVFzsVgvjJ
         51cf+Udrs4rUUShqXeUF1gXDdUldVWvJtT7jLZBOekdaZ65C2sCwbnDmGrpL3DpgxCul
         EsOclg7qenZmzXHkk/Ftj3eXUJOhC0nmRuTNAMcKvSawPA9nzUI9MJuE6S2S2L2Yg5fZ
         MbEisZ6JUrpGrrm1URWOWGB2RDfOW3TEUGhm7gSMziaY0fWuy43uY0eeXyA7VZzigEO/
         T9LQ==
X-Forwarded-Encrypted: i=1; AKwUvByK5QtLGBUhCiIXXzuic/+KlqWaJbfZrJ/XVe+PWWGYMSejraSZOj4Qww9sY1Rwj0QeQwrIZyP8Th1Wsp3p@lists.infradead.org
X-Gm-Message-State: APuU4Z8/3yZwQc3+i1uitXWGkx7le24pSxovDOO6m/89EezXLsJINFKC
	gUXRIH+teMwQnNWDeUrA8i7ZH6ZY6pzgb5HPfdPEEMqWrHOhhjSOqP237sXGQYG2k58=
X-Gm-Gg: AYBFou1CCOdpmqKGMBcWkIIYe06QQaO6vnthGSkWvT/Ksx2qSh1Ys/ztPjewN3c72FS
	/26BZAJds2qwPA5PN8RQLV+6XvBwzf9uMvOsAtGknjGI9g8RBb3Hw9/9qh+JJmSaY6iq+hx/gCZ
	f+6HpWvV7BNhhV8IGFTB/sGP2rWvg9lQPR65l5/1EzgV2A1J7oZpqW8bpYZeIWmU+4Ih7sKfsf5
	+qDKIOeak2xa+SJHR27EwpHTlcJ/dDJq1gw+UsWAOc3w6fK1jUV62FGQbLPXMK+/w9TXxMoBme9
	sVtn1Nak+qHzKHJG81g9O3MGPpG5sg2tF8+zPfe8Dcp8EmCAyBZ72dvKbzH6hPkL5TN+1WDyesm
	klWi1h4a0UIHj3IUcdJeRmkhVgwEOMRy7E8Ij5zHQX4x0AHYmlgAdXB6SXT0sPbRYubqoDNS3zx
	E6xE2Xt3X03RmUqS7635j4VLE6eI1L3qqnuMTysjgaZRWDcnfERn4oruvEEhNN+EUcABLOLKPjZ
	2hUJ8S0eHKxdpRpFSqL9vet/G9BgkPhu/rtlpIpZbgFZm4A2MpGW1ZXpHcCJlzmz7H+FHUSwh/z
	QS8cHKYGHkP8n24HKwfx7WyvVftW96Js1oCLSid/4djFjiuo3D+U0ebL9ngRydjsxlcE+wUfl8e
	0M657PYjt0QpdossQhVBWKlmosdFreC3tyyzvcpCNj0+xeWyiUg/zycDiOldjYKf3hy4=
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr17693885e9.13.1793953832731;
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/7] Add Amlogic S7 clock controllers
Date: Fri, 06 Nov 2026 09:30:23 +0100
Message-Id: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINYtLSguKUpNzNUtNtdNzsnWNU5LSjVLMzY2MzVKUQLqKihKTcusAJs
 YHQvhF5cmZaUml4CMgaooSi0sBVpVAlVWWwsAYXNdmIgAAAA=
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003035_861388_B75E7935 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
(S905Y5, S805X3): the IDs of the clocks the firmware exposes over SCMI,
the PLL clock controller and the peripherals clock controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

The new clock headers are covered by MAINTAINERS once [1] is applied.

[1] https://lore.kernel.org/all/20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com/

---
Carlo Caione (7):
      dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  126 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   73 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   52 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 2149 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  648 ++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h   |   27 +
 11 files changed, 3380 insertions(+), 15 deletions(-)
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
