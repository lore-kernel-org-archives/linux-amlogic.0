Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2C2C4741F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 21:15:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F7A2073A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 21:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wSlePk2q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F7A2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9+y6vXUV99pIlecmVAnmgbY3ps20AFx6n3f8C2cWuFA=; b=wSlePk2qKW5I5XUqbcsg7Ky91
	08oBZUOdNZ756bKI9xeBVFl7xWCDwl2MKkejmRMb7ZZo0TSTrpUOJ44lrG82KqdbhPQouoHYsScz2
	hIdJ73GNGHvQeGjW2T47PWp79ajNRCvyivvW0mSCNTPzMCE11u2QLIIykDjWh8dNH3bCLFrVdmV4Y
	JlWOMB4S3xd4HGj/hHdEnutBQKz6DsQvyLpdyGmDKdZ6lh9nYTtNx0pLGN8AMKPG6Nrwgu6HUYRA6
	hGnM5An9/SeQLrR5Mp9oYqop32g6M/QKDuGqEQOju2RxVELAkECtov2QTYaGINbXCJrebE/1i38Ah
	ptSeebRNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kamb2-0000ua-E5; Thu, 05 Nov 2020 21:15:04 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kamYR-0007jn-1r; Thu, 05 Nov 2020 21:12:24 +0000
Received: by mail-oi1-f193.google.com with SMTP id m143so3168018oig.7;
 Thu, 05 Nov 2020 13:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVeJIfWlxUTgrZqRPHjctK3jnjQfy5YPhbh3+XYgmn4=;
 b=i4TpRBPZi6gdFKHBOpGlcI/7CcUXddb28a4gfPMssm/9+eeuw1e91VXlg+mRWEQx2A
 hLMWUydtqAVt1UzPJe4dVji/leJmNtS8V3YgfN9MLLhLEjvMOuO87sK7iu42GDvQ+svC
 f3ZLgPAUJ3nctBMuJIBUKUPSyd2JyGPLS8kq4T83qJF1xxf/4yt1EI9aWrgUqxsA7N9V
 KWqy5rqSFUfQoonFcW5Kdabx7ycyrcebJ0gxHPciaHsdU83DOf0yzOa5EsTn/Apgbd+X
 aW2qX/EhNp0b3O5qv035kDE81aatASoqxte8tS8lxLIDLay2CGwe9hNLQOK/FpHcIrXd
 hIeQ==
X-Gm-Message-State: AOAM5336RWfmYscEJJG2N1DzkFORmPS2TJcUhTKJbTe28GyYIQhsdzag
 0jpHwMhwMIE8TtMdzg2MCw==
X-Google-Smtp-Source: ABdhPJw+47/D3qnF5mU7Eedns1tPtQUDx6M5jpVs/y82aLzeZ7fJtbLHYBuCzEI8RMIwgkcdafqtfQ==
X-Received: by 2002:aca:5d07:: with SMTP id r7mr811608oib.87.1604610742131;
 Thu, 05 Nov 2020 13:12:22 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z19sm622549ooi.32.2020.11.05.13.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:12:21 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: 
Subject: [PATCH v2 12/16] PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
Date: Thu,  5 Nov 2020 15:11:55 -0600
Message-Id: <20201105211159.1814485-13-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_161223_199324_07B654C9 
X-CRM114-Status: GOOD (  20.12  )
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
 Minghuan Lian <minghuan.Lian@nxp.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Yue Wang <yue.wang@Amlogic.com>,
 linux-samsung-soc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andy Gross <agross@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Kukjin Kim <kgene@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

All RC complex drivers must call dw_pcie_setup_rc(). The ordering of the
call shouldn't be too important other than being after any RC resets.

