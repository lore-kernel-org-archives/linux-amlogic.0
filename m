Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B32C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:14:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8B5206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s5jO6CuZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hdtxvuqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8B5206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O53+IRoaqIzSMnkJoYgeOqYfmPaQkM6Kn9tNOwIY8Bg=; b=s5jO6CuZSjB2x4VN9pXvAzy4T
	SCtXPpplT1XymBfwXZa363p3+N+X6Yi6Lad08laAyZl48zShuiZLoWdC52qaqqb3kZFRx5c7MAVR2
	OaGKNHOWyHUER3Iq1ZZ3EVIA95nL0IV7pH7RpWFoA0MUGbxyCYoKg/du0oUq4F0SaF1Xw1htMTtMi
	y9z1YtgkdeUeVkOu25FNdoXafvbpoZttcJFI36qlG9GOmLb804NOtC5noF2iWm7SP6nlRgYGpkfXK
	FRjJAa8G2X/VX22UTwU8p8bBHRpyWB79bwrytGLltGsvJBI8TF/ZYrubsxIjk8AMhNkolphfvP9Sd
	J2m07WdMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yRl-0005PR-7V; Fri, 21 Aug 2020 04:14:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOM-00034Q-4Z; Fri, 21 Aug 2020 04:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qKmjK2jvfVRVb7Er4EDpjePrGGwdJv1IZniABBvajKY=; b=hdtxvuqRNJ7qFxjkfIQpD2R/Ey
 5tdKzaejmVackTMDyQEcqOsyAVTUkdTgXAnllBiwMk6MNQkn8iaHm+nFCfSO0rCuXrusmWeS9Yhjg
 exn1NzZ0gC/pC5GTAWxVE/q8YkmsdZexycHXMW4RwIf6b1psFQDP/tDuTDNDmxaDTZzsjVISTGvEe
 0zzU5d406SL71kVeOtbLh4hd+JL/YpRt84hBxAt9GHCgk4EZn6TLElycZ5uEW2K4MWdBtCt1mr2qg
 +fprGBfnbmsRkIo/AOUtwpEDsV/IoMlJkMMemqV3znLaPOL8ptETRK00I64EiI8ceoee3165cV2ya
 vpDbb9pg==;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y96-0001Db-4R; Fri, 21 Aug 2020 03:55:20 +0000
Received: by mail-il1-f193.google.com with SMTP id t4so348010iln.1;
 Thu, 20 Aug 2020 20:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKmjK2jvfVRVb7Er4EDpjePrGGwdJv1IZniABBvajKY=;
 b=JeM52ft4Vrx7hVHA9ETpc/iqFJLTPN6ptmLXtQR3sTCJu+0tXLcjG2rCIS4ykN1sbW
 13d6mJQ4OnolxasLHzja+daiOAI/O7ObMguYhISx1kepDIWHcFupsXu0h5+AgYCV3dNu
 oDz+BBjjuCR5uJaGPsNaFrHlR5n5JMNgcTCvj1tV+Kw9MptOYvuLspkcP6iPngcpLkpY
 yS9oAztZACAtyztC36Xs8/yMx14rZywiMbU7uYwlnoeVkfUKppguqwNIRz/WhL9RSvi2
 OhRyCjbysFSdKa0/Os4nSZkoDmOF0gvTAMTn5BrPvwRv3IlGnAUMzObL5hc9vUx/2DXi
 +oTQ==
X-Gm-Message-State: AOAM532fo70JqWSQ2qykfLQwZUwOQ8XuSU8NoqT/V5yhALigZDY7oTjG
 mjkBTst6L9EFQvYNqwJGtg==
X-Google-Smtp-Source: ABdhPJyFyuPqncuoqZ1fAZCdBINxVRQghyiJl0ptgs9OL2HhJzv6JYxxzj1pcCD8hN6EHRc1CXmRqQ==
X-Received: by 2002:a05:6e02:14c2:: with SMTP id
 o2mr1027045ilk.54.1597982114575; 
 Thu, 20 Aug 2020 20:55:14 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:14 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 11/40] PCI: dwc: histb: Use pci_ops for root config space
 accessors
Date: Thu, 20 Aug 2020 21:53:51 -0600
Message-Id: <20200821035420.380495-12-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045517_130525_4F3D9F94 
X-CRM114-Status: GOOD (  15.03  )
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

Now that DWC drivers can setup their own pci_ops for the root and child
buses, convert the HiSilicon histb driver to use the standard pci_ops
for root bus config accesses.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-histb.c | 41 ++++++++++++++-----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index 2a2835746077..af1deae2b15d 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -122,32 +122,37 @@ static void histb_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
 	histb_pcie_dbi_w_mode(&pci->pp, false);
 }
 
-static int histb_pcie_rd_own_conf(struct pcie_port *pp, int where,
-				  int size, u32 *val)
+static int histb_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 *val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	histb_pcie_dbi_r_mode(pp, true);
-	ret = dw_pcie_read(pci->dbi_base + where, size, val);
-	histb_pcie_dbi_r_mode(pp, false);
+	if (PCI_SLOT(devfn)) {
+		*val = ~0;
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	}
 
-	return ret;
+	*val = dw_pcie_read_dbi(pci, where, size);
+	return PCIBIOS_SUCCESSFUL;
 }
 
-static int histb_pcie_wr_own_conf(struct pcie_port *pp, int where,
-				  int size, u32 val)
+static int histb_pcie_wr_own_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	histb_pcie_dbi_w_mode(pp, true);
-	ret = dw_pcie_write(pci->dbi_base + where, size, val);
-	histb_pcie_dbi_w_mode(pp, false);
+	if (PCI_SLOT(devfn))
+		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	return ret;
+	dw_pcie_write_dbi(pci, where, size, val);
+	return PCIBIOS_SUCCESSFUL;
 }
 
+static struct pci_ops histb_pci_ops = {
+	.read = histb_pcie_rd_own_conf,
+	.write = histb_pcie_wr_own_conf,
+};
+
 static int histb_pcie_link_up(struct dw_pcie *pci)
 {
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
@@ -194,6 +199,8 @@ static int histb_pcie_establish_link(struct pcie_port *pp)
 
 static int histb_pcie_host_init(struct pcie_port *pp)
 {
+	pp->bridge->ops = &histb_pci_ops;
+
 	histb_pcie_establish_link(pp);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
@@ -203,8 +210,6 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 }
 
 static const struct dw_pcie_host_ops histb_pcie_host_ops = {
-	.rd_own_conf = histb_pcie_rd_own_conf,
-	.wr_own_conf = histb_pcie_wr_own_conf,
 	.host_init = histb_pcie_host_init,
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
