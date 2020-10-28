Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FE7C388F7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A301D24822
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFFhUs64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A301D24822
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CqoggdcjWszW1M1QXx/ijA1fZYqBM8f26QGn75vLhhY=; b=bFFhUs64FFg1WXa94UeKngmj6
	kq1fUJlYfndNgbEQ9m1RUFJSwSY//F1JsBrK9SZewe9X8Z7b1l7QlOYybtd4pL2BuZjjbauN8Fn2A
	dPtksGFbcQDLPEFQlc1vcwHEIHE+5XqYcOHW29iwqTcCkTyH5e4rVyb7JBr/0l5op4vxXenA4Zb03
	JoNIdz8D7W31L/H5DP1pzfT4MXSgUYcnUqJSEKNelHY1ITiUGBTz5ozJ21xcUo41Y+eXqwbVzxzg5
	dAOtKfZKWAOkHT264TWN0njHp80eBKdR1sOrQi2i2Mxea7Ph74nrgz6SitXN8fXLb9SKZyRvO7eZs
	z1vG0Pf1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsMG-0000ru-DJ; Wed, 28 Oct 2020 20:47:48 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLX-0000dJ-MJ
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:47:08 +0000
Received: by mail-oi1-f193.google.com with SMTP id z23so996876oic.1
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VL29XNIWkQpzNWyeVNn88/4OaIX3OCW0yaXdyYkNuo0=;
 b=SQrpLCEKx8oZRCxQbAhm7r4ne3ey7qpJX30uZ4rBH6YajceqUD54LtORrsV6WIGYtP
 CcaS2GchmzDwH5/uLT8eo1e7MiSLYXP54iEDow9U/qVnMoslGyFTREooy+DoRdmlQPqz
 kqSfiCgizSPzxrdrNnU7AafSPlsN0i4HPQzQKncUazluX+TVu9lcf+RP6AVR7CSlcymq
 HkDuBCTpvt21ywJa4MbbSJ0K0YC+zMVnj6kXvXqE4IbUpTKIGk2NnOoThzOknKzq4M2o
 qrh0NndT6AWIUNvbjI1McsIFNtr8PNFImrmk3r8tfcP+KKm4ID8rrvGyU/h/BwBJ8oyv
 6qNA==
X-Gm-Message-State: AOAM530jsWmVnzI1AspD8ABMb4UX+y3w/LomtjaweIfqYrKIgjXIhUer
 QQ35oBzcABKoTdD0jiIW5w==
X-Google-Smtp-Source: ABdhPJzWQKewEzrujtGvqB3VBlyo68Oonm1AIwSq3hCnepRvY1VGBxkJqbAEBgM3kZQckSIDnyed7g==
X-Received: by 2002:aca:f0c:: with SMTP id 12mr636990oip.9.1603918022402;
 Wed, 28 Oct 2020 13:47:02 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:01 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 05/13] PCI: dwc: Ensure all outbound ATU windows are reset
Date: Wed, 28 Oct 2020 15:46:38 -0500
Message-Id: <20201028204646.356535-6-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164704_005707_8776828C 
X-CRM114-Status: GOOD (  17.82  )
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

The Layerscape driver clears the ATU registers which may have been
configured by the bootloader. Any driver could have the same issue
and doing it for all drivers doesn't hurt, so let's move it into the
common DWC code.

Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-layerscape.c       | 14 --------------
 drivers/pci/controller/dwc/pcie-designware-host.c |  5 +++++
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index f24f79a70d9a..53e56d54c482 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -83,14 +83,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie)
 	iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
 }
 
-static void ls_pcie_disable_outbound_atus(struct ls_pcie *pcie)
-{
-	int i;
-
-	for (i = 0; i < PCIE_IATU_NUM; i++)
-		dw_pcie_disable_atu(pcie->pci, i, DW_PCIE_REGION_OUTBOUND);
-}
-
 static int ls1021_pcie_link_up(struct dw_pcie *pci)
 {
 	u32 state;
@@ -136,12 +128,6 @@ static int ls_pcie_host_init(struct pcie_port *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct ls_pcie *pcie = to_ls_pcie(pci);
 
-	/*
-	 * Disable outbound windows configured by the bootloader to avoid
-	 * one transaction hitting multiple outbound windows.
-	 * dw_pcie_setup_rc() will reconfigure the outbound windows.
-	 */
-	ls_pcie_disable_outbound_atus(pcie);
 	ls_pcie_fix_error_response(pcie);
 
 	dw_pcie_dbi_ro_wr_en(pci);
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index cde45b2076ee..265a48f1a0ae 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -534,6 +534,7 @@ static struct pci_ops dw_pcie_ops = {
 
 void dw_pcie_setup_rc(struct pcie_port *pp)
 {
+	int i;
 	u32 val, ctrl, num_ctrls;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
@@ -583,6 +584,10 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
 
+	/* Ensure all outbound windows are disabled so there are multiple matches */
+	for (i = 0; i < pci->num_viewport; i++)
+		dw_pcie_disable_atu(pci, i, DW_PCIE_REGION_OUTBOUND);
+
 	/*
 	 * If the platform provides its own child bus config accesses, it means
 	 * the platform uses its own address translation component rather than
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