There's a few calls of dw_pcie_setup_rc() left as drivers implementing
suspend/resume need it.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Acked-by: Jingoo Han <jingoohan1@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           | 1 -
 drivers/pci/controller/dwc/pci-exynos.c           | 1 -
 drivers/pci/controller/dwc/pci-imx6.c             | 1 -
 drivers/pci/controller/dwc/pci-keystone.c         | 2 --
 drivers/pci/controller/dwc/pci-layerscape.c       | 2 --
 drivers/pci/controller/dwc/pci-meson.c            | 2 --
 drivers/pci/controller/dwc/pcie-armada8k.c        | 2 --
 drivers/pci/controller/dwc/pcie-artpec6.c         | 1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 drivers/pci/controller/dwc/pcie-designware-plat.c | 8 --------
 drivers/pci/controller/dwc/pcie-histb.c           | 3 ---
 drivers/pci/controller/dwc/pcie-kirin.c           | 2 --
 drivers/pci/controller/dwc/pcie-qcom.c            | 1 -
 drivers/pci/controller/dwc/pcie-spear13xx.c       | 2 --
 drivers/pci/controller/dwc/pcie-uniphier.c        | 2 --
 15 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 72a5a2bf933b..b105af63854a 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -181,7 +181,6 @@ static int dra7xx_pcie_host_init(struct pcie_port *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 
-	dw_pcie_setup_rc(pp);
 	dra7xx_pcie_enable_interrupts(dra7xx);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 3939fe22e8a2..5c10a5432896 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -372,7 +372,6 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
 	phy_init(ep->phy);
 
 	exynos_pcie_deassert_core_reset(ep);
-	dw_pcie_setup_rc(pp);
 	exynos_pcie_assert_reset(ep);
 
 	exynos_pcie_enable_interrupts(ep);
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 9e30fbf4efbe..f9547bb2cf1b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -834,7 +834,6 @@ static int imx6_pcie_host_init(struct pcie_port *pp)
 	imx6_pcie_init_phy(imx6_pcie);
 	imx6_pcie_deassert_core_reset(imx6_pcie);
 	imx6_setup_phy_mpll(imx6_pcie);
-	dw_pcie_setup_rc(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 90b222b020a3..5a4bcc2b1ddb 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -807,8 +807,6 @@ static int __init ks_pcie_host_init(struct pcie_port *pp)
 	if (ret)
 		return ret;
 
-	dw_pcie_setup_rc(pp);
-
 	ks_pcie_stop_link(pci);
 	ks_pcie_setup_rc_app_regs(ks_pcie);
 	writew(PCI_IO_RANGE_TYPE_32 | (PCI_IO_RANGE_TYPE_32 << 8),
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 0d84986c4c16..400ebbebd00f 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -136,8 +136,6 @@ static int ls_pcie_host_init(struct pcie_port *pp)
 
 	ls_pcie_drop_msg_tlp(pcie);
 
-	dw_pcie_setup_rc(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 2df0adcf0bf2..04589f0decb2 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -380,8 +380,6 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
-	dw_pcie_setup_rc(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index dd2926bbb901..4e2552dcf982 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -171,8 +171,6 @@ static int armada8k_pcie_host_init(struct pcie_port *pp)
 	u32 reg;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
-	dw_pcie_setup_rc(pp);
-
 	if (!dw_pcie_link_up(pci)) {
 		/* Disable LTSSM state machine to enable configuration */
 		reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_CONTROL_REG);
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 7ee8f3c83f8f..fcba9915a606 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -328,7 +328,6 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
-	dw_pcie_setup_rc(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ebea2c814448..f2b0a15ad72b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -422,6 +422,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
+	dw_pcie_setup_rc(pp);
 	dw_pcie_msi_init(pp);
 
 	if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index dec24e595c3e..9b397c807261 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -33,15 +33,7 @@ struct dw_plat_pcie_of_data {
 
 static const struct of_device_id dw_plat_pcie_of_match[];
 
-static int dw_plat_pcie_host_init(struct pcie_port *pp)
-{
-	dw_pcie_setup_rc(pp);
-
-	return 0;
-}
-
 static const struct dw_pcie_host_ops dw_plat_pcie_host_ops = {
-	.host_init = dw_plat_pcie_host_init,
 };
 
 static int dw_plat_pcie_establish_link(struct dw_pcie *pci)
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index 210777c793ea..86f9d16c50d7 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -196,9 +196,6 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 	regval |= PCIE_WM_RC;
 	histb_pcie_writel(hipcie, PCIE_SYS_CTRL0, regval);
 
-	/* setup root complex */
-	dw_pcie_setup_rc(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index f84ac1b36b2c..ac4bbdaf5324 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -405,8 +405,6 @@ static int kirin_pcie_host_init(struct pcie_port *pp)
 {
 	pp->bridge->ops = &kirin_pci_ops;
 
-	dw_pcie_setup_rc(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eb107179d544..e49791c4f846 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1280,7 +1280,6 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 			goto err_disable_phy;
 	}
 
-	dw_pcie_setup_rc(pp);
 	qcom_ep_reset_deassert(pcie);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 31475e4493a7..1a9e353bef55 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -130,8 +130,6 @@ static int spear13xx_pcie_host_init(struct pcie_port *pp)
 
 	spear13xx_pcie->app_base = pci->dbi_base + 0x2000;
 
-	dw_pcie_setup_rc(pp);
-
 	/*
 	 * this controller support only 128 bytes read size, however its
 	 * default value in capability register is 512 bytes. So force
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index e6616408a29c..2457e9dd098d 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -314,8 +314,6 @@ static int uniphier_pcie_host_init(struct pcie_port *pp)
 
 	uniphier_pcie_irq_enable(priv);
 
-	dw_pcie_setup_rc(pp);
-
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
