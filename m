Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6D2C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA2A206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRJEV3ZP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="It+Ir6JA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA2A206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TGctPflPXorFS6MZvXnpfSpbOskMu5G5mXICB6vOULI=; b=TRJEV3ZP7lfG9zHs8VbCwjpEc
	yaSl3HKmh0quLyVfqG8LiOlJD3/cXfppKLYbz5vBbJa7KIZrBngyeUOObjQcHIfBkF+/LZqljA57n
	RfKP9UpRxd+W49Bgsr2BPL41dNaz69vt5yx632jcjZZ66FZeIPlsOsf/g80Ok9YGjTfldXs5mIl66
	c3lclQokt5HKMKCbRKk7aqhXEYLekVhUL5EjFzoW679JLD+ySISM0006fdO/kP+KvAc1s5rc44KcG
	hultjIFPBnA1jtRXGWJVOgK3F8/v7hp3x6Oc+xC0Iu4j7ANsxPr5u2dYOHm+vTq2h3yUniBYTo3Nz
	w5VBefCKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yQ8-0004EX-2a; Fri, 21 Aug 2020 04:12:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO9-00034Q-9w; Fri, 21 Aug 2020 04:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1SzKekjf6fRGgLEC8a7Q0N4huYSGdxsop7/CqILDTfo=; b=It+Ir6JAhFvAw9/ICfWoJrRK+1
 9SAbBmolFuJUtxGwL9rVTQQTucpzrGLxJtQfpk+2p6aNKHm2jagDdTnkYPMsJiSsy2yp2+b35LWQO
 EA0lQg8gZmoJZ8+A44yJvjBhgeEPNoZJM5RiBlKMhtWvJSQBgNEfpz+AzdD2V3xcMJdEoj0zdjt7l
 PNEW5qA+Dnk1FfRxjbwaPGpxRxxi2RE5LGJE/O0hbiXGO0Imis8zko0GgQ0ebtMjOuW/cWH6c1ghQ
 iWhkKy1SccusVAmG6572oIvd63I8Grznpx4rejaareqUWm0/nt12bxKzZ5ehq68qCIMBVzxOTudRY
 SGGpMYTw==;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9k-0001Iy-57; Fri, 21 Aug 2020 03:55:58 +0000
Received: by mail-io1-f67.google.com with SMTP id s2so492137ioo.2;
 Thu, 20 Aug 2020 20:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SzKekjf6fRGgLEC8a7Q0N4huYSGdxsop7/CqILDTfo=;
 b=FhNJrspelo2j6aghHCv8E5t9+7iVg540t4wl15b84fD9mcj0SIe/gycviSWW06Oc4K
 bxMpCJSHFXxcI9halgtwIefuHJoRgYAVQ5R2ZfB6z206V5Fu4E6GEvsoT12tg4nbva+P
 gMbNGps2Qj9xDXYihUmoemP4rcGIKy7FgUdjPT7MSsX7W+keZ/SYb2Ypv1YZUekQspgt
 dPGq98nb4wsLMiP1PbPJfxAxapmX4PKqDUPFX8TzVBQUE7S+j6SR9TFLT9RRrlmLHQ53
 5AIgqnmELxO1CexSgafWYjs63EyGChDiyaJPUS4WmddtEYkKQkbrF+/id1OjMTPO8XOk
 3rJw==
X-Gm-Message-State: AOAM530qxyUbZ0Z0ncTcfZ5IJDOv2HSmw+ohvn8R+jgC4sVoeGjn119H
 4ou66K3cPRCkhb+EJVta/A==
X-Google-Smtp-Source: ABdhPJxpMTeiMlYRVgyTNiC9a7PyE7DHTrmOsJRe09lztrnsaJ5bD8KQoQujvIa/rDSeytaaTwHavg==
X-Received: by 2002:a05:6638:25d3:: with SMTP id
 u19mr821718jat.103.1597982155028; 
 Thu, 20 Aug 2020 20:55:55 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 22/40] PCI: dwc/imx6: Remove duplicate define
 PCIE_LINK_WIDTH_SPEED_CONTROL
Date: Thu, 20 Aug 2020 21:54:02 -0600
Message-Id: <20200821035420.380495-23-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045556_502081_C686E590 
X-CRM114-Status: GOOD (  11.43  )
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
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 68a09680e728..2b075a468104 100644
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
