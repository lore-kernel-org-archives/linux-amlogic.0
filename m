Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA117C282E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4232183F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:48:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ILON5Fms";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="u4q3BTrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4232183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kFOLmxvSYVNv2e7E/2PnrcnydQfPR9aDXWnEzb76YC4=; b=ILON5FmsbSKJ4sQYCkJwQPhG1I
	tyUehFi8QekPYYeuK9OwfB91Yn8BVWfkKSSmojgw4TUTFg5MGWxXBoNzMHjHuttsMo05zVt6xdt0G
	iRCq5SqUfQkwzUmj7Zv8DNUR1OCEQmUAr3zALogbDKYwkT+3nBRSBkohZ/b9h+CBFeu3LNAs2r/J/
	x7EeteMiKhOXlA6vhBV5+prY96R38kVfj9NOCZOsx81+Qp6i2cwtpCII0ZsYbwr4/IvIMXoz8kZ2R
	Sm+7vaD9cTHow0h0mfSEyJB09Y84sgNXnN7z+jBfW1xRmnBIiSzDOVUmNVnWZpwg2aXXgan+3wbCk
	WBirnyyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6SW-0004QM-Kf; Thu, 18 Apr 2019 12:48:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6SS-0004MF-I3
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:48:05 +0000
Received: by mail-wr1-x443.google.com with SMTP id h4so2816007wre.7
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lEmzBEboKIGTezlbO3ot+XflyRscqj5u91q4CMrx2UE=;
 b=u4q3BTrLMqXm/Udjmd/qNWIWU8LJmqNEWfZ3DyyFFKrNQpGn0lG0+w0L+C4tnUQydO
 3AHjv8xfkLSJ6JAGPQP3IlDtzIMjv9uchYFdmG7PmUfvu0PNJmymrLHREDEacb4xoJx+
 DrzfxAuWfPq0c6DktTV9NnyICRHLinKHWFkubv+TqtEXOZlNAAvLgHbIX7/1M74JdOFa
 YssBzaSYUNhlb7OuV1ttUIVstPqcYfH9g2pIiylu9qNqi6quFHZZPVzM68/rnKxw9ZDn
 lrRlgQVGZPuCl90Tdv5jMAW/0dhZI+huzzG9F9UkuLn/UdVcTIk1wKU3SsBZthLnyTeg
 p4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lEmzBEboKIGTezlbO3ot+XflyRscqj5u91q4CMrx2UE=;
 b=qGNDUwcqtXIq2HLClD4ax0KkUJpweFdV0NAp2J07OPpByLzoJmZAdOghC38iAYGBLr
 Vf65/6IB++5I2j5i9aZde3nKUpD+rD8RX2f+zcqTXThxsFMus2ycGQrawbgMInPF8Khd
 4EBQgqeOYiF+YPHuP6ztva+YMIyytxqz0Vde06gUY/SvS/5wwUW2CddS2R6AoC31+d2Z
 3J0GFpqpdSHaJ7tDdoyySr4TbSMwsy6iF+Qwn4ut9jH97g2HekRQSfDqN2cqzWzlzaSh
 sSzr1hEJCulN1nR3eobdfmDAgT2hUsQP7kLHrUJ7XYT7k28mJ//FEXilBdOdmvZnduuF
 ZWjg==
X-Gm-Message-State: APjAAAUT/k6/vxbw/bwu9JpOy7GAVqsWr8M8wP92JSOF5sT6tMetpdtz
 ZO5uBbN5SFM2GE6H5bT9RP+89Q==
X-Google-Smtp-Source: APXvYqwNUgYTLOwXqXYz4vTrM0NN+0xqSjHKC1RpVZCz5Zf0JHeJBz/Yb3OEX/2GORWOvyzSmLljAQ==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr38287929wro.293.1555591683176; 
 Thu, 18 Apr 2019 05:48:03 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q17sm1256823wrw.70.2019.04.18.05.48.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 05:48:02 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 khilman@baylibre.com
Subject: [PATCH v2 2/4] pinctrl: generic: add new 'drive-strength-uA' property
 support
Date: Thu, 18 Apr 2019 14:47:56 +0200
Message-Id: <20190418124758.24022-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190418124758.24022-1-glaroque@baylibre.com>
References: <20190418124758.24022-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_054804_654631_22B6D46F 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add drive-strength-uA property support to allow drive strength in uA

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index b4f7f8a458ea..87393e9452b4 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -39,6 +39,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH, "output drive strength", "mA", true),
+	PCONFDUMP(PIN_CONFIG_DRIVE_STRENGTH_UA, "output drive strength", "uA", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_DEBOUNCE, "input debounce", "usec", true),
 	PCONFDUMP(PIN_CONFIG_INPUT_ENABLE, "input enabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_INPUT_SCHMITT, "input schmitt trigger", NULL, false),
@@ -167,6 +168,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "drive-open-source", PIN_CONFIG_DRIVE_OPEN_SOURCE, 0 },
 	{ "drive-push-pull", PIN_CONFIG_DRIVE_PUSH_PULL, 0 },
 	{ "drive-strength", PIN_CONFIG_DRIVE_STRENGTH, 0 },
+	{ "drive-strength-uA", PIN_CONFIG_DRIVE_STRENGTH_UA, 0 },
 	{ "input-debounce", PIN_CONFIG_INPUT_DEBOUNCE, 0 },
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 	{ "input-enable", PIN_CONFIG_INPUT_ENABLE, 1 },
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 6c0680641108..72d06d6a3099 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -55,6 +55,8 @@
  *	push-pull mode, the argument is ignored.
  * @PIN_CONFIG_DRIVE_STRENGTH: the pin will sink or source at most the current
  *	passed as argument. The argument is in mA.
+ * @PIN_CONFIG_DRIVE_STRENGTH_UA: the pin will sink or source at most the current
+ *	passed as argument. The argument is in uA.
  * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode,
  *	which means it will wait for signals to settle when reading inputs. The
  *	argument gives the debounce time in usecs. Setting the
@@ -112,6 +114,7 @@ enum pin_config_param {
 	PIN_CONFIG_DRIVE_OPEN_SOURCE,
 	PIN_CONFIG_DRIVE_PUSH_PULL,
 	PIN_CONFIG_DRIVE_STRENGTH,
+	PIN_CONFIG_DRIVE_STRENGTH_UA,
 	PIN_CONFIG_INPUT_DEBOUNCE,
 	PIN_CONFIG_INPUT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT,
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
