Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B8FC433E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:55:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EE320714
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vm15mfat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7EE320714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p96Qpq/5q5ioyl05RV7vdmy1cyRncn3Ipt0RXd3DGTA=; b=Vm15mfatrEx+qEagGXRg9xJYL
	bSk1phMeH2YhkETdDY/B/KiPgfT6YhRse2SUGpHo0X3IaEBn282NbYNQkT4LaFJX7a/fZDMKUYFgf
	GtSmRlm2attSPNMEJ1bWAb1czrasUT9m1gUE7/2WCViizYrJhtowlJGJ7Re+TlYECaoXDV2+IuImB
	MnaQl0HRTme2nchE1vguvDAKLZQQb5qcIiZg4hAIaFxtur+eT5ok0fedVof5Ueb7p+sKLrvgvNIhy
	3u6JxE7AYjOucl4SrHe2s0e4ye3+9sCwHfnCyayW8tOSwIWL5mXvz9rmbf+pqVgHPEdNRReHEb0vW
	xTGwmULpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8y8h-0004PT-Va; Fri, 21 Aug 2020 03:54:52 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8M-0004DW-W4; Fri, 21 Aug 2020 03:54:41 +0000
Received: by mail-il1-f193.google.com with SMTP id t4so347064iln.1;
 Thu, 20 Aug 2020 20:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRJMVMF9r7qXs+QDp+bx+ovjwoVdm4UDqS7o+cHIDVk=;
 b=AI+sjIWvOV/K4ijzZaA3zgam3BeqLhapX2ocWnJkwEF076UQ7vlJHoszmgQY+xD6Kc
 PatnB6R6dLJT+xOjtY++BYi7zTBElGZv0bm5z/8mkAe2pKZMRRMBoqo2EZEDzKgqfg2v
 nhd7YjTNWEHTHb3F4NH0WyOo0q6ES8jeqAtC9dmNrkRMY78zY2fLHN486i+nn9xddw0u
 YAfpsG1REVl/r3j2IQMGVEv4nP4KsSXFEE3kdN3Fn9AaKlIEKvrEctp9I90MZKS3fc8W
 mMc/hONKyx7rLu/KnPlFoZoDZYgpCwx3QrvgX/rgkfb33+PF2HT4NdaCSsZZI/UesPJk
 03wQ==
X-Gm-Message-State: AOAM532JfQbG3099xSOhVqEcKPeIP7bCxFuiNAXF13AboGre7RnDvbmI
 281u69sJlh6RvQjRXQS4wQ==
X-Google-Smtp-Source: ABdhPJwRNaZICDow1OKY9hk3FD5LXGPW+N8Amx9fFJ/qk2fSUYYNRaZO952kdfGlBWIGO25JKRrzVA==
X-Received: by 2002:a92:c081:: with SMTP id h1mr1021694ile.41.1597982069449;
 Thu, 20 Aug 2020 20:54:29 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:54:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 01/40] PCI: Allow root and child buses to have different
 pci_ops
Date: Thu, 20 Aug 2020 21:53:41 -0600
Message-Id: <20200821035420.380495-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235431_140495_D6271097 
X-CRM114-Status: GOOD (  16.88  )
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

PCI host bridges often have different ways to access the root and child
bus config spaces. The host bridge drivers have invented their own
abstractions to handle this. Let's support having different root and
child bus pci_ops so these per driver abstractions can be removed.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/probe.c | 8 +++++++-
 include/linux/pci.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 03d37128a24f..0c9ebc72532e 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1036,6 +1036,7 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 					   struct pci_dev *bridge, int busnr)
 {
 	struct pci_bus *child;
+	struct pci_host_bridge *host;
 	int i;
 	int ret;
 
@@ -1045,11 +1046,16 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 		return NULL;
 
 	child->parent = parent;
-	child->ops = parent->ops;
 	child->msi = parent->msi;
 	child->sysdata = parent->sysdata;
 	child->bus_flags = parent->bus_flags;
 
+	host = pci_find_host_bridge(parent);
+	if (host->child_ops)
+		child->ops = host->child_ops;
+	else
+		child->ops = parent->ops;
+
 	/*
 	 * Initialize some portions of the bus device, but don't register
 	 * it now as the parent is not properly set up yet.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 835530605c0d..1fbe95a7d386 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -523,6 +523,7 @@ struct pci_host_bridge {
 	struct device	dev;
 	struct pci_bus	*bus;		/* Root bus */
 	struct pci_ops	*ops;
+	struct pci_ops	*child_ops;
 	void		*sysdata;
 	int		busnr;
 	struct list_head windows;	/* resource_entry */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
