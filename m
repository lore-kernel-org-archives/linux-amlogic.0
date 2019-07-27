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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD84C76186
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6477208C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KIaGiBTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oQsq/To7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6477208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fiYvBrJKlQGwFXSmCUXEmGkULXTffCuY/inH1AZaXMY=; b=KIaGiBTiMRheF4
	QV2Z0ruB9DryNK00dD8/C42pzEdPRu9uqTT0bh6MpSnJ6SjJxkBcWc1A8l0wcme1MejXYoEEHuM1E
	BUNtjWLYuOnhBCFsPsJxEVVU547knk/mQe70wxNyp5XPP7OEngAOuVAtzZjqYD2snwSCIB3b56nzm
	q1tedCV953RLZ4d1R5znGt+KrASWqIUKI/UFM32F4j5jZvk7Yq5V7vE92pROFXTbZZqBjyj6+YwDa
	mMG4ErWXhcfCWej+nH5O0QjsdoZjmm+B+lh8CFIfKddQxftej9zGDrcbdDVn3Fb9eN0AzGhAsrxpB
	sYQldvFW5uPPhKLuzs4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrSEp-0000OB-25; Sat, 27 Jul 2019 19:20:15 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrSEm-0000Nf-CX; Sat, 27 Jul 2019 19:20:13 +0000
Received: by mail-wm1-x343.google.com with SMTP id 207so50558616wma.1;
 Sat, 27 Jul 2019 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h4n2rUT6ZGdvoy/BsktvZgyBHxTE8rabTOOnA69x0k8=;
 b=oQsq/To7J5ogzOa0TSjkybKTMPS3rtaiNVWREDB3u4pj4MaZ7uneyrh5zmved/Gntk
 gLlWhpYQ8qveg6e+khO+Q8L0L8buTannUuOs0zyD/dNw8891kufDYrJMD1SH4Ca/6EkO
 9bkTW8xa2yrodLmVWGiJMQH6V7EBjWTzPu0SoeSnFXzH9+C2VbfXumyVgSgEzXBTU+ME
 FfqTxYedHGWQRdA+aPa8Xfh6cdzseXvGgksOCz9d2mBKvb6d43wjCW5MfqQT4LjfsblU
 RhY8+CLcDC6+/mhIU0KI+m0SXawZdENqWoy/ofH/7/4QdWLmUOhI1/9gdoIg06vsJw6Y
 Jxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h4n2rUT6ZGdvoy/BsktvZgyBHxTE8rabTOOnA69x0k8=;
 b=rKfkY+QEIrQdMMLyRYhR5bSpl0cDqBcKz6KWexYQ8Pkm8JlA7YneeVFInudruzhZL9
 zwMhI02QasHU+ngGEi8ii7IhKBNJN7GeTVwrf9e+M+uQuLvpdxsmJCLXXaFBp27/ftSb
 /IZv5Z7/fLdDRbTuK5jfGFdA4osZ48gqFEl4UHXe05zWSQenv6n2Ps3jf0lL338Kc0l5
 yzbMLU3dSV4fANeu+aDgPSFXGBpZKsEOqzleGhgUC9vJLoAmvb0JbuM9WkBWt4YNPE8n
 mMg+LhS+lXVKLB0hGW82TOS9/c8AdQDjD5m+OW7a9ldiGepdUTfRA88xfHpVdBxbfe9C
 peJw==
X-Gm-Message-State: APjAAAWqWwEDQFH/NWMUcBxgPc+YpI37b94ZHXdVnIO/xo06g2VzmpeG
 jXV/1GbkLVEifYba5835R+0ntlY3
X-Google-Smtp-Source: APXvYqzg0efJoczgVWfrxUdgaiXSFNAa16hmUCsmIbTjaatCammoQ2y4fvocHoaMMKYHdCOH+tfyjA==
X-Received: by 2002:a7b:cf0b:: with SMTP id l11mr95920292wmg.143.1564255209778; 
 Sat, 27 Jul 2019 12:20:09 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id e7sm51506988wmd.0.2019.07.27.12.20.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 12:20:09 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH] nvmem: meson-mx-efuse: allow reading data smaller than
 word_size
Date: Sat, 27 Jul 2019 21:19:58 +0200
Message-Id: <20190727191958.27240-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_122012_452457_BF9BCA7C 
X-CRM114-Status: GOOD (  10.54  )
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
 drivers/nvmem/meson-mx-efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 2976aef87c82..d5ccde1abd8e 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -155,7 +155,7 @@ static int meson_mx_efuse_read(void *context, unsigned int offset,
 		if (err)
 			break;
 
-		memcpy(buf + i, &tmp, efuse->config.word_size);
+		memcpy(buf + i, &tmp, min(bytes - i, efuse->config.word_size));
 	}
 
 	meson_mx_efuse_mask_bits(efuse, MESON_MX_EFUSE_CNTL1,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
