Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397A6C61DCB
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5o155bdH9uLarAv9QLX85hKeWSBAFdYvd1bYszvjXA4=; b=T4P+rxdiylYMd2
	N+lJ2TGxN0/Xzihnpo73A7QU9IlBO4icY+SCdlIycEYn/dOJZ7ALQecgbUpgGw0Y/QqT3qNRiZjNr
	xzoJKyhSGJRCC6zry/fktWijxFn1JDa2BP4YyTglHWl9Dv3dwpkNT4t3EWNKrTxnRtdPBePYX7dwK
	ZPda7LUprbhvUQpkNrP9UYbZj9hBq3zMoQVtoY2FQLrEnXg3u2aaJ+aPiOcO3yid4m6kouW6Jny9e
	pGaGtTf4aobwH7LZ4F3kgsRCuJGb6EudNTHvIinrmPOajusXjxeVesY7Cq6V9Dz7R+18RRIHSD834
	dm9NIy7FvyLT0tr4e7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfS-00000006thE-2Rxu;
	Sat, 29 Aug 2026 09:48:06 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfO-00000006tdt-3Cdf
	for linux-amlogic@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:05 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1073775f8f.0
        for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996881; x=1788601681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGDbub8U4HXvEWoNu7b7TUqir4ckSWpnsJ/08Cf1vHM=;
        b=cClkVOhvJV/pKkYh78mTG2AkyEIGOQw7JzDRoMqzCa2Bqx/MO0B+2tm8LfRAhzm2PQ
         GrjnvGWRR8m6h3lZUJHkYlFtfDcAcj1el+6yUyNsMABWdft8Saq8/CcpXA6zy2FXj4lC
         LM3Cv4vSAOekCe+HCcvuCQsBxFvTu55NNCb2WbqYMFMQP6w5fws7vOcIzOlQ1LhCcSNT
         9lfmKyQl7oZO4ZUQAdV89pB/7DV/hGllWcG2shj0MLxjulOwIdAf6UPEFhynDonsOicA
         hgIlOmUcmXlpaXzgnTsb5X4LoTRYKxTx8oT2U57NKGbEEqYfxL6Y3cm5KfcCm4cP5PVl
         uBhA==
X-Forwarded-Encrypted: i=1; AKwUvBy/y0PCHM3VgE5UdF7E0bmEzEGwYgXvHdiBe9xJOqVltOH+Vzassjx5pxzDY0ce7t2CDUGxt4gIkmyO3E4X@lists.infradead.org
X-Gm-Message-State: AFuF++kaNhy650YbxLaUXg+/ecltYhV+3Z55cw6/8FUj8IjVGPLpIHtw
	pPYj8NJIaRshwwBR1A3HDJfK5Fj7hCmvGhMPQFNTC6Ksof3tK5LQYhwo
X-Gm-Gg: AYBFou3cJ/iLxLp/yvmxl3uS0MHu/tpWoLITCRoZaOwMlmpyQIW4NXWUcWgvCmDcmLf
	Ew9Pa5Q0YWPV5A5Ukya72eFNgJSFGIhtgeqpYIwK9B2JSCD4pkki9hyLs6kzuTETuUySQqyRskq
	2Q1SX9pa0nYcb92CTUkWVbBBs8w/zjAlugewtMbBJB8toVQHxoC2NJU6ZQITQ6BihbEqlABxcmb
	OqMr8/XyzMgn+l3iThnv8igL5/dkm/euuGMah3mCXOMgAvku0+lTnMXV2/eoKACLXlLshw/ikkh
	xpKbWf4SdQ4hGn6RrkzayDkkGpkc2vKQpbarcOnVTMX7JZxioUvVfxd1317qo/kkB2bGuL6h/vF
	yOaOaac87M+G/WH2/ckIeFs/h3VqhWgy1c5Q2NfO/3HtwTrvqdZmLgW+kQL234qCEt5SVW8v4Fs
	vmGmEvBWO+z0BFkfEccIlVoGscR1deMFnkA8xIASm2+8nwNdRfMAH+kwPVU6MzEqfYZfifR07B5
	flpxCPuhBVrDjtQH3Zs/xC/Tfg=
X-Received: by 2002:a05:6000:2207:b0:484:3310:f398 with SMTP id ffacd0b85a97d-4843310f455mr2068417f8f.25.1787996880459;
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/4] clk: meson: t7: keep the memory fabric clocks running
Date: Sat, 29 Aug 2026 10:47:55 +0100
Message-ID: <20260829094758.23248-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024802_856213_37552B98 
X-CRM114-Status: GOOD (  10.37  )
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

Four clocks feed the bus that moves data between the peripherals and
memory. Nothing in Linux claims them, so they were switched off shortly
after boot, and any device that started a transfer after that point
simply stopped. The SD card, which comes up about two seconds in, never
finished reading its identification.

There is no device these clocks belong to, so mark them as always
needed.

Fixes: fab4d651b592 ("clk: meson: t7: add t7 clock peripherals controller driver")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..55d09e78593b 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,11 +945,16 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+/*
+ * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
+ * used for DMA between the peripherals and the DRAM. After the clocks are
+ * disabled, a device that starts a transfer cannot complete it.
+ */
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
-static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	0);
-static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	0);
-static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	0);
+static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
+static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24,	0);
 static T7_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25,	0);
 static T7_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26,	0);
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
