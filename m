Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FCEC52D7D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gf4NWW60XkpB3duPPv/fDMGqfCzxG05NQGwEHcEnJIk=; b=GQpRO2uAoeJQWy
	DHCIVwpA7mLb4XD1lbTU/KCitutvqHd7PiTPGayHtPANp1otIYlB6p1diY9Aze3kQowLDyGwc5rJ4
	teg59h1xllUOyK8ZM9ox6f9yxgujKqotxJDFedkaDnChbYkvLAVfbcUodV2TO22xTz0usc2V4RoMj
	qUdb9EWxxX7AmO0Sj9o161NcSsqMwFXskLpTTpBJHifsRUziJ7wuKHhGGfTDUAnQBrVntznz4Z4ms
	jnkNMe3tBYO8LvezwLo9JTC5BcDCN+pfZbD90L5FR2OpveQDS39/afwTLyWKT6Cse6aW5fni+A1ik
	6Cxn1+b/j7Gh0k6pWRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew8P-0000000Cst4-1yLx;
	Fri, 16 Aug 2024 12:32:49 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sew7h-0000000CsdI-38Ug
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Aug 2024 12:32:08 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6bf6beda0c0so11181056d6.1
        for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811523; x=1724416323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16nB20lne5nZUXu6hYGLNV1RBZ9sfyRh8sah/xieHmI=;
        b=AqGAE+vjf4W//hpT7uLbueQ1s4D3sk8JWlv6tzuWqiPfDG4IrWSyXhe9WTuq26a/2P
         FGytWH/AvnLUpwD40+q5YEueNaONuTcv4q3J/qbfGS1KiWXfhYV1gxKS9ltAtCBP4lKa
         Gczm7vRY2GOIX5FY3fYC1gWUqSKm0oAzg7WJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811523; x=1724416323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16nB20lne5nZUXu6hYGLNV1RBZ9sfyRh8sah/xieHmI=;
        b=cD26cEhhwk4ELfDJh3TO3SfD2h/Nl/pw0vebLd2DazEyNk60hfGZ6r1uPGYByOfD2y
         gFrXg55MGy1QfsupAxhJu5avLazes2jPH0kgUqoVQ/j+4Reard9K1c7dbqis+7OUyJqW
         ID7T/2dvL4xmXENme0NKJ8q51la/WBbNOovLQi6lLSOE2PN4md/gYKLXo8fTix+/ESb6
         isgRKXonqAip/nn6YjFmd9GU1rW11P/LupDqm+H9FXq6fkF0F1wBmfFzppX3BSR7m4oF
         ukc42H10Ps8/aNxoLt85tZkj3sXMy7B7d3ywiwTKXv/td/ZWpclB6m5cBI1GtDRKhs3i
         8Qmg==
X-Forwarded-Encrypted: i=1; AJvYcCXU2rCC0ROadtbeKDclEJEu8zagkx6GU8uywSGaheMFV/4WkQsJInXWqOgYAUcxfkPewVVx7c2dX4Dwe5+5W9U2+NPU3KdwD1be6mCOTvc6agI=
X-Gm-Message-State: AOJu0YxVH3/bxuM5sNmmZezS3I9gqwuGZLlKqYIOR+zt+s8FpDDm/yNk
	QWC5MwrnmJobXbNkZYK5VZc6rHM8q63g35lsRMDZsbXFNmc/KG/o/BihajRSPg==
X-Google-Smtp-Source: AGHT+IEc/DNqda2J9XQ7o/We+y3QlRxp9UtmD1+ZU6guILT/Q3NfuJJCxXcnUIyCC+eWr3aG9Ceo3Q==
X-Received: by 2002:a05:6214:5892:b0:6b4:fde8:8688 with SMTP id 6a1803df08f44-6bf7cebc8d0mr28626046d6.53.1723811523632;
        Fri, 16 Aug 2024 05:32:03 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:31:59 +0000
Subject: [PATCH v2 1/6] media: ar0521: Refactor ar0521_power_off()
MIME-Version: 1.0
Message-Id: <20240816-smatch-clock-v2-1-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_053205_881920_133397A6 
X-CRM114-Status: GOOD (  12.35  )
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __ar0521_power_off().

This allows ar0521_power_on() to explicitly clean-out the clock during
the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 09331cf95c62..56a724b4d47e 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -835,14 +835,12 @@ static const struct initial_reg {
 	     be(0x0707)), /* 3F44: couple k factor 2 */
 };
 
-static int ar0521_power_off(struct device *dev)
+static void __ar0521_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
 	int i;
 
-	clk_disable_unprepare(sensor->extclk);
-
 	if (sensor->reset_gpio)
 		gpiod_set_value(sensor->reset_gpio, 1); /* assert RESET signal */
 
@@ -850,6 +848,16 @@ static int ar0521_power_off(struct device *dev)
 		if (sensor->supplies[i])
 			regulator_disable(sensor->supplies[i]);
 	}
+}
+
+static int ar0521_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ar0521_dev *sensor = to_ar0521_dev(sd);
+
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
+
 	return 0;
 }
 
@@ -908,7 +916,8 @@ static int ar0521_power_on(struct device *dev)
 
 	return 0;
 off:
-	ar0521_power_off(dev);
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
