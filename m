Return-Path: <SRS0=FilP=LN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A43C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:41:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 289A2611B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 289A2611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IUNGeC0gOCP0qwfu8zdzJVmPHey+kFnEipzPaFkLfY=; b=yqRBZfHRT7gLiD
	VhscrgGfeybTJgpgEGRhH2MTPa58om8puFXjRxhUMPQkuozdoN8lYIaGykM9x9DO9ca8G8ZoF0hnm
	f+l3pBgVWLsQ6B0s6cp0eSL1erByloyko2tgiIMJvN9BKtXhqvQ2wSObuPatKZqp7tUylBxIILe2M
	jamI8Lc+g9F1nYz6zTQjZJqgdyD7vZxqggCP/YrLOTV60+t2DedY4wEy+4sAbNlbgA5j4o3C+2DVE
	/d2bsJHfrSg79Tuf80QBBZxVCiLAdHQd8jAiU9gBLsEuSZ8A2xxjO+trAOZhxEMQkw8gNJxHX3caV
	8YepiaPwGMVJ5MakL2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUfA-00GUtY-3D; Sat, 19 Jun 2021 06:41:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUeX-00GUe7-KD; Sat, 19 Jun 2021 06:40:26 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so7174616pjq.5; 
 Fri, 18 Jun 2021 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jMdLXDhFl4H1jBrVVGBSGnbHc6XgMnjwU52Wg9vOITA=;
 b=IH+xuUGqI1f9AUP9hnelNrxh0SN+eH8L+m0MSZOUAStxDdSMizzef6SyMrsw5aaB1P
 K12IXSa4V5+3Rb1FMmX61jqbGvgIUGCni1qaqyS+TG6G6ArjERDnkQzVru2zU7xdubKC
 zkyM0QnpKfxBDnkejKI/+I25JPvNRcSSVzzg6UiX68pYUwwrclfXnoy3Ati2dbtipn91
 dWzf7R0oZq6KvSOQFZOtCQuYYz+5f6cYiTvdRnsoeB6nYDxdRi662LvnTw/0vAxPhsPc
 GUE3xNyzVxvgWE5YpZL+x/oxB5MPu5tNDnmIrWDHmlaP6KAn8stTju6PFO58p9GpiX/h
 X37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMdLXDhFl4H1jBrVVGBSGnbHc6XgMnjwU52Wg9vOITA=;
 b=sa1EFgrb8EpWgH/FRfJG61epVTvPMrQ3YcfBTisSjVYrsIqjPRMhjVbc45lwW7X7fd
 r8u2XBfG+gYhyNXeoVmJwIxGzBb3bcliwhnJR4E0ATLIrskj865Hd1mhiumn01eyIr0T
 yigVVu4iQ9H9+LtWloKH4SAHKKqKcDaJmYWMDBeyknx1I0Kytiot0B4EEPPqqJoJtdLj
 dfwnmROnWNZK5Sv/1rfa1ufc3/BYrjJXU0rdxQIv9JX8WNbZSoyzmDbtDfRUcng4PbGh
 K4zDB/8SgzJHB62dN1eppIicV9kNP/EvgFp5mn5NbboVYUyf/novzi+qGudlVRP8n/+e
 LLbA==
X-Gm-Message-State: AOAM530sHnifsvIho76js6u8eDw9EWqBPVbEa+rHe86WkbZmfRHS/lNO
 qedGWi4qZpZwXa649ZOl7kPnixZk7NiH0g==
X-Google-Smtp-Source: ABdhPJxsfwbnPxy93E8cwaFesNULmdimBitNo/Xif9c/y85Wm/Rca1Q+h7DW6w8IvnhnFvfgnesddw==
X-Received: by 2002:a17:90a:7401:: with SMTP id
 a1mr25489029pjg.57.1624084824992; 
 Fri, 18 Jun 2021 23:40:24 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id r19sm9440274pfh.152.2021.06.18.23.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:40:24 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 3/4] PCI: keystone move mrrs quirk to core
Date: Sat, 19 Jun 2021 14:39:51 +0800
Message-Id: <20210619063952.2008746-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619063952.2008746-1-art@khadas.com>
References: <20210619063952.2008746-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_234025_710749_19585283 
X-CRM114-Status: GOOD (  13.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Replace dublicated functionality ks_pcie_quirk to mrrs_limit_quirk
from core pci quirks

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 49 -----------------------
 1 file changed, 49 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 53aa35cb3..879ae2d4f 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -83,12 +83,6 @@
 #define ERR_IRQ_ALL			(ERR_AER | ERR_AXI | ERR_CORR | \
 					 ERR_NONFATAL | ERR_FATAL | ERR_SYS)
 
-/* PCIE controller device IDs */
-#define PCIE_RC_K2HK			0xb008
-#define PCIE_RC_K2E			0xb009
-#define PCIE_RC_K2L			0xb00a
-#define PCIE_RC_K2G			0xb00b
-
 #define KS_PCIE_DEV_TYPE_MASK		(0x3 << 1)
 #define KS_PCIE_DEV_TYPE(mode)		((mode) << 1)
 
@@ -521,49 +515,6 @@ static int ks_pcie_start_link(struct dw_pcie *pci)
 	return 0;
 }
 
-static void ks_pcie_quirk(struct pci_dev *dev)
-{
-	struct pci_bus *bus = dev->bus;
-	struct pci_dev *bridge;
-	static const struct pci_device_id rc_pci_devids[] = {
-		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2HK),
-		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
-		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2E),
-		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
-		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2L),
-		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
-		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCIE_RC_K2G),
-		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
-		{ 0, },
-	};
-
-	if (pci_is_root_bus(bus))
-		bridge = dev;
-
-	/* look for the host bridge */
-	while (!pci_is_root_bus(bus)) {
-		bridge = bus->self;
-		bus = bus->parent;
-	}
-
-	if (!bridge)
-		return;
-
-	/*
-	 * Keystone PCI controller has a h/w limitation of
-	 * 256 bytes maximum read request size.  It can't handle
-	 * anything higher than this.  So force this limit on
-	 * all downstream devices.
-	 */
-	if (pci_match_id(rc_pci_devids, bridge)) {
-		if (pcie_get_readrq(dev) > 256) {
-			dev_info(&dev->dev, "limiting MRRS to 256\n");
-			pcie_set_readrq(dev, 256);
-		}
-	}
-}
-DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, ks_pcie_quirk);
-
 static void ks_pcie_msi_irq_handler(struct irq_desc *desc)
 {
 	unsigned int irq = desc->irq_data.hwirq;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
