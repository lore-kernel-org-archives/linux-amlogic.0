Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CADC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:17:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401D920855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xQuByxnu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="asGEa85R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 401D920855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oS8lT85dNz3KqdLw9WrJFAfK6NDmUpM8vMdqsfoayoo=; b=xQuByxnus+w8wqYAKmZzilt/F
	7VLwxKD3y3pAbISTZVpduyH1s8SuhW04Xx30VKnTiz2PchIX0uvwdU6Dc7pr7iYCHtIje7O6FsnKk
	mNWEPoE00upKzP58x9U9CcaUieOc2v9hwjTfatHWO2Iy3Na2b9YcAbzbxxu88mp4k+OlIrgpE7FrT
	E5WmbZDL/F0bEN7nVgvDl7SiS6AiKcjiTOWV/b0jnc7wIPUWL+oZ6iaQdpyRqPOSclLVmX1JU+WM5
	6ZHvjs4xVPytLQkW7fEW7bOJQ0bMC2EmHOexVTrqRE7XYRfQn/atQtOvhpNUZp/Jn6o1AcXKE2JeE
	YvBuf1sgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yU0-0006og-1V; Fri, 21 Aug 2020 04:16:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOR-00034Q-6H; Fri, 21 Aug 2020 04:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=uLOKJsM36RdxJqf/bYT4HXd1cPeYX0IkkHL5f7qh/3s=; b=asGEa85RKH9MXWDVpXytAEvSJm
 +RnPZAUP+4pYiUL2F8TJjz1I3WS38CuX+XmpweiBOwCooE695NJeMNW72yXzlwIiNF+slR5Nqw75k
 jCdbBzmH1bJlke4r7k1B5EOqKeAB2Isk2rDJ46jbLvYiCc2Hwb7RDHMDuvyLZ4pnKIeUi4XaA7N8d
 CmKmwohmHrr4R02DPRzmT/KSK6/w6+W5csRlxcSfcULcF4zHwhL3XfOGMe2SuZpFOMD+vyNIdQ+Ub
 HbDir6G/2U3PWulpeY6g9mlLUf7r8feZEOqTVm0JHT+ooiqqg2dyBGm7OAaJhNLLTPxoaKCdkK9v/
 jo+fSp0A==;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8d-00015F-9b; Fri, 21 Aug 2020 03:54:49 +0000
Received: by mail-io1-f66.google.com with SMTP id 4so447847ion.13;
 Thu, 20 Aug 2020 20:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLOKJsM36RdxJqf/bYT4HXd1cPeYX0IkkHL5f7qh/3s=;
 b=TeRlrAnb8/i0SHHdU3Qeis4CkTJGdFTSbU5aQqP2T2jbXoqbnfFyVsbhwGo6yt6qK2
 jTazwZJIvptKrku2nkI9neHLU+x1CFBZjiC3efOof4+X+hFcPfcVaBh3HmevsOJhrVj/
 J3xCXbrlPJYrkHMbz2U5eZfpPMaGE6HNDGLVSLoMkqsIeRLIrsAnBatb7xGnPR731adn
 P+3xY3CswYwTbQnkBiONYOnvWTpinxrE5nmO4cJWflUchgAFUWOFXIbViHMqsZcLv7e1
 zHWK6qCQhpfzA1wtPYMB05L44pCUGWCCxEkoKLM/pnrAORVslsCS+Yt7ee1mG9pbxEOG
 qfPQ==
X-Gm-Message-State: AOAM533J8NN3Egt/5er3b4GMOLF3SlZcRFybQnSeJRj06ZM0YaPTgN8r
 C0zdnwi7Qr0+a5kuhdQdGw==
X-Google-Smtp-Source: ABdhPJyq7iI4neXMHfp35dYxnHywQ9YGqTs7MIdd7KldjmqdJZ+ojUjvq0arWrzNuO2oF13NV46Vpw==
X-Received: by 2002:a02:7f0f:: with SMTP id r15mr940737jac.46.1597982084039;
 Thu, 20 Aug 2020 20:54:44 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:54:43 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 04/40] PCI: dwc: Add a default pci_ops.map_bus for root port
Date: Thu, 20 Aug 2020 21:53:44 -0600
Message-Id: <20200821035420.380495-5-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045447_683402_FCF2F10A 
X-CRM114-Status: GOOD (  12.91  )
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

The Designware root port config space is memory mapped accesses via the
DBI space by default. Add a common implementation
dw_pcie_own_conf_map_bus() for platforms to use.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 11 +++++++++++
 drivers/pci/controller/dwc/pcie-designware.h      |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index b626cc7cd43a..e87edce9b8da 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -602,6 +602,17 @@ static int dw_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	return dw_pcie_wr_other_conf(pp, bus, devfn, where, size, val);
 }
 
+void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
+{
+	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	if (PCI_SLOT(devfn) > 0)
+		return NULL;
+
+	return pci->dbi_base + where;
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.read = dw_pcie_rd_conf,
 	.write = dw_pcie_wr_conf,
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 8b8ea5f3e7af..a9d805b28c2a 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -377,6 +377,8 @@ void dw_pcie_setup_rc(struct pcie_port *pp);
 int dw_pcie_host_init(struct pcie_port *pp);
 void dw_pcie_host_deinit(struct pcie_port *pp);
 int dw_pcie_allocate_domains(struct pcie_port *pp);
+void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
+				       int where);
 #else
 static inline irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
