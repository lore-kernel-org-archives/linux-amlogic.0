Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE2FC433E5
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B178922B40
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGoIEwz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B178922B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lDLR2to5prX8AQkrL49jQqVaD4QXL3ucV3mmVh/LA2g=; b=AGoIEwz+/8UcLQRAVV7vwJzP8
	ei4fiLDRpJKG2AAs4TrN8B8+efaM4CEix1EDkLsB6Q8tlxMotA4hqN8OEm350JgBJJ7QX8/3z+gP5
	J0gEh1oH47wKNjqDXK94SdF+qkgOfS8MdgNU83gcMENZCRw29x5oR/+Ml4LXczGa716qMQQxgyvnP
	l0W6A90NXraD9Q/lRNq1Miw7LCNzB+NJVXXhLy2j5nVqmalOPOMK1+72ep0m/yflDG1A9I4SG4Ya/
	cSRuSljpy/9gR08m+eHYelJ4Kd9fRDcUEc4p1aCPkycNP9oXHX5PNBoe6pEkELe4jIKxenWfrHiIE
	K1/Y9Q6eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zEX-0005lL-FM; Fri, 21 Aug 2020 05:04:57 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9J-0004ej-Jy; Fri, 21 Aug 2020 03:55:44 +0000
Received: by mail-il1-f196.google.com with SMTP id e11so322543ils.10;
 Thu, 20 Aug 2020 20:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcT/tBt5hzVcOFIbbxsACp+IaB0FfUbF9lTytCWuySo=;
 b=JuZvu3s8UFojUmWzT8RIc/l62f8ttNOyauu1ujPWsXoI61c0gIr3f+xEXGyPRYgZQU
 0kAB5athveYOektpiOEfNf3oN+T8F9ieXFo+2k6qxQJk/KvVJ+ud5BttIggdXFVUPlr0
 7FEk7VbyfbFY+rtnTA9CA2/OKpyjrRbKsprP5QRMPp9KE5HWWHUJI6Os0cdwrGhwANoL
 QMppQ7+XrQqBvYlOikJTnnszu8XSEbqvOac+xz/qj0bp279Bb/hDutjE83gcTGyAcDey
 FVrLhmmqUej73yrokPQH+ca6pozNdSjLWdQ8wR1YmZXDJzZTcbpgVTWzn90u1YxtNfXA
 bNTw==
X-Gm-Message-State: AOAM533D9MjaqO178WD6VD0/F/Oawi5hJSWBmNttA4jed3nYrAkZuFzU
 v3ed8u47z1YUxDZx8rgqYQ==
X-Google-Smtp-Source: ABdhPJwb+JNqT15FRuhKwW2bKzsNM7yeAHD0rWW3xkgvROAQ42nkfFVQ2Kjlc+K/WmlwAfYFGPHgyA==
X-Received: by 2002:a92:6a0c:: with SMTP id f12mr952021ilc.213.1597982126498; 
 Thu, 20 Aug 2020 20:55:26 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 16/40] PCI: dwc: Convert to use pci_host_probe()
Date: Thu, 20 Aug 2020 21:53:56 -0600
Message-Id: <20200821035420.380495-17-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235529_931925_92C77D43 
X-CRM114-Status: GOOD (  16.77  )
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

Now that there are no more .scan_bus() callbacks, we can remove it and just
use pci_host_probe().

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 21 +++----------------
 drivers/pci/controller/dwc/pcie-designware.h  |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 07791b4ebaa7..42b13a7a7383 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -300,7 +300,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource_entry *win;
-	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	struct resource *cfg_res;
 	int ret;
@@ -436,23 +435,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	bridge->sysdata = pp;
 
-	ret = pci_scan_root_bus_bridge(bridge);
-	if (ret)
-		goto err_free_msi;
-
-	pp->root_bus = bridge->bus;
-
-	if (pp->ops->scan_bus)
-		pp->ops->scan_bus(pp);
-
-	pci_bus_size_bridges(pp->root_bus);
-	pci_bus_assign_resources(pp->root_bus);
-
-	list_for_each_entry(child, &pp->root_bus->children, node)
-		pcie_bus_configure_settings(child);
-
-	pci_bus_add_devices(pp->root_bus);
-	return 0;
+	ret = pci_host_probe(bridge);
+	if (!ret)
+		return 0;
 
 err_free_msi:
 	if (pci_msi_enabled() && !pp->ops->msi_host_init)
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 4ed59b051b2b..6cd61892f24f 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -161,7 +161,6 @@ enum dw_pcie_device_mode {
 
 struct dw_pcie_host_ops {
 	int (*host_init)(struct pcie_port *pp);
-	void (*scan_bus)(struct pcie_port *pp);
 	void (*set_num_vectors)(struct pcie_port *pp);
 	int (*msi_host_init)(struct pcie_port *pp);
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
