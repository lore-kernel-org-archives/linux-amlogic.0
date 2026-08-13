Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFD9C5CFCF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsfMLMUqfBZn0Pc4VsNF0rCWb2eOrR6vRcu4/mb3f3o=; b=oFAUX2P8j3G9ku
	tArm2XYoAhPvsDUUR1VWy+LTwkmKCLRd8DA670IZ9/Lo19Zf/eSCelePK5xBk9Bb+LC5j35wfuwe+
	mI555XAhCROTnhnzfcxijXF2K15efrAbLtUvUK3Q4loxkwvi7OMaspRmIAGONixTRGNVTgPPC74ZS
	dm0S2Q99NUr5unPsbjdTZZ5wIhXwBXfdz2CPsgBZXULVPxWU7uUfHjBIXfNJuc+jK7D6h7nsQpm0i
	pgR0rYL3mgFO7E+m+rS+iL1k0U2sa5dAjQltC2I+8lbqBVbqgDBGIjZeqU2M6FO80jW8eDAiB9NCl
	aI7Y6KryT/VUSMgwOnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5I-0000000HQSy-3shC;
	Thu, 13 Aug 2026 05:34:32 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5F-0000000HQQU-3EUc
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38101f85591so623678a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599269; x=1787204069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xzFkArDiYUJVrphFijlWZtDKj/k87XskzGvkdFKreQ=;
        b=LyWVZKZ+5Fl1UOKkfn8zHGuClvuH7S1M33vhSLA/gp4XQDmLgqZM/Ux6tWuBr8YlCY
         a9DQ5pISF59dljBmgbT+lgSFs3EHMPJ7pJoqCSAOnDHp+sqthzdYXDpnRCpf18KOA0XF
         LGYUHVX/esZksnAlqv0R3UNsDC+wkvBlstCchzopj4hFTepiyRX44aMou5uF2+xgT82T
         jYpzXwe4xaopLJbvGH8Ue9N/QGU9uJYwvQi7WwjHkqFysoAvRLGB/f7rhqvfNKjxq0Ee
         5dSqxvKQFxvaHc5d57kKMcD8rYolVluu9Mbd45RNa+XIzUH8WgjsATDTyPivwBTKR+Ce
         EZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599269; x=1787204069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xzFkArDiYUJVrphFijlWZtDKj/k87XskzGvkdFKreQ=;
        b=tOKHnwte3doyfOHTIQcTpsaOCxyZyuhkqT+oiSO5h/rVJ0OIm4HrQ7MzLYMToLOWdk
         RAbnNB0XysZh8YjYAO9CcdN78+W9emFoSVInEl5B1bJREqWK0J9jiK8vT80GtbUMLS4n
         HEu6aqKxFqOXiHEfiet7u9E3wd9hmuiic2IRDByzntgtt5qFYRDtfCi3a2L+nJpr0XA6
         YPG3W1vlhzq24ARHH5wa33Si1yWl2g80l13pEuDqrHUZIIE4gMZftOGShgGFa+p9HEJr
         HsdyymN5F7R0H4LjpZxUlOaIozMUzJzpUF0sBtLLFhXVfD/VD1rGioxIeHpIXKexDY6V
         hgBA==
X-Forwarded-Encrypted: i=1; AHgh+RqtbrOjN63IrzpEgzoD3yo63BYL5ilkBy6tpwLL/NS1mtfMIaRSz6b3I1V30rEISibT4gMd6/GirUUC2l5R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+eTAsoSA15pHA3fEn1+Pbj6VM2xKgTPeqltWsUBK9qdhBTrgT
	w+6PfleDjnofFQx1jOcs4YtvDlpZvYcnHlgS/+qgA7m3SktdH+orU/X0
X-Gm-Gg: AR+sD10g5gE+njijCBl7LCZ9Z69DAmQ/UNl4r7oUGumqhBtnCUGutKtiQk5Q6G3mHEq
	Lm3dyQo7NuXHs0/Fc2eKauRyhcYF0cX2pxQriMnorGPT58qP1ycob2nYNbA2SaskLpY/5aAYjii
	HEt2j9eFN/XgH0tkCrtvkr0rteOzaaD1b3L2GNp13YH+NTUrFgzCE3MSNpuI8rqPvdLoV149N2f
	4M2foz1T2cu7S+U2JMK8JP6XZiA2Amh+7IXp+s5q4q5WoeBnj3kpLbV3v83ShjXPXR5ActLCyNK
	Rjwl6g5oJSEEF+CqTB5UzebhtbGIuYoU7MbpD/72zewx0/350mnGa03ht5f56yjSl39KhSZZ5Dv
	GDSwLp3bl9IOys8Z4Q096JkjEh8J+8m4Efo61UOBKJNu9kmEgTlw4CsxookzwY4JROiHhPcwJI4
	0wPyjMKLNjgH4N7HEfoKFTMHQt8VSrYxGqv0juzUdyGjwYOzOArJ8XfVUrueQ8llWMx8tNj9FlG
	mHPNiRmBMRirpOezGcVqdnxu5s4BbTUnHLAZLhKLvPRdydzvDwPFULYF4PoJSQZhQnonUjOm53A
	0OJ3eRf91zSUmkdc6T9sjuZhF58=
X-Received: by 2002:a17:90b:4990:b0:38e:b3fd:d584 with SMTP id 98e67ed59e1d1-3931f94365cmr1262125a91.15.1786599268892;
        Wed, 12 Aug 2026 22:34:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] mmc: davinci: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 12:34:03 +0700
Message-ID: <20260813053404.21553-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223429_821816_981D81AE 
X-CRM114-Status: GOOD (  12.73  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
host->sdio_irq and continues probing.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Use parse_fail for proper cleanup on IRQ lookup errors.
 - Keep the value returned by platform_get_irq_optional() 
   in host->sdio_irq, since it is already checked 
   before calling devm_request_irq().

 drivers/mmc/host/davinci_mmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index cdb9fa94b56d..773577a10512 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1249,6 +1249,10 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 	host->use_dma = use_dma;
 	host->mmc_irq = irq;
 	host->sdio_irq = platform_get_irq_optional(pdev, 1);
+	if (host->sdio_irq < 0 && host->sdio_irq != -ENXIO) {
+		ret = host->sdio_irq;
+		goto parse_fail;
+	}
 
 	if (host->use_dma) {
 		ret = davinci_acquire_dma_channels(host);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
