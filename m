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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF68FC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F58611CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69F58611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kN+Gggl5FSS3fF2Xg41/BGVANjFifU3NGSvebZ98x0=; b=JpspkyatlvKx7k
	nnb7KDUWidgv2XgWQnrVPAQsnUx8YwIuGrv2PBoTFgCLgY5cKwcPOMfMClVO285piLvGxdGQX/dGL
	00/+yl/QTEiT8XUkc9Pwz+M7fln3TgZXOS661U566ND6Jq6Mn5a/WtFLFIziSUjODZ9fKYKFJBtUv
	vAIrrN2HyNQl1vUX+C08l6keZ7VPthOpUB/B1EokKyWdeCRr117uO4bLeGRgmIXA9mHtVP4yC2qCD
	JWqi6WTQBXvL0ryp6x8S5LAFUZzRGh0s8jbVvJlf98KBW9vRhD8rf+7mUFALoKAdOmEwn/gDSM5Zb
	LwdzQmQ9iedov4HpozIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUfP-00GV0y-7e; Sat, 19 Jun 2021 06:41:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUec-00GUfV-17; Sat, 19 Jun 2021 06:40:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so9057519pjb.5; 
 Fri, 18 Jun 2021 23:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1glDM6oLeTVKmgkuXKty5D8QEB/JX/Xhu+0hRlzxY50=;
 b=ck0SbqtDwvvUv3IUYad5DJbmdangdvOau/iCF9srKXiWZ2fV80yAO2xqVqvTZbOUr9
 vdKxDq+MfnRmzW9JqCyZB1oifJpXKLJmsUwXsLWYe/3xwCLFI5hGK3iblNeQshsIKBSC
 9mGrHWq8CmakB5U9A9am3FED/Z3S5wE8bNGopHZBPT7LC1c0dBS/IKteyzryggtIFaDk
 7uqtxXmvinZCZFHYD8aN15OmZh30c3RoLTmCWxG1AYpJ9LRvGREa+13OCPYMDw2aWmQo
 neQtOvKO1FYfVV4w7ChdXNMecl6yc9UiQhLFAcGCIjpgM1w571u+qSHdkSyV+GIC6HsM
 MM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1glDM6oLeTVKmgkuXKty5D8QEB/JX/Xhu+0hRlzxY50=;
 b=qYq6Sq1WzsimDS/y9UFsPjFMrYxFuBEBxsCwX5gsXquQ8PtT3wNtJfnpj4NXzHr62j
 rVvodDANXjRr/5NeGy082CxknJWeDslni9xl5wDrdiTp3ujuzx4vFRWOzL9dCTyYHeau
 usH3psrcSua454vgVIoValtu0te7Wh6YtTcHC+Wj5nQuHwzboS8NmgVmgIh0MjCzdddQ
 cMH1nLrsbxEloR/oI8l1mA8qzxaSNAKWxeJRcKis/GGFJqdH0amTrgrTUEIAmzz50LPW
 4rq06bk4xjV6tdqIVvyMmlGYjpVl4n1zXApijm4d8JM4BgXWi9jenLdpdY1rBgCAsz1G
 chMQ==
X-Gm-Message-State: AOAM533PQWudRbPGDrToXSUdjvqrgvN8UJLsI5vm3E/dCPIZjvuooIeA
 9nJ6KQgje0MHmb50l4W4FLw=
X-Google-Smtp-Source: ABdhPJxylxUb3CRVvUOB7sWREsvDlUHSsbGKGDdn2Z/cAkCOJOGn25zImPk4XDriCcBsagFUQaG9lA==
X-Received: by 2002:a17:90a:5907:: with SMTP id
 k7mr14518747pji.46.1624084829359; 
 Fri, 18 Jun 2021 23:40:29 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id r19sm9440274pfh.152.2021.06.18.23.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:40:29 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 4/4] PCI: loongson move mrrs quirk to core
Date: Sat, 19 Jun 2021 14:39:52 +0800
Message-Id: <20210619063952.2008746-5-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619063952.2008746-1-art@khadas.com>
References: <20210619063952.2008746-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_234030_144785_4CCAB2BA 
X-CRM114-Status: GOOD (  13.53  )
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

Replace dublicated functionality loongson_mrrs_quirk to mrrs_limit_quirk
from core pci quirks

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/pci/controller/pci-loongson.c | 42 ++-------------------------
 1 file changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/pci/controller/pci-loongson.c b/drivers/pci/controller/pci-loongson.c
index 48169b1e3..5a54faf10 100644
--- a/drivers/pci/controller/pci-loongson.c
+++ b/drivers/pci/controller/pci-loongson.c
@@ -13,10 +13,6 @@
 #include "../pci.h"
 
 /* Device IDs */
-#define DEV_PCIE_PORT_0	0x7a09
-#define DEV_PCIE_PORT_1	0x7a19
-#define DEV_PCIE_PORT_2	0x7a29
-
 #define DEV_LS2K_APB	0x7a02
 #define DEV_LS7A_CONF	0x7a10
 #define DEV_LS7A_LPC	0x7a0c
@@ -38,11 +34,11 @@ static void bridge_class_quirk(struct pci_dev *dev)
 	dev->class = PCI_CLASS_BRIDGE_PCI << 8;
 }
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
-			DEV_PCIE_PORT_0, bridge_class_quirk);
+			PCI_DEVICE_ID_LOONGSON_PCIE_PORT_0, bridge_class_quirk);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
-			DEV_PCIE_PORT_1, bridge_class_quirk);
+			PCI_DEVICE_ID_LOONGSON_PCIE_PORT_1, bridge_class_quirk);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
-			DEV_PCIE_PORT_2, bridge_class_quirk);
+			PCI_DEVICE_ID_LOONGSON_PCIE_PORT_2, bridge_class_quirk);
 
 static void system_bus_quirk(struct pci_dev *pdev)
 {
@@ -60,38 +56,6 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_LOONGSON,
 			DEV_LS7A_LPC, system_bus_quirk);
 
-static void loongson_mrrs_quirk(struct pci_dev *dev)
-{
-	struct pci_bus *bus = dev->bus;
-	struct pci_dev *bridge;
-	static const struct pci_device_id bridge_devids[] = {
-		{ PCI_VDEVICE(LOONGSON, DEV_PCIE_PORT_0) },
-		{ PCI_VDEVICE(LOONGSON, DEV_PCIE_PORT_1) },
-		{ PCI_VDEVICE(LOONGSON, DEV_PCIE_PORT_2) },
-		{ 0, },
-	};
-
-	/* look for the matching bridge */
-	while (!pci_is_root_bus(bus)) {
-		bridge = bus->self;
-		bus = bus->parent;
-		/*
-		 * Some Loongson PCIe ports have a h/w limitation of
-		 * 256 bytes maximum read request size. They can't handle
-		 * anything larger than this. So force this limit on
-		 * any devices attached under these ports.
-		 */
-		if (pci_match_id(bridge_devids, bridge)) {
-			if (pcie_get_readrq(dev) > 256) {
-				pci_info(dev, "limiting MRRS to 256\n");
-				pcie_set_readrq(dev, 256);
-			}
-			break;
-		}
-	}
-}
-DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, loongson_mrrs_quirk);
-
 static void __iomem *cfg1_map(struct loongson_pci *priv, int bus,
 				unsigned int devfn, int where)
 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
