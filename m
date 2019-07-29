Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59928C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 12:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3235F206DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 12:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lm+AoRdH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b1XehoO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3235F206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Ak6P8Gvdsdt0lp8Z4b0FkautWiz0WwwN+QuZYkI5ow=; b=Lm+AoRdHR1hyIF
	zeeQKjJrwDG0pg+YCTMtckGq8eE6FcD7diNLXYSd6a8QG2ckDvZrrR+h5yADBadly/UFsjIBDZX8O
	oXJOkVID/3JoVBdOtqB01HbR5CZI0zHrBhnbuNQDkjbCiyOQxa9GRC4dNRgGGEJi1I5Mn2m66dikN
	u+XoJskQSoYWA3MnT9CUwLMr++L4zuybPbgbAWt6JP66TxOndRPRvqEC+c+NF/5BkU7Ba6ZG/NriG
	yFzd9IC3Ke/AdBr4Xy/kex6OsbWLKBfuMNon8WZDUEMzjp5KEFXBKUbkJCR2Y8YFFDCv+tLQbbvxw
	wQBr3PI5VpIMpq/rXMsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5Ew-000604-3P; Mon, 29 Jul 2019 12:58:58 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5Es-0005zB-IF
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 12:58:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id l2so53365288wmg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgZeKxOrrqWjvML06wf3e+bjI2MpHSypq9WO6/xcbOs=;
 b=b1XehoO/Qpmy7h8cLHnGcdHcn9QNU8V3wbMeh5Y369UoTvBxlEztW/B0FnchCtEz0n
 /+CeTaNXTliBGVc2tSMxeqCTBExvzxi/MEHNO7z2CUzZcG+aWMVZks5jUnaU2BXC1jtC
 kLk3c8CUtdhzWSYqaVZlIyp9o7fOKEY5wtus/rr/VtRIxVbcHNHYSBLKEh/6uIyu6Q/n
 HMEHmDVr1rajNjGuzjX5GUcyUfpJvkXLXq2EiYCxmQOMgEp9xw6pXWeXBVwoG6FM6TG/
 FSKsZnB0IkvpuLV2T5LvNjCCtUnpVSQB3xy4FpkI0KiYQ2HoT0VDp7b9X3tsoK6vMZ1+
 0c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgZeKxOrrqWjvML06wf3e+bjI2MpHSypq9WO6/xcbOs=;
 b=X03XYFySw9itbibN59csRZK1/gMzPLSyYyduVnjynwZsHOxNeJP4hTWbDgQ+ngulf1
 RXDASbBM0tH6CEnx/kM75cm6UXnLqPy5pwnSpYqIq7tsTTL3q3qmdtFgezUPl3ssoG/5
 qF+DndRVI3EmXFl29V2b2kCVyzVGKuQTLQkPgLxzAW1rC8ZQhaVeqTdNekLPaAmrOZqC
 mFzvq4eegrMt8JkaM6bdhZiswh3JRLfQx6jTH3yX3kjwsyQgsqGl0EO1OaeZ64aw0TE8
 QO/5wQ1eYPaiwU8r8bwOudh27H/radEdt5mhCJ3vgUPAJCLf9u57DzNwTMyvSRfXq+tE
 qVhQ==
X-Gm-Message-State: APjAAAXrcV4cNHrpLGsGakjWO56WFS0J+dt5SMjgNtPNHul1KC+kdXSy
 oQaaxOD9tjHnLLmfcaMCJTLiKw==
X-Google-Smtp-Source: APXvYqxTYhDqa6nBd6gkMoZq4dBfgw47+AH3bqKhNvPMkWAuzMonrOkTE6yj1F3cKty7qTwSwxAGDQ==
X-Received: by 2002:a1c:618a:: with SMTP id v132mr34306997wmb.17.1564405132425; 
 Mon, 29 Jul 2019 05:58:52 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g19sm115217270wrb.52.2019.07.29.05.58.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 05:58:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linus.walleij@linaro.org
Subject: [PATCH] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
Date: Mon, 29 Jul 2019 14:58:38 +0200
Message-Id: <20190729125838.6498-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_055854_602839_BEB69C6D 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 3475cd7bd2af..582665fd362a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -801,6 +801,9 @@ static const unsigned int remote_ao_input_pins[]	= { GPIOAO_5 };
 /* ir_out */
 static const unsigned int remote_ao_out_pins[]		= { GPIOAO_4 };
 
+/* pwm_a_e */
+static const unsigned int pwm_a_e_pins[]		= { GPIOE_2 };
+
 /* pwm_ao_a */
 static const unsigned int pwm_ao_a_pins[]		= { GPIOAO_11 };
 static const unsigned int pwm_ao_a_hiz_pins[]		= { GPIOAO_11 };
@@ -888,6 +891,7 @@ static struct meson_pmx_group meson_g12a_aobus_groups[] = {
 	GROUP(i2c_ao_slave_sda,		3),
 	GROUP(remote_ao_input,		1),
 	GROUP(remote_ao_out,		1),
+	GROUP(pwm_a_e,			3),
 	GROUP(pwm_ao_a,			3),
 	GROUP(pwm_ao_a_hiz,		2),
 	GROUP(pwm_ao_b,			3),
@@ -1192,6 +1196,10 @@ static const char * const remote_ao_out_groups[] = {
 	"remote_ao_out",
 };
 
+static const char * const pwm_a_e_groups[] = {
+	"pwm_a_e",
+};
+
 static const char * const pwm_ao_a_groups[] = {
 	"pwm_ao_a", "pwm_ao_a_hiz",
 };
@@ -1290,6 +1298,7 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 	FUNCTION(i2c_ao_slave),
 	FUNCTION(remote_ao_input),
 	FUNCTION(remote_ao_out),
+	FUNCTION(pwm_a_e),
 	FUNCTION(pwm_ao_a),
 	FUNCTION(pwm_ao_b),
 	FUNCTION(pwm_ao_c),
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
