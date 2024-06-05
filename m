Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10610C41513
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mtp0Pop1Crdh0yqfpRhl7VZSl2ipDypcwQGJgAn/yHo=; b=Fy8ODwgc2Shugbi3qMD5JwgFp1
	L8SpMxMcwuJq9vHja+TydqSDhjtKtLBtR5WHdm8tcBkR7RT72uhiizabrpCSVDR/1fT1Elsq86RmK
	7uTmkmr7yC9GM5DSInaOBhZmFPF1R6jy9mdDcxMBMVl+e9qIvAhIlnqIMskhTX+w+PxEqUr/sBLN8
	uGPOWukySMfKfjjLylvt3rbjv3ZfDo5uPXJenQ7/+1936d9Geg41FG74xDw8KKwSWtNMYAmjB3TzK
	QDN7P53EiVlp2yaCEcnpBtwF8ZLabmNHKXpae7qShkM4Fgag+qSy7+zZ0J2jgXwaEzXbodHhg7tnm
	xjFIkA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuzE-000000075EA-0xhW;
	Wed, 05 Jun 2024 18:03:48 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyg-000000074nN-2plS
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:03:21 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-629f8a71413so473187b3.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610590; x=1718215390; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=4VxQrumrJ1mKCsy33vQUWuhkVGTGf5Eb/hWWkDMXaG224lH91aZFOV+hFSKK4v0Zqr
         qLGhn8S5T6d7N4qSbx0Ly3IDVxPVXAxIe9vxSWHa+hzAmCvTdJAtPtHo4lnz1mfKbGY7
         rCaNqxknmwPWzxAXrvhdMeHD1u4WQMli5rSWu3bohXaefp31AIrYDD2Tm26TnimHmQBH
         xWcc6QT8zhBG6ZJzbIEGPOvwkqnDS2nkAHOrAJwFaHES8Ti3C+iP0MQlD2qya1yQpdp9
         GSvYZpvYUFyslKyiPjWXjS3NT4MOh11ysGpvoVGdI3CZBRyYEduzehPErSdMEn4WCdTJ
         gcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610590; x=1718215390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqJdwI0kfu08l8zta4NZb2Dhq8rse0Xjye+A2f9mH7A=;
        b=XHMjesXXBnJZ8jdXzbEMuOHLwYqO04YOdm/6VHk0pEo9Cuw40ZAdg8FAKZUv3UjKLD
         L0wq4156DyjOhGME9hTSKf1OUVLWh9sB3EPGmIqSkW9SWEo1zMzjSCx0RIQU0n1tzyw0
         QyxWW+bK7F2oMROtRKkc8fjLFftuZKhjmUD4Gm/nJXvlQIcP6Bgn2Xnss4B88bRXFWYz
         Kk20skTPZvWdAyfQ3Jq84wS3bo0u1bnC50d10fY+UoFqdC2PyTg36kk06efVXg1rOBsS
         ky2p3n3kpCCUYY2gP5qVX60J+N4zwyUVrqipwTeHiXXjJZnN7FHcWMVsA4rPp9e5oAZB
         kN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmgsGVYOqtnBttoDwJfK0WxHwd+e8MUeLUdVFxhqCC/dS1+YJ2cQrNYGDrwlyf9E3VtmAZ+Df6aEJsPLGAyV2G5K2KOaWtq8987ZLpiWq489U=
X-Gm-Message-State: AOJu0YzrAJPr3JgHbRhJ1g5+0YgPVHSCR0gnylcBPKpGKnNHo65aoB/Y
	lNIuDGtb/Z8/bXRkjkG4X3UZ3PW+ym3NRBdFtApiBqE9l7vzxOlTnHbb5HlMVRAaey2gH0jNBz5
	RDFQ4qZcOVg==
X-Google-Smtp-Source: AGHT+IFarMTHRQyaGAXOhvjvZC3Ev9S2zTS3Kvs5hpqZrMnxro2/BzrazXCSnRirdCi4qPaGa/c0QONTMKwCWA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:d608:0:b0:df7:d31b:7a29 with SMTP id
 3f1490d57ef6-dfacad1dc1amr763889276.12.1717610590398; Wed, 05 Jun 2024
 11:03:10 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:37 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-7-joychakr@google.com>
Subject: [PATCH v1 16/17] soc: tegra: fuse: Change nvmem reg_read/write return type
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
X-CRM114-CacheID: sfid-20240605_110315_328892_1E3033F7 
X-CRM114-Status: GOOD (  12.50  )
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
 drivers/soc/tegra/fuse/fuse-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index b6bfd6729df3..1b067dd8a585 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -96,8 +96,8 @@ static const struct of_device_id tegra_fuse_match[] = {
 	{ /* sentinel */ }
 };
 
-static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
-			   size_t bytes)
+static ssize_t tegra_fuse_read(void *priv, unsigned int offset, void *value,
+			       size_t bytes)
 {
 	unsigned int count = bytes / 4, i;
 	struct tegra_fuse *fuse = priv;
@@ -106,7 +106,7 @@ static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
 	for (i = 0; i < count; i++)
 		buffer[i] = fuse->read(fuse, offset + i * 4);
 
-	return 0;
+	return bytes;
 }
 
 static void tegra_fuse_restore(void *base)
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
