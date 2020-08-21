Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0462C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7141D208B3
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrz3VusF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7141D208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tgm+TiPGkxRjTld5rkVgRWe/FundoSd97bvsoXSClY0=; b=jrz3VusFhAQnOhBFZKrA7JUl/
	KcS9aEE0HUGi4dvLJoJjjkrkyx5VSRjXiH0/rHKKC2kYfc5LvVF35EIVEY2B+lDtKdP78iK0uoIZj
	0o79UEqp3jJ1g6k2z5vd/tFgmkgNHKNG2JcKpzZnf5ftXdOYC9/L9BQBJ5DmanJjky20y5Z8i33aW
	eTXpc1wiSKIZ2yq6j+Q5E+7I92jMwizMqRvW61WySHpSWuF8hrUYGwt9SFJ4w/Ob+B0SxJCG78MnK
	bTcj2d4f/lD2QtT9TfKUjKB2GqjL7G4QQv8ZtYF5X/TfkeBW3hIr/Sdjp8R3iPVNW/aohVWSrQMC2
	eSgFP1oMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yFr-0007nh-PY; Fri, 21 Aug 2020 04:02:15 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAa-00059p-RS; Fri, 21 Aug 2020 03:57:12 +0000
Received: by mail-io1-f68.google.com with SMTP id q75so489021iod.1;
 Thu, 20 Aug 2020 20:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=977wihraQvLF0SPRRQJhF+YrG+p3/qEwPqMrKAY+nbQ=;
 b=Zbx2tsC1YIaaE8P2UzVoLoG05ZeBH+QGLLm86bJogFmjPy1LFVTBKYGJJ4mgDH7PM8
 MdR8xtTQLxAkAJ82WThbBMRiNZpHpSbGWNqNRNjO8PYJ4up69StRuI4vocE5sv/jOXtx
 Tz6Awkyo3pHMl4PJrq8WDvAlddLigfHgdY+Msn1KmByXk9vcEiRyASLqhNbfLiutgw/Y
 vOvL+gFIV4tk5/XQZwsSZhzSmsiTck69axiEBuF6L8Kg9QKovNp0ExuNtILSPA/UpPvP
 6sZU3tXvcYfJ0og0hksXhwjNkrctiz7Fby8Yaehz083NRqGZzQyGz2BXNa9kG8o+gCB4
 Hjhw==
X-Gm-Message-State: AOAM532eB+nOD9rB6hVmHD5IBOnDoGo/afc7gyQwWuhGrJJGhrKHsVSk
 EcwdQUl9HvLQLvW/5SYqbA==
X-Google-Smtp-Source: ABdhPJw/uNByXN0aCl+4jyJ73JOY4dDBXCFrmTrhHNDlH5OMH+mWhGn9ESZSwCXXys59FN3TPFATHw==
X-Received: by 2002:a02:29ca:: with SMTP id p193mr859557jap.131.1597982205997; 
 Thu, 20 Aug 2020 20:56:45 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:45 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 36/40] PCI: dwc/intel-gw: Drop unnecessary checking of DT
 'device_type' property
Date: Thu, 20 Aug 2020 21:54:16 -0600
Message-Id: <20200821035420.380495-37-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235649_109234_A3C02F90 
X-CRM114-Status: GOOD (  13.16  )
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

A driver doesn't need to check for DT 'device_type' property, so let's
remove the check.

Cc: Dilip Kota <eswara.kota@linux.intel.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index d15e49b8df2a..6b102197a1b6 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -268,12 +268,6 @@ static int intel_pcie_get_resources(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = device_property_match_string(dev, "device_type", "pci");
-	if (ret) {
-		dev_err(dev, "Failed to find pci device type: %d\n", ret);
-		return ret;
-	}
-
 	ret = device_property_read_u32(dev, "reset-assert-ms",
 				       &lpp->rst_intrvl);
 	if (ret)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
