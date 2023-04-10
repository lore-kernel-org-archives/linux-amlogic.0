Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F413C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU5Nn+KQKmuCnJ/yKwZT0AiSG2f3YKMXHuczIy/X8C4=; b=c1VUqsgQKhAPyr
	Bvc49o1ST22a19WdPE5ONMKJLZhlkkS5Bjdq9YQNW8BApyPnf9sQ1nhePdG2qQzfTilZxoiYXP7hg
	gi52hcztYMdjnaUa7EX6J8D9p9H3SRDGvt1/WA5mmJu6c+K3Pw9Ih28Or3IWHNUSMMZnoMyGEgaEp
	NVDSrz8nji83tCSVNTwisiquguiiWOj7dLjlEifb/s+jyiK35kq4ATPyf1+jCHC79n0Ld54PvDk9l
	CLvTPTUHxJpG588e/xGek+Tke5NBdECKPWE81o8r+oVaIjys4iNOLlm+U2KpNIRQvSEZEclbh8Dy9
	aUKjCC7IsuRF+p/RtT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plqCH-00FBpR-1N;
	Mon, 10 Apr 2023 12:00:33 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plqCE-00FBo9-13;
	Mon, 10 Apr 2023 12:00:31 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1842e8a8825so5600041fac.13;
        Mon, 10 Apr 2023 05:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681128028; x=1683720028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hdg6OnGdhnbQDxiR6CHlfN0w6V2p30dC7To9wkPjF7U=;
        b=odT2X9/Kafhqt+mfurHwFW5eUF5izshxcPdvE1cp1WZYFiflnKDocFbiSUqYS8YCAW
         zOtGGIGhCgNrxWkIgYVpJU5koMQC79v6UpJrXON52EAaATJvNxqGwB/m6ak5yYNSuOuP
         m2e+0fvMDomw440MunoeOxeBz+6XgFMbv2NZFcs/h7gkBxpOacrj2nDaEn9kRE68MjOh
         6sfSmZVMyrnwVvRmZV0ULJYCUKS/WAsiMK3Qogqwo7QPUj50WPW0bUV4nW7B1JsPqg0B
         ybenaWEk7vPofrjPPPemQigdRgkUHHNgNAm2NvKhQ91nB1GoPrqXqxi2jKIOm64dFopw
         PNWA==
X-Gm-Message-State: AAQBX9czcid1GnHFeVP935ru9pUCAxcYrZsMggl/GIWIfNkzEBmXU9Fn
	Ii4Hno6BAeSsiru+VaX+VWg=
X-Google-Smtp-Source: AKy350bAQmqx25l+3rBkic3FytZFkAQr9CoLxY8EvZgErZmEKWzqTuGKjdy/sRVA4KxfgfAtkx8g4g==
X-Received: by 2002:a05:6870:c155:b0:180:2a5e:7f8f with SMTP id g21-20020a056870c15500b001802a5e7f8fmr6126629oad.22.1681128028235;
        Mon, 10 Apr 2023 05:00:28 -0700 (PDT)
Received: from archfamilia.lan ([181.219.149.7])
        by smtp.gmail.com with ESMTPSA id j4-20020a9d7384000000b0069f9203967bsm4141884otk.76.2023.04.10.05.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 05:00:27 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	stefan@agner.ch,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2 1/1] of: fdt: Scan /memreserve/ last
Date: Mon, 10 Apr 2023 08:00:17 -0400
Message-Id: <20230410120017.41664-2-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410120017.41664-1-tanure@linux.com>
References: <20230410120017.41664-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_050030_364537_4873450C 
X-CRM114-Status: GOOD (  11.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Change the order of scanning /memreserve/ and /reserved-memory node.
/reserved-memory node should go first, as it has a more updated
description of the memory regions and it can apply flags, like nomap.
Also, /memreserve/ should avoid reserving regions described in
/reserved-memory node.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/of/fdt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1a68b6d03b3..26e608d8025d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -635,16 +635,21 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	if (!initial_boot_params)
 		return;
 
+	fdt_scan_reserved_mem();
+	fdt_reserve_elfcorehdr();
+
 	/* Process header /memreserve/ fields */
 	for (n = 0; ; n++) {
 		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
 		if (!size)
 			break;
+		if (memblock_overlaps_region(&memblock.memory, base, size) &&
+		    memblock_is_region_reserved(base, size))
+			break;
+
 		memblock_reserve(base, size);
 	}
 
-	fdt_scan_reserved_mem();
-	fdt_reserve_elfcorehdr();
 	fdt_init_reserved_mem();
 }
 
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
