Return-Path: <SRS0=q/GU=MT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AED5C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jul 2021 02:30:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B42860FF2
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jul 2021 02:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B42860FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zr/SvXGOaRy3bfR+kUStsL4jEJJxSf6/Yjv6X3M4d54=; b=w/4FcqCYUzAGmL
	AABm4Au5pLwMBoNiSfBUqUAPB1b3nWqZcU8JVxP/wCxc2zCyoEYsj7LxNzheE5YznlC8YcSSy3WXJ
	VQ/TwuP9fo6ClJbU32wDWJF1TARBL9Gndg0+v/6t/iS07Z/BR5EzaqraZIziwmajfDQcsEEyZZTBe
	MGfUVinnOKTHIAqDGqlrTGprqrAChLM0fntq1is7c7xnKWjozfLtZgjsfk+LSzO+Zs1+M37pnE+jX
	54ECKvs8HfFWXJG40/35O4KPUEyCZEJd1fyarn/fn8iV0ZQZGXttOYHDuL9zga+ulUIh6Hdjm1RKz
	3yjQKmIKLYLYywrw08ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8CrV-00Cs3f-VE; Tue, 27 Jul 2021 02:30:29 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8CrI-00Cs2D-M1; Tue, 27 Jul 2021 02:30:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so1921995pja.5; 
 Mon, 26 Jul 2021 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+lClEageFRMCE8DUCewTHpIp65fpquDBhSKpdSUstzo=;
 b=bg/xZcytHhyJAAAM+Y6wTFw75X9e3K/l4J7WSxzajW9Xf1t9oLSe2DdtbNvzrrX9ZK
 L5Zv38zXyHQ+v1bQhhRtvwX1v4LRlKxTl5AfUX+kokKSsj4tsRqCSX7vVmQg4kL/3EjJ
 NGWSzi10GGBGfGEFoh8v90GahoGiOFGetABXggcAGBkZu3UIafEWqQD6pvVhuzXPyxG2
 Nd8gsM/yy4ototik7+u8kXUf5B3x+1ECTEoWecXrQiI1XuI58XpO9ffaD9GxW/8a3Fsa
 b0AvQdigSlYWyv3xGkVcKeSxzVkMoAyfpevjAj5Hmyw56shyKiiHwbp21OynbI+i54WX
 SJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+lClEageFRMCE8DUCewTHpIp65fpquDBhSKpdSUstzo=;
 b=hCLA9QXErfuuhWfZCqsbUhJJpdcelvZ2YXhAlh9ZAu1nDxxL2252UvKkKc1BiqE2sh
 pnlusSqGL5PGbfjIyWiq1EwNRrUG9eBz9jlrnbhfNRnuE4cZXKOSMwoUJ+WXidkbnJsr
 nlLlyQKiG9W1Jjsnv/FPGriN2J2E3IDr3xLVVl4h5YblDesSi7REn/FIOoh+9BpH4LJh
 dSYY2qfVe8Yj/pp17y9l7iZOYaTkm1rpRrCM9hyv3ioZ2kvqplhT0t7CysJWTbjC+RlU
 nSfXmtRefrQ+66lLQCwGcROZLJbG9V1xQpxX+BBJkY+G0EaPzTCiwKfLLxpCdUSmlIKO
 uXxQ==
X-Gm-Message-State: AOAM530LOzZPpH527EHOq8ZbvwAcv18JCP0qIUw06OLdHcTGmbwPR15D
 sAvkJKu7xtbe6AwlScQZUzY=
X-Google-Smtp-Source: ABdhPJzMeiVSuP/fXcXTTi1mHCsB1uniJXVmTS2VzGmikhuzE9YBcg5doqw1QtwWm6hxSBF4VJtR+A==
X-Received: by 2002:aa7:8b4c:0:b029:314:5619:d317 with SMTP id
 i12-20020aa78b4c0000b02903145619d317mr20941089pfd.60.1627353013642; 
 Mon, 26 Jul 2021 19:30:13 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id r29sm1414076pfq.102.2021.07.26.19.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 19:30:13 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH v2] PCI: DWC: meson: add 256 bytes MRRS quirk
Date: Tue, 27 Jul 2021 10:30:00 +0800
Message-Id: <20210727023000.1030525-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_193016_806517_ABCAC86A 
X-CRM114-Status: GOOD (  14.89  )
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

256 bytes maximum read request size. They can't handle
anything larger than this. So force this limit on
any devices attached under these ports.

Come-from: https://lkml.org/lkml/2021/6/18/160
Come-from: https://lkml.org/lkml/2021/6/19/19

It only affects PCIe in P2P, in non-P2P is will certainly affect
transfers on the internal SoC/Processor/Chip internal bus/fabric.

These quirks are currently implemented in the
controller driver and only applies when the controller has been probed
and to each endpoint detected on this particular controller.

Continue having separate quirks for each controller if the core
isn't the right place to handle MPS/MRRS.

>> Neil

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 686ded034..1498950de 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -466,6 +466,37 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void meson_mrrs_limit_quirk(struct pci_dev *dev)
+{
+	struct pci_bus *bus = dev->bus;
+	int mrrs, mrrs_limit = 256;
+	static const struct pci_device_id bridge_devids[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3) },
+		{ 0, },
+	};
+
+	/* look for the matching bridge */
+	while (!pci_is_root_bus(bus)) {
+		/*
+		 * 256 bytes maximum read request size. They can't handle
+		 * anything larger than this. So force this limit on
+		 * any devices attached under these ports.
+		 */
+		if (!pci_match_id(bridge_devids, bus->self)) {
+			bus = bus->parent;
+			continue;
+		}
+
+		mrrs = pcie_get_readrq(dev);
+		if (mrrs > mrrs_limit) {
+			pci_info(dev, "limiting MRRS %d to %d\n", mrrs, mrrs_limit);
+			pcie_set_readrq(dev, mrrs_limit);
+		}
+		break;
+	}
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, meson_mrrs_limit_quirk);
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
