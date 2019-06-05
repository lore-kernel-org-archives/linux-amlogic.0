Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B581C28CC6
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 16:19:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9D820870
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 16:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1n3oOTL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xSvGQ9SI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9D820870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hdI3cwuWK0Evw9bQ1wjKziPrbvp+PSB9lNcTwX5xHg=; b=H1n3oOTLbto3Pg
	Ny+GU+nd6jxtdwIX3FkrAq5QIrAlfCwgj+z9mjGVGDFbw92bEo61s/Q7AqfFGye7FD1DPBGnzY2Oe
	8qwAtW6kUgMRw649IDSLDvlwlcteXokZlfqsZiksneY0RXhXSfueuiaZEDqGCpAFsHi3fqRZ6WBSO
	72OEa5l57OT3gVC4MtIlFQe53GZE2n4ls8eEpOzYkW/iELyibL0AfOZdw68cb+FHoOqpZLE10G0Zz
	L0Vgou16wCrG5uWuLVT2Yk+o/mshVhte50Hf9p2X8Dx+qf2JmJbN9IhhzRh3pZZfBCaK55U0trFFx
	oahwYhEwCnxlc5CA2wFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYYdl-0005wl-3P; Wed, 05 Jun 2019 16:19:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYYdb-0005mz-VR
 for linux-amlogic@lists.infradead.org; Wed, 05 Jun 2019 16:19:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id s3so2878090wms.2
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2019 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
 b=xSvGQ9SIw52V+xJMZSJu1t5JISloHTwQ/WcAqny7yeQQZs1S1UcR0Y4sA80dMU38y2
 GM6DmHjk9PmL6JZaXLxXOBZdJrwYcAju226VUJyhkORsLc2qHDvJDwNPAOuow/WANc+E
 oUSD+9NxBoOjnoS3Po5Z0EKMmRNKI7L6wDIBjxmxNVfNcuift44HPNGuHNE7Z9iOju1K
 K8ZqdQyUtq/DUKZ0/ICjCuEL0kPB8rNlVPDATjnZAiYnBuCeYFptndmVC6KLQzkHMyiy
 f7auDVsLTJ8PxPn+kGauN3fZHPjISBgiclFUj9Ek14U5Yy7ebiCeRSNUSX8MwOZ6yUrE
 0p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REJ+F/EoJF8y7ON3vJSgKlf1KSRuyaPRK39EHGB3NLk=;
 b=LT5Pz76AWvx6oHDq3kfj15e8n1Pq1H5mOW8qMuAAXNJEz8mfngT7w6RRIkY/zjzxBs
 zlWCKYopjguJW86hFY6ZBtNkaONdlOlqe/HdzCXfsaBBWF+66GwnjD4i1VRX2fnVkPUa
 0adrBXPzqB35dGxqxGvsEn04NvqoohG3PXLZb1RKOQjIPh18zXqxTqB8S/grHtm4WUnA
 eaQntroAn3RoDksh6mbdZGdY299+d6GAkyygo4tEvcph5utOdv+2bzg5sqHqBjWIOEC4
 TH+no4g18BUH1/rS6Rjh0EIJ4JvIhRbLgCR1HRFpNcOHtDugyzRnmMwWyziB7PssLTXs
 4eRg==
X-Gm-Message-State: APjAAAUzUCDRWf01SIxMqpj87MWKSYhU0uo7drO0HQbNUDrCAY18S50f
 pXyT9H7iEcSKgBDqp9k2hASNDg==
X-Google-Smtp-Source: APXvYqwmf+UWLALwoDRIoedcMvv5gTJrZReDlb+XPS5jcOrSEieCWO3wlZSFz74KYV9MywZPz2GGww==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr20301333wml.97.1559751582725; 
 Wed, 05 Jun 2019 09:19:42 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id 95sm40062336wrk.70.2019.06.05.09.19.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 09:19:42 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v8 3/3] MAINTAINERS: Add meson video decoder
Date: Wed,  5 Jun 2019 18:18:58 +0200
Message-Id: <20190605161858.29372-4-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605161858.29372-1-mjourdan@baylibre.com>
References: <20190605161858.29372-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_091944_013745_A049B569 
X-CRM114-Status: UNSURE (   7.53  )
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
