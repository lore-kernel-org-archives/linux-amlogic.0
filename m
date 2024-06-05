Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CF8C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V4gAY8lZGx4xBOyZp2L/t9peuwmu/48/6uii4zFdu8A=; b=msnK8HeliroSC2jwXUdiFXEGtw
	McyHeuGx60mLh9zNQXmnm+Y/+S/s9WE1ek+a2hrNIG+tXawfKbTNw1kPMuNgaTFo99T+tfWHJe0sy
	NeCI1YpdwRHISq+mI4q2g2aVE0jyk9q3BFonDVEf25cQyYn90U8DxIyuBgxaB3rN1N6zXky09u4eX
	BrMWjzIHKItr3nUWdwMNmq1/TtbyOKyXUjkz1DFkLGgFAaW623MKWG8fMBH4Q9jn5ocnCg4tQEfwg
	NbXUoUuGC9clc1sK3kGwu6sMTddN/DAqXhzNT2mSYteuJGgBFSc1CshoxiOXQE8HfYed8AxoCkFnv
	b7fQg66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvv-000000073Jr-2aZA;
	Wed, 05 Jun 2024 18:00:23 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuvj-0000000738x-0dq0
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:16 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-df7721f2e70so1661156276.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610405; x=1718215205; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=Tfm7Fl/SzBvtHEu+ztBK+Ax8vvfRfVmwL6loBRTjvq+xNmyJsjTbsNEXf9cOflOQwY
         mzYv5GEvqlfcvO0x2t/iPgWlCdGxAElzOzI3OYgeGuPkN1LLzR+3+QnrwNMwVYHV+r7l
         DE1E+M5xXsjO70PKtlf1jUvg+aU/aaiL0qAUqobOPRdUQTxpBrus3daZNk2ULDrjin9m
         nWCbi1zhdvPv+U2fI/1i9kObsbZMN3zqb3QlzR8UVAHI/6Sen3I8E61ZbM8ut/OtTqB/
         so55y4GI857AsqZHMTogbf1p4vfTPJPMcK+GJYXtX1gH3v5WDcm1bT3O84ppqlwMKiZy
         IesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610405; x=1718215205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=hTWLc7iLHay/J58a5FwtTHoEHV9gxExYFRYe/Yd47JY9Denydw2xiyHEzTPuadF8K3
         J13M7/+F+xsiCGtwi6qlBJcRhUy9kumrlg5xRWyHGBI/cMYjgeyoyPI42/lvuWOqc8hd
         rXEDvRHYqj0uZKjnXRTSg7R3vPmmVgtSYQ3C29ayinJZD1ndDYZt1LnUjA5wbSJ9uTAF
         9PxpQ2ul0IyocXbLst8ygLP5cCBRjXID0mHBXTwdiTttVHlRUgMgBZjjuxDNeFKTpNCn
         0EhpiATWTgClmDkt98IwVOcLrFxiwkbFlenR3dClqvI2dWAjRikPrVirg+sj3voZtNi6
         pktg==
X-Forwarded-Encrypted: i=1; AJvYcCVc3hY5lZH9+Ny6f7Qg2DMXF3L8EecR8QkXK3BYrwE6+eIOUPe9uCffPOW2HnibUIZZ1zTFmHoeZkPvstVSLQ7UquaqEd9m3m0aN6GG7p78atE=
X-Gm-Message-State: AOJu0YzkeJxqfgLY8MgwAH0lWVVYtmPspV0nlNIRS5TXmwCT3VQxKa1p
	O2OeCN62jLkfH58VyRnpLBVmZ+B/2/ngLgcIcjtwpN00CAaIzjlMV40XFx2gsWHFoiSwwNqSKMR
	sOziRY+nn5g==
X-Google-Smtp-Source: AGHT+IEFfd1XOUpmBlCQ8OC96XaGHvsQJFoGDWo7KSg31aa/FmwG5qSwwUZMqSajPkXkOc1t6VuaS9UByNrZ0g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:dfd5:0:b0:df4:eb0b:8fd with SMTP id
 3f1490d57ef6-dfade9e0f4dmr76066276.2.1717610404805; Wed, 05 Jun 2024 11:00:04
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:45 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-2-joychakr@google.com>
Subject: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110011_230600_3FD5F759 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/hwmon/pmbus/adm1266.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2c4d94cc8729..7eaab5a7b04c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	return 0;
 }
 
-static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct adm1266_data *data = priv;
 	int ret;
@@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 
 	memcpy(val, data->dev_mem + offset, bytes);
 
-	return 0;
+	return bytes;
 }
 
 static int adm1266_config_nvmem(struct adm1266_data *data)
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
