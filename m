Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27E9C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697B42075A
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iY5xIVM5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x5OvvQUk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697B42075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zDRkoN+2Sn4eLVdNhil2bpv00jd/hExoaXmgY8c9JoM=; b=iY5xIVM5lWyP0Zl5eZVMRXITE
	O31+t4eyZZxK8t9uzavHeq2pJQLGme6nYt4sJ+mzV4VAIwe4JhCAeQrFPUWC9yxesxCpMTcm91nSe
	JMsRQSo+618g7izX/DyXDUgJj6o8N3NalfS1QXlcZgni9+Rk9pP0NJEkDb6Smd8eIsz444fK8noY5
	52Y8/Rq4oEZGBX0A2hdutQa3BY48bLbPx99ekjCkrEoQabXx5CnD5A6VDYwv1kj1QRaFFytfjxyDa
	2F7RXugi6oqWZqMzoBLUOfWY5gSkVXAQk3VnRR4N7cgYD0DIDnV7VlOoE/XS2Dsl1/8ux7XBYt78Z
	/1T023MCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDbe-0004Bc-VH; Mon, 07 Sep 2020 09:38:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDbQ-00044e-8F
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 09:38:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id q9so13723753wmj.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
 b=x5OvvQUkQ4I2LoNSkzzhx7+W8bsO/ZK+grYryhcNhh2GnuOJrKUI34PxB9IXwKoDn+
 LqVt4VbSrgEe98AjCzT96WwDVHuu0/mNSVlEya8GiGHMHcSG+2AMkpA386+kpcihAp4u
 EX+sgczSwYvRJhXtSGmezYLMwX7W28/HD6mPBUfhr+KuYnXst8uMh0zIx2c7jWDHkYFo
 0M9SjCWO6dLVIZLuqNRTK5x//eBcgk9dpQJiF+yktcvQULZ6OVLkRCVrXTyioRktnzTK
 AGeTw11CRE0Val89BCKJ8+vuSyEzVlOaaFy5v2F/6TKcVsf91yhH26LyDBO6iXYsqa37
 8Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
 b=tdtdTtsjwCGlHQEOsLrJVJSX8cOgI8Jf1L/R/Y2eD2fRky1qqN7qYwLWTv58hcM1uf
 fIfIPbRoAh/ronigzuKudEIrFMWZk0KAtFjeUs7IWRfmuDWl4MPB0XcQm2csm91mO5cN
 zP1/8Kpj2dSyKDyiwUIEb3+POFLtaPTzVmQHbC2LF52vj1KO41t1DYDW5tUA5hILJ7PG
 Lqai9ymtTQsBYG3GS/WjYZwOr8Yn11V0wyxVCO17Tm29YwdPeYZBOd5K5XaPQOcUWgFt
 a3Pv9Js8QLRhFRycLRLruEHlbIhf6aj+m2NI7PBr3+YeNZIljeOhsCwl9qCrG6MTzvvO
 5n0Q==
X-Gm-Message-State: AOAM531OOK1swPB1YaKcYO66wQYhZ/N+6l7NUZg2bZeFrYoMd2ACXyaW
 icCV+1xHbF3HeurzEE2cyTU+1A==
X-Google-Smtp-Source: ABdhPJy6RXmzUtHiqGSQ+Zn7a1yFtQEiNWhWQFBWPvR3QOL3F52xazfR89nrTNoJVR99ebtMkMS+bA==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr21016967wme.128.1599471496274; 
 Mon, 07 Sep 2020 02:38:16 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id n17sm25170687wrw.0.2020.09.07.02.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:38:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: clk: axg-clkc: add MIPI DSI Host clock
 binding
Date: Mon,  7 Sep 2020 11:38:08 +0200
Message-Id: <20200907093810.6585-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907093810.6585-1-narmstrong@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_053820_328345_CD2456DA 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock ID for the MIPI DSI Host clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 281df3e0f131..e2749dbc74b8 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -96,5 +96,6 @@
 #define CLKID_VCLK2_DIV6			130
 #define CLKID_VCLK2_DIV12			131
 #define CLKID_CTS_ENCL				133
+#define CLKID_VDIN_MEAS				136
 
 #endif /* __AXG_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
