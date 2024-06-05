Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85291C41513
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LQr0PqZ78YNMW6VLX/XPQjra8xCrcF5lULf4nK1BBpg=; b=TsnFO8GdMPMsDiwPFgLUrByZob
	Up3fqs3AzzMeaaSWdKB0u0PVqLBIM1AnXVZQ5zY+FXcW1olPMVQInu5pHNDtrWknoZzzey4jXkyAW
	0QoQG3CNMQjxH4J9EDETPINKyp06YLWSZk6VbsIcIpUQeVbevTIre2X9A2zh6KXx0R2gjJokPOlNG
	7mva+IVyvKzP4UOHjvuJ64NDnDs1nexOtoYpRaBW9u45e5z9SzDHL2l2Wf095zdFnDqsUjEW9aKg8
	O6/MZK0L9oPnWfIk4nyYaLBTEtSkGZ2/Fhrkv3hUnbXamBuVsRIq2xGKd91uR/A16ybdDoLCX2gBr
	YNe4w/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvx-000000073Kp-0omA;
	Wed, 05 Jun 2024 18:00:25 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvl-000000073Aq-3bFK
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:16 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62a080977a5so580997b3.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610409; x=1718215209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOg+UnJ80V7MsfirTppZcqaQfW4UzyZaf6xSdj4zJek=;
        b=CYN4WXdksiWsFe0Xt0EmOQkJ6hKZPJW6wU913/6LgpvSNOi4CtnN9lftC7feBoHj4/
         +bE/FzAZ86EcJS808FiqDR/Y8Q2lJvLir/smaeVC8eMBNie3h5CKLfqL/8wwAslGG2Kn
         gj4rOz3wUQZHRL4IprtZKIeYE4wlb+qDPoZ8PC0aV7aOdrYy5uPqL5WANrqNYR+GdQ6l
         5xjVeDd3vJmpfuMKRKVTyiKrbNp429qknLzVsufQAygTGt2mSa15q0YOzJLExecF1GP5
         mjRzQaoKuNJkvE92ERm8zVLzO/qMbc08nTk9vPjWa9djEj1sOcbQi5ug1zmH9WfL20Fq
         5/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610409; x=1718215209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOg+UnJ80V7MsfirTppZcqaQfW4UzyZaf6xSdj4zJek=;
        b=heIZPdZVdE69e1d7n7JcZMpP/vKQJuzoN9mv4iUf04hzewBp72In+oZcOCIXAU3hF1
         X043WJM20C2Tk2P0EJML5zXd9B1/WSehV1hTiXfnwEUr0rHkKx6BkHwtIQaqJqkiQeRU
         Jkhrp6OTACvfgiia9DxWowyDsJsY54lEDtPnX6bsibhOre9Ib1k0IPcLd8WeeIH5+TEs
         bd52IyODmimuC2pl54/ItL0nYFRjAjR79dM7VJI91T8BkhpTIejUVgK0hQlj7B5ClanU
         L+ys7ajRE5I852ua6SM9/ftIV0I6abGi3ZsMrC7fK81CWSkTWshvJb1Lnkj2guiwTptj
         98eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhVyOhqyV12DqpGu0sdZu9DpAWUSbfGWpAUaY0+DOyKTSMW2psPT+K2JjLINoM0BKDXkngmsUdcI+Kzz50JsTn5Gy7DQJfpw516wIb9bLfEck=
X-Gm-Message-State: AOJu0Yxbe7aoDf+ntqXI4dBLp+LU93KgnHCycLfqyKnnkkoqLOJIwWbt
	zJMaahyP2Ai5iph0GnuFSUcm+x3siUfagrbHSZSjZ1wkSqlYIpfKTZhTwIeoW7vQ6MpJ/7QfuwI
	+VEu6a52Zyw==
X-Google-Smtp-Source: AGHT+IGVqeHwMyqXKI282yIc4vrmNhlrddNc8SUJnwKBYMg45bAMjkiEv9ztSUrQcKvlvHzhm96dBXxGRdgPkg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:b12:b0:dfa:7282:d6d4 with SMTP
 id 3f1490d57ef6-dfacac47b9amr605485276.6.1717610409394; Wed, 05 Jun 2024
 11:00:09 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:46 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-3-joychakr@google.com>
Subject: [PATCH v1 02/17] media: i2c: ov2740: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110013_917573_536514A6 
X-CRM114-Status: GOOD (  10.68  )
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
 drivers/media/i2c/ov2740.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c48dbcde9877..0101ab55a5ef 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1212,8 +1212,8 @@ static void ov2740_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
-			     size_t count)
+static ssize_t ov2740_nvmem_read(void *priv, unsigned int off, void *val,
+				 size_t count)
 {
 	struct nvm_data *nvm = priv;
 	struct device *dev = regmap_get_device(nvm->regmap);
@@ -1241,7 +1241,7 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 	pm_runtime_put(dev);
 exit:
 	v4l2_subdev_unlock_state(sd_state);
-	return ret;
+	return ret < 0 ? ret : count;
 }
 
 static int ov2740_register_nvmem(struct i2c_client *client,
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
