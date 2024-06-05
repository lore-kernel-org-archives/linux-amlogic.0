Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1DCC27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WwDOql6KQUEA8jQ30FEY116l/cqZiO7H4QAatqvr1Io=; b=l6EyK/KIWNiGZiS/pXbhP4doNf
	tS5mOF+iJUAy64qU0kqwAAiEbyTA4jGowokC6Z+mfZ4u7mSyGWB4BOEh7laXW88y098jFfdE4T+Ne
	y/r3+bO2rmlQXh4nFhkWayMQJN288CxC/LOl5s6rlWCB6X8YqDP1N/1oKyktvtCVI48AO7MubQF/R
	nFt0NCxaMdoi6xzzJnw0fTvdOj82PKPHcUK4ZT/ypFIPVKjFF8fzdyXVm9jNq6bW9Yu+v1TdwcYjc
	zHljKnD620MwqUqkfX2EsSqSzU2fIakGuuXCRTmM/e4EyJRA2yJrlQyWxQByJ+H6+2JYWbXegWRoN
	G0enJufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvtb-00000007FcV-1RJg;
	Wed, 05 Jun 2024 19:02:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuwF-000000073c6-3UQx
	for linux-amlogic@bombadil.infradead.org;
	Wed, 05 Jun 2024 18:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=; b=gJWGtAgen7nuG1iP8lKRXIy9Ex
	bmB8hspCbBRaHFKLWIRxNh67SoAErtIOyJZgBr8qfMo8XXTZJ4V++qWJQXiFCM9wVxsSMm/HejB2S
	NAKk99WorvgvWtKCJe9n7amGcGQWSnY6ZmiCBHx2yIh1Wbe0vKkf/cd16quPAnL/xomJ00dSKM3V7
	F2wfTjn9yM1GBwGikrCSiT5wyFfP9BqKREizfXtgk/T1Jw3lrVh5HuaTtBr8QrpZSfu9Ve8SNXxuy
	524n30EaPwTIc9BQMVi6tJtDS73fh7i6w2Pp+23vY8LQSKo4MB59W95jr2O0k4BIRnjibkngZfmus
	JIgqq8dQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuwC-0000000Foy6-0nDG
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:42 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627e9a500faso392837b3.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610434; x=1718215234; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=G2z68Q42h8BopQasNC59Hs1iU6alvuTCNS3++OdmKiQ5yn8O3op6CCl2OMR44KEs3h
         tqXBYH3WeAjYKGLPhr0uuEuEsCOaRxv5R74eUo3eF4kZTZlggp+gsYsL2FJf2atqLRI8
         wSpwd9nDpECCC9+s+cbRMCa4afFaxTd0Cn00gsyketdA5vKiH8P8Efxo/+LBtpnrRTX7
         cco5CJRd9j2SDjg5tse/3onRoO5soomEeS0lXJ0RErL9Xl5ioyFWURmOHEqBK3mUFtkX
         9V7k+lpdhW2OYZ8HOrxuy+Tyc4jAgwhZsxlwR58fJCbUcR3H2WHOxA/LilsKzzmW2SL4
         JIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610434; x=1718215234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=iEBX6/uFSGOxlA19Ap6Tt7H8Fha+3WEB4rqzvJ1IXJLJZFqv+ph2qbnWuB6wN/hNc9
         /P0Jp0uy7nd56WcnDaHw5RdxhpJZ2kyins0MtAY8bxdU8+001hHXqx7HSc1ChOEsYI2r
         7yb8aqLzxqp3epfp3bNvruhpkFuy5ZZwuyB7Zr5350lus4JLIkY7FGIewf3jRUHOjGn+
         yb7hUt+un8Oz1v/eLRoLDQDz5C5gQqs/kwH3Zpign0C24V4VnTyco+8H6GtNgpmGC7SN
         S2uuqALK98g7PKDVHiReBz/EODSVSGlGO0y3IycH5E4Y8vFiEgSlzgzd8eOIZCR4PWuF
         T0AA==
X-Forwarded-Encrypted: i=1; AJvYcCVQz5rRnddW4ItW/nxYcl5L8zFN5YAS0bmHMmqaBi8LYRYI+LCkZNCSuFe9DJZN/v+CquU7L9IraL6UNimks7C7JM/+jsLO0sp2pr0L2dAFjRQ=
X-Gm-Message-State: AOJu0YwlV7jXB5UdG2rRXXdQARiMRpBouYBeCz5VK0/fUjPP+wxcY1FA
	hIEYmuRYb10lKq54KLN1PjBHT2wkyH6RYrCrWMsy3LXi4bXSqFmyzQ93WIvZ47ea4WvJRi3kZzm
	XRUlsS4LK6Q==
X-Google-Smtp-Source: AGHT+IFNKfAUW4OMaL9qXpdep3tJtwg2SPr15+NfVtMPZB9WLEiwmeB7gCF1Z3uW4GFYC8/zL1lL4yiz6W2izA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8752147b3.6.1717610434368; Wed, 05 Jun 2024
 11:00:34 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:52 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-9-joychakr@google.com>
Subject: [PATCH v1 08/17] misc: eeprom: 93xx46: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_190040_465436_B55AFC86 
X-CRM114-Status: GOOD (  10.31  )
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
 drivers/misc/eeprom/eeprom_93xx46.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index 45c8ae0db8f9..5d618a13fe5a 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -79,10 +79,11 @@ static inline bool has_quirk_extra_read_cycle(struct eeprom_93xx46_dev *edev)
 	return edev->pdata->quirks & EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE;
 }
 
-static int eeprom_93xx46_read(void *priv, unsigned int off,
-			      void *val, size_t count)
+static ssize_t eeprom_93xx46_read(void *priv, unsigned int off,
+				  void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
+	size_t bytes_read = count;
 	char *buf = val;
 	int err = 0;
 	int bits;
@@ -158,7 +159,7 @@ static int eeprom_93xx46_read(void *priv, unsigned int off,
 
 	mutex_unlock(&edev->lock);
 
-	return err;
+	return err < 0 ? err : bytes_read;
 }
 
 static int eeprom_93xx46_ew(struct eeprom_93xx46_dev *edev, int is_on)
@@ -258,12 +259,13 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 	return ret;
 }
 
-static int eeprom_93xx46_write(void *priv, unsigned int off,
+static ssize_t eeprom_93xx46_write(void *priv, unsigned int off,
 				   void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
 	char *buf = val;
 	int i, ret, step = 1;
+	size_t bytes_written = count;
 
 	if (unlikely(off >= edev->size))
 		return -EFBIG;
@@ -304,7 +306,7 @@ static int eeprom_93xx46_write(void *priv, unsigned int off,
 
 	/* erase/write disable */
 	eeprom_93xx46_ew(edev, 0);
-	return ret;
+	return ret < 0 ? ret : bytes_written;
 }
 
 static int eeprom_93xx46_eral(struct eeprom_93xx46_dev *edev)
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
