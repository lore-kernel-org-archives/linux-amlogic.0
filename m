Return-Path: <SRS0=FilP=LN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37011C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C8F611CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8C8F611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvXTANDCDNFuK5A/13opgazPC32VDaY05+uKp+LahNI=; b=Us3mGV9+Bu6w1/
	g/5WeJeHOeTLp5JRzfKb4onmylsVqksVxcr/sWJXRh9s0wN4CacTmhHvI7Wblmvjaxft0wASuVu8v
	JWoORstBMdVYV558Ji7XtlOyuva1BSpP66qjle8HtNsoxIFtiWgUwhYzin4Pp5jDBmDcozTjV1/0K
	6IeoEzL9dg5xWxoa+sWiDWSsjC53kvKvzL5TucBLnS09cCoELshd+PxAtJJOgiihufPVALD/ue6aI
	BFjqjblowrHULF4pj38UAN9l6Nx3Ne7mAX4trRFeNsGDLpxTzBmnzhdAVwJ0JAaAfMLuoYQqqN4Ys
	aEhCkZ38V3m/Rn/HqPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUef-00GUge-O2; Sat, 19 Jun 2021 06:40:33 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUeO-00GUcZ-5w; Sat, 19 Jun 2021 06:40:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id e33so9700932pgm.3;
 Fri, 18 Jun 2021 23:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cTrGZor3giFSILahtV27RiFLtW55t+UVcQqePFHTEzI=;
 b=XcNwAOt4Iaca+5I7ng6jQeAUgDZQdzV4x+GsaNGBPWqmAq4s8U5PZ4FfMEEBZWsnbg
 /iO6gOOw4+uCrfX34VEFStsCbq5OOVSZU/ESNU4tiGHnzD6FZawjxIUXwzBkkNqzpgc5
 UGdbvD03/Iw8AXIprWT5hpsLEXL9iVNGb2jW07IN+7MfStS/TW0/j6X+BaodroEsueSd
 e3xddEaEP1QuOJTWLD2u1Zm9jas4qm741gSJBMa7Z1mwQzzqY8GxzNXCQkBruUjqWvk5
 FWmGoaGpOLc9QbblLOdV+JRTA5FspI/0o8WWSnghAPnHFy7HtUChgdBAP7nuQmYErDVx
 r1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cTrGZor3giFSILahtV27RiFLtW55t+UVcQqePFHTEzI=;
 b=BhyChHHsdCXbVZU8pdXDmU38qCwy2mG+Cg6unfGs+bNZhuvatlMOmMxghZrXhvE4pV
 9VU4TVofxVqK7TEQsxigCLySL1J60g4Pdhm+xLzq37k/3fncSPY3u99HqDrHCgIIwV75
 TZEt/ez6kH20kuuC/ezbqcXGvDKvL++PHYPQ64oqWuztNIWypNohp/r6H9kFe5XyNyia
 4g4g/4G3Cdq7bq8L55M2Snz/Q86V0ys9pd5vd80UxFe8cRsauKEWCrSAcyeGNSaCWtGk
 amvzo1uoNop72PZqh/SrJDdgiBS7XabUbFeNhyZVTxFd0JBeavSJysUJ+foZ565CoZun
 /yXA==
X-Gm-Message-State: AOAM533WYyTk6OHBCGmcdvO2jtzdak3qODEASKkGI7I21He94H7FyhCO
 NcKqbu7If5IzXeRPYVAiau8=
X-Google-Smtp-Source: ABdhPJywWDZq3dgNDKtQB7s+bDUb2ze2dkeB2P4aHX12qoZcnCaeqhQ+Sct5O2yT2zz/apKFljN1qw==
X-Received: by 2002:a63:ff20:: with SMTP id k32mr13898803pgi.82.1624084814388; 
 Fri, 18 Jun 2021 23:40:14 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id r19sm9440274pfh.152.2021.06.18.23.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:40:13 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 1/4] PCI: move Keystone and Loongson device IDs to pci_ids
Date: Sat, 19 Jun 2021 14:39:49 +0800
Message-Id: <20210619063952.2008746-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619063952.2008746-1-art@khadas.com>
References: <20210619063952.2008746-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_234016_270197_8AAF962D 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

Moved from
* drivers/pci/controller/dwc/pci-keystone.c
* drivers/pci/controller/pci-loongson.c

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 include/linux/pci_ids.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 4c3fa5293d76..e19d224bbca8 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -151,6 +151,9 @@
 /* Vendors and devices.  Sort key: vendor first, device next. */
 
 #define PCI_VENDOR_ID_LOONGSON		0x0014
+#define PCI_DEVICE_ID_LOONGSON_PCIE_PORT_0	0x7a09
+#define PCI_DEVICE_ID_LOONGSON_PCIE_PORT_1	0x7a19
+#define PCI_DEVICE_ID_LOONGSON_PCIE_PORT_2	0x7a29
 
 #define PCI_VENDOR_ID_TTTECH		0x0357
 #define PCI_DEVICE_ID_TTTECH_MC322	0x000a
@@ -885,6 +888,10 @@
 #define PCI_DEVICE_ID_TI_J721E		0xb00d
 #define PCI_DEVICE_ID_TI_DRA74x		0xb500
 #define PCI_DEVICE_ID_TI_DRA72x		0xb501
+#define PCI_DEVICE_ID_TI_RC_K2HK	0xb008
+#define PCI_DEVICE_ID_TI_RC_K2E		0xb009
+#define PCI_DEVICE_ID_TI_RC_K2L		0xb00a
+#define PCI_DEVICE_ID_TI_RC_K2G		0xb00b
 
 #define PCI_VENDOR_ID_SONY		0x104d
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
