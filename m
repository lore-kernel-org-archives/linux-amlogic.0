Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96644C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F97B24823
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f6C4vNGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F97B24823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vdkm92T8M3NKXpFG2BCvoFG4epXI6gC7/Q6uTdtPC/A=; b=f6C4vNGGDbHv2jZbMWAU95888
	mNG7dtrpdCxc9Dk5fUSm00MDOx9YUF8WMYcKXpe/7K78MTXdlA884lkDg7PQGfM1f4A8Fq65Umiwy
	hqAWFkneac9XorYXNukBic9+sbZEWJEcYy0rPjyHTznoB4Eek4NVTnL7DFVB/XtxrH+K0kgDrwy82
	o2lE4UEqBg4/mIjxOGWZDmYC8DSKJ0Ou/kLKqfLDIARYT4wvP7DRtPPBUaOmzCRqUjSIWWED1IjVF
	wi5jr0AwBJsyy56t+Upc1yzNYmVHQt8K/Q/4pfHBP+QETZBg4bZVwpdk0OrfFRvMQ0zHR4falyTpC
	6IrqZyGkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsMI-0000t0-66; Wed, 28 Oct 2020 20:47:50 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLa-0000eA-FR
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:47:12 +0000
Received: by mail-oi1-f194.google.com with SMTP id x203so946117oia.10
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0T8M9HFPja/Qcz5+OFxDy+3Ox865wq64TJqX0lZtiY=;
 b=aN5VQwpnXfVSEBuGi2tGMKyASKI9VLMtCvfQsKRi9x4EwASlH0r8gWM+iCtLZ5qaKT
 WAGMRn4EJD8Uy7fS1Y+GHMDhTRH0Vp8fdOr5nLe8hUlwGRuUBYdDGzHEhgyNh96GzeLa
 4HhnrBm9uqSOPgBueHUVkAADuOIOqzmMVsffNx2R1Ko361+eJ5oi2B7retvmkb5lP71n
 YCdiFNsVPoGamgWXkRzPlm9wIq7UqIQ68xLH2O+dQ8oi0/dZk2sPb1VylprE9HiLJQN3
 fXxTIf3JyQD/IFcCk9C4Gt6Ribz1hAN9TOiftU5kTomQNj924fI6pMsVhyn/GgRp0Abt
 H59g==
X-Gm-Message-State: AOAM533WXok4cKrr+GbslPouHGocGub3ZsBOTcF5CSdvVZMt0bhIkHMk
 Wwd7UlHiRzHODPQz+Ds4Rw==
X-Google-Smtp-Source: ABdhPJzzLIwVb0GnrgftuCJ9zcN8udQxeppgVsd6r2Be66BDmlGrxb8/wZxghvtZTyC09OZtmCreNQ==
X-Received: by 2002:aca:47cc:: with SMTP id u195mr630676oia.83.1603918024915; 
 Wed, 28 Oct 2020 13:47:04 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:04 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 06/13] PCI: dwc/dra7xx: Use the common MSI irq_chip
Date: Wed, 28 Oct 2020 15:46:39 -0500
Message-Id: <20201028204646.356535-7-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164706_828725_7AA38729 
X-CRM114-Status: GOOD (  16.85  )
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The dra7xx MSI irq_chip implementation is identical to the default DWC one.
The only difference is the interrupt handler as the MSI interrupt is muxed
with other interrupts, but that doesn't affect the irq_chip part of it.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 125 ------------------------
 1 file changed, 125 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index a4aabc85dbb1..4d0c35a4aa59 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -377,133 +377,8 @@ static int dra7xx_pcie_init_irq_domain(struct pcie_port *pp)
 	return 0;
 }
 
