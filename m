Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36687C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046CB2084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K762X4rP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1D0c140l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046CB2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nss1aedOB0wbJQG8Rz/3yv81QMFeZrXoPxNVAN7h1kk=; b=K762X4rPX5UDLd
	hqXiwPB6yqf3+XUBuJzLZCcLrafRdHBSTwTe/v+qqvDP6kY0vLF48SKWvWlJMmgYvlABmLboK/tVP
	a4GHashRrwzWp98LOOWz0/8792YEFt6jKCHZzZ1XvAoo+COSMmzu84uPsIvS2Qv9gGHe767BXZcQD
	Z7vbbgcW53RvvrSzUPG6xB/ajFzvBY9IsXrgEwxD2CmVgkAJ7BOSijPP5cFp20LaX/Ujil+MoPlQ0
	iA1xdULlxc665ASeZ59m8e3CaA8KejQvSW7xcDkjSLloKoIGObXSxV56JzIrVzOAt2ya+ZIXw7DcC
	2SY+F9NAuD64khyleY+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8N45-0007tR-I8; Mon, 25 Mar 2019 10:42:49 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8N41-0007sd-5P
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:42:48 +0000
Received: by mail-wr1-x443.google.com with SMTP id o1so9458152wrs.13
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4Cs93Td2ev+3BK1qi4u01I1+1mquQ3LynMHsDaBAJA=;
 b=1D0c140lZ3TuoOseTpYGn+KepDJTLUGQCx2qD7hQyg2W5oTW5jTPbmwJ1whikF4Dgf
 PGuC20teMw12a0Tf5eRXGGdhKZUVUlLGm8TaoVd3YI8tcKtmI50du8l3rouAP2aAx24P
 6QzhRTSNPNvSLYmlHo4fOmNj/vdb5Q9xwmqcDdYMwLfKFychAWGpDu9etYvhuAxsySBs
 uBGXmLzZyFPhyR5UcAIM7FWwDPJ4y1bubHNIZG89rJ0JJIaSZGeiNx7FHTsOWONT2ZmX
 9JMuyfBZDap3+RBVNZXJr7z7SVZM3UPZNatg44dwETeJ12LfqROtyzcCXB1A2xjEsHVw
 gC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4Cs93Td2ev+3BK1qi4u01I1+1mquQ3LynMHsDaBAJA=;
 b=AqjoJ7bh6w8eWjKbflYZ+DPVfstdmkDUir3B97vPHiAXTWZYSb3sckNB/Pue4IoEN4
 NfNFeAmibVpaI6/UrgOlGF8yoZfawDVM5EqX2UN2W4VsVHvpi9tGE/MIyoNhqYho57qg
 ZqcB21pobwvSVIXexyw1/I37rzle8MMuqBwDacXl+knCz0GefBNwsAoePAQNZD100WCN
 +jrc1tH0zphORHbAWw+wmtrF8W4rkB07YvfbLzPNHuGsJhoT6phWR0ONcfiHXDNsX33f
 pI+BewA8dxNwwnAhCUaL81Y6zEbyewfNHpO13opjN5jjomVp0vh5MJANjAD/re8k2tWP
 oDmQ==
X-Gm-Message-State: APjAAAUX6Qu2/zvVZpCQrAIzvMzH7uHBu9JdoVfNBa4m39LGTpmCBz/H
 7kTrfV6hB/muYTEZGRwxvPiLzg==
X-Google-Smtp-Source: APXvYqzmTIG/rqGXeKziNk/T5/p0SkUjSx6abAoIlZG9mN+VueyLCQl8QPz+VUUkS3jRKQkQwGwytQ==
X-Received: by 2002:a05:6000:5:: with SMTP id
 h5mr14681264wrx.271.1553510561778; 
 Mon, 25 Mar 2019 03:42:41 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id o17sm16760232wrw.73.2019.03.25.03.42.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 03:42:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
Date: Mon, 25 Mar 2019 11:42:30 +0100
Message-Id: <20190325104230.11245-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_034245_246663_90D48E53 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While some SoC samples are able to lock with a PLL factor of 55, others
samples can't. ATM, a minimum of 60 appears to work on all the samples
I have tried, so lets use this value until we have a good reason to put
something else.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0e1ce8c03259..d3f53a9b97dc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -151,7 +151,7 @@ static struct clk_regmap g12a_sys_pll = {
 };
 
 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 55,
+	.min = 60,
 	.max = 255,
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
