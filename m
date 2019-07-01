Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D121C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21493208E4
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jyVQgoRP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zPBzDYcj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21493208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ty5Ydow8OwsZpD28p9Sk9YedFKIMLhvgAW0yCPXvwwM=; b=jyVQgoRP+shu+o
	Oy2rv46vca4PgtWFlxpUhEF7GSTcgvE7UjWPV4d38k2P/e0y467JQtP4WYtpdC9FW/PQQz3bEri0h
	Hyx8+skzMqwVcS/C7nzSHsoAIulfBQcUerkr9QOE/gbUEQkMsxsCoGVpb3oAclCgVgrbvYii1B6Rz
	f3enmbF5r5sTt+NcYuIq9MH+oqg7jWN0+vRCPKGRV7Ur2oxxf4+WobizpU+0pHD9UHH0z5FwsUTIE
	plS03TSvm7EALirh6gdHCXYYEUiO9+aXt6uysDu8X5+bn7+1SsbLgBef3GscfuzrOhe7hgELTj2Do
	jxsAI8enmqegcRKyF3VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtqu-00079l-Ov; Mon, 01 Jul 2019 10:48:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqI-0006YO-LA
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:28 +0000
Received: by mail-wm1-x342.google.com with SMTP id h19so14296692wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfgjAQ3M5HY2NtkjVQDzRJpLev5yRfzCJhptr2owUzY=;
 b=zPBzDYcjDqHiHXy9jMFQwxCKaAAzbtCKZS+bwK61KcgKKpDtVjmshT4h915qhXcnxN
 GvwfCIK4DBZEZ4s2JPKlmLDWsh/l7icG41GIM20ZorILqhFXmjfYjLllTB8xnsfodCps
 Zt+QSHs1sZfGVGgZZgtsDLCQcMfhzB1vBZArWhJ6b3MIfCOM38RuEI6qunfj61p08z17
 x0U0vbKHjuPy4nXo3/46YLS53egemjbBMuCI4TRDKO/+a6HKHDCsWM05WohCj+QuxeRj
 3bDhWP5je88qRmMmnqCYb1z3f8ld5CRz3z04Rx50kwxO3V4eR8c42qaac+j76eVocv7Z
 QwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfgjAQ3M5HY2NtkjVQDzRJpLev5yRfzCJhptr2owUzY=;
 b=SERb1Kgd7bKVjoRoHco3nnliDFoxhY3WIkAFUFdQMRHSgqRO17armYOSP+D3O8FTYn
 M1s721X/4gjv3Plcocp6bTPCy6TOz2bSidH/kdGiQSDMS2yMCyeUY09ET9HoL//2bIOC
 H348i94LeCuJf+U0cLk8LoU2RBQxh/hMIHLnwF3AbbAIc/QZplIJtfOZspDhJUJM8fFs
 w6qOmzPQW4ArANPjAxhsA8LCbD4sWCp1CWugm7l14PurJslEL3Y6tgRkUFnmAozDT765
 NMsJA1lky7AXOfvVB3CU3EXH7e6xoa85D/DvvWgQjig5mWSb7xpIgrHZK1vvZI+2UApJ
 fYBg==
X-Gm-Message-State: APjAAAWDCAEuZwt5lacZgsGd68/rQFxPqPeA6Tqjc8dECzHW7fuzg4mv
 BmmNoUKWjaDXjgvU32xZA/+FdA==
X-Google-Smtp-Source: APXvYqzrQnQF/+v+bIQvryP/j5lpMQ4UpR0oBp9qdOxkvujlAZoajK57bDQABJ8zj0Dn/XghUa8Djw==
X-Received: by 2002:a05:600c:1150:: with SMTP id
 z16mr16105586wmz.168.1561978044919; 
 Mon, 01 Jul 2019 03:47:24 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC 01/11] soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
Date: Mon,  1 Jul 2019 12:46:55 +0200
Message-Id: <20190701104705.18271-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034726_700501_16F29916 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the SoC IDs for the S905X3 Amlogic SM1 SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index bca34954518e..eb81d391b620 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -39,6 +39,7 @@ static const struct meson_gx_soc_id {
 	{ "TXHD", 0x27 },
 	{ "G12A", 0x28 },
 	{ "G12B", 0x29 },
+	{ "SM1", 0x2b },
 };
 
 static const struct meson_gx_package_id {
@@ -65,6 +66,7 @@ static const struct meson_gx_package_id {
 	{ "S905D2", 0x28, 0x10, 0xf0 },
 	{ "S905X2", 0x28, 0x40, 0xf0 },
 	{ "S922X", 0x29, 0x40, 0xf0 },
+	{ "S905X3", 0x2b, 0x50, 0xf0 },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
