Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E422C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E5B206B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kLxtC4CN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0E5B206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vZ0kfAqwaaLechUknoQWZFUF+efQiLOStAqufBnEyJ0=; b=kLxtC4CNZMxmyMGc7w1x2C32w
	PuxqLVRZrhy1bVxeNC2LaTR8lZDpOhG1hP1w7TbDbjKBC8ybb5y5XgLpHV8953d3cPqRC1+DKXRZs
	DNWISutgk4vAYzMvrxHYuyQZmwk5CSHq9bsgIGJ8Ew4RKDWEBqWFDR0ALr1Yi6Ed382jID/5E3QTQ
	b7wg3FJj2ljFvedptWGHTwqAVIVIyM/FFVRvVWhi5LU/31C1hoNwdDf3K6ROmKLKW+kMyoep3hwYQ
	WnN36P7SHC2UFaT1NBfHFUQwxMYXSoBetwTTU+Vp66IF26ud1jFeHIMGcLL+SOX2qMz/WBLcIZjKc
	HuXBdsDPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yFt-0007pC-PQ; Fri, 21 Aug 2020 04:02:17 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAg-0005Bz-QC; Fri, 21 Aug 2020 03:57:12 +0000
Received: by mail-io1-f68.google.com with SMTP id s1so462404iot.10;
 Thu, 20 Aug 2020 20:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by4oX7Q9EHMVJaM1a51OAzD7P0ljQOmX5mYz/PVurNU=;
 b=D8lnrvswDnrkAZhCFQLPqhfILAmjpcMi3HdO7RdNBnKgG4S2+Fs483ohyL2TMk+l1G
 oO3BGJbikR41hml4JNBfugfJ3r+K/zPNzAdKNpL9LSYlglw0ec6kOOB5J65vfaaDnFgx
 Qtu83HO9iwLK8c74fMwc7nrBdHOUOteBXlRWg0BI8EPbVN2B1AOzAZO4zVetQyih21P1
 GdTxMKE+KB0cQJlPPh91fOEbB/zpenWmjY46rh7LfqFlzqYyOgtU6ktNIIqYq+SyC1mq
 e/8FPODBtQAsel9RdII54DkYDb5bUCcd9XIO9zRl+rsSWcaMo0UxAKRP08pqfg8yn+4/
 6S7g==
X-Gm-Message-State: AOAM533ZjlgBKHsRquwsCKz4nl5cv6Io5MSPb0J667uOPUJvysdRdWsG
 IXGidd+37NksktLGDmba9w==
X-Google-Smtp-Source: ABdhPJxM5kjSHd3L5b8T/on1Z1mm06cBCvBOTiUQ8rjsJmv63ck+8CPmCubjjHoxbemoW0uKPGWg4g==
X-Received: by 2002:a02:aa87:: with SMTP id u7mr925566jai.13.1597982212144;
 Thu, 20 Aug 2020 20:56:52 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 38/40] PCI: dwc/intel-gw: Drop unused max_width
Date: Thu, 20 Aug 2020 21:54:18 -0600
Message-Id: <20200821035420.380495-39-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235655_080631_E87CA253 
X-CRM114-Status: GOOD (  12.53  )
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

'max_width' is read, but never used, so let's remove it.

Cc: Dilip Kota <eswara.kota@linux.intel.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 807e1fa1bd6f..333f11561807 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -67,7 +67,6 @@ struct intel_pcie_port {
 	void __iomem		*app_base;
 	struct gpio_desc	*reset_gpio;
 	u32			rst_intrvl;
-	u32			max_width;
 	u32			n_fts;
 	struct clk		*core_clk;
 	struct reset_control	*core_rst;
@@ -133,9 +132,6 @@ static void intel_pcie_link_setup(struct intel_pcie_port *lpp)
 	u32 val;
 	u8 offset = dw_pcie_find_capability(&lpp->pci, PCI_CAP_ID_EXP);
 
-	val = pcie_rc_cfg_rd(lpp, offset + PCI_EXP_LNKCAP);
-	lpp->max_width = FIELD_GET(PCI_EXP_LNKCAP_MLW, val);
-
 	val = pcie_rc_cfg_rd(lpp, offset + PCI_EXP_LNKCTL);
 
 	val &= ~(PCI_EXP_LNKCTL_LD | PCI_EXP_LNKCTL_ASPMC);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
