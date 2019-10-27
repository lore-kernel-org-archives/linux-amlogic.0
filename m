Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC1CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87129214AF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MEgspx7z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Y8fcd9UW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87129214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIQ9+XMP+qD+pQf7W7nquXrfTLtVOiqAuH8TAuPxa5o=; b=MEgspx7zX1gRzc
	71giSpElbYsHQW4IVo5ipCfkn2a2Dw8pdCOXXTu5pqnEoJnD1cKfDcp0xChY9aKv37q/2GT8ruqGQ
	AjtooIyV/F1+QeTe0yVmbp/uHkI2k9+XegOFf8KcmSLKGJcmqgnkeKDKt6V6N/n0XxPMB+Y0syxhl
	6U+7nwPQSVZl10jJ2HNiaoEp8zJkxKcpRpVvJZ/B+CxiyYRNCfFuLN6yxtDovzvmg8lTTgJ/81RYV
	uKTfrlKdEz5eP0j7IN1p80mONojbUu6/eUqZOtv12lfyob8RMYao8sT7kLedjPYW81rzzbwEm9Gvc
	ujbp37befryx4ltzXXRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlFd-0006bs-KE; Sun, 27 Oct 2019 16:18:45 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlFE-0006Ch-CW; Sun, 27 Oct 2019 16:18:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id s1so7399973wro.0;
 Sun, 27 Oct 2019 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQ1b11JrQMPNCzMJaz+y6q1nSpUtkZ5R8/joJD6Qz18=;
 b=Y8fcd9UWEz8ZhI1HAXrUApECbzToLMV/0EZ4fsDzW1oo4Ol5ePz6Mm0IxAvoezYzkd
 s2HnNydcCJv30Wka6Ei4vvbv3sGYXS3vGn+EIkzxzyoLPVuQLSHdgpH1Wt2d4Z/B8BdC
 vwy9UVXLVY+1ivTt5j5Mrczx1aYKocrKk/+TbT1TbTqnhFBbm4pt41AwNWMWy/2loU6R
 8MwwkEwMHjYrTq9P+STJ9fu5Khe5PQf3VSDGkdNDMRq8nQGh21rnLrjwEztWyVtuhWfP
 6ktxynw0Cn3bBFAzb+sXi8HpEnJ81eQ/yyXQHCve4AtjTzyGmCGDpVzZGdFqSRzriwA7
 Sz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQ1b11JrQMPNCzMJaz+y6q1nSpUtkZ5R8/joJD6Qz18=;
 b=W83sYxco4kNGE0xc8ambhtDAEbDyq0PhwppstM85/eHbti6CvkWtla3HETpKj5yvoR
 3Q5C5OuGdHHtZ3+9GrolU9PteliInuyTLWPf10NON++WvvFrBdhxcGy4ni9c2j6jJqP8
 haK5TOkcJd/Ku5fc85AZgavBeG9w7eptin3wD4mgVzkWsTO3CE0cQN+zr0oGdt1wyiYC
 iD4mzhKwgeiRPgOzXJ03PRB6IqY//YPYGGifHjUCyBG5XZy2ggnxkb5YDpp5sA3XQV5z
 yVNqK1frXfbtrfzUTbq0VXWTXvAG9T0LX7B4UlltsIZFKmnw2XQMdvrWok22rM5lcPDB
 yRcQ==
X-Gm-Message-State: APjAAAWF2kUVq9pK460uuVNjAEaoWsHOhNk9jR6T4IylUrszm3CzVNfK
 XUoC3Gb9/jHX4j62pElA7eU=
X-Google-Smtp-Source: APXvYqysISP879oRde/djghIAdFy/7j14R2KbsTb23U1GvaSj/8vP8LRd3LHDN3ZcXn4lnSWEN3ZWg==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr2473253wrn.134.1572193096993; 
 Sun, 27 Oct 2019 09:18:16 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j14sm9585014wrj.35.2019.10.27.09.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:18:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 4/5] clk: meson: meson8b: don't register the XTAL clock
 when provided via OF
Date: Sun, 27 Oct 2019 17:18:04 +0100
Message-Id: <20191027161805.1176321-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
References: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_091820_477277_94F576B4 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The XTAL clock is an actual crystal on the PCB. Thus the meson8b clock
driver should not register the XTAL clock - instead it should be
provided via .dts and then passed to the clock controller.

Skip the registration of the XTAL clock if a parent clock is provided
via OF. Fall back to registering the XTAL clock if this is not the case
to keep support for old .dtbs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index b785b67baf2b..70ac6755607e 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3682,10 +3682,16 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		meson8b_clk_regmaps[i]->map = map;
 
 	/*
-	 * register all clks
-	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
+	 * always skip CLKID_UNUSED and also skip XTAL if the .dtb provides the
+	 * XTAL clock as input.
 	 */
-	for (i = CLKID_XTAL; i < CLK_NR_CLKS; i++) {
+	if (!IS_ERR(of_clk_get_by_name(np, "xtal")))
+		i = CLKID_PLL_FIXED;
+	else
+		i = CLKID_XTAL;
+
+	/* register all clks */
+	for (; i < CLK_NR_CLKS; i++) {
 		/* array might be sparse */
 		if (!clk_hw_onecell_data->hws[i])
 			continue;
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
