Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A73C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B4520855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZTfHCQz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B4520855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c+tkX5EmXQVaw25iW2FALSwXmiNfqdUelIpSTkEgqLM=; b=ZTfHCQz6jRF9tTwT0LJbEFDlo
	1fQwb4EPqp03XLyN5Rx4Y8WXwQEPjkRVAya9C4sqjI2LxqH95AeHwhHbO70ah9WcNKcyTKem3P8mj
	3Mn56VLKnIy4SPu4I0roMXybI9sq6KUFOaQeO1IfIBycT/w0L7uOwq+EUywY4xmTjQMnPAoHpzMrA
	heln+R5QHrxQVRYJ6uCoRH2nABPyYJi64jWPmfuQPEYrRhL59aOQwEtxbgms9EqMAwCQUXntk+EmH
	lM0PUFJK3xBLeZHeJk3Dya58q+4EkTkUcILxfwKMYnDkNya1bpb9+1Ey3xydwpmwP4/3rPCs+CR5F
	zfSBkogiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yEd-000734-3a; Fri, 21 Aug 2020 04:00:59 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9d-0004mU-1I; Fri, 21 Aug 2020 03:56:15 +0000
Received: by mail-io1-f65.google.com with SMTP id g14so496079iom.0;
 Thu, 20 Aug 2020 20:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kumZHZjUFIvX3SHWpXpEUET8g4KV80WJmK3nUIgHIRs=;
 b=RFsjLA1j1YhSW0t0JisFlX1n/bhp3jqM0UHCVLoWqKWAGZ0YxymePP8TD0Zn8kEJXE
 ADwYHIPvRh+o+P8M413xb3R/dQ7CA6mu+cW6ijs0eoeXfHLPRNzue3TzFqig1MLuKeN3
 IBfHLZR+RVynRd9oCWeDJftqU5BmM7Etb0JlrJC4QXMiGPUHDa/2KIyE0U0UbmgBNIJT
 3JjEgADQeOo8ngOdcJcqFWUdXVU1TgFWPI7NCKVsM+tK7c/1pv5HP1n5+vY088zRk6+6
 ayIG8Wm8q24rRVJJJwTrLZVdQDTqHPHAFNJOiOFqcvjagP52f3e1LfoB4OydHVoM6tzm
 J/sw==
X-Gm-Message-State: AOAM533WU97IHKTSGJv2wAhpNA6EGX/fVRKr2N4EdHf2CCUqqNbXKUE4
 PFuiWyOam+kzhQKIK7IoGg==
X-Google-Smtp-Source: ABdhPJxRKUtV0n+dK2NRfpXEvZsHGODGBsP7rLd+TFntUVfJ0RA8JVZq7czdDNbyUGCiMPAKKGQyTA==
X-Received: by 2002:a05:6638:22c7:: with SMTP id
 j7mr840801jat.77.1597982145790; 
 Thu, 20 Aug 2020 20:55:45 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:45 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 20/40] PCI: dwc/keystone: Drop duplicated 'num-viewport'
Date: Thu, 20 Aug 2020 21:54:00 -0600
Message-Id: <20200821035420.380495-21-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235549_343349_77A5B188 
X-CRM114-Status: GOOD (  16.26  )
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

The DWC core driver already parses and stores the 'num-viewport' DT
property, so there is no need for the Keystone driver to store it.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 983069a4a561..0fe792f6c253 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -123,7 +123,6 @@ struct keystone_pcie {
 
 	int			msi_host_irq;
 	int			num_lanes;
-	u32			num_viewport;
 	struct phy		**phy;
 	struct device_link	**link;
 	struct			device_node *msi_intc_np;
@@ -397,9 +396,9 @@ static void ks_pcie_clear_dbi_mode(struct keystone_pcie *ks_pcie)
 static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
 {
 	u32 val;
-	u32 num_viewport = ks_pcie->num_viewport;
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct pcie_port *pp = &pci->pp;
+	u32 num_viewport = pci->num_viewport;
 	u64 start, end;
 	struct resource *mem;
 	int i;
@@ -1199,7 +1198,6 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 	struct resource *res;
 	unsigned int version;
 	void __iomem *base;
-	u32 num_viewport;
 	struct phy **phy;
 	int link_speed;
 	u32 num_lanes;
@@ -1349,12 +1347,6 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		ret = of_property_read_u32(np, "num-viewport", &num_viewport);
-		if (ret < 0) {
-			dev_err(dev, "unable to read *num-viewport* property\n");
-			goto err_get_sync;
-		}
-
 		/*
 		 * "Power Sequencing and Reset Signal Timings" table in
 		 * PCI EXPRESS CARD ELECTROMECHANICAL SPECIFICATION, REV. 2.0
@@ -1368,7 +1360,6 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 			gpiod_set_value_cansleep(gpiod, 1);
 		}
 
-		ks_pcie->num_viewport = num_viewport;
 		pci->pp.ops = host_ops;
 		ret = ks_pcie_add_pcie_port(ks_pcie, pdev);
 		if (ret < 0)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
