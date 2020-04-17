Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36CAC2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1082220A
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 18:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KU7sdqWU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XGX0WSH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF1082220A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ph8N9p2AIUrTRzYvXybOBjwAqcDRQGQeVq8tRb+0G2A=; b=KU7sdqWUQsspGz
	M0PMiGGaS6NIbWAfW5+RpxclmYniPa528LGn/U40dXPMfmt1jM7AAAuwbkyWRpstgedF2IZZpdVpD
	VdHidB034QpJtrB/ckH3RFe4cQC3A+eimkRR85s1DxLvKAzrH9iMqri8ZJsTh/9OAYWk7nHD2uJto
	IJViSDhXKJSqW+B8TeIRrUA1utctUvvYsUASS8frvLxR4kseMmSIPKo3pfp5vjc9W1Vc7rp0pXKGg
	/fdMQjYR6sJ8K7Os0Q9vC+aAS0Uab/w9wvsGjBEAhlbKZGicteVf6R4Ha6/XXq6XHcDC2heQwsenw
	KwqdDPm28FhTetgcpTOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPVok-0008VC-IW; Fri, 17 Apr 2020 18:34:22 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPVoU-0008Gt-DR; Fri, 17 Apr 2020 18:34:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id k13so2958529wrw.7;
 Fri, 17 Apr 2020 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bc/4pRlxC+D2ONP1rH1iDduXk9QWuQPhI7TtU7wZt5A=;
 b=XGX0WSH5u91Vm9+oAwQwPXioSYI72fUAscUYc1Ykbw8DGjTGQQm37imIPumogvw6Bv
 C0H7R7Hme4YRD655b+hVV5mYfW5qHWenUYbbJFHaTRAWtWksydEuJWzWsD0UU/jIVihB
 gmxbjYR0Ky7EOt9UAcvcuGmzlcLTZ8OvkJO2a6r8GXf+G1gdaumQIhGPaQm0kvfwdOog
 4XvsHGH5arT0hEEUZdg+MxYbyzquI0BxQWftDmB0y6OVYJAjbt2iPSlEZqZLso+9pyUS
 /O2nVDMxL5mjwqm1F62ucvLGLbZPtCd1wIXVq3SeKiRH90ChR3eypjiKngKoXUSCHMjN
 EJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bc/4pRlxC+D2ONP1rH1iDduXk9QWuQPhI7TtU7wZt5A=;
 b=d46BIMFr+dHdxFRu7z5HiROPqLaHNbhmBe18ZYSpnRciOCQ9iMko0iIikHvr3/pL/T
 aFjxjrdjJGzJzUTShUL+efWjXrSyGgtgwje2JIq5WWMffwRDt5VYba3YTqKf+jyGVm0D
 SONQRQn2rD4UWmO3LPxcYrjpn5B59ubL1FddOuXyvNC5PVw89+GdmkH4JNExYIRzD8VB
 5oA0Z/M0T2Oq1vd7hohH/RjA2Sy/EOHLUj0t+Q8rIf/8Pse7bG/Tvb3DOkiUj+RxR28v
 Do3XrBahAtNfF0BdyHwPTkesdltOR9iy8E1DNO5VyjNvcAkA2QwRDQyk6ZiCY6Th+2gr
 NvHQ==
X-Gm-Message-State: AGi0PuYZVh5ywbx6TOUBHoSyV+3e7N+12AuRkw/nQBL/tdD0KYWfP0GH
 uQULMwtHJpEjixK0HmulKPI=
X-Google-Smtp-Source: APiQypJXKwAyXZE4BpbMeuBoaJhj5rZNgR7yJJgPmD6EnGtgcUKatnBXclheu+LM3LD+NmNCXZqjYw==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr4986564wrs.94.1587148444923;
 Fri, 17 Apr 2020 11:34:04 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id o7sm3074994wmh.46.2020.04.17.11.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:34:04 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND v2 1/2] pinctrl: meson: implement the gpio_chip
 get_direction callback
Date: Fri, 17 Apr 2020 20:33:48 +0200
Message-Id: <20200417183349.1283092-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
References: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_113406_448124_16BE37F7 
X-CRM114-Status: GOOD (  10.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Implement the get_direction callback so we read the direction from the
actual GPIO controller register. This is recommended by the gpio_chip
kernel doc.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..291f3078e7c7 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -549,6 +549,18 @@ static const struct pinconf_ops meson_pinconf_ops = {
 	.is_generic		= true,
 };
 
+static int meson_gpio_get_direction(struct gpio_chip *chip, unsigned gpio)
+{
+	struct meson_pinctrl *pc = gpiochip_get_data(chip);
+	int ret;
+
+	ret = meson_pinconf_get_output(pc, gpio);
+	if (ret < 0)
+		return ret;
+
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
 	return meson_pinconf_set_output(gpiochip_get_data(chip), gpio, false);
@@ -591,6 +603,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.parent = pc->dev;
 	pc->chip.request = gpiochip_generic_request;
 	pc->chip.free = gpiochip_generic_free;
+	pc->chip.get_direction = meson_gpio_get_direction;
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
