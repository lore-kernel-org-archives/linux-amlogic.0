Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925CDC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:06:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A1822BF3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHsGJvw2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91A1822BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LU+FhlEoTSOG40NpiBRXXFz/Nc3VQAmVMZBe0C1SO2M=; b=HHsGJvw2C4MSjrvpfp4/aAlds
	5vC/dPkVdkQdNxpxk83ir0ggFy+qvy1DJVdCsyYC+e3wfvGc+s2GFx3GmP/g2U5i7iMz/v5yC8toK
	iw/kUQHTeJxuGxS3d/WF+sktmAQ+afMOHBA9md0mbjJvNaochzdas4fcOSR6VfaA9wzgKBMlcAT6R
	f6M0yIxKpSBv83x0Q9/q9U069LrU6p0yak9yGrA5NpL1xdGy9TqGeV1ny1dYZbo8kUQSQMbmusiX8
	l6FpOAviZIaOF3hp/2LTEUhUQZzwq4cAP3XCYpfEAwA+wRMbnEI/K30nS0QMhZmpbxGMi+Ofuz5rQ
	TCuh1wv7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hfT-0003Fy-VJ; Mon, 03 Aug 2020 21:06:48 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hb8-0000OP-OC; Mon, 03 Aug 2020 21:02:19 +0000
Received: by mail-io1-f65.google.com with SMTP id l17so40000735iok.7;
 Mon, 03 Aug 2020 14:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yeVh4LY4Ol0sFEbqSsJcffa7f//z27paKHgfSp0xtxI=;
 b=cCDEPXa0vsy1h8bjWLs27lUzm643XNjMmebl/YpffuA13x78kMcN/3bP1z5o7OTomD
 jxzMccc3l4EywShlJ9etuzWfZUonSaYN1CgoWSYzUNbEUxOU8LeJFjM+pQh2oq0531/c
 DyZoKCyy0WNmi7GSvN6IqI8Mbxjm4hrLSSx4LKvl44Nk6hJzb9/p3nQvq29FoJGop6ZH
 FjDxEQ7BHqhknWv09VRqkv+uLUkr9dZOQHCXqK0gonghpbQNNdjgUXTf9rjt3ZPgrbKY
 QXXB4JcOnij0tjiMw2e03adZehIib5XpPrZw70rphJP2Zi/FvG6tpZFGxxNjyO7lrinZ
 Brfw==
X-Gm-Message-State: AOAM530gw7ykz96UNA023EipaGnlQAJd8RAQ4n9MWW+aHyMrXbATA6UF
 ZkxEA+PXAalwR01JWyHCeA==
X-Google-Smtp-Source: ABdhPJxHdYdH6fpt0x+gUcwdUAm9TdIxKmfEPs100vcr5aCcB5zinD7L8bd5gBFg5DUxhkQoFWaU1g==
X-Received: by 2002:a5e:c30f:: with SMTP id a15mr1845040iok.184.1596488537676; 
 Mon, 03 Aug 2020 14:02:17 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 22/27] PCI: dwc/imx6: Remove duplicate define
 PCIE_LINK_WIDTH_SPEED_CONTROL
Date: Mon,  3 Aug 2020 15:01:11 -0600
Message-Id: <20200803210116.3132633-23-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170218_955438_9236B4DC 
X-CRM114-Status: GOOD (  13.74  )
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

PCIE_LINK_WIDTH_SPEED_CONTROL is already defined in pcie-designware.h,
so remove it from the i.MX6 driver.

Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 7b526f4f85ce..64e694f04dce 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -116,8 +116,6 @@ struct imx6_pcie {
 #define PCIE_PHY_STAT (PL_OFFSET + 0x110)
 #define PCIE_PHY_STAT_ACK		BIT(16)
 
-#define PCIE_LINK_WIDTH_SPEED_CONTROL	0x80C
-
 /* PHY registers (not memory-mapped) */
 #define PCIE_PHY_ATEOVRD			0x10
 #define  PCIE_PHY_ATEOVRD_EN			BIT(2)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
