Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F90C77B6C
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 22:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6uWTMjuqCsgb1UjLEEt14oY+V1aZrVlDS88fTeYJ9w=; b=Gjfhw64MEjS1Wq
	2HhC7FUvTP26iVhKzNhjMi8k5auyfQv3EZZ3zwMgnZWQsUQNO7YUSiYWspeJEc9E0mfAryyqf41f5
	JAW3qcyHj5mYGW3QM3DlTFSyXX/oe+Ksf6TGd3JCT46OnXId3pp8Q8Q3QjS5kQ2BVfrrOBA8d42gK
	LLFtbRSRaqguXxKfZmxO5zBOmwwmvhTHQWMQl+xCRLjyQA4y1NfdSnepDHmtkCmNXEdydD2/QxEdL
	u6SBtocFRCdcvg7bxLQcFUUea5QKA6/Fs3lAqa1BEEP+lYF+ITGVC4SSjrkaZB3xukApjdRjwyypO
	t9EvaGOX/XVQ4Ws2KrEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjEd-004Z9G-1Z;
	Wed, 12 Apr 2023 22:46:39 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmjEa-004Z6m-26;
	Wed, 12 Apr 2023 22:46:37 +0000
Received: by mail-oi1-f181.google.com with SMTP id cd20so2478718oib.0;
        Wed, 12 Apr 2023 15:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681339594; x=1683931594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6IQmhNHxPjInxSQpSIu3wq6BYWmrEpb2ujMy7CJmmE=;
        b=MGalbeYvh4NYGpAfnlU/wt1/Rw3Rlz9W8Ud+6sn1NUE1edCE6c9m5Tzs8qP05+S4rR
         bP3B9EO6/SsPlNOiEKBqZugzcoQbkuJ37yup8gsZsHbk20vz7hEOWorediAgMF646ODF
         wQW/ewxcsVzKsJYlCs8bD38IfICPKEXZt7GUholUGUV9XM6OpgWfYUFoNe1BXey4pWyt
         16E5f8iLxQ1BDdAUJelEpv524l8WmGA44vtIzr7S+L2fXPU2iBogSGMiSoBimAOBGsz7
         0i4t7Shb8IF+aat1LC2dIly0PF4tA5CREiKOzySjEUuNvJtoAV8KYEBJ316ZQOb9mydP
         yjOQ==
X-Gm-Message-State: AAQBX9ddMUif3t+76HGOmRE2GddNEFsNPYMi6AQI+WT7PO/c2V/y44qd
	l3YIdU0fM/+ImuZeSjf2Ux8=
X-Google-Smtp-Source: AKy350b3kRXiEpI85ie3nrvEShAhdBFxd4KwZmrMkY60iSWqORJl20wsZIIc2xYDvXSOb8nHd/bsSg==
X-Received: by 2002:a05:6808:694:b0:38c:9f1:2c88 with SMTP id k20-20020a056808069400b0038c09f12c88mr111818oig.32.1681339593707;
        Wed, 12 Apr 2023 15:46:33 -0700 (PDT)
Received: from archfamilia.lan ([181.219.149.7])
        by smtp.gmail.com with ESMTPSA id cg9-20020a056808328900b0038beb8c1289sm50012oib.15.2023.04.12.15.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 15:46:33 -0700 (PDT)
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
Subject: [PATCH v3 1/1] of: fdt: Scan /memreserve/ last
Date: Wed, 12 Apr 2023 18:46:20 -0400
Message-Id: <20230412224620.8909-2-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412224620.8909-1-tanure@linux.com>
References: <20230412224620.8909-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_154636_690168_AB207161 
X-CRM114-Status: GOOD (  12.32  )
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
 drivers/of/fdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1a68b6d03b3..c28aedd7ae1f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -635,6 +635,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	if (!initial_boot_params)
 		return;
 
+	fdt_scan_reserved_mem();
+	fdt_reserve_elfcorehdr();
+
 	/* Process header /memreserve/ fields */
 	for (n = 0; ; n++) {
 		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
@@ -643,8 +646,6 @@ void __init early_init_fdt_scan_reserved_mem(void)
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
