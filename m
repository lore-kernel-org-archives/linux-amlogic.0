Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39963C282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0446220823
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3tGD2Nk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DDKaRtFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0446220823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+L4jmYNHegFeTUCeHFIOwVKhfcdTvDcC31M5EVpc1c=; b=n3tGD2NkeNwM1t
	xUOz4G9oUaxrHha7DtqAOfzT4nkoORA8gbrfImLCKwsd8ijoBREY+OKLT2N96Rcg1P6Zc2fmGq111
	14fBei/Om0PKvfOjcGsrOhq8zHOOEoIhf+z2wIm/eSi+Eg6P4KQJcCmnASN3C6oekiKD3SJCRjSE/
	xZZ4HzxeKSc0QLH6sQMgGnNma2YrLAMVs9yIc7EA+lV3zIv2QSCUAHY/PFWlS+35rxovb5l7IQ2cF
	5glN3h3KD/x8W3nRGhhm4ZzvIh4sTWIBa8Ew3buCMM2g2cvHfYxn0oc/XIPUnlPso/M4/Pq4otnsA
	+M6SN0uS2KQEfNNqaCqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYea-0003jY-Mw; Tue, 12 Feb 2019 14:03:16 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYeP-0003Yl-At
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:03:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id q21so3132436wmc.5
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dulm1bU9WtsfyglzYBfpic3H5/a+/roIjKv2vYQ8/qg=;
 b=DDKaRtFgKO7VzFN3HDS4BSseE07cHdEL2YnMBj5rNfi4sdbaVkIJHhlvDCSgVwbNgc
 wcTWHqrO4lr5n1X2fyNzKUlAyr94HWE1W4vyjSIlMWbgs6O0YqrUBsXo4X0R42s8W9+A
 3+4PA7KeXrPYmDkwPdLwp9KEltX4bvhCs9rf5nWy9x1Q24o9NM0DR3/6M7Pmw45c97Wt
 M2wrfLuZy4gAqor7FHhhDO9sKcuU8ywd8BMXZtwGSXWPWAr5b6kcStJPlpuoqwvgAoi3
 PZY76QWsSBEVeqzXnvkiHgjwmKSSLuBdR55cJf0DqQofKrr0G+b7MwjgnLnwZX9BZI1r
 IWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dulm1bU9WtsfyglzYBfpic3H5/a+/roIjKv2vYQ8/qg=;
 b=o16XbpoNHx9Cd0tJi79xjRlbxoh6Hmn6Qe+0G4XWYbADkEntrCWZhSKtlNq/buPZeu
 E7zoDbzU6M1ASaIcfEwvq5CXeaYbmDHHGTI6pBPDcM+uIPGQ75PGlE6ri/0IrwRoo4QQ
 T3ECvttJHIwxNhG9rG6X1qfxi3B+3tnk+x3t97GvH9tWplR9S//nSGRnxp/A2CHYPw3l
 ZCKRNkpxvdQxzeUN++oE9IuhBUWyRQ++vy0lh6bPGxkgeup2XmOwlBwz8d7D/k83L44J
 HK5x+Xu/e4mlJUZqF+RVvDd6UrKXxZBwOIl/BkNsMHIDZKPsdMy5oeZAeJZEotbbOVrw
 Dq+Q==
X-Gm-Message-State: AHQUAuaVAWU2VMgKKBRHHf+y+prumhH51SmRhVM6xx4TAZFwOvBIzSO1
 xbVTRPajOzhQuDWgI2GCtevn8g==
X-Google-Smtp-Source: AHgI3IYMiZchpHwXlRRXUxNBcje3WNreoRMlf+KDfkg3zQC6oxYJP3FScpJukr1yLGZK+OO4ykSc/Q==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr2886191wmh.119.1549980183432; 
 Tue, 12 Feb 2019 06:03:03 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g10sm23435678wrq.81.2019.02.12.06.03.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 06:03:02 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] vendor-prefixes: Add prefix for Shenzhen SEI Robotics Co., Ltd
Date: Tue, 12 Feb 2019 15:02:58 +0100
Message-Id: <20190212140259.9537-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212140259.9537-1-narmstrong@baylibre.com>
References: <20190212140259.9537-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_060305_372893_9426694A 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add vendor prefix for the Shenzhen SEI Robotics Co., Ltd, a chinese ODM
specialized in Android TV HDMI Stick, OTT Box, Hybrid STB,
Smart Home Gateway & more.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4615d4b9d11e..921ad8f88ed3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -343,6 +343,7 @@ sandisk	Sandisk Corporation
 sbs	Smart Battery System
 schindler	Schindler
 seagate	Seagate Technology PLC
+seirobotics	Shenzhen SEI Robotics Co., Ltd
 semtech	Semtech Corporation
 sensirion	Sensirion AG
 sff	Small Form Factor Committee
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
