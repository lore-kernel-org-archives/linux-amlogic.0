Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D7C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:10:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B61B206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGKj+pr5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ahNFtXGp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B61B206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+nVyWQNRkLHAoraSpSZYweDbH0SGMUDXXRLZ6tZzGM8=; b=qGKj+pr5mCbhRChqGtUltXhcK
	Znm/HOCtzMJLbdpWIrWkhcogySDDUt1dlLj5Ls156ahYgGQSZC3tTgXZry0oQW7oBCBsvECXujPR+
	Q0ABjzS8VodFyre1FOXxA2RS3dTLsdtjSABzzArOnL0bLzhgSZLAo5DuSikK0JDdgYDwmw4bIW6j1
	FDHbZ2IW2aLMHiKglyruJfoZm0eiLNMASAW6H1HpWyLbuYmnGQHxcodW8UwmibT6WOgCca5W4JBoA
	urWpVkWSvnlO1oz2bMhhDgdh6IAL66tUVlbQvGzilaibzReiOGms/4ZsUCWr0XKJ/LtXbNlYSemRq
	KYN8gGcxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yO0-0003MP-SN; Fri, 21 Aug 2020 04:10:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yNs-00034Q-Av; Fri, 21 Aug 2020 04:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FSKItnmqVV47WYr/7qcDpqZpoV+iUC1CCrqmTczKz5k=; b=ahNFtXGpcBmBHyctwfOjuSVD0D
 ka/Zabh8c2pXx33c0ZZMm5QM2KOqJ/S2I2WsHkKJN9rXzCJUCXP/pCQF35fykSYMBr6PQWVw+toG6
 xI8sKZaiyPxPzD4v2PMcTynlboo7ohmvGwjGqn64028lJ8wLSGN3WagBNbGFlfvhIrGyYGRA7rZ3Z
 2x/Pzwwa8uxIy5Rc/BaJf6CD+EQ+o4f1H8tKUDdEhUzXWPNAPAkxt0aSk/Qe6THLWW+uSevtwJb4R
 owLabSGz9tQQeXKIex/xKp2vJFib8VO3fAXg1WbsYCT1NUygLerxU0SixIuDsIpAoDl77ZScbTd18
 NoSuLe4w==;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAU-0001PI-FJ; Fri, 21 Aug 2020 03:56:46 +0000
Received: by mail-il1-f195.google.com with SMTP id t4so349697iln.1;
 Thu, 20 Aug 2020 20:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FSKItnmqVV47WYr/7qcDpqZpoV+iUC1CCrqmTczKz5k=;
 b=ZEI0zC/x8DXlXjtwi5/GbXY3J+tVrjch1EGcw/dc9u9WXK6MYB+9C2tBB5uNJelLWg
 R9qW+ZGN3XhE5K2cP7I7aERAFfPTtPGc98h0Uvb6fhCh+rV0vGhfcxtlTEj2TRvb7mRQ
 s7KebgAbz0rPwYLH/3oGyMS8JxcI8l+vKkpCQ23HCq8JO0loaEKtW2Se15jmsQxNt9UW
 apPFy62TpSkwHJIpPtYJZCqIihfM3mPjHy0HRqJDvO3nFKDGXcEUEXWzpOsAHPu2NiaC
 wdy84mWli7p/rCg60rsq2e7fJ7SirBBz4NjEZilsePK2Qg5oITCXA6187iKSR9ayxGKb
 k8cg==
X-Gm-Message-State: AOAM531mFiqU65FNfZ/yofB/FUvVREaiPlXZYANspEg1pNThG1qvOHXR
 ZVrLhllMR+VquttlHUIjYQ==
X-Google-Smtp-Source: ABdhPJwGnC0NoaFAIgP3xC50Zxq28Km7ugxrs/Tj/1VjtdqN24aNRru4eyCFf0FvELFPS5zN67Hmig==
X-Received: by 2002:a92:1b85:: with SMTP id f5mr984799ill.308.1597982201268;
 Thu, 20 Aug 2020 20:56:41 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:40 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 35/40] PCI: dwc: Set PORT_LINK_DLL_LINK_EN in common setup
 code
Date: Thu, 20 Aug 2020 21:54:15 -0600
Message-Id: <20200821035420.380495-36-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045642_928141_8A837A27 
X-CRM114-Status: GOOD (  13.97  )
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

The Intel driver is the only one to set PORT_LINK_DLL_LINK_EN. The
default value is set and it seems pretty certain that enabling link
initialization is always required. Maybe it could just be dropped from
the Intel driver, but lets move setting it into the common code to be
sure.

Cc: Dilip Kota <eswara.kota@linux.intel.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 1 +
 drivers/pci/controller/dwc/pcie-intel-gw.c   | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 448f62f2e6ea..61e1faba15bf 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -553,6 +553,7 @@ void dw_pcie_setup(struct dw_pcie *pci)
 
 	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
 	val &= ~PORT_LINK_FAST_LINK_MODE;
+	val |= PORT_LINK_DLL_LINK_EN;
 	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
 
 	ret = of_property_read_u32(np, "num-lanes", &pci->num_lanes);
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 2c0d32ffb828..d15e49b8df2a 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -164,10 +164,6 @@ static void intel_pcie_port_logic_setup(struct intel_pcie_port *lpp)
 	val = FIELD_PREP(PORT_AFR_N_FTS_MASK, lpp->n_fts) |
 	       FIELD_PREP(PORT_AFR_CC_N_FTS_MASK, lpp->n_fts);
 	pcie_rc_cfg_wr_mask(lpp, PCIE_PORT_AFR, mask, val);
-
-	/* Port Link Control Register */
-	pcie_rc_cfg_wr_mask(lpp, PCIE_PORT_LINK_CONTROL, PORT_LINK_DLL_LINK_EN,
-			    PORT_LINK_DLL_LINK_EN);
 }
 
 static void intel_pcie_rc_setup(struct intel_pcie_port *lpp)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
