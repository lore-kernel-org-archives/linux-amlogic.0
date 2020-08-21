Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8357BC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:11:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27899206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsfXcTI9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LSjBgmSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27899206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5GeWmXyC9IhMx/vmupOXIabT6A8dCUr8FbH33vmq7I=; b=UsfXcTI9HSb9c/KUZue8HwcFR
	46x5XXhCRJD3i8CjvDROqHj5/1o/TCvml+sSSJThNHfReW82tC41wzZxMHzNjQ0UHEFDnGrfFXUZc
	QwtAg8+F/XdlHxDj5EUMFvCiIMpOPAhe9GaPHKZXtEZFDQajNjNAP2hiCKoC0noLrSnvn/enmbXBS
	8cuR9SmXkBd4/LcYo8P/hzhbyVm600uztEvyWfi3uld8WU63R6rSLCRwJ+HozHxdlm0RXDvg74kPU
	4YCzyFyQRF9MxGJSK/VyfZ4ydNP/D9YOsFMRkIwWUMPRJQrDuWG1r2rsh4Vp5iUECb30ZbUXwMFMO
	g/XPQktqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yOe-0003cB-8t; Fri, 21 Aug 2020 04:11:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO1-00034Q-Qh; Fri, 21 Aug 2020 04:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XnNKAqnUjN1d+iRAazU+IyknAUrI93QopWNUW3GBtYU=; b=LSjBgmSHYFhs85tpDbNPfaUzS/
 tG+7Ye8J++AAvKsE2oFA4icjNBetzlTUWAzdTMaicTTIHLTtTplha60n1eM7Lm1KVmNgYuRdEr0vz
 KHrpFYOc62pkU+8CN9Y5FduxI3CLb72wu3B00xLDcKfHlmrbgjoFU92FuJDKUj8MlcveTD6NErAmD
 agH8Y2T2HT96DHPPS5rsc6gE5MFiUp7MNYdSfCot7aO9OJSBGQuRBpue9L2Q57/sLJoKqRjHOyQcZ
 MJMrJXybj6R1ld0vpUBvTSTjYBH5Fuw0Y+p3HPWVrGNX3QKeco2P1h1qUOtHpBnMMn6Y/+wfNg/JQ
 4I2A4jDw==;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAP-0001OJ-0E; Fri, 21 Aug 2020 03:56:39 +0000
Received: by mail-io1-f67.google.com with SMTP id g13so466596ioo.9;
 Thu, 20 Aug 2020 20:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnNKAqnUjN1d+iRAazU+IyknAUrI93QopWNUW3GBtYU=;
 b=VghCjZvDfKvwkB/FfpG6PIsSbg2pQp47LUWabJaYqEZM0+ttUN4vhmBZaCflm5WHUF
 lU8LrAWkadrAWikZSKoMAIsd/em7LM9mJxhtm2EPL09Zh79qO5Vs66UJZbGKzvufjnH2
 ehU+Ll7+vQhs2IUXfY5rHaEmnvYw2aA7h35UQcy+F7XYqej18MkxcBQ5BpICtGIivlsO
 9E3ML8WZEGT1as4bxpZ8fm89+jlB2J7Gm3uydUo4uDNHmGOuHcQX24RBKVk5PMmNiQMr
 yIv7JBV5fHug/ERKQgRrAAsyavBHNN/HPb/kVaC6aC7thjEGxqA3zVN09Cvbc6Txr3b5
 cdEg==
X-Gm-Message-State: AOAM532/e+a992opOGVRUrFmd6xtoQUDLiyNn1Eju7MbQcpG06Y/PY4h
 ZU6o4sgH1RScJiVzurwavA==
X-Google-Smtp-Source: ABdhPJxPpL1HBEw5J8dDBY93Hs+NL1K9mj9gCD0oWmg6OAV5ux8hwc5CFjZikXwoAoAuwpAiqoM2TQ==
X-Received: by 2002:a6b:1454:: with SMTP id 81mr919882iou.50.1597982195816;
 Thu, 20 Aug 2020 20:56:35 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:35 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 33/40] PCI: dwc: Make ATU accessors private
Date: Thu, 20 Aug 2020 21:54:13 -0600
Message-Id: <20200821035420.380495-34-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045637_265388_DF8FABF4 
X-CRM114-Status: GOOD (  12.16  )
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

The ATU registers are only accessed in pcie-designware.c and can be private
to it.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 12 ++++++------
 drivers/pci/controller/dwc/pcie-designware.h | 12 ------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index b2739b96659f..b0a030661860 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -180,31 +180,31 @@ void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val)
 		dev_err(pci->dev, "write DBI address failed\n");
 }
 
-u32 dw_pcie_read_atu(struct dw_pcie *pci, u32 reg, size_t size)
+static u32 dw_pcie_readl_atu(struct dw_pcie *pci, u32 reg)
 {
 	int ret;
 	u32 val;
 
 	if (pci->ops->read_dbi)
-		return pci->ops->read_dbi(pci, pci->atu_base, reg, size);
+		return pci->ops->read_dbi(pci, pci->atu_base, reg, 4);
 
-	ret = dw_pcie_read(pci->atu_base + reg, size, &val);
+	ret = dw_pcie_read(pci->atu_base + reg, 4, &val);
 	if (ret)
 		dev_err(pci->dev, "Read ATU address failed\n");
 
 	return val;
 }
 
-void dw_pcie_write_atu(struct dw_pcie *pci, u32 reg, size_t size, u32 val)
+static void dw_pcie_writel_atu(struct dw_pcie *pci, u32 reg, u32 val)
 {
 	int ret;
 
 	if (pci->ops->write_dbi) {
-		pci->ops->write_dbi(pci, pci->atu_base, reg, size, val);
+		pci->ops->write_dbi(pci, pci->atu_base, reg, 4, val);
 		return;
 	}
 
-	ret = dw_pcie_write(pci->atu_base + reg, size, val);
+	ret = dw_pcie_write(pci->atu_base + reg, 4, val);
 	if (ret)
 		dev_err(pci->dev, "Write ATU address failed\n");
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index c3178c8694eb..f4b871e3d73f 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -268,8 +268,6 @@ int dw_pcie_write(void __iomem *addr, int size, u32 val);
 u32 dw_pcie_read_dbi(struct dw_pcie *pci, u32 reg, size_t size);
 void dw_pcie_write_dbi(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
-u32 dw_pcie_read_atu(struct dw_pcie *pci, u32 reg, size_t size);
-void dw_pcie_write_atu(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 int dw_pcie_link_up(struct dw_pcie *pci);
 void dw_pcie_upconfig_setup(struct dw_pcie *pci);
 void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 link_gen);
@@ -319,16 +317,6 @@ static inline void dw_pcie_writel_dbi2(struct dw_pcie *pci, u32 reg, u32 val)
 	dw_pcie_write_dbi2(pci, reg, 0x4, val);
 }
 
-static inline void dw_pcie_writel_atu(struct dw_pcie *pci, u32 reg, u32 val)
-{
-	dw_pcie_write_atu(pci, reg, 0x4, val);
-}
-
-static inline u32 dw_pcie_readl_atu(struct dw_pcie *pci, u32 reg)
-{
-	return dw_pcie_read_atu(pci, reg, 0x4);
-}
-
 static inline void dw_pcie_dbi_ro_wr_en(struct dw_pcie *pci)
 {
 	u32 reg;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
