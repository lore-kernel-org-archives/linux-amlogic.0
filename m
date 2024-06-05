Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A7C27C65
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jEfVRiprO8+hTukNi73+oEZjlsoYz1S12DxOn21kBeg=; b=OMnyd+RyQpJXYmx3a7+qvtLUUI
	L5ppyyRq1h7ONTIRdvVJ4iHv/bU96Udxl4UUgsT0l2qyl1B0/ph6cC7QNPVMx5fOw0XtyXAXM7bFs
	auPTJ42Re9+ZL3cSSeE2sUGD58a2vII2Fc2FcIpR6rbtZNHNC+EZ6dtGPcznrEN86HiKGf9avF47Y
	Ie4peJrYn2mFD6+LGv1WhXbT/RR5bem676XEHwlo0T3/4FiPz0RSvzEH8tCothnJidIcOGnYlezOf
	CvYSX51/M6OeyItNthpqY3I5DZgXX5CxrtzhhEILgc2DMEVXJcbohItftYvaJrsFejpLeLrIwHVu/
	yD/sUYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvta-00000007FbW-1A0y;
	Wed, 05 Jun 2024 19:02:02 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuw7-000000073QJ-007p
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:41 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62a089511f9so15305497b3.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610430; x=1718215230; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=ckwPFo3b9FzZ80AXhPlbZl9Sp8r43TS+dCRvhO72dZkNabZYg/mR+slPHeMij7v64P
         gm7DBIUCb0VUA07LPR0c7q5xiOTg99kHOtsolNDGvqaNtSUeoYeLmOm0mHZKlwyAYKK0
         YpL0Kb/tYlzvP9+tknUPPJoLieCXOxQ5T8GqhhGSSpFUxV9/NLQstOqTs/UbUhH+fo0B
         vzfwPS5udHr1YQLaojwb96qidYiTc7EBR5Ly1GyBb3UgEhkbwXYuhvwKEt8NrzDujxeb
         bKDXcC3SV98mPeXU3HRwcwo8Tjwuvsp7/CSwJGm2Bawq2OolT7NVN9O4Xwyo5Lv0x8un
         v/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610430; x=1718215230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=bkzrlqsGJBezopQsOKkWA5Mi1cST4fmoQBCy1C45K/I8KV3YoELApdGXpb/rW77i9m
         AUPS9db2fZulsRlsOY2u7B54yYLgv6LmJfbWdsObVOB05uESJS8M/81PSdyGH3xUV5Cp
         dINB7z2NB+xwYpE9j4dEjlYgUqDnZBEyzmJ7BQRb3JFzbkYSbcirXnmGGYwrYb20jslx
         HI33KUqLbci1tquObDTKzCHo8tLbeeokJ+FQOVraj3s7/0ki3kExZ19eR3mb+pRB/uEm
         YNvu/J1hGHWqpcgf0z+SKiOHG0ZCqFYLdWR98hzCI1YOXkFXpqo+NLe9FlvOo7v3/bOM
         pZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUubDRUSlttmT8mwKX1PGO0C9+rVhOzh1T+o/5xQYxaspxVO6FcVxdoc35hvj1MantClwiW6PCJKD9ZsnTSfrE/YkO3PrrFRTlxoi3cYASWHH4=
X-Gm-Message-State: AOJu0YxTX1kFaGSnCwIXgdb9x6E4Zoey8FbsaOHFBSAVAVo9dY4qBNoK
	/U7VMeURKEQnv3diVYJOVBRUxtIpINu9QPEu3Sr3mtnaCY86nq9fEZzn3XTx+poFk0i6hoXW8hJ
	XY1qTlRY0Gg==
X-Google-Smtp-Source: AGHT+IEja+GLVOpS7V2U0r8IR9Z9ZB6nAf9rPU6225JSB7wTRYk1qUU4QFIkeBtYF/8VHx1IHDowrDp0WPzcZg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d952:0:b0:627:de82:8077 with SMTP id
 00721157ae682-62cc709af05mr798057b3.2.1717610430440; Wed, 05 Jun 2024
 11:00:30 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:51 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-8-joychakr@google.com>
Subject: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110035_711769_8AE8C12D 
X-CRM114-Status: GOOD (  12.09  )
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
 drivers/misc/eeprom/at25.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a7126..73d60f80aea8 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -74,8 +74,8 @@ struct at25_data {
 
 #define	io_limit	PAGE_SIZE	/* bytes */
 
-static int at25_ee_read(void *priv, unsigned int offset,
-			void *val, size_t count)
+static ssize_t at25_ee_read(void *priv, unsigned int offset,
+			    void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	char *buf = val;
@@ -147,7 +147,7 @@ static int at25_ee_read(void *priv, unsigned int offset,
 
 	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
 		count, offset);
-	return 0;
+	return count;
 }
 
 /* Read extra registers as ID or serial number */
@@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
 };
 ATTRIBUTE_GROUPS(sernum);
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	size_t maxsz = spi_max_transfer_size(at25->spi);
+	size_t bytes_written = count;
 	const char *buf = val;
 	int			status = 0;
 	unsigned		buf_size;
@@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	mutex_unlock(&at25->lock);
 
 	kfree(bounce);
-	return status;
+	return status < 0 ? status : bytes_written;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
