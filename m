Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DA6C388F7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBBA24821
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bsAY2aYu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBBA24821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RWB3tvCSomRkl/18strnB3Px5YFoEFcN4rkFwPhW1O0=; b=bsAY2aYuEK5Erlj4S1iMm2Fkg
	hYoyVTXLqvO+1KyBhJscu95N1h9lL+cPckyxdqbFlbLx2RhZG2qfz5MNwSzaMSd9FAz3oUfrxdZoD
	NOkVvrNl3WwuDepMhw+D29YX07UxErem/iCVsO/szLIkYVbcJF+/gP5p8yuLf6Jcw/4MCCktySI5M
	40wRjytlEtZLK92tIkcLC6H73FgUiTpwGQjlXuxwuK3mmPMMj7ckYJ2VwzDndgdoX+QvMQ9n0of+X
	DPCyRU71B6T343x7X5k6us/BVNAsyLxGSifMmF7JL32Ko0FrevPE9gHI1jwGucm6NCbqgdPOcqyvu
	ePHrplISw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsLV-0000cW-Ff; Wed, 28 Oct 2020 20:47:01 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLP-0000Zi-AQ
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:46:56 +0000
Received: by mail-ot1-f67.google.com with SMTP id k3so427602otp.1
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQyia8yFxJFo/T6o8CYQ5VyHneaAbbvX2dVIUGSCMQQ=;
 b=WVByk23QGqCjldqYtgf9+QDRFBWe+h7TEouEBIWLeWFdXGxOQbJ6K3tsObRL76yIi3
 CZBWL5Fo1uc2O8FJOSc1TZ6/jtnn1bAhN+09WcNd9S/sEZ/wzO1Bg0y4ak04wDOFgkwS
 BDPeFFPzUEbJkaysPDYpO6tLw6oqwE2yk6GNhWFh+nlyaFMQtwccV8NCOakb+B+3TuBs
 bZtrBTJk8pTN6SPurjW49PQwOut0S7x68I0XL5szIdoOTDNGOOFOqJi2MB+3/U5F3bP+
 Q28nnLIJWtABAKnFAkI/I6NihXfWmQNuR9MBMO7ex7f1omzn9LoXYm4wWEke2dfTrZd5
 Bz9A==
X-Gm-Message-State: AOAM5305+d9YfpPsWDCeMkba08gS+/QcgPGP4NxfbDeYInGOfl0r0Wns
 eQ1TzX/NjLz2rUoTxqqD3w==
X-Google-Smtp-Source: ABdhPJw2Fi0abZoXS4t0yH9eCkAEgtoxTCLjdD+B6EjQnzh8DitGWJBXxEHGCCo7AWLp1zCE4fxuXQ==
X-Received: by 2002:a9d:685a:: with SMTP id c26mr883050oto.40.1603918014866;
 Wed, 28 Oct 2020 13:46:54 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:46:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 02/13] PCI: dwc/intel-gw: Move ATU offset out of driver match
 data
Date: Wed, 28 Oct 2020 15:46:35 -0500
Message-Id: <20201028204646.356535-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164655_422695_2AC69875 
X-CRM114-Status: GOOD (  15.58  )
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

The ATU offset should be a register range in DT called 'atu', not driver
match data. Any future platforms with a different ATU offset should add
it to their DT.

This is also in preparation to do DBI resource setup in the core DWC
code, so let's move setting atu_base later in intel_pcie_rc_setup().

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 5650cb78acba..77ef88333115 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -58,7 +58,6 @@
 
 struct intel_pcie_soc {
 	unsigned int	pcie_ver;
-	unsigned int	pcie_atu_offset;
 	u32		num_viewport;
 };
 
@@ -155,11 +154,15 @@ static void intel_pcie_init_n_fts(struct dw_pcie *pci)
 
 static void intel_pcie_rc_setup(struct intel_pcie_port *lpp)
 {
+	struct dw_pcie *pci = &lpp->pci;
+
+	pci->atu_base = pci->dbi_base + 0xC0000;
+
 	intel_pcie_ltssm_disable(lpp);
 	intel_pcie_link_setup(lpp);
-	intel_pcie_init_n_fts(&lpp->pci);
-	dw_pcie_setup_rc(&lpp->pci.pp);
-	dw_pcie_upconfig_setup(&lpp->pci);
+	intel_pcie_init_n_fts(pci);
+	dw_pcie_setup_rc(&pci->pp);
+	dw_pcie_upconfig_setup(pci);
 }
 
 static int intel_pcie_ep_rst_init(struct intel_pcie_port *lpp)
@@ -425,7 +428,6 @@ static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
 
 static const struct intel_pcie_soc pcie_data = {
 	.pcie_ver =		0x520A,
-	.pcie_atu_offset =	0xC0000,
 	.num_viewport =		3,
 };
 
@@ -461,7 +463,6 @@ static int intel_pcie_probe(struct platform_device *pdev)
 
 	pci->ops = &intel_pcie_ops;
 	pci->version = data->pcie_ver;
-	pci->atu_base = pci->dbi_base + data->pcie_atu_offset;
 	pp->ops = &intel_pcie_dw_ops;
 
 	ret = dw_pcie_host_init(pp);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
