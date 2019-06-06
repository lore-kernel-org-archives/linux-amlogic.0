Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58C8C28EB4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F7A20645
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFBCJzpL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kKQ+Velk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F7A20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hdI3cwuWK0Evw9bQ1wjKziPrbvp+PSB9lNcTwX5xHg=; b=bFBCJzpLZLmo+9
	QctUZtsUwqlOsWN7MWljf95qoUwxWihNChx7bsSnO5o42176eDJZSmcPjM/IOJozNmgzrOXuWulkc
	5Ml1rxvFcV8O8HnBZbnQag1On8M/J/r9q831UL3CD+srZYAR5/P3YAljWRkEfqqt6/g5lbgB6YUE7
	mQiGk0CL98DJhzLvPphMVn/zjMk//kIGyQNqSO1OLjB/Zw9MrEpw0OZYeLaiN/Id+LFzRVUEtfjdM
	T1mPRYYmzBLtUkQoJp/so22++Tw41wBVRqdRbTCsyE89Ko7FPT21WZWQpy/lnoXsrYMB/vpUClTA/
	+8Ph+ZZMUn2luTt+TmHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYutf-0002ys-Bk; Thu, 06 Jun 2019 16:05:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYutK-0002dA-JG
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 16:05:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id p11so3018631wre.7
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
 b=kKQ+VelkUt6JaYM6/XzEtySTnRdqSxbVzVFAxBo810/cywmokiLiR9kZNee1J0oD8f
 ZUiQBCwReVS8IyTTxN1o5MB7Sfd2YRlfLfxryIof6HGtRhKx2z3iC42g0gt6pdBEmz/J
 ErTPSjLXXxXyj5qQQEumXBGTkg42dC6rF7dt4FYx3io5Zdg31GFQvL9+QfjHedb295WE
 F85dgv+buyyOakKpy5ZmUS+XaQqk632bXD2ZFp1o0aBdSrrEp/DlP6ar/Z9eWPRkwnpo
 GudcD18NWBPIchRHYt5YhwfABUMyzJJp7v3A+4jOj65U46ofalj9D+2VhG5iJgz0MkT8
 3/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
 b=noM/xKSETtGZQOCfmYMysAqpmCjKjKvu1+pp6sfLeJJgR0ghbeIrJzt0qy0+zK1r3n
 0FJV2yHQn5YNgMj69g92P+hO0rjXC51Ij2P0Ng0yNXDa5BwMslDVEwuXZr8pgCFVxuXV
 2ZHhiGOqWXudosAc2yrB9pDCTXYHYfKaaeU0vtfQeoSnN0PbjTALJ+pTx+h5No+QxZwG
 qhmZ8DeYuQBzSx20e7PWsfV1a129lsu1als7/IJsjvxChuVCknmT+DfWVjkgViM3R3O/
 vHAEU/pJp5yvbkSr215QuxQazjB8r/tWWDc3Kyaw1eLdmWQttuK4DzQx2Lx0XkzQ5l/+
 VCLA==
X-Gm-Message-State: APjAAAUzFyjDZ2sYolXUPtU7fdFMJPUB6eAZoTpurDq2GhpPy4DKuoxr
 Iq73s/MPZ50ihPz/qW8kGl4Oig==
X-Google-Smtp-Source: APXvYqz3gbNA2D0bF0Eq0O2oDIySuKiZynD3XFfUkI1kKWkAxWifm2Gws82DrVcaBKGHZEl7uIaLzQ==
X-Received: by 2002:a05:6000:1c6:: with SMTP id
 t6mr31836953wrx.236.1559837125386; 
 Thu, 06 Jun 2019 09:05:25 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id t140sm2180901wmt.0.2019.06.06.09.05.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 09:05:24 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v10 3/3] MAINTAINERS: Add meson video decoder
Date: Thu,  6 Jun 2019 18:05:12 +0200
Message-Id: <20190606160512.26211-4-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606160512.26211-1-mjourdan@baylibre.com>
References: <20190606160512.26211-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_090526_635860_9CA9DFE9 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add an entry for the meson video decoder for amlogic SoCs.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8fbf41865c2..7cf3ece9f0cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10222,6 +10222,14 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/meson_*
 F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 
+MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS
+M:	Maxime Jourdan <mjourdan@baylibre.com>
+L:	linux-media@lists.freedesktop.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+F:	drivers/staging/media/meson/vdec/
+T:	git git://linuxtv.org/media_tree.git
+
 METHODE UDPU SUPPORT
 M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