-static void dra7xx_pcie_setup_msi_msg(struct irq_data *d, struct msi_msg *msg)
-{
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	u64 msi_target;
-
-	msi_target = (u64)pp->msi_data;
-
-	msg->address_lo = lower_32_bits(msi_target);
-	msg->address_hi = upper_32_bits(msi_target);
-
-	msg->data = d->hwirq;
-
-	dev_dbg(pci->dev, "msi#%d address_hi %#x address_lo %#x\n",
-		(int)d->hwirq, msg->address_hi, msg->address_lo);
-}
-
-static int dra7xx_pcie_msi_set_affinity(struct irq_data *d,
-					const struct cpumask *mask,
-					bool force)
-{
-	return -EINVAL;
-}
-
-static void dra7xx_pcie_bottom_mask(struct irq_data *d)
-{
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	unsigned int res, bit, ctrl;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&pp->lock, flags);
-
-	ctrl = d->hwirq / MAX_MSI_IRQS_PER_CTRL;
-	res = ctrl * MSI_REG_CTRL_BLOCK_SIZE;
-	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
-
-	pp->irq_mask[ctrl] |= BIT(bit);
-	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK + res,
-			   pp->irq_mask[ctrl]);
-
-	raw_spin_unlock_irqrestore(&pp->lock, flags);
-}
-
-static void dra7xx_pcie_bottom_unmask(struct irq_data *d)
-{
-	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	unsigned int res, bit, ctrl;
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&pp->lock, flags);
-
-	ctrl = d->hwirq / MAX_MSI_IRQS_PER_CTRL;
-	res = ctrl * MSI_REG_CTRL_BLOCK_SIZE;
-	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
-
-	pp->irq_mask[ctrl] &= ~BIT(bit);
-	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK + res,
-			   pp->irq_mask[ctrl]);
-
-	raw_spin_unlock_irqrestore(&pp->lock, flags);
-}
-
-static void dra7xx_pcie_bottom_ack(struct irq_data *d)
-{
-	struct pcie_port *pp  = irq_data_get_irq_chip_data(d);
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	unsigned int res, bit, ctrl;
-
-	ctrl = d->hwirq / MAX_MSI_IRQS_PER_CTRL;
-	res = ctrl * MSI_REG_CTRL_BLOCK_SIZE;
-	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
-
-	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_STATUS + res, BIT(bit));
-}
-
-static struct irq_chip dra7xx_pci_msi_bottom_irq_chip = {
-	.name = "DRA7XX-PCI-MSI",
-	.irq_ack = dra7xx_pcie_bottom_ack,
-	.irq_compose_msi_msg = dra7xx_pcie_setup_msi_msg,
-	.irq_set_affinity = dra7xx_pcie_msi_set_affinity,
-	.irq_mask = dra7xx_pcie_bottom_mask,
-	.irq_unmask = dra7xx_pcie_bottom_unmask,
-};
-
-static int dra7xx_pcie_msi_host_init(struct pcie_port *pp)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct device *dev = pci->dev;
-	u32 ctrl, num_ctrls;
-	int ret;
-
-	pp->msi_irq_chip = &dra7xx_pci_msi_bottom_irq_chip;
-
-	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
-	/* Initialize IRQ Status array */
-	for (ctrl = 0; ctrl < num_ctrls; ctrl++) {
-		pp->irq_mask[ctrl] = ~0;
-		dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK +
-				    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-				    pp->irq_mask[ctrl]);
-		dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_ENABLE +
-				    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-				    ~0);
-	}
-
-	ret = dw_pcie_allocate_domains(pp);
-	if (ret)
-		return ret;
-
-	pp->msi_data = dma_map_single_attrs(dev, &pp->msi_msg,
-					   sizeof(pp->msi_msg),
-					   DMA_FROM_DEVICE,
-					   DMA_ATTR_SKIP_CPU_SYNC);
-	ret = dma_mapping_error(dev, pp->msi_data);
-	if (ret) {
-		dev_err(dev, "Failed to map MSI data\n");
-		pp->msi_data = 0;
-		dw_pcie_free_msi(pp);
-	}
-	return ret;
-}
-
 static const struct dw_pcie_host_ops dra7xx_pcie_host_ops = {
 	.host_init = dra7xx_pcie_host_init,
-	.msi_host_init = dra7xx_pcie_msi_host_init,
 };
 
 static void dra7xx_pcie_ep_init(struct dw_pcie_ep *ep)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
