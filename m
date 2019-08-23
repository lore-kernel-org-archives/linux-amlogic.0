Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C21C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:23:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6CF922CEC
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BdTSJLgC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a6uDcdad";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y3j3iCJE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6CF922CEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rv4tNin7fZzQtBQln9QYVpUTorrI0bmHokPV6zAR0NM=; b=BdTSJLgCq7r1H3
	s/AXUIVd2WVkdChxMA4P71YQylSsuSuysJTOnA2OG2whQgNOqL9BFKoiCfx/G3V3ZJCc/K35vfDUY
	/52DcomhotukSO1bYDmzCh7f+UOJ3Z8xNc71zywZRHgA2euG94zeQ+HsroiWi1uNfqZ/9muyudzX8
	GzX6dHfGXYvRx0diDtQmSJoI916+42M0QQ2dKh8XDCzEqx7BNVJNpYYuEprYySTIrSpkYy2NEMaaB
	IN9rsmtY4iD7hszSROrxVZOX6MxEie9JCBGyxIbyw4XoaLgyNKziut4SpwLnf4AZWU30ktlRcoQeZ
	DK4P+vqo/Th/Dp+Y2e/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13uc-0006OF-0B; Fri, 23 Aug 2019 07:23:06 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bR-0001Hd-JZ
 for linux-amlogic@bombadil.infradead.org; Fri, 23 Aug 2019 07:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKp/3tQaH/+CAXC5vPIgbu9pLlo8VAlZxJspdFK2/l0=; b=a6uDcdadLkhScLJBg0P5iFijFC
 flefoNgMTROU0p4fy8PUpOGlmBdTb/S+rsoYmZnbjaFzPnfg8Gse55Fna/ISyGPx4pfueqB9/8Yr6
 by4F3S3AMbfb8TiBYQ/Tc9iksE5TusAHbm8VVupwOrbXNgABZyvfXTM6AI6/MdX7bwjC7w0ZodTUf
 aCCoKTIJmmOkV1y8qYQiI4BydxIADBaZig0jSBz0V2qxxwMB38g+GtWravewriaZ+614G7iI7rqdG
 hq4mK4vjRz4oGchf7llbM8PTdkN2tA7cEIPeisG2SBbBCDNKsezNd7pRInXYOgwsCB3C1Pw6i1TQv
 uaXx7mzw==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bN-0006VJ-Rl
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id c3so7599234wrd.7
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKp/3tQaH/+CAXC5vPIgbu9pLlo8VAlZxJspdFK2/l0=;
 b=y3j3iCJEVDtu7oGjTnedwcQgrl2JHBVZOJrVixukWgmdfKEeK/FW8LAE0L8dTexkRn
 ZxN5FN5t2WY8yWY87/2pUYi5BlR1oB/YcUs6FxnPf7bVE7hjIyhbxVfDzR/34SXwtsMm
 WV5ZcPjM2SHrPP20E44e3c4XoV9qgfI1+3kyWS8iBvi7TOz3F679oEBfjvf1U7BprN3r
 50SB9ZCwTIwoPKvEBgusHzOI3zirbI07qz3AvoKZhUZ7xM3YynCN5GlgwBN8ne8DOWCZ
 yAeZMagJzM0DmDCvwcojhMb9CVGEmRQSy71orEyPT/3AD1BhhPXb/fcAPFgeb+oqmf5j
 GvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DKp/3tQaH/+CAXC5vPIgbu9pLlo8VAlZxJspdFK2/l0=;
 b=UatJO7iPW5X2lXlLJ9j/mp6Hvoh82JEZtiSC5wacCGwOnE3wAnPwcC9W8UMyJy4/EJ
 OLpfdCfCRoA72NEWs41ijdZZoreBFTqaUQAjhdlZ9TFEyc4PH+SDeMFNYxgEhFHZEkxl
 Fulea4B0ckaIUviMtQvvTdrLBIvr7+OfRGxoU36uRU1ry75YxE6v+EgnbM9tEUPkFYTZ
 f+ntEMF0QFwJrD+kY1Wnn/+YHafO+It7CLrINtDhnovetu1SK2/RJHG9GoXy5XpibiXZ
 q1KLnefZXuIY4x2CgcGP+B8diDlBmievplvR9YJxBhXVDSUMaqjVWFaueiS/fhcMZ9AT
 +C5w==
X-Gm-Message-State: APjAAAW5HRrX9lzoCRh3wPrt5F9mfbDoDcLRiaXMTRsSw7u5m9+egv99
 nXtG31J198tsRNLY2HB80sERHg==
X-Google-Smtp-Source: APXvYqzHQysbTFU4MseJMlikAoQNVPMZIuTg9LNrYO5FU4enKFF06okMREZkZdmBoHmutZTGESobKA==
X-Received: by 2002:adf:b60c:: with SMTP id f12mr2522969wre.231.1566543786329; 
 Fri, 23 Aug 2019 00:03:06 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:03:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 13/14] arm64: dts: meson-gxbb-p201: fix snps,
 reset-delays-us format
Date: Fri, 23 Aug 2019 09:02:47 +0200
Message-Id: <20190823070248.25832-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-p201.dt.yaml: ethernet@c9410000: snps,reset-delays-us: [[0, 10000, 1000000]] is too short

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index 56e0dd1ff55c..150a82f3b2d7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -21,6 +21,6 @@
 	phy-mode = "rmii";
 
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
 	snps,reset-active-low;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
