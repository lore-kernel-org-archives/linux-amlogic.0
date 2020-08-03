Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C425C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2431922BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfJnxwn0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2431922BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5qLJYUqKO+vpgSuJvjuNBDhZKAqEoCFn8MqgXmhDo2A=; b=UfJnxwn0vGZKxcgj+FTY4049W
	5atAR76PE2mH8mepYGnSu1hBNAEHB3u9PRXGXtqtkFDDjEbSpVR2DNE+Ks12k//coV373fHMXXQeW
	MYz5yHg0NgzFEbxIlhwqbmLQADKZLOWacdzOpbMiRTYUNz/Gf1sXFmLzTr3n0bK34yGPL8KX7s4hg
	+so3+SezuvWl5kn485r9q6boGLFD9VDT7H8/uKFGv/aef7eVSZmxT33JV1tf+HLrRT0RM1ICz85hc
	WGFqoVZ2+Bv660+bCmN1D8lwuFG7Q1CpFYC6BNrq5NzZ/pQNmPcx7E1ms+V9ik5Jt/0le5k2fNyNf
	Tsi8B1ABQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hbe-0000gJ-BV; Mon, 03 Aug 2020 21:02:50 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haU-0008TP-GE; Mon, 03 Aug 2020 21:01:39 +0000
Received: by mail-io1-f66.google.com with SMTP id t15so31076925iob.3;
 Mon, 03 Aug 2020 14:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfEvf5H5JZ3RCT8OcWDqKEAE854FjnIcjQahQFy60ZU=;
 b=lfzky17ikEkGcIF8kMx1oYJEs7/FobTth3hrnnyCCKokMoRSNSuorCFC0Eg63IZRS1
 WTuJ7mmSM1ZiDAuu4Jp3TzK+SMgkXWSmTmXDUcRARaF/4hSP6uV6QnNqzkynM0Vq4vOx
 R7r2VHm2pGbf9Xp3Pu/6/JcQCVKY6TdlXVOjZRweGz+ZvcqWajArhskk5pV7flP8fsPs
 7iOpghavYJPMX3uSIfcdle6RNU5Bqa9G/SmRCgwLOGxDAgUN0EKrKIYz3reYkocZJh3F
 Q7y4CL7Cq01MM2z2J5u5J8LFsajipiBJMIHFUBJN/fPFfL+2QgLuJdM60SjfOSZJ91yH
 RzDw==
X-Gm-Message-State: AOAM533tNUAO9BvZi7BWp5IbbZPCjrdjfJVV0LihCRhOT53pkGNY1pVy
 22wmAn93vdVGEgkSgBYNKA==
X-Google-Smtp-Source: ABdhPJxVu37JrAtNyU3mWLs6CsBaCHUNz0/4V4wrWC42BJDmf56FSirpVGwbFUOMHezq7H+x89bQUQ==
X-Received: by 2002:a6b:9008:: with SMTP id s8mr1803377iod.132.1596488497604; 
 Mon, 03 Aug 2020 14:01:37 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:37 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 08/27] PCI: dwc: meson: Use pci_ops for root config space
 accessors
Date: Mon,  3 Aug 2020 15:00:57 -0600
Message-Id: <20200803210116.3132633-9-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170138_596662_CE070945 
X-CRM114-Status: GOOD (  16.07  )
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
 linux-pci@vger.kernel.org, Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Kukjin Kim <kgene@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that DWC drivers can setup their own pci_ops for the root and child
buses, convert the Amlogic meson driver to use the standard pci_ops for
root bus config accesses.

FIXME: child bus accessors

Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index ca59ba9e0ecd..54ce3369d963 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -383,13 +383,12 @@ static void meson_pcie_enable_interrupts(struct meson_pcie *mp)
 		dw_pcie_msi_init(&mp->pci.pp);
 }
 
-static int meson_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
-				  u32 *val)
+static int meson_pcie_rd_own_conf(struct pci_bus *bus, u32 devfn,
+				  int where, int size, u32 *val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	int ret;
 
-	ret = dw_pcie_read(pci->dbi_base + where, size, val);
+	ret = pci_generic_config_read(bus, devfn, where, size, val);
 	if (ret != PCIBIOS_SUCCESSFUL)
 		return ret;
 
@@ -410,13 +409,11 @@ static int meson_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
 	return PCIBIOS_SUCCESSFUL;
 }
 
-static int meson_pcie_wr_own_conf(struct pcie_port *pp, int where,
-				  int size, u32 val)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-
-	return dw_pcie_write(pci->dbi_base + where, size, val);
-}
+static struct pci_ops meson_pci_ops = {
+	.map_bus = dw_pcie_own_conf_map_bus,
+	.read = meson_pcie_rd_own_conf,
+	.write = pci_generic_config_write,
+};
 
 static int meson_pcie_link_up(struct dw_pcie *pci)
 {
@@ -463,6 +460,8 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 	struct meson_pcie *mp = to_meson_pcie(pci);
 	int ret;
 
+	pp->bridge->ops = &meson_pci_ops;
+
 	ret = meson_pcie_establish_link(mp);
 	if (ret)
 		return ret;
@@ -473,8 +472,6 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 }
 
 static const struct dw_pcie_host_ops meson_pcie_host_ops = {
-	.rd_own_conf = meson_pcie_rd_own_conf,
-	.wr_own_conf = meson_pcie_wr_own_conf,
 	.host_init = meson_pcie_host_init,
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
