Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9CEDE9A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2k4u5IXZmkut1lazLdLquzC3lWpNU2sXa3JEL0JAIE=; b=TAP9x5wlsrKa1O
	/XRvBy0r0gcZKPspHjelB7KGMbw2q1x/uQfUpASMmLENZ7ujV2GDyuL8fGvqYSSr4JgM8egC0aeTq
	vMEg1yFCXbRt/dHS8h9pMTMTasXxTNdQYPHGSkgJiDxLuGV00MqDnO0b/i230MiKlaCi6Irui8AFh
	Zpt8SGCDtkp1I9z1ucxsvncQef1iO1poead4B8pZnvyb0MemXiH1khn99BqLKlj2PJD/TJ47ZSZIP
	EIb167IoQtbGA+EMQ2R073A3TktTKuY2eLp2kQKv7BnxbOtQTDecz95u3r0cL8xneEKEK7TuBSkSr
	yODd/WfW1VTYI7uRmyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3sR-00000006Mlx-0KU2;
	Tue, 10 Sep 2024 16:38:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3ne-00000006LCK-1p05
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-374cacf18b1so3335588f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985985; x=1726590785; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdCiYPdjlPcL03UXJdJSn9R8TB2L5xNznH8+xFLLXME=;
        b=0fp3Yfgd8k8w+Tfvzd37yQZ6cFHB8IpMP/wi9kUTp8Npcczf9jhO3ENwYdz8zAPOib
         G5uftl6l4ymjp8r1JBk5SUeS89pQLjh7i7gx4jpFmJfWQ2m3N6o+twOkPFutMmN6TJpc
         thjJj3brYSFQfdOVAD5oT7GbbQCDJRB9ooy55nfHA1HnNz9+2uTbkkQBQ+S9xpd4umP3
         bI/HulgrFmo1rKP+xUr6u2JaoAvR9VPkqRbTt3ohvq1VyXppwX0766Cn/ah8iAXPR4X/
         YlSB5usdFj4vtncr0xNqRfeZMR1X+aFmZ82ZNeZlncUu3nyZ/2LE4bJ8QxdM63Zo41/A
         LVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985985; x=1726590785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdCiYPdjlPcL03UXJdJSn9R8TB2L5xNznH8+xFLLXME=;
        b=RzAI+sjErcM0zVzQ0GC7NhjvRogXek05u7LRNTPratXWkH4IRGAQ/MvbTzlZZ/pEAi
         ZVaLriiAFCkpD+xiEE6zl0Q4K74dE++ueKcj9zH0wlLIeU/cuevxO47S/+RZZ6VLCcps
         F6n16qrTHLm6vYMT956PvQUMPeU5qgrkdn9sUQpONbRvRniXt9v9taGs5EFcduAWvCKr
         tFWRaq5wvLpPN3DBDL8YYGOya7y1DUnWRxh+BmVMfOS34JLanMK3V5kE+fHXDP9zo6vm
         m8qIQvyVcFjbYaqPZmyl8+dvMk8ey1Jj4Jjfm7Qjil2upiQwKWEym+uP7pR7l2fkAbWp
         h3yg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Aa2EIsVsTw+G4Tqu4hCdCS4liDhqZFFL9CdQzdruOoQVvLMU8Q5HxKnWXYSR/4kyQErYQ8hr0ToPxumG@lists.infradead.org
X-Gm-Message-State: AOJu0YwCMkMYQPd6fUKRHg9u3gySKbunr3tLUE6bF6ed8YQYHhsmDn9U
	dVzqys9VDUf7ql55XdfeStu78gSoQqYujNtnvDce8p4kmTu78NKBS5bJ75XKKGI=
X-Google-Smtp-Source: AGHT+IEYJJaHk2U/FX9vPPozpXuXIiqpvUnZX4hJXDjt5ixtTHSPLiv++R22SrtDiFbpcEWrBAzjsg==
X-Received: by 2002:a5d:4fc4:0:b0:374:c23a:2ce8 with SMTP id ffacd0b85a97d-37892727bddmr6243973f8f.52.1725985984538;
        Tue, 10 Sep 2024 09:33:04 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:45 +0200
Subject: [PATCH v5 3/9] reset: amlogic: make parameters unsigned
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-3-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=737; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I6joFYKtEZpmpOu7whQFwYwYWPHiUyzVlrs8QkUbiqU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS2itiARGZrvq/tXETgO2AUVYcuyrsCp7sa0
 TH9q3ap+YaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0tgAKCRDm/A8cN/La
 hYasD/9S8uCMfSuqThBYflvkEd3zYbAGGV2FKUHajNLbUZ8VsNZkd12w8M26sndSWIOKHfuxjX9
 +6MJOUuFzPgOtJGf4SRvnrbuxybbEHDCdebuH/cDExu+w851pesycvMjHWytEecEw0NXZjwtP8E
 9zCL7KqqImvL00hVnKIYeTFhV/RCFMwkdmmPHx4AJk2FC47EWJiBJY3dtTzF9qwnyPnB+0HebwO
 6Qq4VpsarQpb1fbJk3zdq9fNxSAQOPf6YNZN2C5A5/91iokwBBx9nguKnZkRpLg/I5IjnuyvTG7
 wDVcRM+P1jDrREVS/mbt4rS0LpPtPowBIs02f1hJNSAQ+8Jo1k52QCiA4BpHWZ5T7KQycPBTzof
 BJF9Lh4CFKTTV/oA45QIkebSFA1ME6YH2UbRRT3cMEdds1PwIMWQpD/u/DtoUzZsEVIYGMA+Lr5
 jkz9xuf0oJaKnaQ4UzDD/ctFZzCTnoCvIem12B7njHXYOlJST8dm/Jpec+EdrAWLQUmmEz4M312
 7ZqkkW2jymzi/jvgNHor7I904jwR95vulk5yYyWujz6jb/2xBpM7dmKMBr4+vcVkfUI4N8QjuSJ
 GZnXwVTDvf8+a/M4zGQn6ENeqirvhTx5idTF2OrAfvEublCWVlY8LdTsv+pLuB9Cc0ttIpPRPY/
 K5THCKSgsv9WOTw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093306_545381_029E26E8 
X-CRM114-Status: GOOD (  10.19  )
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

register count and offset cannot be negative. Use unsigned integer
for this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 848c2d88503e..50bd2241ef2f 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,8 +17,8 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
-	int level_offset;
+	unsigned int reg_count;
+	unsigned int level_offset;
 };
 
 struct meson_reset {

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
