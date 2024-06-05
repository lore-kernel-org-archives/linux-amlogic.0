Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E930CC27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T/fX9KpUKP1NkmDYe20jN1HWbVRI0ioSZyZnDattfds=; b=N7PCR6mzkTnLoOCY2p3Psow9rg
	XFgIg3L1C365r53eeCR1JpfOvvPXDOamIVrfEDmokJX/k6ccU0WRLlvS8Ax/QGWJQ2PgOHO3uMXxP
	F0LFZ8InzCjrj+aiFbHMC+wmJfeK6tZJiJZ2tTBG+P1gnQnv1cwdqpDeeksLXrva2T1uUPFcMhoB4
	UJ2BMYq5c+c+p+/HKc2NAAJ05JCxL/kMEMxpCnroXVHJsNy7jnr6WNm3/4TPAqWMDKmJmp4hWxOyq
	bQIMZdStLBUDiC11LRJ/sMPsJ/LWuDIEXxfdxsUifCI9XPgS7Qf83WRUultlTAElBbpxXsYBLF1lL
	eNKGgqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuw4-000000073Rv-3LeX;
	Wed, 05 Jun 2024 18:00:32 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvo-000000073Cq-3O6o
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:18 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-629f8a71413so394357b3.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610414; x=1718215214; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=1UL4KDKPz8BjQ2nQUK1wAI9AVEkK5QoOHEH1zd+mFQDxnQtU+Wo5+9+nBBscBO0tE0
         KRtD8BT6UO2wZU0gnRr5WKqI1Ktq6rhrFrQG17fkzufK4IlUL5zu2diNsQ70sqHY+44s
         ZeQE2oCW+AFnfffOOhkZEJJQ5P8bdQoEGcdhYXkL93xik0IaCY9YGniEuY7Vpxv4xqTM
         1gd8iJW8rylEY7Nw8PDxrsaw2lZXLuGWx4yXo8Kz2YZEeq5VeD4CThxud/5W+Exrt5/O
         IlSsQvNa5Q57iUYtx07OacZiAB2SDkeYv5TvteEJtLR4M0zov49A8NIm9LX5/F1LBg2p
         vbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610414; x=1718215214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=myomolZCM1RqRUJ7kq2Kcj4w6+0YC9aYqagAjavbL6lZ8MrrUQRiDdAnMql+macYwU
         NwTm2O5rtkEto83SmiIaFbwiQTzqZtV1bcseHt7mt1cp9SCRYmZEOzWihjk/QoGe8mUE
         OCJK8FsPX7hMrEiJgW0muKtGL0HGAO2NMh0K42DHGvznjIQBy/gojWismozdnljUhF0K
         ruFQwZieA1u1b33yW8GjwZ9xjxKuFdgoSWe5oCDGAQ10odZ10LmnJa1+0qIVUdulmMnE
         KNJh4oSehA+vyHBdGerLSKf+rQhfvhKPjNSa9mIxR1M/Ly+CMX/K1SeXbveQh5L5wUFP
         GP8w==
X-Forwarded-Encrypted: i=1; AJvYcCWtWjLQP+BmycTTqtAaeCdkKtr38IMerz4fL4mIEx1Vzq9bj6b6gYD0xIK3bafFyUSnfLsDmfBhTLgT4c3yt/UMNAI1FO2KTlvr8UYWPiapm4U=
X-Gm-Message-State: AOJu0Yxk36miC6+YurdPU3H1VhE5b1XZmy1zycFAIl1su5+LNEWl8dNm
	q7AeQiatiihCodw5hoHs3kC1gUIO+yBKKaFB5e1jBbK9rPfzMfVL0DjDHn+jt6NrKZgzFrYP1l8
	k+OPDevTq8Q==
X-Google-Smtp-Source: AGHT+IHixjuOYQ1InGCAjmo87JHH7BxdpNaY95UBwdRBHB8eZTSP6/tJXCeai8kdlzm5GsjEUY/q6O3hk54taA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:6688:b0:622:cd7d:fec4 with SMTP
 id 00721157ae682-62cbb5e6bc6mr8437267b3.9.1717610413829; Wed, 05 Jun 2024
 11:00:13 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:47 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-4-joychakr@google.com>
Subject: [PATCH v1 03/17] media: i2c: video-i2c: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110016_938161_21C79749 
X-CRM114-Status: GOOD (  10.41  )
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

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/media/i2c/video-i2c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..2bfc221b5104 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -151,12 +151,15 @@ struct video_i2c_chip {
 	int (*hwmon_init)(struct video_i2c_data *data);
 };
 
-static int mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct video_i2c_data *data = priv;
+	int ret;
+
+	ret = regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
 
-	return regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config mlx90640_nvram_config = {
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
