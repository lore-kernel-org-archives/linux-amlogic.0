Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFB6C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0A0206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ayEhLvAv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mcfS4WiL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0A0206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=70XFtD31Xp5WMcam62c4XrQkYOjf6GCFzXW1FoC2oCo=; b=ayEhLvAvCrcJXrxDsePKFy/dl
	d+WfsthOXDHCqQSTKSfk8MdvbMDs7lFRMcEFvV+QF/3aq5WeFgBvxyIDPw5OYY8OMTaRs0DkQ1U7H
	QPJBbPYPYxqItFaHn92N9E+ZwZjoaQ6tx4WKlh4QOHMK6AmXlHbaUAMQ/mAZQokQpRcrEa8lDtFr1
	gJixUAMzpWZqeoZMTju4HkioQD/STMil6zca38iWZqGUu2UBIb5cjsKex8atbPgVQPjIwnMbqOKdU
	ZgMn6kc9OvUsmxTqzxqDPAKJVsPOoWocQAJjopnT8JvG4g3nYFOHzL7PB6piMYPvEp15B5WXvHfxl
	MB4vD18wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yPl-00043Q-HT; Fri, 21 Aug 2020 04:12:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO8-00034Q-9d; Fri, 21 Aug 2020 04:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=83Z8Zqnh35ir8IvrFX4mU8ZovtxoSS674PF4/COyolw=; b=mcfS4WiLk+KB6LNQlZTY9RtVXh
 Ft+D8z7MzktvwI3VQgL2Y390LJ8YbesiUEaO06qB/stDejqV4yelleeQapp/OiaCTB3P1KfEjIa+g
 2m13kyHmoA3QkTaPM6KHJlSAkAHFTlCmcbdOO8yfSf1LGA900kxe1UiKro9afflzB2GoZWWr2m7cJ
 aRLI14spp8D2S28hh88ELocDNbcVD8r72RyGTO8WM4otG0ethhXS2mi/R13LJt/yT3wkRFdl5FhVK
 cW+SO8FzyaCrGnQ0ko2oiZ1w+V4LIahm0J4M3iDVTjWXz/6JWh7TikmHE5pmxRlr98jYaOXsKfF8F
 kCoL41rA==;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9t-0001Ja-24; Fri, 21 Aug 2020 03:56:07 +0000
Received: by mail-il1-f193.google.com with SMTP id t4so348948iln.1;
 Thu, 20 Aug 2020 20:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83Z8Zqnh35ir8IvrFX4mU8ZovtxoSS674PF4/COyolw=;
 b=Gd0FkwubLcMKlVSgZAFonappelI1i0qQF5Q/De6JiILU27OdvL65yx57G1usuC2uZ+
 l3MSHz22znn9/isyl/gdnXEbXw/4VHE4g9+J/w664yt64QxmzMzv8IEmFz1uT2YqJLWO
 2F36hZWXMOgI7d4tkd2e+xUviUQW8d04bb6NzPJR9GZnDw2a9BEzoEac4SSf48QS6vdK
 Fm6vgLuB8euH+liw7PTtAww9j3ZekmOFOpB32YF+iP++WdhWNYnBlTBwya3pu/umZnZG
 PhAW6e+wjFI9JEqDKu09W2mls+c7ME5Zzu2OJ/Kbj70fsv8Ugo0qjjDKRkUPxM4oLeYz
 M7+A==
X-Gm-Message-State: AOAM533sr4Jey2N7J6YYKPzTKahpMjgTTPQy3rLdT1AIWGFhmoOGzfr7
 unGZQhNpdzl5uOVfLIflKw==
X-Google-Smtp-Source: ABdhPJxVmfmxBFQk5b4jolguEC5aoTpVw2YVZCKtqDd0bav8Td8Xfa3gvtoATcNAX6N1B9W6CughMg==
X-Received: by 2002:a92:ae06:: with SMTP id s6mr993827ilh.64.1597982163916;
 Thu, 20 Aug 2020 20:56:03 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:03 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 24/40] PCI: dwc: Ensure FAST_LINK_MODE is cleared
Date: Thu, 20 Aug 2020 21:54:04 -0600
Message-Id: <20200821035420.380495-25-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045605_388855_EE398003 
X-CRM114-Status: GOOD (  13.37  )
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

"Fast Link Mode" is a simulation environment speed up setting which should
never be set and the default is not set. However some Amlogic platforms
have it set (by firmware presumably). See commit 87dccf09323f ("PCI:
amlogic: meson: Don't use FAST_LINK_MODE to set up link") for more
information. Let's clear it in core DWC code so we can drop some vendor
specific code.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 5 ++++-
 drivers/pci/controller/dwc/pcie-designware.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 14ac87fa21a2..ed5dadcbcb45 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -560,6 +560,9 @@ void dw_pcie_setup(struct dw_pcie *pci)
 	dev_dbg(pci->dev, "iATU unroll: %s\n", pci->iatu_unroll_enabled ?
 		"enabled" : "disabled");
 
+	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
+	val &= ~PORT_LINK_FAST_LINK_MODE;
+	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
 
 	ret = of_property_read_u32(np, "num-lanes", &pci->num_lanes);
 	if (!pci->num_lanes) {
@@ -568,7 +571,7 @@ void dw_pcie_setup(struct dw_pcie *pci)
 	}
 
 	/* Set the number of lanes */
-	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
+	val &= ~PORT_LINK_FAST_LINK_MODE;
 	val &= ~PORT_LINK_MODE_MASK;
 	switch (pci->num_lanes) {
 	case 1:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 43d3729101c3..40c3766df096 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -36,6 +36,7 @@
 
 #define PCIE_PORT_LINK_CONTROL		0x710
 #define PORT_LINK_DLL_LINK_EN		BIT(5)
+#define PORT_LINK_FAST_LINK_MODE	BIT(7)
 #define PORT_LINK_MODE_MASK		GENMASK(21, 16)
 #define PORT_LINK_MODE(n)		FIELD_PREP(PORT_LINK_MODE_MASK, n)
 #define PORT_LINK_MODE_1_LANES		PORT_LINK_MODE(0x1)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
