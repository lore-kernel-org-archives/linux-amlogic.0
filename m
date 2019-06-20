Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D7DC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:04:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F24820673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQFmmNE/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jiMFQLFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F24820673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pgto+ejrVDEego03nFylMnhGPGfVjtDVHgyDkkc7xtc=; b=bQFmmNE/03ZRk6
	Al30+S/k8uj6PZabg7wrHe5UzlEo0zffVxOPeF48vjgX0PyeifPKwVYqWT1+dPjxPNlBi62ojV7Aj
	ihHMsDWc23DlhHqSgueSXygltRoFw9tqaMhqpKQQ1x3EAwLRKJtjuIKQm0K6791I6r8VDX1T9rwH4
	UJkRjIxPktkuqDird+n7/IR1PqduiXQBV4kU6ztXTFvdg9O5aczxVeAjpviYMqdfdO9ZZBiGpelts
	GD90rcnYonZL3YotFutn29/W/Lc/YfE3DFLnXtaiQFwEIfHm8p/nvEE98Qwaw9MeSsz15YAMCcjGW
	PBiVyQPXQuhnn3varLYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdybT-0005by-02; Thu, 20 Jun 2019 15:03:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyY8-0003FJ-PX
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id r16so3351020wrl.11
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
 b=jiMFQLFWtay0rRLzh+SDB1Dk3ZblEFbfmuUEilGmgJhW7Qz4KUAOuTU5opeNKO7nWt
 3n6KP2WFOgh4jIbh0CB9N9m692nzvHycKqZRsgw92Mlfi9t2kewxfiNiBnBP5KlFLxic
 9sQlOpOiP0tLfshVxMI7gTuXYR4gXXsG0+JRzy1uCzshnXvPYB+bAiQslnrgRGdC0QLh
 NMa/SVGZJA10pDNrdq1V2bwTLxwVHMR7VPnGXjDgUXHQq/AVt4tl6/UlAxL1WAvBtdy6
 2FmQiQyKUnniVQIQw0J8yoVz/rtn/FkGaG8a51HsMYSRhJKY5QMSsch1/WLNdyKN+7zC
 oXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
 b=neZOYHhSnZidRXt5teowU0KaJj8pWKoApDT229I5lPsPjgMQnQELk/zewsvvGmU93N
 oXCPritbW7CIq6hLjwTTWivfniJMqiJggKPBQls/1avzpz0Ye7fWQS3MYbBtj8mq3cH9
 wsm4KTY8B5M2LHO5YjcSiAFijYFrqn37EGVSXGUbb63Cgq/2MkOICtiBc6X+Ioij0Pgo
 CQ4b18fjpIzrd2ylHLrrxuvzC62fjw53iAJ+e5ACtjx27xAlla04uJ/dzDsk3ZTRUrwe
 ZtelvNDAokDZtArI5T+HrfjobaEeE7P32drenB7hhD+W1qMRPJwBBz+XCwVmGkJ03Ixn
 o1+w==
X-Gm-Message-State: APjAAAXjZ5T90X37RblnrIAYBEazDFoQ5xhbYS6e8LgHcPDLOjUs6iW2
 hw50qCfjMVA41kOAFUQmvXj3+g==
X-Google-Smtp-Source: APXvYqz/51ebhU5rXHGYChuENG7sgffban6b+i1SauMMfobKCffeLHRbzIr3Iq24zACKZETqEf1n9Q==
X-Received: by 2002:adf:f046:: with SMTP id t6mr41634172wro.307.1561042827408; 
 Thu, 20 Jun 2019 08:00:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 06/14] soc: amlogic: meson-clk-measure: add G12B second
 cluster cpu clk
Date: Thu, 20 Jun 2019 17:00:05 +0200
Message-Id: <20190620150013.13462-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080028_828680_B702E3FA 
X-CRM114-Status: UNSURE (   8.69  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.

These IDs returns 0Hz on G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index c470e24f1dfa..f09b404b39d3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -324,6 +324,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(84, "co_tx"),
 	CLK_MSR_ID(89, "hdmi_todig"),
 	CLK_MSR_ID(90, "hdmitx_sys"),
+	CLK_MSR_ID(91, "sys_cpub_div16"),
+	CLK_MSR_ID(92, "sys_pll_cpub_div16"),
 	CLK_MSR_ID(94, "eth_phy_rx"),
 	CLK_MSR_ID(95, "eth_phy_pll"),
 	CLK_MSR_ID(96, "vpu_b"),
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
