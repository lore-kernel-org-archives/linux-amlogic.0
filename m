Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09A3C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2EE214AE
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oGaLchH4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eIjUllel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2EE214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=agVS2aW45E61hICpMTxcD1AJdfICO6G6626mNNPTb0U=; b=oGaLchH4ucubOy
	yc4QbOTXRGQm+v3+y15DKoKUWh0Wc0hpuM1wZQj1KuafARFIszS29DFwPu/gHUFpL/tukAbE0BXE0
	3aqNE4i5mfvlx4BtHDmUIY4caHS4BZ6IFXZR+KWOm6/Awidi09PZtlNniUvdGz3PVKPdI2AasLBrj
	x7I8Pr6Jx/3NS6dGcGwXig28wtTkVBm+s4YVgrijaM4Y3FVazJvJEVAee0t53Rzm7sBqyeyF2z0gu
	7cHZo9PWeoPmlm9lLSZkovJ71puVIna4Mlep3qRFT0doWcRZu5XPVZouOwFOGJ8Z3kqhZBMNfZYqB
	dGojlCsy2Swk5hGfMl8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZgdZ-0006fw-IE; Sat, 08 Jun 2019 19:04:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZgdW-0006f0-UB; Sat, 08 Jun 2019 19:04:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id x4so2631340wrt.6;
 Sat, 08 Jun 2019 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jXFcak2cBpexQk8XYN9VwrCjw1WZmHd35NHcnWvlUM=;
 b=eIjUllelamnWeZcriXf4pecRr643goyySvVh2oJM0Dhb5G7lrmEbCequZfHbZbaCmN
 g/qHrO6fzfqlK0ycFPOnUio+yrz8dc0qLpiCnfuXN7M6474V4gNYjCk3aJ+QH4uU++P5
 FrZ92j96kXDKox9o6FBdjE3XYWlEJB/hELgeaW+vykoT3GVOA7Od8zmFN1LBaUoVyBuW
 8+mBMqYndQxBlqJfVE8dgEcuXDIeqqMRcmPZc7WnYlQo/ch83e8I7DUQPQyigBLHu/WU
 9Y2cAe1hPF3l0f5elho+4et2FsznVRtBCpcnT9Y9b/OLWllASSjSaJA7lwm7tQB7KyIq
 VnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jXFcak2cBpexQk8XYN9VwrCjw1WZmHd35NHcnWvlUM=;
 b=ZjfwbbzEXxWcZvGjaUzFjuYd3NfI+YfZ+ce9IB9sKnZEyfkctqsex9cOlZfEUTuG2d
 NRsZBZ3hN8M38OKloDYBJ9oD2bWaHBMcQ8IBkRdYvAteBuC3eL77pCmKv22kamnH5Myt
 OcCIeYyu+V36m6e13tV88x6VQJZRN/GvZYbdi7vzWMlxPofEi1/rgZyNHArpKA42rhvR
 vHPsUmlUxxKG0HTh/Gt4Pt8SyZ/wPUaZr4BQJwAEiZSXrHARlTj6DPkv+MXoM4E1Demp
 KvomvPvUIhG15gTJE0lIPrV9pK596Q7863ywdAVMfuBxjzNNZZmSBlbbrBmAnewdbSMU
 /Qbg==
X-Gm-Message-State: APjAAAWHj4mAJM2b1dwT6/dzh4RXvTjI8WKneBQplWLjDb6/oGZAY/tO
 /MIRD4HH+GcfxfRVamV6tZA=
X-Google-Smtp-Source: APXvYqwG28JNmUgm1CsQro+958rHZ/hNNfAHUq1Xkkz1MmrE6sJADMNYtPLldhD5c8SSB7LZxxUWJA==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr36679469wrr.252.1560020657104; 
 Sat, 08 Jun 2019 12:04:17 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id t6sm5655062wmb.29.2019.06.08.12.04.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 12:04:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Subject: [PATCH v3 0/3] meson-gpio-irqc: Add support for the Meson-G12A SoC
Date: Sat,  8 Jun 2019 21:04:08 +0200
Message-Id: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_120418_975055_87CA2E53 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds GPIO interrupt controller support for Meson-G12A SoCs.
Although the total number of pins is the same as the Meson-AXG SoC, the
GPIO banks and IRQ numbers are different. Add a new compatible string
to avoid confusion when using it.

I am re-sending this update because v2 looked good in my opinion (Xingyu
Chen did good work here) but it never made it into mainline.


Changes since v1 at [1]:
- share the device data with Meson-AXG

Changes since v2 at [2]:
- dropped "Change-Id" from patch #2
- added .dts patch #3 - this should go through Kevin's linux-amlogic
  tree. if required I can re-send it in a separate series


[1] https://lore.kernel.org/lkml/20181203061324.36248-1-xingyu.chen@amlogic.com
[2] https://lore.kernel.org/patchwork/cover/1021232/


Martin Blumenstingl (1):
  arm64: dts: meson: g12a: add the GPIO interrupt controller

Xingyu Chen (2):
  dt-bindings: interrupt-controller: New binding for Meson-G12A SoC
  irqchip/meson-gpio: Add support for Meson-G12A SoC

 .../interrupt-controller/amlogic,meson-gpio-intc.txt     | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi              | 9 +++++++++
 drivers/irqchip/irq-meson-gpio.c                         | 1 +
 3 files changed, 11 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
