Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93921C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:08:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C35B22BF3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3SQLKlkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C35B22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VZ5VU8wmys1tWvLzyjW9zoIsJRludcHmF1623f9xSDE=; b=3SQLKlkMReWPt0mYgopsBzA/k
	Mg+MN7zQNWQAgxpfDB+BRMfsQ2YYRgWtYx9jzZoUks1Af7Z2xGC+Dr9XvvEHEpcDDc4gUjtoGCtbd
	AT3v2Vbf1AWQY18jH1jeJYWfRHQ85WUwq60L99ztk9ztkttNSqLDAk8/Co1Rd+jx8q1g2sc73CEe5
	sfoAIyHNqwJEmhcVOwqZS/IuoQ1ExadBQDQtFEWc2Mq4WXGpzHRIpBp4WRtTOW7t/aypsVdpOmkIo
	V0w7YCzlLH9DoHZL555NMEEiFTmZLGxwyKv2vEw0sdMMIeRaedZ7aFc1UfT9gUgc8jbi3sfpL40bM
	ZGcO8u3tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hgW-0003q1-N8; Mon, 03 Aug 2020 21:07:53 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hbC-0000RB-AU; Mon, 03 Aug 2020 21:02:23 +0000
Received: by mail-io1-f68.google.com with SMTP id l1so39994443ioh.5;
 Mon, 03 Aug 2020 14:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bEN9vVsE3mU2Nyqo3uVsRwOE6mBebuJzlr8xG6a6d4M=;
 b=TnBF46tvXH6xWzI9Alt11vY+pTEAi2BqWT0oBgEVZYx3mYZGq936LPeABS76rKqX18
 xpFdRJ/8Ujlz3zJBpOazPh5hnGs7lfeauxkp7lhDFBSmH1FtJZn4Y8FPQ16bXhW2kFpQ
 P4x66ENDA66zAqUj8b32qz5qa/39TikO6UWM470LQ0xm+ZxJHV1b6mCo9XHqx4pFKSLO
 k3qgM4gWyvmppB9JP7xJ0dnGOOOdTTM8CjkgnUQyOGBsMy6Lbp2Mdm1JKHcA91BsJjH/
 kLFEhZ6lWJUNvtJZ+Gq1ZBS68KoOq42IgqfGN5InpwGQIasSYLQEdalBj0Uym/xhKM2i
 lDaw==
X-Gm-Message-State: AOAM5336Qld2nI1aqcWucPSsneCJIkhLjz1HerV1yQiBSwRo/StoiQkb
 xcxrKOlNCdVSXBYDrugSvA==
X-Google-Smtp-Source: ABdhPJzc5blExyVY0xBSjialU7rbyHIo6WdVKug3iv8C/bQYaB+qRckTphLyP0HPoPp/7SDACilwzg==
X-Received: by 2002:a02:a584:: with SMTP id b4mr1758886jam.68.1596488541762;
 Mon, 03 Aug 2020 14:02:21 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:21 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 23/27] PCI: dwc/meson: Drop unnecessary RC config space
 initialization
Date: Mon,  3 Aug 2020 15:01:12 -0600
Message-Id: <20200803210116.3132633-24-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170222_485572_896E88DA 
X-CRM114-Status: GOOD (  14.22  )
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

The common Designware init already initializes the RC PCI_COMMAND, BAR0
and BAR1 registers.

The only difference here is the common code sets SERR. If clearing SERR
is what's desired, then the Meson driver should do that instead.

Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index cbde683d107f..d1cfc65f0a69 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -34,15 +34,6 @@
 #define NUM_OF_LANES_X1			BIT(8)
 #define DIRECT_SPEED_CHANGE		BIT(17)
 
-#define TYPE1_HDR_OFFSET		0x0
-#define PCIE_STATUS_COMMAND		(TYPE1_HDR_OFFSET + 0x04)
-#define PCI_IO_EN			BIT(0)
-#define PCI_MEM_SPACE_EN		BIT(1)
-#define PCI_BUS_MASTER_EN		BIT(2)
-
-#define PCIE_BASE_ADDR0			(TYPE1_HDR_OFFSET + 0x10)
-#define PCIE_BASE_ADDR1			(TYPE1_HDR_OFFSET + 0x14)
-
 #define PCIE_CAP_OFFSET			0x70
 #define PCIE_DEV_CTRL_DEV_STUS		(PCIE_CAP_OFFSET + 0x08)
 #define PCIE_CAP_MAX_PAYLOAD_MASK	GENMASK(7, 5)
@@ -303,9 +294,6 @@ static void meson_pcie_init_dw(struct meson_pcie *mp)
 	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);
 	val |= NUM_OF_LANES_X1 | DIRECT_SPEED_CHANGE;
 	meson_elb_writel(mp, val, PCIE_GEN2_CTRL_OFF);
-
-	meson_elb_writel(mp, 0x0, PCIE_BASE_ADDR0);
-	meson_elb_writel(mp, 0x0, PCIE_BASE_ADDR1);
 }
 
 static int meson_size_to_payload(struct meson_pcie *mp, int size)
@@ -353,13 +341,6 @@ static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 	meson_elb_writel(mp, val, PCIE_DEV_CTRL_DEV_STUS);
 }
 
-static inline void meson_enable_memory_space(struct meson_pcie *mp)
-{
-	/* Set the RC Bus Master, Memory Space and I/O Space enables */
-	meson_elb_writel(mp, PCI_IO_EN | PCI_MEM_SPACE_EN | PCI_BUS_MASTER_EN,
-			 PCIE_STATUS_COMMAND);
-}
-
 static int meson_pcie_establish_link(struct meson_pcie *mp)
 {
 	struct dw_pcie *pci = &mp->pci;
@@ -370,7 +351,6 @@ static int meson_pcie_establish_link(struct meson_pcie *mp)
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	dw_pcie_setup_rc(pp);
-	meson_enable_memory_space(mp);
 
 	meson_pcie_assert_reset(mp);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
