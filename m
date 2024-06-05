Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE6C27C55
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qmtcsOuHPIUSPOtfD/i60MBDgOoicH2qZe4dz35am40=; b=UjVxn14Kf1Kg/D5OgjPb+NOhuh
	Rq7E+JsKnEgCtJveuBmrAY3e1KSNlcrEQdO3LOuG1aHttWrzqDbf9FJW64AF2JDAAbcL2O9/kUk79
	dcU2LEDM3gbPNCZCUj2g2EyUucze/Hl8yHgL6pLYzs97/5iB9BE3yGqy4BBs9pLU9q5aPuFBaGJgB
	+rfHNoBte3ijF6ud44aHGEGQHSW1oHC1PDRk5ImERMOYYaotTM+eO++k7pNvSWcEBTgAi1iU4kgQ0
	Ss8T1RbTTKos0HmT4fzlLoW+OuXtpLFR1qdmsD07+gO59eTEE49fSQCeosAm8+WfqQ5bh3Qi61WBn
	ytBRJ1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyb-000000074lU-2WWK;
	Wed, 05 Jun 2024 18:03:09 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyP-000000074Xm-1qSY
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:03:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627e9a500faso436257b3.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610573; x=1718215373; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=Yjbi3QJZibdkUbW2N3vMMC1ImMtHZv/d3JfO3j+oCvyP/qglVa+uAZWcBkmHlryH5c
         KcPmcdbGEVxC6SMPM8PA9mpTSlW37t/Mxb3injMfRd2pJ1QFf7DmQgv+k2GJBDrk7dAp
         tQw4HQpa5I9SYXAptjJtuOdl0I+0Dn0HqaX5jPuS8L9xKI69cWuL7awMsweA/9k6yg3Q
         AsINBnzLKdg9r+nXdzwMCBdTaSVlgaHRZUx5IMhCE8KXHfKxppzjn/CDJksoCUA3JaPf
         If1lkhy6BHRL794wjNU/VZghIWrg9TfOXsS6xZqJcNfrcVChYeG7jMnVNmJGHk5YH5EW
         q3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610573; x=1718215373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDI8h7ZoQYy75CqD6I2McYIto2hpIA5emU6fq1I3LPI=;
        b=g8vlD0N/5Fd+6V74s3zBJO3IPB1jFmodjyb1Kzllk9kbNbU8vo7RGXMReHSyN3j+zZ
         6QOItR4CKWORbT4xnmCxWjUrF0XM5kAtKgK+bnql6iJYegtzNVy7D4bZhEBBF8rGprRz
         HaSdxqZEbATj5jai404chCx9OuzShxE9A5kb45qnVTXX2at7Cni2NdU5JBiTmqPBKG5p
         J0gsDR3MADx0YNF/xXhL9BBvfns0XpL8MUvpI8G72foyeQZJFv0tpFa7jr1qiqQdGOOV
         doZBoB7IfHsV6X2Q4Efj37BAqDuJY/HpvnLsW1GdQnS8cREeI1cudHhLrg09sB/yCvvZ
         4hDA==
X-Forwarded-Encrypted: i=1; AJvYcCX6RLP1k4KQCv+U9dePFyLL23v3xqpNOQwCn7n5gu2KnUJiUunlMr6UdENi2Pa32kYoE5dgd3mxqM5eOP0oLy3fI5Mf85tcoB+nOLxIOxafMYg=
X-Gm-Message-State: AOJu0YxpTXQuK2XngfgbzGXGS3MOvFpgnS3tulMG9Nu9BcCZ/wC8jHX7
	eyEJVGy9+VAqYLXCVogb17cJf4WF/M751ZyUMfJEZLjOjLoyARhgUjQFSD0ANhP56wIHtjyrb9Q
	8LFV4aGcCuA==
X-Google-Smtp-Source: AGHT+IHsHtY+bAgPNOkcmVi64EeRKQimO371NMHALyHppPPqEXYX97pSerbED4x3JFp6tor3148MLJe9OAqS8w==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8780427b3.6.1717610573043; Wed, 05 Jun 2024
 11:02:53 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:33 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-3-joychakr@google.com>
Subject: [PATCH v1 12/17] soc: atmel: sfr: Change nvmem reg_read/write return type
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
X-CRM114-CacheID: sfid-20240605_110257_645007_11854A09 
X-CRM114-Status: GOOD (  10.08  )
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
 drivers/soc/atmel/sfr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/atmel/sfr.c b/drivers/soc/atmel/sfr.c
index cc94ca1b494c..c1c8e59cf6fc 100644
--- a/drivers/soc/atmel/sfr.c
+++ b/drivers/soc/atmel/sfr.c
@@ -20,13 +20,16 @@ struct atmel_sfr_priv {
 	struct regmap			*regmap;
 };
 
-static int atmel_sfr_read(void *context, unsigned int offset,
-			  void *buf, size_t bytes)
+static ssize_t atmel_sfr_read(void *context, unsigned int offset,
+			      void *buf, size_t bytes)
 {
 	struct atmel_sfr_priv *priv = context;
+	int ret;
+
+	ret = regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
+			       buf, bytes / 4);
 
-	return regmap_bulk_read(priv->regmap, SFR_SN0 + offset,
-				buf, bytes / 4);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config atmel_sfr_nvmem_config = {
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
