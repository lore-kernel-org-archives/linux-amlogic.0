Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DDCC27C55
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SYpcafqGZwfU0cHdSAI8CLWGYMiERd+PBAPeHef+S/Q=; b=B1q
	HDyr/Qa1/ydaSMNkaFD5nAMphCTi6/rWdFBYwSTae/r+l598XgX9ypSgclCj98NvHlzAYAr9wzYuv
	jJX/38lPN4vak4P3PVQNnVaUDtfub8KhuCULK8xYX+xahry/dkrYB/aYKPwXKPpiiS317yn9vS/Pd
	AHk9ZVgMmpjj56rzw7FdukrEHZlA/iM1dTttJ1+/Nva6ttvd6XazmposvHxdLt/8r9avECSyOsYxc
	mFLvA6N0nXl+gQ0zM087tFpmofZRFknN6ZqZtoLlZnARAXpaV9RC8J3eMbsl1dQxS+uh3etLnsk2g
	Y0v+rNiHb+kze/3Oi4GV/CmzN6PN0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyJ-000000074W4-39ez;
	Wed, 05 Jun 2024 18:02:51 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyG-000000074TK-0XXw
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:02:49 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627e7f0ca54so338707b3.3
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610564; x=1718215364; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5YxZkBMx7xM0lBc97o2/iv7RwAsHr+ZFIuj4hushzk=;
        b=2DWnL00H9LXKeklLar1PcxZ2u0vpYz3P4MbVLjma0TJEIMD9qWQNK5eGDqWFPM2P4k
         6fv2LI0pK1EPH/m1+q8ic6riVdoXIHi7LENLW8g8NKz3vyskowYfUATtQe3VclNjz0np
         tiIV6o3qlYC1MJz0jfXyXuVTjhiF+QRQzC4TDo0CTDY8O7b7JjGVyDXcAaVlDpYALyT1
         /baZZpqk4dlkXWJ6NveUFMn/zDFer7re2jJXZl9eRh7RoOcty7H+T7HTVKiiiIWJfEot
         mSbS8p7wAKeH2CjPmhjJI4RF+S/9VLQpFolJRRsyUqTztEhBPe0JHpoC0+XAVIIhcz5N
         io0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610564; x=1718215364;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5YxZkBMx7xM0lBc97o2/iv7RwAsHr+ZFIuj4hushzk=;
        b=VqLyzvZoazIuzPEadzk4dWlVsFpFMqnTyLPYsVLX1w5L6lg5jQ7tk2BZk8Zsvw4Uvw
         mGCllWPmfA0rsVcTlgQfEPvnDCy7aQva0ci97ekteJeLDBeYIuDx7qYJWO/BrdibxlwP
         5UHc30YEukFBUP8JirTcq3e3c7CTQnKJwW45YGI9RWDyEQB5tojkOu0cb3go52hdWeYg
         mK+8Z6nghaJA4R1wK2PCSruXJEsrAj7e2/W9mQalHXHY4ED6f61iUmEkO5qqT+qFP6g9
         qLoZIKIhI94uAMubfG6QmV9ro7uGEE5MssvPTKukLVyY7u0meh2gMpAdjx/2PmUR7cSy
         UaXg==
X-Forwarded-Encrypted: i=1; AJvYcCXScUmLm9DxCMmHuZRuYItXBMd5Ib5xLnN5carRkDcA6dMWQbimfha/q6cB2vzDoBvUhM24W2zlyrcbCe4SSKdE54aO+qBXuQ1AnJebw6cXXkk=
X-Gm-Message-State: AOJu0YyZoaIZ9lUag6wXBAdAzk9n5IIWsn8ag6fE2n5AKkEwiOY1nz7i
	Vqd9d3XS+NH3U/6Yfs3P3PhRs1VtOehomCzCbiwhYS8vshCg7I35DqsRVO0c9O3hjJTjUY3tBq2
	HxLFn/UyLEw==
X-Google-Smtp-Source: AGHT+IGCU+GmK3Rf3XT5eiVn8GBJTqffr6kRhdYR5C7W1ubGEWJe6ysf+n1fV0SHLE+oXrcbvgWtj6KwbrbfFQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:884:b0:61d:3304:c25e with SMTP
 id 00721157ae682-62cbb5b3bc3mr8573737b3.7.1717610564108; Wed, 05 Jun 2024
 11:02:44 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-1-joychakr@google.com>
Subject: [PATCH v1 10/17] mtd: core: Change nvmem reg_read/write return type
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
	Joy Chakraborty <joychakr@google.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_110248_179565_97BC1D0B 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406050200.8BOdZUla-lkp@intel.com/
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/mtd/mtdcore.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..b13752ec2f1c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -530,8 +530,8 @@ int mtd_pairing_groups(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(mtd_pairing_groups);
 
-static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
-			      void *val, size_t bytes)
+static ssize_t mtd_nvmem_reg_read(void *priv, unsigned int offset,
+				  void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -541,7 +541,7 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 	if (err && err != -EUCLEAN)
 		return err;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
 static int mtd_nvmem_add(struct mtd_info *mtd)
@@ -919,8 +919,8 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	return nvmem;
 }
 
-static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
-				       void *val, size_t bytes)
+static ssize_t mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
+					   void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -930,11 +930,11 @@ static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
-static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
-				       void *val, size_t bytes)
+static ssize_t mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
+					   void *val, size_t bytes)
 {
 	struct mtd_info *mtd = priv;
 	size_t retlen;
@@ -944,7 +944,7 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	return retlen == bytes ? 0 : -EIO;
+	return retlen;
 }
 
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
