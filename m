Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64057C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3547920855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BzBx4WdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3547920855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gtuVHdtyZHR17nvSsTDcE3NUwqTjkdNVkdkKvdMlkV4=; b=BzBx4WdXOG0lWRKkDAmahzj0Q
	nYq2qvK1f6f1u4mQmw1579k1ASj2nWl+OkClcMKoWWdlrkvQGVvrPIIA633FsBmZ+9GX3S2XtgQNi
	YV/nOIugLQn+qnPbcj2TzfhEe0rfMsJvAsXu66uSUiT75nPZSIh//yAy9oirp3TORl56DAnTg4QV0
	PgbTceivB31qINl2pufoBGq85SpEV8UNHKPS5ok+xCSBQckZubfysWEbQyhmpKZSMnfyyTgXAWVm+
	OZCGked/cf8nCFH/5KF8HRvgqyFYBQwR/LKeF5spMaAnYMDLTWpHdOe5qxygNK3AEdLAojscX9aeB
	x4D/8hYRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yG1-0007tw-Dw; Fri, 21 Aug 2020 04:02:25 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAl-0005Dn-02; Fri, 21 Aug 2020 03:57:16 +0000
Received: by mail-io1-f66.google.com with SMTP id u126so454624iod.12;
 Thu, 20 Aug 2020 20:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/YPThWKebuepD09jEOhLOS7SrW7ksPYY3UHELax/QU=;
 b=U+a725Lgsb1QB+GG32JFc3djoLvTfLhYMzWNVtQtPEXxPQX3OFgcyr/kMoSAmJ9dnP
 7dJnbIJzoVjdW4PBSyjybXo0ZxUtT5rAyUBrMnWO76UlRN7fPj7glXiiN2hZ6hZsc8HG
 POTRVQ5bAKnp/Vwx8OXGuYPhx2JtoDKsRn4TWHukibDcUFkWIeqiOF2kZw1Wz0TFzpSL
 yxeA++WCJe8naVRxdueA6euc8itevxbuKN8Rl3BcdLDxT4aLgm34583Vk5BaLJZudxJU
 HTyMAA8tgnvgeesKzz1gh2glYfZMPGbmM27KWuB7MDmFHXpSquJ3Z70o56qESw4FO991
 osdg==
X-Gm-Message-State: AOAM5332w/2YB7l/2KQwAAdh4d8Dd+NZWEaICt8PRjndXptxM5RxzKW3
 9AJt9ijnEkY4eHDs/OCgGw==
X-Google-Smtp-Source: ABdhPJwTwqsPsKVkMoMEXHOo2cKMWdbZxZdy/oInmh65Y7ywfHBijNwvFaSB2WL1YEbhA5nsNJVKOg==
X-Received: by 2002:a05:6638:1690:: with SMTP id
 f16mr859543jat.91.1597982216882; 
 Thu, 20 Aug 2020 20:56:56 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:56 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 40/40] PCI: dwc: Use DBI accessors
Date: Thu, 20 Aug 2020 21:54:20 -0600
Message-Id: <20200821035420.380495-41-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235659_275228_6BCF00F0 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Dilip Kota <eswara.kota@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Convert the remaining cases of register accesses using dbi_base rather
than dw_pcie_(read|write)[bwl]_dbi accessors.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-spear13xx.c |  8 ++++----
 drivers/pci/controller/dwc/pcie-tegra194.c  | 10 ++++------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 0d8d0fe87f27..e348225f651f 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -86,12 +86,12 @@ static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
 	 * default value in capability register is 512 bytes. So force
 	 * it to 128 here.
 	 */
-	dw_pcie_read(pci->dbi_base + exp_cap_off + PCI_EXP_DEVCTL, 2, &val);
+	val = dw_pcie_readw_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL);
 	val &= ~PCI_EXP_DEVCTL_READRQ;
-	dw_pcie_write(pci->dbi_base + exp_cap_off + PCI_EXP_DEVCTL, 2, val);
+	dw_pcie_writew_dbi(pci, exp_cap_off + PCI_EXP_DEVCTL, val);
 
-	dw_pcie_write(pci->dbi_base + PCI_VENDOR_ID, 2, 0x104A);
-	dw_pcie_write(pci->dbi_base + PCI_DEVICE_ID, 2, 0xCD80);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, 0x104A);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, 0xCD80);
 
 	/* enable ltssm */
 	writel(DEVICE_TYPE_RC | (1 << MISCTRL_EN_ID)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 1560c449757d..aa511ec0d800 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -816,26 +816,24 @@ static void config_gen3_gen4_eq_presets(struct tegra_pcie_dw *pcie)
 
 	/* Program init preset */
 	for (i = 0; i < pcie->num_lanes; i++) {
-		dw_pcie_read(pci->dbi_base + CAP_SPCIE_CAP_OFF
-				 + (i * 2), 2, &val);
+		val = dw_pcie_readw_dbi(pci, CAP_SPCIE_CAP_OFF + (i * 2));
 		val &= ~CAP_SPCIE_CAP_OFF_DSP_TX_PRESET0_MASK;
 		val |= GEN3_GEN4_EQ_PRESET_INIT;
 		val &= ~CAP_SPCIE_CAP_OFF_USP_TX_PRESET0_MASK;
 		val |= (GEN3_GEN4_EQ_PRESET_INIT <<
 			   CAP_SPCIE_CAP_OFF_USP_TX_PRESET0_SHIFT);
-		dw_pcie_write(pci->dbi_base + CAP_SPCIE_CAP_OFF
-				 + (i * 2), 2, val);
+		dw_pcie_writew_dbi(pci, CAP_SPCIE_CAP_OFF + (i * 2), val);
 
 		offset = dw_pcie_find_ext_capability(pci,
 						     PCI_EXT_CAP_ID_PL_16GT) +
 				PCI_PL_16GT_LE_CTRL;
-		dw_pcie_read(pci->dbi_base + offset + i, 1, &val);
+		val = dw_pcie_readb_dbi(pci, offset + i);
 		val &= ~PCI_PL_16GT_LE_CTRL_DSP_TX_PRESET_MASK;
 		val |= GEN3_GEN4_EQ_PRESET_INIT;
 		val &= ~PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK;
 		val |= (GEN3_GEN4_EQ_PRESET_INIT <<
 			PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT);
-		dw_pcie_write(pci->dbi_base + offset + i, 1, val);
+		dw_pcie_writeb_dbi(pci, offset + i, val);
 	}
 
 	val = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
