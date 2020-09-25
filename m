Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C527C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 16:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D41822B2D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 16:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3Hg1T86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D41822B2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q+EGkwq9pLbPh6mNP3B12HN/CtMaPvtGynqaBk0vdLI=; b=O3Hg1T86eetw9t0DaCBbgyff6W
	Lw6L3euiqqMlh8IslkXp7EOC2z5+/SXITIFHk48XV86kbVesYaYb3aVc9XEKRVJMFTZm5svVzAP9y
	ztQWo+2G2Bd3mte+XpkobvVjJ4kk6i8ypQZrjw7qhC2P1rJRf4vQv7BkeHmS/Y6fAKqYJqps5+SPN
	FQkcAvUxs5RCDTFWxf7QJyZMxtE48hT1Ib7duGxfiqMDikwTrST8vLiwxHPbRlBS1v4M7WM4lJSvK
	5wSskLS3HzYKffYDtVAfmFtBxEucbV8XaKrD8WiG9mWcUb5r8kLPU65k70mRcIgBaYsucz0sY924P
	8R8EAJFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLqok-0005Lz-9e; Fri, 25 Sep 2020 16:43:30 +0000
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLqoi-0005LP-D0; Fri, 25 Sep 2020 16:43:28 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: host: fix depends for MMC_MESON_GX w/ COMPILE_TEST
Date: Fri, 25 Sep 2020 09:43:23 -0700
Message-Id: <20200925164323.29843-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mmc@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix build errors for meson-gx-mmc.c when CONFIG_COMMON_CLK is not
set/enabled. This can happen when COMPILE_TEST is set/enabled.

ERROR: modpost: "clk_divider_ops" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
ERROR: modpost: "devm_clk_register" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
ERROR: modpost: "clk_mux_ops" [drivers/mmc/host/meson-gx-mmc.ko] undefined!
ERROR: modpost: "__clk_get_name" [drivers/mmc/host/meson-gx-mmc.ko] undefined!

Fixes: 54d8454436a2 ("mmc: host: Enable compile testing of multiple drivers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mmc/host/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200925.orig/drivers/mmc/host/Kconfig
+++ linux-next-20200925/drivers/mmc/host/Kconfig
@@ -425,6 +425,7 @@ config MMC_SDHCI_IPROC
 config MMC_MESON_GX
 	tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
 	depends on ARCH_MESON|| COMPILE_TEST
+	depends on COMMON_CLK
 	help
 	  This selects support for the Amlogic SD/MMC Host Controller
 	  found on the S905/GX*/AXG family of SoCs.  This controller is

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
