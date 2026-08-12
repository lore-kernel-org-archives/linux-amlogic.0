Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D83C5CFDB
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+SivZ7N2Hi19om0CO1wLXBBIPFYuGyUsX3WRIYn95c=; b=tbXiwhbiHDhVfa
	TnNuIqey2lOroi9XNeInwdj6PQeuMoegaRfrr6CMm/Ded8O6eSybRO+ml6tHevfAC3NGkGagFEbgI
	2XnSnE1CRFIyhF7Ykr2EmvHASI6WU1TE50LNSWwT106x9ZWvtjRAfjlSUl7h9SQvh85dwTLpqSzy5
	2aQ/0W2El58URUAAlNu+iDYs473PZYQlBVs4roFoqySRve8/rcG/uvAyiFgR5lm9J0uYwSjX6eN7u
	O/brPB+zq5ZYhIQbr7PHT27bFWBhf8y2w4rNWw+qeTvpGa7YDgTsuTtmH77km/hl2FriwLxTxC9Nt
	HKcEzzAnozoMpsGZ21MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu713-0000000G2KE-3NKb;
	Wed, 12 Aug 2026 11:21:01 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70x-0000000G2G8-3d6c
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 11:20:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso542161a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533655; x=1787138455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbzzHBH8DpqZehMLNcK23Xh4Yld6J3JsAmwo9QAsqAM=;
        b=Aw/IM9xgiR68T9+lF3weWxNGcJ9o24c4wS6nVDyjjnr91sRF+SAnnPp0cM5QQLGX5D
         Bxq3WgY2LTJkqVjVpM6VKTzKXwdNu/pDaYO0FeK3w6bLdQO8U2svakQ1V2605hMvjpn8
         hHzRcQpNbG+ewE0Sq+JAi+XjZYeeoTtzmIYA9yzAoJPAT5+Gva3R4pgJlsyhjT9RRrC0
         OZ/IgdeLEjP1AV6H5okXIc6yLQZvVS5JfFkBgGNF30D+tg8S3yTFeA6uUZdHaIwSFaJy
         7OlmzRcWOA5OCru+B1MbaHww/hR+0m/Y+wP9jf3Gg7TRqbMwSukFIQbM6FGUaelIeDmH
         PUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533655; x=1787138455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbzzHBH8DpqZehMLNcK23Xh4Yld6J3JsAmwo9QAsqAM=;
        b=W5F8aIZflnPlfZzhHn507H9QmCA+5LucbG6bHY9XaL/jZe9rKAMN2wlQxNrLSNcX9B
         wfKxdSVjXEWSmFH9L5C2DcCI7097PUa9FjYYBlQk7EIu/F7x2ri0aVi9zjf7J4Q0fDlw
         hmWgomDEKRs0yIBNoPARelJhYALU9RdOMY8Yo78mhax7eJamxmGaKYHvVD0HRgaGc3L7
         HFFsfrklnYSvUGAM67Bw1rNSzH2XmMFldkZZ36xCM4NnKxj7AAhNb93knSBDP4U2ZXnm
         kpD0qEvwKxXAR9soJHrQ6AbUiIgmGsbMAvFjSEwjlxdzX6baQWlvkcl254w6ZlGR7P6f
         VocA==
X-Forwarded-Encrypted: i=1; AHgh+Rqn9cHtBzRnU3Y+q0roos3lziXhmTq56yO4XKf2LhM4TYIGOPAa4ELgf1gyz17mZmN9wDc/1NA+ixTPze7P@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi6iLGOM2flfaW+Oa9U+wPtkjCuUrJYp8yI8xBon9AZqzX93FM
	Y1bowwYL5B/mr5BM2liNSyfOd/yrbxHpc8gaz+MYkh03Y4hOrQ0XoxKY
X-Gm-Gg: AR+sD12CnoFqz/cxWgUAClB9JMB+sV6c0HuXK2YfNYstBIdIngJoHc+zT0Dhq5l4w/8
	xMnVH3i2Y2zHeZsbq1TScmG7oG3tP5Psk2USK2LTxbTF/ckyDmwh0qCiaYsCvqMmmnzBBIQA6S3
	NW+7ocQh0GTRjcfiNwhAgS+3wjR8R6648+H/ljy/B9gBlgq4/HtDWpBMwEEKBEGRVAlCv/hbNJF
	oeS1xH0lxbp4ZRW8gyIMYbw1D8rBNetb1IBxPtMbneOx+MJNak4HPlkqI22Msy6GNKexwfzVGMU
	IFdB8Y05f5v9L23oupjEGPYqfCEWlSZFaAx11MEzGmBGcBwRnAbcH3obNvYsMYqN7eEkHmVLac2
	UnStoto74nV5MY2xmyzxvNpZdryFBe7FyIQJU0WQDqvgYZ/vg4k/RPnp/ha7tQbGrAr5B0btY5B
	wcL4nVs2RLFlFA7MpAq65nRou8frWS8JnOWlhFRslOKmvkzCK8p0Vic5pNBWfObdOim3n/ykT4g
	j+OHc9GDYH03RLugnDm8fi2nX1ycPRxEemKM8VoGjzhdkwWrlvRTUZn2fw6wNuM9T8lW50FfWhV
	PBwK
X-Received: by 2002:a17:90b:1dca:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3930123d0c3mr4872172a91.1.1786533654838;
        Wed, 12 Aug 2026 04:20:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:20:54 -0700 (PDT)
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
Subject: [PATCH 2/3] mmc: davinci: Handle errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 18:20:22 +0700
Message-ID: <20260812112023.42254-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812112023.42254-1-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042055_946555_99714DB6 
X-CRM114-Status: GOOD (  13.92  )
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

Propagate negative errors other than -ENXIO, and only assign the IRQ to
host->sdio_irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/mmc/host/davinci_mmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index cdb9fa94b56d..4765d2dee599 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1248,7 +1248,11 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 
 	host->use_dma = use_dma;
 	host->mmc_irq = irq;
-	host->sdio_irq = platform_get_irq_optional(pdev, 1);
+	ret = platform_get_irq_optional(pdev, 1);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		host->sdio_irq = ret;
 
 	if (host->use_dma) {
 		ret = davinci_acquire_dma_channels(host);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
