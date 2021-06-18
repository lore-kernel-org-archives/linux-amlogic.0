Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56886C48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 06:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AAFF61004
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 06:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AAFF61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QHWx5cXyCX3RDwOiY5VRvPf/TDRf+jFDXde/iqHeIv8=; b=43TeEa4UKlmber
	APPnF90GpLnG3a+w0BVVlV8NdPCs9Fhd2BhdTCVWz/K8CgRfmwsj0WtLzFOFn5hUBjXGps9rPCR76
	BqssiPHwcmgobS4sZ0GroIV8up91KulcpkxY0INV4wUygtyrjz3tX3JdJhupAuD6i1e90nTA1ZjQe
	HVw73iAPPzWBdBrzTAFYxQjFp+4BgNvLMIfFlCxZARDBOhKJBRFEgZbxDEeAKsX9p/kQ/YRRfmPuE
	wfPH30GO4wxLAF8WqBsPneReK/CG5wwAQoY6ZptoJbEKb+GZkdNmx1XhK2GwJtigZl2X8TMcX8/iF
	A/Ff7BZah8Xx1l00Kdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu89h-00CsEi-PP; Fri, 18 Jun 2021 06:39:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu89S-00CsBe-TR; Fri, 18 Jun 2021 06:38:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so5270510pjq.5; 
 Thu, 17 Jun 2021 23:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ACxHVcK0Ryo9RIAxVD4v0if52uvGSzNC+4znNKdgqQc=;
 b=fVceLY8i+XTr2ehlpRUASqQbKHbdPcrWn2ltMuUoOxlaSstLq9oDHQwzM71ozgv//c
 54vXD9aEJP1qBvnYYab72d8XW15fggwjsMGIjPxzVuZsIPGHzUrfa4yO/o3+nDVzu5gr
 L8gWIQY/3IYpHQ7RLc7enQS0JjxvuC58DHgXQ3MoO1/0v/Ovy6uun/epGt8XzOu7UTqv
 L0540M6uTSJ0z28ColEmdULeHo7VykwubNCUY5wLZ5k8XiVQNsw91bX7a2Aw4b1WRUAF
 u1kMBOA6MVNjKfh4w7olDuiGjWLPioZ0f/jsjSsIcaL6D57YXpIdgJYmWNRrE26CIVok
 yD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ACxHVcK0Ryo9RIAxVD4v0if52uvGSzNC+4znNKdgqQc=;
 b=huxzqqu45TybF+Z4PICn+a3bf1NqxbieQWajGo7mchuZCKqKatA8u0OIzpUV2n+9Bt
 wFT0tG/mv35LrAnuI2RtPJt9xxQNrM37EfvnD/1ZX5vp5bltHdpLv2Qp5GKWC0RB7V3o
 1Vp3KBO20UcQCxWsrSMDrLazaM9+IPK89gKojlbO/mMYsbJ5B7S36FmpG6bBqRzZhgX5
 Dq+0eOVt0pZmGxnSe8q8pRmpYSc5M9wW1VlusyyPP7GKrwPUzDPPRHsg8PToeH1DY1WU
 oF6jVyTgP9wmZKbe0dnv6LSoJpGjLK05fcHlx9m/YJBr0AvZ0aao4Xwx+T+ZnoJpBnuw
 VzrA==
X-Gm-Message-State: AOAM5328x1C2rATthj06CqqAbqayLhxRq4naaErr44XDhuCHgJ5bem1b
 6rjzmqo//0QUly0xQmVnWxM=
X-Google-Smtp-Source: ABdhPJypBALpu5GeFhgh8yLD19XLlfA/C7wvL5ldLBSZeGcMfkSKMcYTZD8PYh04Z5DtlYJo/JjxnA==
X-Received: by 2002:a17:90b:3001:: with SMTP id
 hg1mr20365432pjb.169.1623998329465; 
 Thu, 17 Jun 2021 23:38:49 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id s1sm7612604pgg.49.2021.06.17.23.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 23:38:49 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] PCI: dwc: meson add quirk
Date: Fri, 18 Jun 2021 14:38:21 +0800
Message-Id: <20210618063821.1383357-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_233851_009522_3322FAC4 
X-CRM114-Status: GOOD (  11.46  )
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

Device set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
was find some issue with HDMI scrambled picture and nvme devices
at intensive writing...

[    4.798971] nvme 0000:01:00.0: fix MRRS from 512 to 256

This quirk setup same MRRS if we try solve this problem with
pci=pcie_bus_perf kernel command line param

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 686ded034f22..e2d40e5c2661 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -466,6 +466,33 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void meson_pcie_quirk(struct pci_dev *dev)
+{
+	int mrrs;
+
+	/* no need quirk */
+	if (pcie_bus_config != PCIE_BUS_DEFAULT)
+		return;
+
+	/* no need for root bus */
+	if (pci_is_root_bus(dev->bus))
+		return;
+
+	mrrs = pcie_get_readrq(dev);
+
+	/*
+	 * set same 256 bytes maximum read request size equal MAX_READ_REQ_SIZE
+	 * was find some issue with HDMI scrambled picture and nvme devices
+	 * at intensive writing...
+	 */
+
+	if (mrrs != MAX_READ_REQ_SIZE) {
+		dev_info(&dev->dev, "fix MRRS from %d to %d\n", mrrs, MAX_READ_REQ_SIZE);
+		pcie_set_readrq(dev, MAX_READ_REQ_SIZE);
+	}
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_pcie_quirk);
+
 static const struct of_device_id meson_pcie_of_match[] = {
 	{
 		.compatible = "amlogic,axg-pcie",
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
