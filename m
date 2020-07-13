Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1EFC43459
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06B55207F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8flF7Y8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLYogsEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06B55207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FYd0PfB/1hLQviZr7r8aJjEkzByvOfktR0XA/mhJFw=; b=I8flF7Y8hv/BqmIDgJxmftyl+7
	n/DnLyHj/ECwE0PyuPXIm/iZz9N9IL5oHf1oBsM2IXLBasT67INUx3QdnjgzPtlIfExlmxIroJKjL
	6D46cQ2WD3kmP+1IRVfoRSpbwHj9nrOugGrhS32apHzxMZQcpLVAu0i0ksLHWWcCYyYbakmqhndXc
	Ro6BqSHnR5gC1HEK/gryh/dlIIakmvYWYFWfk/hvUG7SyugzTDUvNs1zhIKRSjbv4lqWD8Xh224dd
	zatC3B+h3hLOsJuIEoQCZJZAQZJWujCmsxmg/2lC1blf0wTeyqBNLjY5uwhhI3IgXcn/avZSrisDp
	CAKFfrNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyQ6-0006N5-3C; Mon, 13 Jul 2020 13:22:58 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyPu-0006I4-8n; Mon, 13 Jul 2020 13:22:47 +0000
Received: by mail-ej1-x641.google.com with SMTP id o18so17131306eje.7;
 Mon, 13 Jul 2020 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9eSzPhspiWvGf9aT6n+u7h1JAatvbzNtxDm7qgPwQa4=;
 b=hLYogsErj4MxDifEjs2yaWms0NpgUVako6c8lR/I2R4HV9RllrJIdGqkMDp5APeeDE
 oWeJOdnNhg7Ug/j0KkKHuaUJSEqiFCugiXFDKBKD08Rf4UCqkHYGXXTk09tPPdekReMl
 f/Z3N9TMpWpw2xAQtgdR8/N+9F0vAhXDYUe0EU/xGTl4W5zeIioGJduOy6lClM+Y6oFA
 xnjejrZ8kSmDHyZVOhAaPrgokXgExqfS+EI7cvM+Df1dhlImeqOdm4/lVR+HRcx5xHku
 Igf8N+NUygg5XttWH+kIcV9FL4bX+s92wGGITkFUVhBz34HIbR1LCVyWtNYcj0CfHCge
 ox9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9eSzPhspiWvGf9aT6n+u7h1JAatvbzNtxDm7qgPwQa4=;
 b=cGBUebcqVKkq6/mZTo0mvzTL+S2U7hck2njxoqNqWIvODeBHe3DPcTDj9EcIEeRx+K
 TOfWMdpQnKNT3OIpIep6YY864sajn73+wLmYTTD0A/kY4BHkrSpzL06bjRCpFko3p5Jx
 L1ib05LRY8c8hqw2htYRDeMOfwFaiFGYxkHKie+G8+z3OTnr0jZfc+qGeXtFjEBZtHAB
 aNOzIAR3cNR2VvPrR/xd7S5suKzgArgxUvTZ9nC0za8zY+psKBgdOi+jrlyzBU15sk2A
 szF8SiJvyi8DOBTwuP4kg6b2Ksm0bZ58RnGvN9vis5i4FBOkXDhCzKgsq8xumTUZ0Mp7
 IsUw==
X-Gm-Message-State: AOAM533nrF90LApMZYVLuOp8MAdcQ3dDvcXYHuICBLG1L2GlA2drNVy9
 oFudzI+ZprKf4iEWF7r/2Pc=
X-Google-Smtp-Source: ABdhPJyNhtJJphGqXF4QW+aGFKHkMsFvQ0ZrswEHN2+kh5oK7be5K3ZFffA96ErJ6GVjCF52Di2gmA==
X-Received: by 2002:a17:906:d143:: with SMTP id
 br3mr71266443ejb.268.1594646565435; 
 Mon, 13 Jul 2020 06:22:45 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:44 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Toan Le <toan@os.amperecomputing.com>, Jingoo Han <jingoohan1@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yue Wang <yue.wang@Amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC PATCH 06/35] PCI: Tidy Success/Failure checks
Date: Mon, 13 Jul 2020 14:22:18 +0200
Message-Id: <20200713122247.10985-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_092246_377909_45ADA14D 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 bjorn@helgaas.com, linux-amlogic@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 05/35

 drivers/pci/controller/dwc/pci-meson.c            | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
 drivers/pci/controller/pci-xgene.c                | 3 +--
 drivers/pci/controller/pcie-altera.c              | 4 ++--
 drivers/pci/controller/pcie-iproc.c               | 2 +-
 drivers/pci/controller/pcie-rcar-host.c           | 4 ++--
 6 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 58142f03d300..8203d5f95d28 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -390,7 +390,7 @@ static int meson_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
 	int ret;
 
 	ret = dw_pcie_read(pci->dbi_base + where, size, val);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	/*
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 7c97c54f787c..2dd3965365f6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -459,7 +459,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	}
 
 	ret = dw_pcie_rd_own_conf(pp, PCI_HEADER_TYPE, 1, &hdr_type);
-	if (ret != 0) {
+	if (ret) {
 		dev_err(pci->dev, "Failed reading PCI_HEADER_TYPE cfg space reg (ret: 0x%x)\n",
 			ret);
 		ret = pcibios_err_to_errno(ret);
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index bf74f0a8b451..8d55cfc4ff8a 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -167,8 +167,7 @@ static int xgene_pcie_config_read32(struct pci_bus *bus, unsigned int devfn,
 {
 	struct xgene_pcie_port *port = pcie_bus_to_port(bus);
 
-	if (pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val) !=
-	    0)
+	if (pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	/*
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 96f5bda32b58..9f7b12ad0c04 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -367,7 +367,7 @@ static int tlp_cfg_dword_write(struct altera_pcie *pcie, u8 bus, u32 devfn,
 						    value, false);
 
 	ret = pcie->pcie_data->ops->tlp_read_pkt(pcie, NULL);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	/*
@@ -453,7 +453,7 @@ static int _altera_pcie_cfg_read(struct altera_pcie *pcie, u8 busno,
 
 	ret = tlp_cfg_dword_read(pcie, busno, devfn,
 				 (where & ~DWORD_MASK), byte_en, &data);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	switch (size) {
diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index dac9352c0cb2..d34c9457fbe4 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -584,7 +584,7 @@ static int iproc_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
 	/* root complex access */
 	if (busno == 0) {
 		ret = pci_generic_config_read32(bus, devfn, where, size, val);
-		if (ret == 0)
+		if (!ret)
 			iproc_pcie_fix_cap(pcie, where, val);
 
 		return ret;
diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 363a8630de28..2bb250c6f767 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -157,7 +157,7 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
 
 	ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
 				      bus, devfn, where, val);
-	if (ret != 0) {
+	if (ret) {
 		*val = 0xffffffff;
 		return ret;
 	}
@@ -184,7 +184,7 @@ static int rcar_pcie_write_conf(struct pci_bus *bus, unsigned int devfn,
 
 	ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
 				      bus, devfn, where, &data);
-	if (ret != 0)
+	if (ret)
 		return ret;
 
 	dev_dbg(&bus->dev, "pcie-config-write: bus=%3d devfn=0x%04x where=0x%04x size=%d val=0x%08x\n",
-- 
2.18.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
