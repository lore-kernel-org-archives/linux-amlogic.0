Return-Path: <SRS0=w9Vw=XD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8D1C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2019 13:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F89020828
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Sep 2019 13:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ep3sprdE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D3va8Eqd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F89020828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GfKk2qZD/MqipNWdyZGLwm1+1R9xTOIemZt4UpzI3pk=; b=Ep3sprdEymAcDy2WsOV70iT4HB
	RVsMIRbH7+fyeOCKkCBTWtmTb8oHd7sBGC8yZZ25WIgfA+A7RcZOxW5dJPZJJCFX0iuK7y2dw2Dwv
	l3zuDrQcxjeSKV4F8lEQJKwmXzwyqYunFRxX4YfUawvsteKEklhH1ikICfrcgCKwWJgdR2dPVavZR
	v6xSGVJQ8g8PRmTlz6g/TmSgNT/k/IWhuHXoHCCJtGP0GWjk+0JDjMOpMAXZntbNzUhfxlbDHw/6Z
	SL3Fz/oIUp+WOVCqaeGjw2bN6H+aqnn5bClkJvh0yUsblAqmo6ltQN53nMBKkoIzGrMOCwXUkVBxI
	xAbSvoVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6xTi-0005cF-8e; Sun, 08 Sep 2019 13:43:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6xTB-0004ph-J1
 for linux-amlogic@lists.infradead.org; Sun, 08 Sep 2019 13:43:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id l11so11005405wrx.5
 for <linux-amlogic@lists.infradead.org>; Sun, 08 Sep 2019 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P9spBEsBHUZ9g/u9RtVBlcb3OiOFBO3IyBThdfZnhU8=;
 b=D3va8EqdexPnI1YV301Nv++203bL9hC6gwxXh+dK1X5wRenRC3TfHRPf1e5JASy+Rq
 ta+CoZVk6/SrkqN6BZi5/JeiRdTnHEDdeyD3mbgS1x/ANHOA+m5f/kidvGTOAdJ0YTSP
 ++RYNZWZWx56VWpfjqXFxF3I/WW5KI4F2tG6u86x9ISHYLtDmO24gMjeFk3pAtaIeoF4
 2Y7a+oL9BaU5BZaOAlg1u/iUx2Bf8pDD8YGZ3pUIi47YqW5ZWP3j00W0qo045IBTWWfV
 q9kQu5qxY/XQyENHpAevcyqj6CaeO5EOKTCsDNLlywYtw/M5MBzGJS15AxI6NWV3OcRe
 TyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P9spBEsBHUZ9g/u9RtVBlcb3OiOFBO3IyBThdfZnhU8=;
 b=XMUZRFLxpAt5bACUoZpZDmS+Qy74HFS+hpvV1+8IWlWQeD25vvHgi8BKM1zPE3seJV
 R0v6xMSGPE6xlHADjuds7C4O5oKCOvWMHSouQc5OB5hVdUVuAl7wAWfjYFoRC0liObUi
 moFtAGGT5qLX1+tRKpwHSsbcWUX1pvbiorb/8oASJC6Rlirj/lwwo3XpSwO/k6nKjK1b
 50srCuthYgAoZ8klnPKFRNNUAkCFwiXWtMtV/0kPKXBpG2Cn+Ttq6y3fVBhwZvYiwnNz
 yY4xi3PIqxdy4kqJihrOkpu+Wu7bT7ZN9cOGs23i/W1IYW+V+LJD5WJEJoXSE8rAU+CB
 NFBg==
X-Gm-Message-State: APjAAAXEOisE14ve7MujA6L8d9vhnOHISP+LOpfyLFsFrZLOI1D3uSNf
 hMQitMS9ZlplGU+X8145scqcfA==
X-Google-Smtp-Source: APXvYqytEYFBR5k51dO2xW5tElr8MGpnA540xchKrS2qKXOg2WYwyMiu0TYkC6h7nI39i2dMwEc84g==
X-Received: by 2002:a05:6000:128e:: with SMTP id
 f14mr14632709wrx.28.1567950186850; 
 Sun, 08 Sep 2019 06:43:06 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id t203sm14313902wmf.42.2019.09.08.06.43.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 08 Sep 2019 06:43:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, bhelgaas@google.com, lorenzo.pieralisi@arm.com,
 yue.wang@Amlogic.com, kishon@ti.com
Subject: [PATCH 2/6] PCI: amlogic: Fix probed clock names
Date: Sun,  8 Sep 2019 13:42:54 +0000
Message-Id: <1567950178-4466-3-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190908_064309_623920_38C7B81D 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org,
 linux-kernel@vger.kernel.org, repk@triplefau.lt, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the clock names used in the probe function according
to the bindings.

Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
