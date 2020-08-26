Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C24AC433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 13:17:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2562080C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 13:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6/UXWf3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A2562080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9h47QNjv3dc02xMXI2/udQqlmx1bZJ3d8gan6C/MfA=; b=M6/UXWf366wM+TWzOafRQXfdVJ
	+o/xpgUyJjcySwg5qZydG3nkGiNRIDpVzjptDqYHR4UhASlD2jqQ9PvrRjIy3g2tmg9Z8DJIMjipW
	YbYUOvBOtXB45mKOVv1MeFUJmN8DFQs6l5rlOggkRKgjIyNQh+3oGRu1nGqmV+qvOkITQLezZquSk
	7P0cGGdgsjjgtzj3Mg/Gjf0/pRT41qqQ+ulpV3zU0g8zxOc06V1L4HkCQKofrVzRm4jXo9DpuFnNU
	+5dSz9oQ58XiWjaKFtSYUObhkG1Kauz7C2GQ6b2Hjh2l6ELD29sepfGOC+PvXpnNM1Te+jWjpcapm
	Ocn1kaOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAvIY-0004qg-Gt; Wed, 26 Aug 2020 13:17:06 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAvIV-0004pB-TP
 for linux-amlogic@lists.infradead.org; Wed, 26 Aug 2020 13:17:04 +0000
Received: by mail-lj1-f196.google.com with SMTP id w25so2279914ljo.12
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Aug 2020 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vU/nQo+UBNG9xvKd9GuEpi2FmWTAJodJN80NdTSBLAk=;
 b=SJV9XrbHU6zx+4B8F0HzpRYl+U1oJt4ep8QpcYEIkKsvHMpQRlhwt1V9cfitOTQpdk
 gIyRwCuSwEDjvGwh7/nUaZzYVKFnIR5C5UGJ9Z3bqrQs6DLFsv5MixkQG1WYdpSUljq4
 fxXGJIhArJ5Dd8Tm0LOecmk42rol0FAR08il2qqtIRYfcmT7TV5x0/Ek0eAlyhy6C4Y1
 EqJfn4UL5gHrAcfQpLm2UySMjv0z3D6zYehu4rx44cU/FOmVJrkdhKpFWpUwh7lCQArD
 GIIC8/STaDUDC+eEB7sTLeO7AzHYrgrI3xPoJzmdgELc5v9eBIEDzY7OdpbVdNTywCtU
 vaZg==
X-Gm-Message-State: AOAM530LGgtBkql2liE91mKci3PBvZKcr98WLoYZ7LQZTfiZjK/vyQST
 i9S2Vm+H/s3F7giqqsoAXv2nAYMa9yI=
X-Google-Smtp-Source: ABdhPJz7tHUoM8nJr9czWl1gcdQGwvnPgBvglHx5FCWqpeWj9hP2LVpyXxO/BRHRRUxT/7MnePBLcQ==
X-Received: by 2002:a05:651c:152:: with SMTP id
 c18mr6508091ljd.15.1598447821446; 
 Wed, 26 Aug 2020 06:17:01 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id u19sm496556ljj.128.2020.08.26.06.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 06:17:00 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH] crypto: amlogic - use kfree_sensitive()
Date: Wed, 26 Aug 2020 16:16:57 +0300
Message-Id: <20200826131657.398090-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_091703_975199_9C05C286 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>, Corentin Labbe <clabbe@baylibre.com>,
 linux-amlogic@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use kfree_sensitive() instead of open-coding it.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index d93210726697..f3dca456d9f8 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -341,8 +341,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
 	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
+		kfree_sensitive(op->key);
 	}
 	crypto_free_skcipher(op->fallback_tfm);
 }
@@ -368,8 +367,7 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		return -EINVAL;
 	}
 	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
+		kfree_sensitive(op->key);
 	}
 	op->keylen = keylen;
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
