Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132E9C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:15:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDDA20855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MDGUOz43";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gOi3eOfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDDA20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AefUsee1wB+b4xMghcrUrTPWVCTYHXhUPO2TF+CMC/8=; b=MDGUOz435pBv3HdAfU6/vzgKO
	bUD4X6t36GNcflo/8nERBGFCiARLlVLosM6m/rnIRvxNwvKWKi/dynRPC2OoQQY/ZmvOJ74lMwWEv
	fmNKz0ZsXAVk+Q6617ROeyCe7SsUmGOvpU1GWQxIEQaZNmJm74Ev9SwMQRXHnRsHh/BHX+5x6hD01
	OshcTUYh1pgfoaaG52HvEf7hLiVvC2SLurVV/5NVgEpi6bxfr/jQoHRrKdI+maq2X9qgr+FagM2GY
	pd4WhjJfaaw5ff+K6IJgvALseQJxAZpYo1DNS1nDj7J/aqm6q9glBvWJ9Lo3rDC5kuRzYyzIUwna6
	wwR440mTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8ySp-00064E-8t; Fri, 21 Aug 2020 04:15:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOO-00034Q-Mi; Fri, 21 Aug 2020 04:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7rh6G+pSUvMo/kfJhXJbE4GkdnlNpr7WklVnmm/bzwU=; b=gOi3eOfilu4aWm4C4LvlgpeNl0
 Sei31ym2vb1JpYaioqu30wKj+/Ijj54LfQfrRVc4erX4Ra5E3sCEdRFTGfwfikt+pDeZRLrfnaC7b
 Zh/nOYxpRaKiQNJf/C9PKlvMlkdQSrLnOnhvYNL9rmp0bBxjHgquA/byTStcuZ7m89AVj6KgVup4O
 RIjoi9J23dr6ou0XKd+ElG2Dip+rNjQYNvckgs1JXhPiCHSJm0BGANSon06acMZEwGMlLBBG4hl1A
 uUy78yrUnjUni3DS7iu6XLi2uDM5zeZb6c3JQHWZpUcKD1Z5dUNEat1UNWxUDgSOMyGVOvHLd5vsp
 D0qv0g6g==;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8v-00019s-Aa; Fri, 21 Aug 2020 03:55:09 +0000
Received: by mail-io1-f65.google.com with SMTP id b17so471343ion.7;
 Thu, 20 Aug 2020 20:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rh6G+pSUvMo/kfJhXJbE4GkdnlNpr7WklVnmm/bzwU=;
 b=izHHw30j5p3SN7xrVdmkM8MXNS9hIKC9qwYkqJ7H2ziCWdyRTevlZbh0bSbqrEPY8q
 yyUyU1n8Vhlut6pK1WHCDuimk8uYfyYIRBMXTrm24gfruLTpmrGAHl/BO0GgV26XBbwQ
 ZppdXKmoMUZMCXTasI5fiGNfQlvWQ6P5FUJHukn7pwviF8wQ0ObVJDvfVjSymDLzd84v
 SZnQd64Aigs9nBGcfeptpopzhGcy1oFKKIl/VcVWYCW1ZHpBpDGG6LTB1WCBwDcLQXn7
 03ivxWVi2sq4tB2jDvU1H6Rehks6RL42kEe7Uq+Ab2lz3jjgNigXM8IwUORdkXO9+xTx
 OAAw==
X-Gm-Message-State: AOAM5314GosoMouMfzfGeN1nhnMPUMKEyQlosILgwkb4p1N/RvDnmNLZ
 7aIjPpi9/EHdMj2X4zGJmg==
X-Google-Smtp-Source: ABdhPJxFNP+9p3GGDQpm7EPUPc+wX9H2iPB71LxQvc3q85Wa7WNWwtlDpQjSXqCEbwssrGemQZMHVQ==
X-Received: by 2002:a05:6638:1a7:: with SMTP id b7mr917900jaq.1.1597982103862; 
 Thu, 20 Aug 2020 20:55:03 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:03 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 08/40] PCI: dwc: meson: Use pci_ops for root config space
 accessors
Date: Thu, 20 Aug 2020 21:53:48 -0600
Message-Id: <20200821035420.380495-9-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045505_979216_6B4C4E4D 
X-CRM114-Status: GOOD (  13.62  )
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
buses, convert the Amlogic meson driver to use the standard pci_ops for
root bus config accesses.

Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 4f183b96afbb..f4d822190359 100644
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
