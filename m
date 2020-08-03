Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79848C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFCA22BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6I5RUCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DFCA22BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JaybKtWO6V9wj8BXgSUODrfNQYnCyMtOjgk0R3536vo=; b=c6I5RUCsHbBSIQ5IOg0ti5Yzi
	0bBf9hk6qzQuFpR5x3W6eK2u0PZBGI+1WbahxBejRZrYfIOKT1abELPWSxX4d4k9VBwbDViyarmOz
	RCIgT0r0BucYSWRCa+WXqnPEI+tjNv79zjO0ysb7ZpWqRcAoMNM0G5rS3E/LZ6v+pRdX6Bs8di3DM
	DLNkVz5MwhGG+nalcS0kkFEx4y9p8AOneG+73x+niApfQoz3W5DZ4TwP454pWLbtdjyko4EqWYA47
	Q6HPI1DwapxGpobm47qbMMry7pHFy/8/JEwgStPoM08Ug3S/+Mr2Caf1WCMyXyuj6cbapk89Ns5nY
	A3+3OFuvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hcp-0001TL-Tr; Mon, 03 Aug 2020 21:04:04 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ham-0000CY-EU; Mon, 03 Aug 2020 21:01:58 +0000
Received: by mail-io1-f67.google.com with SMTP id v6so24750934iow.11;
 Mon, 03 Aug 2020 14:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFafu+8WFYxvnK2ZfkQMV1ef4S4ilss7PqKLS2/JE9Q=;
 b=bgW6u7LnxYh2OMfzJxWRnEom8//r8oG1o+ludYj26ETmLbJeFBSMoGlSXxeF2abckY
 05pNg2iBczfdrfBnk4sjaMYiJZ1J8V3RFuxRsBcEpPOUDfJEvXeC7xHm5ba5wb+DqCmv
 Pd/rBRuyFQGJ6jUIhgXUUOHxLarl3oJ4RHITjVOHjuIClUc4i8yar0r6UxJZiLf7HtzS
 9s6EThRhJBnFC7Hfly4QOpV0JasNYMtPN25TWWeo4QmxNm9tlet77ckN+9Paquc/p0Bo
 be0tuzgqL01blwkvwLUbHk/lWQvw3P4cvOUpWQZwYCKWsHGE1VcFD3aeYKEKkHw/OnzY
 TuKg==
X-Gm-Message-State: AOAM5320FGfecC+fcLg5a5PByvmxJrlNueTy7AKzWFX73UIYdnWDCpUk
 +/bRySmgYLT0ExnpvTn27A==
X-Google-Smtp-Source: ABdhPJwJ3HnlJnV2ngZJFyUd41+SK9bAY0gYR06YRKYq8NPItVwUmrMdWUTQ4AtFe1sC/npigxntYA==
X-Received: by 2002:a5d:87c9:: with SMTP id q9mr1812686ios.113.1596488515619; 
 Mon, 03 Aug 2020 14:01:55 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:55 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 14/27] PCI: Also call .add_bus() callback for root bus
Date: Mon,  3 Aug 2020 15:01:03 -0600
Message-Id: <20200803210116.3132633-15-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170156_615702_9B1217CE 
X-CRM114-Status: GOOD (  14.47  )
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

Similar to pcibios_add_bus(), call pci_ops.add_bus() when the root bus
is added. This allows host bridge drivers to do any setup requiring a
bus pointer.

There are currently no .add_bus() callbacks, so this is safe to do.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/probe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 8712e595174d..337a3b7766ca 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -935,6 +935,12 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 
 	pcibios_add_bus(bus);
 
+	if (bus->ops->add_bus) {
+		err = bus->ops->add_bus(bus);
+		if (WARN_ON(err < 0))
+			dev_err(&bus->dev, "failed to add bus: %d\n", err);
+	}
+
 	/* Create legacy_io and legacy_mem files for this bus */
 	pci_create_legacy_files(bus);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
