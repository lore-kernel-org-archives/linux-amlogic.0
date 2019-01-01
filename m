Return-Path: <SRS0=NIB4=PJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DDDC43387
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jan 2019 19:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA962171F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jan 2019 19:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YVQ+24Zv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KTtQ33rq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA962171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVSWksuwFNiCuX6vfWOuJLtqadxXzm2iw1c7Rz48wJo=; b=YVQ+24Zv2swvKP
	R/ATYlOWkkrmmlWznaHzIbuFnzRi1LCws7E5LhnO6dv+dhIT11XKx8Qp2KLY20yH1Z5keNjOaCUoV
	ZDBqh3JcaehTTUv7zt3dQN9XnkwtdOASQWhkse6Wj3Wy6I/zkyyly/Rs5icn6hdl76Os3xQ1hqJCe
	F2bfwWS/LmqwFBGvy9nxCoN01PEsmhiMJ/CoLCdh6xHLhmVHYemFyR2i9gQadF1D3n1CWbP26k9ho
	xHSNW35UXge3Hfj3S3EaA7rPNkPWkC/jnSmyOF4kAu2F/yQtdjz6yp4GSZ0REqYi76fi0XRTgOEfH
	L+uQJO2inYyO8ay8uOvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gePxp-0004xD-8k; Tue, 01 Jan 2019 19:44:33 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gePxm-0004wa-Fh
 for linux-amlogic@lists.infradead.org; Tue, 01 Jan 2019 19:44:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id q18so28709202wrx.9
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jan 2019 11:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EgFPtA56/pi/munJDAyiQosAJuwozyE4DN+t4JD48nY=;
 b=KTtQ33rq1nkZfx1bdDLywWiyhsq+wNwCOVnJefVmcdIFkS7Gep6aM57xgF3pD7kt+6
 BnnOrz+ift5j5NUL5CQ/pkqFqYxGzYyAl01PrIydBXYGqtKHROvY9x8zZlL6LddWSxWg
 d4QFrj1aOV1tzXxM1/ctCUIsNGghaU92nZJdTRKuno+LmYkaXOFLEbdKMVjZT53N8wei
 u3qHz4l3SvwpBXzdgMmnDTePkUAj0PraW4AFtaJvXLK9NnAVJdCzkbH+PeNAiZ1Wu9gT
 y2Nn1RJHrQ0Xolu9h2E7FuGTiYaZYwuPF/D0G2LQiri4D5Cdo+l820rKSPpMFoyY3HEo
 DBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgFPtA56/pi/munJDAyiQosAJuwozyE4DN+t4JD48nY=;
 b=eION7IX5As+lUBDFaJZdLrqk9gwBpYgl4gMpNM1EDbuvhB5JLfw664G17wZJtk6qlv
 VghTajptMQhy7bRd5sBY34M3+NXgVIYkwcO3Hc1IVr2brSK3hUNFvTXBqTKsL4UORRN1
 4vhDUEIzeQUCQm4vvBOYuAF/kjhg6yR+ta5oDpmEf3WHggu9FRswxF8rhZvHDytRlANl
 tp1dIK3JzKEBDz2cCFxKPlNPGCSrg+h0tgG0tOGKi5LjVrKV1CznS9P0Eksuqpzbanw1
 +Pd1iL6ZVmVeLIPGpAp6cki5gY7wAxCGKWg36qvUZs/MqeMZpjjRYDG1ihhHAm6ZbdaB
 dLLQ==
X-Gm-Message-State: AJcUukfC/4jf071NxC2gPz9/URXsVQQ/jJCIXRZM0xyreupWta0H8lzj
 x8bES8Sk2+yP2hWBQibDH8s=
X-Google-Smtp-Source: ALg8bN7siEF/o+Fia3jVqdBHmMwwt9X55TVA12QJYTgHiS2e1GnuxWa8MvbLt4fCiXGYqlPoIZJIcQ==
X-Received: by 2002:a05:6000:120a:: with SMTP id
 e10mr36672882wrx.85.1546371868049; 
 Tue, 01 Jan 2019 11:44:28 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD719940081266F57D36520DF.dip0.t-ipconnect.de.
 [2003:dc:d719:9400:8126:6f57:d365:20df])
 by smtp.googlemail.com with ESMTPSA id l8sm41505654wrr.60.2019.01.01.11.44.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Jan 2019 11:44:27 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-mmc@vger.kernel.org
Subject: [PATCH 1/1] mmc: core: don't override the CD GPIO level when
 "cd-inverted" is set
Date: Tue,  1 Jan 2019 20:44:14 +0100
Message-Id: <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
References: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190101_114430_552128_BF1D4088 
X-CRM114-Status: GOOD (  15.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
 linux-amlogic@lists.infradead.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Since commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
tree") gpiolib-of parses the "cd-gpios" property and flips the polarity
if "cd-inverted" is also set. This results in the "cd-inverted" property
being evaluated twice, which effectively makes it a no-op:
- first in drivers/gpio/gpiolib-of.c (of_xlate_and_get_gpiod_flags) when
  setting up the CD GPIO
- then again in drivers/mmc/core/slot-gpio.c (mmc_gpio_get_cd) when
  reading the CD GPIO value at runtime

On boards which are using device-tree with the "cd-inverted" property
being set any inserted card are not detected anymore. This is due to the
MMC core treating the CD GPIO with the wrong polarity.

Disable "override_cd_active_level" for the card detection GPIO which is
parsed using mmc_of_parse. This fixes SD card detection on the boards
which are currently using the "cd-inverted" device-tree property (tested
on Meson8b Odroid-C1 and Meson8b EC-100).

This does not remove the CD GPIO inversion logic from the MMC core
because there's at least one driver (sdhci-pci-core for Intel BayTrail
based boards) which still passes "override_cd_active_level = true" to
mmc_gpiod_request_cd(). Due to lack of hardware for testing this is left
untouched.
In the future the GPIO inversion logic for both, card and read-only
detection can be removed once no driver is using it anymore.

Fixes: 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/core/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index f57f5de54206..cf58ccaf22d5 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -234,7 +234,7 @@ int mmc_of_parse(struct mmc_host *host)
 		if (device_property_read_bool(dev, "broken-cd"))
 			host->caps |= MMC_CAP_NEEDS_POLL;
 
-		ret = mmc_gpiod_request_cd(host, "cd", 0, true,
+		ret = mmc_gpiod_request_cd(host, "cd", 0, false,
 					   cd_debounce_delay_ms * 1000,
 					   &cd_gpio_invert);
 		if (!ret)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
