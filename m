Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1706C27C77
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C76h4fFGNpdOUm3ZBNGZRpU6vXAJ7GPwfiCJLmf0+do=; b=epk
	T7L18bTeJAzp3uCxVJWAt/ffht7WNJqOcZjnrJJ7nIUG0Aq/RiF53+xvjoky+FG19EpakNdqGXvEA
	6WlTocuWyB3WF8Ri1ygqX62ZcKY3hYviwLyoUZ0IKwpaaT0zgmkZ3uDyKk5DtHBX57pKcw1NY0tjM
	4QJZLNoN3rVt4N53z/gWc7nNQrRQ+A5ZSO+/khDKZcNEcflon5prB1N8qr1TBN/DFH/fzbpIEO9Gu
	ybpfRHzKar73jL7w/jEAT7iSdXmlYFMkoUsc4txWy+mrQCXHxVDY/j2U6WCKUiiJbgJTNnlQZYkcA
	WJfYVz2fnW02ce/+VT8gGc0cWodTNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH2uV-00000009Dcg-0BQc;
	Tue, 11 Jun 2024 14:55:43 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH2uR-00000009DY6-3MMu
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 14:55:41 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfa77d54cd2so9038781276.3
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718117732; x=1718722532; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MTug23NVW5smTBIbInLHVPug/iFJLDfAzzZ2mui8rNM=;
        b=Ig60Z8GNGkVi0KIQAmQOlA7OSPSqHYAo/LoSER0g2rrwYfZPBQret5tStZgXhBQgj6
         3OTdiSPTqzdzfQYDmHDNCHf3LUnVh9uIXepfpO395D/CFZh+njYzueuvSQI0ldkaEBG0
         jCas49o0xI8YQg7/SGA7QFaSeJN0FSJvBp8JrhLPAgq5my218VTl44Y5hnsGY49fQhTu
         AMz+Fc60EkP7vs6OZUCCvMgoKCRSBlU63aeStvIexwn365rmMCAvvVnieJFkDG4FkfoX
         j0+Q/P1+Tm/+Pg5FQn0v0yGfbF8wne0EkT6s/66XCcskyjZyltLZlARBNEYPQ6T3Erpi
         YFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718117732; x=1718722532;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTug23NVW5smTBIbInLHVPug/iFJLDfAzzZ2mui8rNM=;
        b=VEMFb50IZImzUjvKPR42OqU0B06+v5/pzz54xrxsbi4wMvSJ42tiGnSD40oaZ1/1r+
         cjI/MdH/wtdc8rxtenZ0pvp9WiwU6Heyl64MeazOES8zVSEqbsk5zPq4T9qOKo5cd7SX
         ET6NWu+DUhyWI76CoPyestGDQvHPB4CNeVMq0MPZaDsXToBJqhHdDhJ4j9DSj6J/GBwC
         yabrRKvWat3zQh6llY2rdT6fnw/x3ElTvlp96ZmAxntV/GA3OgBS/sIoGtKF2RJQxlKs
         uf4TyKWbYX9rJbMX/6WCy9Nh+u+RjSsRjCt4mJ7qfuAY6OCSL01HnnlGs+1iPyHpYY9g
         zQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWcwfqbYsODf1enTiTO5tGEbqpanBVfwXs/ztiPrmtWgDL3TOhm9erJeCE6XaphxyvK9+MPj6CeZ2OG3tAGO5G1XUrlPZysNKez9fvObvYnwG0=
X-Gm-Message-State: AOJu0Yw+S20+s4NmSC9htj+b8wEM4hMmCVQ2fJaywoCLi5OiqNlTLNgW
	fBdC4TERxHehxx6eQ9r57r2mtKG5IkixZJCD1Rwqx8GvsHy/6sxg9maPA6NhaVdR0k5BBdff9le
	UGXuP6hS2Uw==
X-Google-Smtp-Source: AGHT+IHiOkeOvIjfZ6wUrcER+iWZsILYAZCJ9J9uHIeGqPk6NP5zJj3D5rPgY6hwnMYRfIhfkqi1mMAvYXYIig==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:1207:b0:dfb:168d:c02e with SMTP
 id 3f1490d57ef6-dfb168dc4e9mr780657276.3.1718117731956; Tue, 11 Jun 2024
 07:55:31 -0700 (PDT)
Date: Tue, 11 Jun 2024 14:55:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611145524.1022656-1-joychakr@google.com>
Subject: [PATCH] nvmem: meson-efuse: Fix return value of nvmem callbacks
From: Joy Chakraborty <joychakr@google.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_075539_910202_05DA8618 
X-CRM114-Status: GOOD (  10.69  )
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

Read/write callbacks registered with nvmem core expect 0 to be returned
on success and a negative value to be returned on failure.

meson_efuse_read() and meson_efuse_write() call into
meson_sm_call_read() and meson_sm_call_write() respectively which return
the number of bytes read or written on success as per their api
description.

Fix to return error if meson_sm_call_read()/meson_sm_call_write()
returns an error else return 0.

Fixes: a29a63bdaf6f ("nvmem: meson-efuse: simplify read callback")
Cc: stable@vger.kernel.org
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/nvmem/meson-efuse.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 52ed9a62ca5b..d7f9ac99a212 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -18,18 +18,24 @@ static int meson_efuse_read(void *context, unsigned int offset,
 			    void *val, size_t bytes)
 {
 	struct meson_sm_firmware *fw = context;
+	int ret;
 
-	return meson_sm_call_read(fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
-				  bytes, 0, 0, 0);
+	ret = meson_sm_call_read(fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
+				 bytes, 0, 0, 0);
+
+	return ret < 0 ? ret : 0;
 }
 
 static int meson_efuse_write(void *context, unsigned int offset,
 			     void *val, size_t bytes)
 {
 	struct meson_sm_firmware *fw = context;
+	int ret;
+
+	ret = meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
+				  bytes, 0, 0, 0);
 
-	return meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
-				   bytes, 0, 0, 0);
+	return ret < 0 ? ret : 0;
 }
 
 static const struct of_device_id meson_efuse_match[] = {
-- 
2.45.2.505.gda0bf45e8d-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
