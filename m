Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85974C76186
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E631208C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P7e9ZnwJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QHT+vr7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E631208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sBlKxbxF3VFoLNdv/Omsu0gvPhtJq26+/rV/fzwX/Bw=; b=P7e9ZnwJ3tNIDN
	0C3GbNIN4pdmZqWDs8cHxk4yH3pELNVDJrCTBW4bsRP5iN4Q6fldn0M57hx7NVfxldUyE60B9984E
	Mi7fY6W6/iYdK6lghj9tr8xKRfQIBznxrd4ZCf1gyvdL8gjvTclg7mwmM/HYGW2fnI4Qqc79huNYZ
	6y2u9yvICycbhdkotQEzh2OlLdXNi0YLqa7NVHuj3nfF4IikjfEzH+fNQ3OsSRjUA+pIRQ+Ld5KdA
	tgoAasJ0vasQ8ExsEfUGaWn+kkqdkDGtNUQkBJCzODKYBt4DObaL+o5xZ1tzPn2RdMrZ1J+wJ+t2F
	4cv8PeaL8VMu0BxgBGvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrSSj-0004KV-5R; Sat, 27 Jul 2019 19:34:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrSSh-0004Jo-23; Sat, 27 Jul 2019 19:34:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id n4so57766148wrs.3;
 Sat, 27 Jul 2019 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwPC0uC2vhnnQFt6dtjfct0lT1hDdrq7y6oBUVdLJKw=;
 b=QHT+vr7UctQsq5De/q5TWMQcuzSpL9ljxuV/hNLT+ItJwKXkM5g0LOvOUd02ezmEgN
 I9oEh9513WE73nzCZyW2keHtEuqZpwwDcSya5rATKTtZS58nE2Qe7BZLO6CzOpQGeoMO
 t63VYywAg5wGh+gDQPQixN/ocPo44KmMqJ7gyBLUeZIkhBUXCOAcfweN9A9U2uyNKkjt
 j2MGWuCFgqB2fu9j+oN2xm0rTzmMou7027hLuHn/CDTIiL777gOwV9l2CxAm78GnV6L4
 sW4AlzaBnvgMuiJoSEAkZxefKDwMqv1nMl1oJ8HGWMjelXlyk0MGOZOr2umlEIcQUbY5
 adrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwPC0uC2vhnnQFt6dtjfct0lT1hDdrq7y6oBUVdLJKw=;
 b=hBAM9tXw3hE6OoIo6WBdmmVOZ5lfDlKuynz9ckPjcTvZnCHHyLC41KVswoswEAu8yC
 4VshPz64uv/CIEOlAycOeVtoiYWNfkzBRw7U8N2tv1DJxIXWql+MC7/2qbMtD2Daw/6Y
 7H3JQ7YPGNWaJWSKMT6FEQr/2IXt2104QrlO0ojAYIPP7bLKypfHP2aQJgdSJwsRpEjl
 ZaLEqYEQYg9Y0+eX3daygwYbw9rtAFGU0Q8eLJKUnbxNAK1+PXkpwEiARyKQhpr9png9
 QnVZ/jYoqc4BOsx5ljDRk/croT1RnXnO3xCiVUuGNQ1LFbQztqxhxPkhUn4IBvRbB0/D
 0khg==
X-Gm-Message-State: APjAAAXeN7nx1K/g+NDTtSp8e4aYKLeb6r6jfLPtc76eEjjsj8qKdPOA
 5Wog6S+91dGRIXXwvVRMWrzqTYEq
X-Google-Smtp-Source: APXvYqwtcykN6reCHIDCRtC2TmW13zB5ZF0C7B4/4u2+Ho0Ih/KuuXH6Lj6HdkYgFIebULYKFdTG9Q==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr52098236wru.156.1564256073191; 
 Sat, 27 Jul 2019 12:34:33 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id n3sm50301258wrt.31.2019.07.27.12.34.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 12:34:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH v2] nvmem: meson-mx-efuse: allow reading data smaller than
 word_size
Date: Sat, 27 Jul 2019 21:34:14 +0200
Message-Id: <20190727193414.11371-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_123435_095810_5928A4D9 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Some Amlogic boards store the Ethernet MAC address inside the eFuse. The
Ethernet MAC address uses 6 bytes. The existing logic in
meson_mx_efuse_read() would write beyond the end of the data buffer when
trying to read data with a size that is not aligned to word_size (4
bytes on Meson8, Meson8b and Meson8m2).

Calculate the remaining data to copy inside meson_mx_efuse_read() so
reading 6 bytes doesn't write beyond the end of the data buffer.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- switch from min() to min_t() to get rid of a compiler warning


 drivers/nvmem/meson-mx-efuse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 2976aef87c82..e8fc0baa09e7 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -155,7 +155,8 @@ static int meson_mx_efuse_read(void *context, unsigned int offset,
 		if (err)
 			break;
 
-		memcpy(buf + i, &tmp, efuse->config.word_size);
+		memcpy(buf + i, &tmp,
+		       min_t(size_t, bytes - i, efuse->config.word_size));
 	}
 
 	meson_mx_efuse_mask_bits(efuse, MESON_MX_EFUSE_CNTL1,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
