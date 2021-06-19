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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EB9C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21813611B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21813611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh5Lbbyp1WQ26glf5VrOEFajtIlhU7bJX8A3k8erepI=; b=uTYBmMsr3qE/Ik
	kKGmXOq663R8FBBdlogT4ONQg7tphFembBiQ4cU8Zz2mW/VZ2pX4XE0rknSzke5Dtfq+2t+NdgOem
	PM2UoscvMp5fNe3wi4Ez7eefuVd5hwvp5DU/N/uAt6hTdGsZvJFHb4dl74X489ZMGtQ3mmNGJN+Cy
	Ug5LDS7SyPc31Esu3UEshWcs5iDeMEANy1sLMcf9sqQqofrQQTKsJK3cGf0X/9kLbo0quYtTtSwRR
	GQSbGMKo9lXKn9ibtNV4/mOjH4HqWR/AFW04uPAJBIW6junW/gfCj3pJuVaVDsFXww+CUWDbq5GMn
	x3YHBWP7K8mi5yXC2Jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUev-00GUn6-Gp; Sat, 19 Jun 2021 06:40:49 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUeT-00GUdG-2v; Sat, 19 Jun 2021 06:40:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id x19so5809432pln.2;
 Fri, 18 Jun 2021 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBC2jKS0EXBhnjYqqHmBsLNtpsQFO2BHm+Xp1hgeFE8=;
 b=SPMP2ltRGwzcECcsH2aLjunU8fcC8kYzSGXILxhE5YWPRR/jrZyv6tRZvCTvPbMaOw
 y0E5fhpE22+hMyNXfOKTYDDwxPXZALCk/nKcZrS4w2iXpMYqj3LMZyX8XxOqvHwKFWMX
 UVLaCTxLOxKdpM3diOdhIiLSywvIEk7eVYo5bdavd89yMDfdHbs2kYzzk7b7PrXjw3B7
 mNH6V7s8xF3tjIn8fHJBWMrwUXvMxDohYBNHqLLLg3mxnMLs2eh6tpcIn7wIyosIePsX
 3U14w+zRFAKo/lxybtoKMlj+aYqAsMyOWTX9tQLJz7udmNDa6BEbUIJWem1W6TDSJZD2
 v0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZBC2jKS0EXBhnjYqqHmBsLNtpsQFO2BHm+Xp1hgeFE8=;
 b=Guf3j98Djhoe7SppOqiK+XtDzeZ+khAXMNbIrmKw8e+tJORGNjdOAlaYE+0N+UevNb
 eqAW/OWn4Oa95SKuutzAq0jZ6Bjp3icrEfxTLjp26mArUbPeNpvdILwz5xHxiN6SERm6
 b86AT+K8eucfsndqsugkhc8H2+DUbRWUQmXssLxR29Q/aOKaL097yDqoGKOAbXB04LWb
 19i9oCqhfV3+8OjQCWgkgRLf6Nd1tRg4I4OAQGLeftn//Jv2hxmxspOu+QJSJyXYyY1q
 T3Xhvg/AOstmY/7PSHo34qebewYOu2xW86PLGFtQSnufCllslz5bYpsteLf05ENXoQlr
 QUTw==
X-Gm-Message-State: AOAM532sKZEgB8hCArmAl5KeMaMO2rEeSzsp8zhbat/1hNvbAoK/TH6Y
 KyZeWpGHOefflIQKv9mAnVI=
X-Google-Smtp-Source: ABdhPJyZAYPMcraY9oFytwbhDkAJuPkVaHQ2RiogYWEkWAm4fQF4c6JEkpP16vIoLpBXYob7YkRzYw==
X-Received: by 2002:a17:90a:3c8d:: with SMTP id
 g13mr8231545pjc.229.1624084820400; 
 Fri, 18 Jun 2021 23:40:20 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id r19sm9440274pfh.152.2021.06.18.23.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:40:20 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 2/4] PCI: core: quirks: add mrrs_limit_quirk
Date: Sat, 19 Jun 2021 14:39:50 +0800
Message-Id: <20210619063952.2008746-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619063952.2008746-1-art@khadas.com>
References: <20210619063952.2008746-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_234021_177572_35F97C53 
X-CRM114-Status: GOOD (  13.61  )
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

Prepare new MRRS limit quirk which can replace dublicated functionality
for some controllers from Loongson, Keystone, DesignWare

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/pci/quirks.c | 54 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 653660e3b..73344ec71 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5612,3 +5612,57 @@ static void apex_pci_fixup_class(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_CLASS_HEADER(0x1ac1, 0x089a,
 			       PCI_CLASS_NOT_DEFINED, 8, apex_pci_fixup_class);
+
+/*
+ * Some Loongson PCIe ports have a h/w limitation of
+ * 256 bytes maximum read request size...
+ *
+ * Keystone PCI controller has a h/w limitation of
+ * 256 bytes maximum read request size.
+ *
+ * Amlogic DesignWare PCI controller on Khadas VIM3/VIM3L have some
+ * issue with HDMI scrambled picture and nvme devices
+ * at intensive writing...
+ */
+static void mrrs_limit_quirk(struct pci_dev *dev)
+{
+	struct pci_bus *bus = dev->bus;
+	struct pci_dev *bridge;
+	int mrrs;
+	int mrrs_limit = 256;
+	static const struct pci_device_id bridge_devids[] = {
+		{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_PCIE_PORT_0) },
+		{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_PCIE_PORT_1) },
+		{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_PCIE_PORT_2) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2HK),
+		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
+		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2E),
+		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
+		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2L),
+		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
+		{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_RC_K2G),
+		 .class = PCI_CLASS_BRIDGE_PCI << 8, .class_mask = ~0, },
+		{ PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },
+		{ 0, },
+	};
+
+	/* look for the matching bridge */
+	while (!pci_is_root_bus(bus)) {
+		bridge = bus->self;
+		bus = bus->parent;
+		/*
+		 * 256 bytes maximum read request size. They can't handle
+		 * anything larger than this. So force this limit on
+		 * any devices attached under these ports.
+		 */
+		if (pci_match_id(bridge_devids, bridge)) {
+			mrrs = pcie_get_readrq(dev);
+			if (mrrs > mrrs_limit) {
+				pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
+				pcie_set_readrq(dev, mrrs_limit);
+			}
+			break;
+		}
+	}
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, mrrs_limit_quirk);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
