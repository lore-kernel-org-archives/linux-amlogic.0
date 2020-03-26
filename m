Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68C1C2D0E5
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AFB20714
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBKB51go";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oBUu203t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84AFB20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUxYgxl1Y/qtigBuQLHBCl+vGaJqIy1XAff15WS4yaw=; b=fBKB51goa92vUj
	5hfQnRFRw4IUCZZATHy52d/FxUEC+5jkSchiZCU/c0YYVkB2hfWZG3Y3dVwE5pgJSDIPp8IWLWPTE
	+fYw0Q5ckDfcQvGtgdXSJkP4uA2og1+Rml80YkXeiX9mdeVofe8bEWAI3ugSbq8CjxBKBxXkxShoK
	yhohiOZDPld+z2pwaSRfcxQNcK0Jx9Js5v72bXhQG7YSZVuY/RQE7QsZWLBhTaIocUP9LkYshJ7LV
	QXcI9yQyAOWYN12o43GCtCr9EYEX4SPxGENtDuXzJJsyIYO/eZGDY1K1iPIv6bCaeCRxQavSktUAD
	Qk8SqFD8Vw5NX0MRXMPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVtk-000716-9I; Thu, 26 Mar 2020 17:02:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVrY-0004s1-Gh
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 17:00:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id s1so8725610wrv.5
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KH7vfyD8OR+w3xEkJPXyaCwSs0SNGzK6N2bTA161o2Y=;
 b=oBUu203t7RmFgHaWPKfqDoFNZ7qHA8FaJ57IhhRltK+4P7FX4lRZ1KagibzgXmPiS1
 pAbe2ZIo/zd9GzYffqMYqUMCJjGL6Q+W8I4zCSJas0CYRTMQtw8aU3MVv6EbToUzoYnL
 g0x5K1Q2Echb5hvO70B2wRozqQKt5CeRQu3+D81P84GVEL+rFlnRyZF/CCnf5UBvzdZW
 YSsFQo7Jdm3hP0jc/+t2AF1FxDCySn7eFeEGXWZD5mtm8YeKAUvJP3S7YVO0vqdfyGzm
 l575fST3wy2MLaHF072JL8P9brrFrMR8mV38T19U7FpTLFUJPVgsRQSwsBuUfm/hToZz
 mEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KH7vfyD8OR+w3xEkJPXyaCwSs0SNGzK6N2bTA161o2Y=;
 b=ihIoJQfDjEvy27Hn5TmO7mHQYvDq/ZqG9hTOIt79TS7VGZHgKmo+WDRQxO/WF83N+x
 6g3+3oeoR7Cna3nEuZOlicOZ3f3vrIksWNLjBXQq0Itunt8jGFA4+iqzkwESkXuRZxKs
 i3lX7gfYA086AkrOEnKhtDymQTLRRpWDpjoEUqu8e261Jnyl2BLlg8hBrXjOj3G34QpF
 vJgPlUybsRiQfi2JiMcdmMnB8NUqFgHxTRAp553qmE98NslpUYBoWxzKM3afxsgGPvW/
 XDEjOBsWv6M5tLQsvZ73XYPBhXcSBKsUZu3qMLwjphiw78ZSNo6+gCb5mzk8Fo/5B5Bd
 vv3Q==
X-Gm-Message-State: ANhLgQ1aAdT/nXrLI9eyxKuNKrN+wrsi/OzkieN1o4ta4NaRj5SyoFYu
 qZOIFrtIX9g9DxOE7G71ilKsL2nW7E6Chw==
X-Google-Smtp-Source: ADFU+vt3O1mUzxJ83ShJE2FwW+mMD0UGCyJFszSd3W0wU5qTnctfhV6RSdjpu+iyF10tx1Nl+pEApQ==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr10326561wrg.34.1585242009350; 
 Thu, 26 Mar 2020 10:00:09 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:00:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: meson-gxbb-kii-pro: fix board compatible
Date: Thu, 26 Mar 2020 17:59:57 +0100
Message-Id: <20200326165958.19274-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326165958.19274-1-narmstrong@baylibre.com>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_100013_138238_C28F501F 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove the uneeded "amlogic,p201", "amlogic,s905" in the board compatible list.

It fixes:
meson-gxbb-kii-pro.dt.yaml: /: compatible: ['videostrong,kii-pro', 'amlogic,p201', 'amlogic,s905', 'amlogic,meson-gxbb'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 6c9cc45fb417..e8394a8269ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 / {
-	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
 	model = "Videostrong KII Pro";
 
 	leds {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
