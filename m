Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B5C98331
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=966+A1W7BAvNNn4QXlXUckPqIaSCTgsZqfEj9MLqor8=; b=4irrT/T+icYogi
	lAvD/MCHr+WlxItWM/zXZb6jblVrhTxG8BMwYqP2m9DJyxbcaDZi+ssMNk4ih59HZEyB6cXVYVmeT
	Pb7aur6GPG9OFSPsHaxc8ZmQ1I22rBTSIoOwpTlomg636tbSEz64yQGQ091tTPUb2wr4dkHJChQPq
	UA1NqdMvZso7zd9s8Wa5UWJMl/V+VC7TtlDuXswteFJC0NeF4OprzuvR83bzFqhWI9yYcjzNYoBYv
	mT/bVBb1qOMKPvSQwLCL/Pd2vt5/lp3YLz2M0wkvNhd4vYtjTikYZC6GPthnVvEAW75k7dMQ5D3U/
	iT+AnW9jyILo19FI9UHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUH-0000000C4Q2-0Vmg;
	Mon, 05 Jan 2026 20:47:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUE-0000000C4On-10GQ
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so3654642a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 12:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646052; x=1768250852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=;
        b=kHX93APjzFvnkMVKDTsuwIplw31vWbDjWAS4MLhgUVoxisnKEGOpGOZja7HSmGZBE5
         PSZZjJdN3asyrHCc/8vl/IuoyNKSZrdiCRbRdnxeEUzEM9hRz2cc2g2WKtDzst9rABgk
         nE6k5g4XCM/udy9ATdupuhNP6FsrkJ+w06lAcib0QqW8XN7vht/VZ65J5VMM69dusyx7
         QKq5QDnuGL33aqpdimI1BUc5QUjJr6mp0wdoj2pI1bRUGYmqloGS8sfP0krd+5YKnkxh
         Q1lwRTXnp9ImP2hJ9U52ap9eQ4Rf5s2Tt+OFHp/HaoVw0AzrSdiWgoQcvSUTTuOnXvlj
         7wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646052; x=1768250852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=;
        b=Hf7XFu8Tvkr/iXuv9OrVQDtRWbeXcGTSq2eSk5CknQR9iGCzqTsLa2GADtPpppoGMG
         R083tZCjGpMm7lePylV61lwWQtmCHkgRB6qbCs2+6z+XLMlcrUG/nyxFZog2Qy+r7Leo
         EtNrqNIxDhW2p+T+n/b/PxvKdFpa7hqzfTYe71eBDXdctpsFwTwngWZlC9pfpn03LrpV
         dwO1d64qlcKnxq5ineireY4AoAwe25eqaKN5EfI0ZErbZ9FwhviCsSuqEBE7qQC0AFvz
         2RJiRFzHGyfHXjB56YY2L97S9iLYP9hw/N3I3XYDKCs3rTO8fAc8Lgv3xbF5nqSO7MXU
         sFNg==
X-Gm-Message-State: AOJu0Yw8Y5e4oj6GCeeTQH/fTsVIl96f+pW6hfaJzgzW11L3Gyuwtgbt
	pUNAtG4DWbXHsEefzKjvrDI9riIRg06MMrMd12nptj38ZvWZ7MrhNyaREVTAPQ==
X-Gm-Gg: AY/fxX73DT9C7AkAJufKsvq3W8jEEKAjR3TmC04k9J+RhRz8ovl0uqd0V5J1zLmgVlw
	cIdpcBebu11Nnm08dc5KGhFtukq2CO80BoZ3+XJshLASGFoltYmrCTUK7CU79jlJ8LDY0PVJhi+
	xwA6UKVyf+y7EZCMgSrsMPImxdKXQpyWvXsvw7tZEsFEAEcecGjvpXRrkA8I6w7+HliMKQ+nhEx
	YR4ur+WcFjoQWxSz2J44aOPYboiskgo0j/Vr9VG3PsBwHM/j4OOtVNcPg0hK9+kEcjX+wX/4JMY
	fLUtUE0f/cxtLv9I4R9eIBv9pew8XirlHXjm06JefVIa/ata8JDHXkim/YcRAPICTUbsq/VS77g
	3v5nc9Sm9nLmuoRYZXEcGEZTlq+dhVe+iGUJysZN1dUhzsdCQJQ+GGXLSqxrzNpS3M97KddRJZS
	nXMqpRgJRPCY90THjn4IhppYIzfYS9HPDS87z+yLjmKHYgtjsbmBcpZWOCNayATQCt4za5vwC4d
	CyMjz1poD+KXAi1ZMD/EjFpzJ0WKWD/50T3Mrr5vQ==
X-Google-Smtp-Source: AGHT+IG983985xcXDR9yciOy4mjbs0yhKZ2yFQoVEgq36/qbmuPPSyYeCXHNkblnpNi806zQM2DtvA==
X-Received: by 2002:a17:907:3f9c:b0:b80:3fc4:3762 with SMTP id a640c23a62f3a-b8429892021mr46330366b.1.1767646051708;
        Mon, 05 Jan 2026 12:47:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
Date: Mon,  5 Jan 2026 21:47:07 +0100
Message-ID: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124734_285831_F6CE73FD 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

Hi Jerome,

this series contains two fixes for preventing HDMI PLL OD /8 on
GXL/GXM and G12A/G12B/SM1, like the downstream driver does. See:
- downstream GXBB code: [0]
- downstream GXL/GXM code: [1]
- downstream G12A/G12B/SM1 code: [2]

I have verified this on GXL (Le Potato) by setting HDMI PLL OD1 to 0x3
(which should result in divide-by-8). The resulting frequency reported
by meson-clk-msr is double (meaning: only divide-by-4) compared to what
CCF sees.

These are not critical for now since the CCF code-path for the HDMI PLL
is read-only (as drm/meson directly programs the registers).

Additionally there's a cosmetic fix to use the HHI_HDMI_PLL_CNTL3 macro
instead of calculating HHI_HDMI_PLL_CNTL + 8.


[0] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_clk.c#L505-L627
[1] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_gxl.c#L501-L553
[2] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_g12a.c#L671-L721


Martin Blumenstingl (3):
  clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
  clk: meson: g12a: Limit the HDMI PLL OD to /4
  clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

 drivers/clk/meson/g12a.c | 13 ++++++++++---
 drivers/clk/meson/gxbb.c | 19 +++++++++++++------
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
