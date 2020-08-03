Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAD0C43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:01:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA71E22BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BA/xCfuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA71E22BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wB4SJHMPo6wTUL3mHfo6FhvyqSKF8Npg3SRFKrK0GxY=; b=BA/xCfuJ68FA9i6piNybkwRlN
	qh0ErbS98f+bBCteoy1dpbmSh+B79F+rarLfDjanKQy2oqie/tMuzY7gio4iRe6W3edQr47RSL2vU
	I6Xdu2ilYZvT4z0OGU1ytS1dXh7zuANY7n3pfUVdi0oQLHzONfCmRp8uUE6ftsPjqVW3Op9MTXA2S
	pbNNtrIVTUTe9rgEqK54RwbwRvnIzirp1/CIQh2zhYbiZcxE75cgSb30FVpcW5ZSKfSHS4l6Tnv2p
	DzskBLvIir6hCWSVC0+tbhLISCTA2ZRoqhVFakuqvdX4kj2PysWrY6lctmT1tfPlvJoixwahv0I1Z
	b1Zh3/1Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2haH-0008N5-2X; Mon, 03 Aug 2020 21:01:25 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haE-0008MC-Ho; Mon, 03 Aug 2020 21:01:23 +0000
Received: by mail-io1-f65.google.com with SMTP id u126so2716341iod.12;
 Mon, 03 Aug 2020 14:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKskqR1BQLcQkRJa4jVCjBb26v/8ydnan9t1CfXlQP0=;
 b=pleApfyELme+4uIBO42PoDZssFVjl3PHLZbLlp9zNyKm1wEXt+6dIY2dQjl7EZ13qf
 v2wXqtW3ng5WGzDiCe5AtJP35mAaJNgxb9d9GeJOaHXpO1uxDQy1p7geCt/Le/3kRNO4
 H7k9/3jB4BjfHcN08SEHDYPnYnkIeGTl1l46zg0aVG9d0ca0S6AeJxTstuGN8goXKg4K
 jvK1UJddl4VAp+nVWUZUm/M+GyNDprocKpf86WCGKu++QGZXOgLAOMrJy6MRYvCI9R/Q
 wSk812M4BdhfOQsesnLn0GU+KWmqoH9iXiFAfqR+zYrJor5VWhqysp8y9J+5JwqhVv46
 lQIQ==
X-Gm-Message-State: AOAM530+aIm7YiQen5zjEgxv/d94FwKw4g8MwkcjfO8dNeX9V4pQGIXr
 fLL4GselcZUwTX8WQw92Jg==
X-Google-Smtp-Source: ABdhPJy4qG4p8bfrwbYSt3lvEPjhQpXlxLgUy+tuEvf+7Lf39Luq/OZA9TVNwuc57X3DpMVIygnSPw==
X-Received: by 2002:a05:6638:2601:: with SMTP id
 m1mr1810484jat.141.1596488481653; 
 Mon, 03 Aug 2020 14:01:21 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:21 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 01/27] PCI: Allow root and child buses to have different pci_ops
Date: Mon,  3 Aug 2020 15:00:50 -0600
Message-Id: <20200803210116.3132633-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170122_650540_030A4781 
X-CRM114-Status: GOOD (  16.48  )
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
index 2f66988cea25..8712e595174d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1030,6 +1030,7 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
 					   struct pci_dev *bridge, int busnr)
 {
 	struct pci_bus *child;
+	struct pci_host_bridge *host;
 	int i;
 	int ret;
 
@@ -1039,11 +1040,16 @@ static struct pci_bus *pci_alloc_child_bus(struct pci_bus *parent,
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
index c79d83304e52..cec789a0437e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -516,6 +516,7 @@ struct pci_host_bridge {
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
