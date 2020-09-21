Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB3BC43463
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 07:50:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC6C20809
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 07:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="re3GIqRZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zluKvCTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FC6C20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amZYKqG6sO5AH4RjSMGkzhV2hPdWGuQTWXjUSdGpC9E=; b=re3GIqRZvhtzgUNK4shOeydrOn
	dREZ+IfK/ZYTJK6WApsT9RuteXotQa6solKUXJt1rfSeTp6xCqIODI58SDYoLo5Cc+bVYtItju/Fu
	Q7ncK56xTc5bjVDhcyNrJX9bRcu25in3yXYj4Y+6/mfQBitIa5XRkQcr8rUkdFlS8L0926HSJqHi2
	3S5ppHus24z9XtoDR+uVXM1SMinQYPz3lmzdSQuoACvg3r4Pky6jIs7wWY6eNT/FT+6RcOhUAp7eE
	epYuX0EqOsHraRACWbNVoRox8T0oGZE6Dxxxu6feTA3+9E/X2mI6/WgJXK3LJI6X+AfSqB7i7c0Ki
	+cJVHKLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGaK-0000MJ-P1; Mon, 21 Sep 2020 07:50:04 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGaH-0000L1-NJ
 for linux-amlogic@lists.infradead.org; Mon, 21 Sep 2020 07:50:02 +0000
Received: by mail-wm1-x344.google.com with SMTP id w2so11122553wmi.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Sep 2020 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQeugMSbNm4MoGJLzLTQ1K90HqMCkQsDeLBTGL4VkMo=;
 b=zluKvCTLGO4Q1xNTMRSk0CyQwXbjLielLIiaHrs4aJ5B23YEK6UYXhfPZMmf68MMOU
 iXyvqIhrO/BHAKZf7qyHRQtoTetEsfzpsvASAnylyINqR4S2WdmLE/h6s8/Jnuk2wjJR
 fEPUhakN0RlOs2+ggSV6P5Xy7mjIdLSYAC+40Ghdh0WnDP2O+E85ah/3weYMe56st1sT
 L961A5Y/17Ncdz8TwYz8QJjIUHfR+8nMcSlRIUnr7CmhLHXpVPuFzY4xoXgLn7GGbr5t
 qicW/hvk80C9FR5o0cel+FJDhEML91OlwWYTx8HyuHfkGeB9u5qbtP5S/5szRwLCzVl4
 TjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQeugMSbNm4MoGJLzLTQ1K90HqMCkQsDeLBTGL4VkMo=;
 b=DJwjderP4G64IlOG81K+FHTdcY8RGp+18/jw2ZpSOaHUethhkvhDrTMINEbT0tzkzS
 yE7cMEP9HwEMZRnsu+QNybr1HftgQddc5Ldd5a3uTIGWJpUiWg77W73oSvdW/3YcTx3G
 NmHJTHJbXn67ZAVef4Mm97oE/3MbtEQTa/EViaLBtfNlHFMd45hsJCz0a2GfHzm3kAGT
 HXbR9wuNJN4pvyNXu55/bYd4bF562rWm36Okj7Yoa9LnLp/cQt4rg6/1EC/TZMW1TEvt
 xNa49Rfz+lAV5iqfmbavCLwJfqbmK4T2Cx2wPfXBqyNnqmD++8Bc9RE0Jy1L6A5Y6TGT
 cKiQ==
X-Gm-Message-State: AOAM532cH+hnyvaZSofehhUl7lovjctYTGu9FxsrFt02p1wqF0nL6gVk
 c1MDqcSiGT1ofdjc1mFdJuIwWg==
X-Google-Smtp-Source: ABdhPJwM5F5CftRbSvYRv3kUr5yxBYf5c+QTnBmrJtpThRGN8qtcsxzNDcx41GF7jYUmHq+NVA49eA==
X-Received: by 2002:a7b:ca4a:: with SMTP id m10mr22398950wml.11.1600674598674; 
 Mon, 21 Sep 2020 00:49:58 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 o16sm17854778wrp.52.2020.09.21.00.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 00:49:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lorenzo.pieralisi@arm.com,
	yue.wang@Amlogic.com,
	robh@kernel.org
Subject: [PATCH] PCI: dwc/meson: do not fail on wait linkup timeout
Date: Mon, 21 Sep 2020 09:49:53 +0200
Message-Id: <20200921074953.25289-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_035001_794314_D6FB7439 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: linux-pci@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When establish link timeouts, probe fails but the error is unrelated since
the PCIe controller has been probed succesfully.

Align with most of the other dw-pcie drivers and ignore return of
dw_pcie_wait_for_link() in the host_init callback.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 33deb290c4e7..846275e68fbc 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -383,10 +383,7 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 
 	pp->bridge->ops = &meson_pci_ops;
 
-	ret = meson_pcie_establish_link(mp);
-	if (ret)
-		return ret;
-
+	meson_pcie_establish_link(mp);
 	dw_pcie_msi_init(pp);
 
 	return 0;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
