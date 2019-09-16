Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72144C4CECD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C1C216C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IdifixaB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uRznrPwp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C1C216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6wIZTCqXoMOK9HXmBER9W56+li2FScFfxHNMqR59Y8=; b=IdifixaB4iUove
	DEx41+VbfLEjmbfRIjWu+pFUbEp7bzdp9MwB/ngJlqEHl7g3kB761Vr1xX3W8E7lRbQoU59aGfxfG
	SxibJDqa260g6Cu+s0EImaCoEaEfN7+QJNN5JTuMdzZsbeAL3Is+DaK6jf4jnim23iNdFUfD6DdR4
	WZrtRTJX+49YrqaAvl6FlP+XRZ2Am5pbE/forjv+HK+1+PzNYLGPAeAPmmEZKKthxf1de0NTAtaJj
	mwt7nMVfz+DZ4OBC4BU8nU9O5aQxa6dNnmmCE6OqCojL/7DQWGZ2225hFi1yv2uFEzbSu3MT4cC8R
	H3LpMY5Boc/yoe1ttCpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qSp-0002xT-Gk; Mon, 16 Sep 2019 12:50:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qSa-0002nm-Ew
 for linux-amlogic@lists.infradead.org; Mon, 16 Sep 2019 12:50:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id l3so16022668wru.7
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2019 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlGUHvg+PE8gs96DiXpNJ8Kfd/rHrkqDzag5ZPnKd5Q=;
 b=uRznrPwppxChi5DbFjBeAieVJnJpLht0j9pPELbSwp1vv3rhF+D0lrlX1Yetseyedi
 EHQmRJ5hu9fp3801FOKkw5+yX1bloZAVLZpMjuj5WAstQXZsNTcqZ4lZjSik4IAsiXLx
 b/LxLStKZvrpsV8yX4Nn/uWNoyG/XqctVhaLSa3X5/hPIRwYJgo4E8g62aiuq5qlKmfM
 Q3Hf0vxXjlFjvi+6EWQJUtlnn7+zGxpduDjbl9FGcdjotSN1JnykahEWQ301TkYIfUTy
 KHFQk+UDLG4QjGgEuFk0jHuMgn9vAFrpXGQMhcqIm8hIzQJOw/0KvmNvX+n+nUiS96vz
 SZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlGUHvg+PE8gs96DiXpNJ8Kfd/rHrkqDzag5ZPnKd5Q=;
 b=FjGixsnOQYzpL2CMlQZUTaZFfMBh+Nh+oNsXLu5rECdvCKT5r0QYL9HfURxKVkdtcn
 76PIY4qBohwe/kTW/Od6tkWskDFakCq3ZmH5nDrDIRR2nEPoeal3BQQRETJzaaqC2gHK
 UbBy34JU9wMJiLOGo//lUmidrRfTy1PjaC4GaS6dyP8wVrQlD836CUF8ZzAOfnBuCivr
 ouRzLoN6/zYbjGVU5GTLNT0gRmSSJduzvCWh3gQfGKlFkv3Nx5PUYs4MIGXSKU5CD+W+
 NPxr1bix8r1zQX+lP99h2Et5DNnYxfVgyF9HFuP5+jqWm3/9Y/69G6Ds/M/53BJ9ON0Z
 YFcg==
X-Gm-Message-State: APjAAAXshFFgNv11ntf6/ssSlUBsFbviHs7CoxnrMgJs2E5tL0yEps2Q
 z7ZAu0IrYwPl5ROdTtpbenPZkhoXE2rJNg==
X-Google-Smtp-Source: APXvYqy7RU2IS8RX/3f7CyUGB28iNocAeDt1Nen58ZP9x40CfxUXWROzTKwkmKdqC1wR0VqTF3GNSw==
X-Received: by 2002:a5d:680d:: with SMTP id w13mr17384767wru.282.1568638226669; 
 Mon, 16 Sep 2019 05:50:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o12sm15109960wrm.23.2019.09.16.05.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 05:50:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lorenzo.pieralisi@arm.com, kishon@ti.com,
 bhelgaas@google.com, andrew.murray@arm.com
Subject: [PATCH v2 2/6] PCI: amlogic: Fix probed clock names
Date: Mon, 16 Sep 2019 14:50:18 +0200
Message-Id: <20190916125022.10754-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_055028_497123_CB73945B 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Cc: gouwa@khadas.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-pci@vger.kernel.org, nick@khadas.com, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, repk@triplefau.lt, maz@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the clock names used in the probe function according
to the bindings.

Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 541f37a6f6a5..ab79990798f8 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -250,15 +250,15 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 	if (IS_ERR(res->port_clk))
 		return PTR_ERR(res->port_clk);
 
-	res->mipi_gate = meson_pcie_probe_clock(dev, "pcie_mipi_en", 0);
+	res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
 	if (IS_ERR(res->mipi_gate))
 		return PTR_ERR(res->mipi_gate);
 
-	res->general_clk = meson_pcie_probe_clock(dev, "pcie_general", 0);
+	res->general_clk = meson_pcie_probe_clock(dev, "general", 0);
 	if (IS_ERR(res->general_clk))
 		return PTR_ERR(res->general_clk);
 
-	res->clk = meson_pcie_probe_clock(dev, "pcie", 0);
+	res->clk = meson_pcie_probe_clock(dev, "pclk", 0);
 	if (IS_ERR(res->clk))
 		return PTR_ERR(res->clk);
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
