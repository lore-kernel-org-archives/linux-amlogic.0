Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629ECC0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36DC02145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hw+2iaq1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r81XUdll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36DC02145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oqr5qleIIMduU/vXVZ4sO1CUL11gi48UaKi5EHVq8m0=; b=Hw+2iaq1vm29Cq
	YnT9DVepIq64OX7zvWzO998ZGK/yOwBVjhdI+OlI5Q1QzSsxzXHY6S+WSJ7sA0YqlmhObOmGJg4Vk
	6hwp9tCwVfulVWi1XP2fHGycwCuepyQu4SyJPVeG8dOkxX8lQQ++e1y8k0EGbA0vtRH0Yx4rS4GjN
	jmIfdn4ABIMmO1R+Locd2s5DXo+/A8p+0Np7m83IJ5O6yh9CsVAYJER2A+QOqEUIcXoFZRR1n5FeF
	ynHi8OKwWN82RLbFRKbD9LLO4qsOrvvVfHJTcoJAHvfDDNic1hbKk4Ceq3JG60aw2CGMIUAuxrYhu
	FOvMIKV5GiyrGeQtqK8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhsNW-0003Zn-Ok; Mon, 01 Jul 2019 09:13:38 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhsN7-0003Dt-6p
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 09:13:16 +0000
Received: by mail-wm1-x342.google.com with SMTP id c6so15041897wml.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYJwtVX2r7KnFTDIFCTGswCpHKhjGFZMmXuYYyexqis=;
 b=r81XUdllxw5uXCyKEsvqIiwFjD4+Lrm0Imlfz2u7g/nBUVEQ/H/q2CcOkbeh1IoekK
 XqmukpLUNFQgaTn4IzOvgmZdqpd98YvfrZ7VM1YVyM7O5eDofTXxiSS1mEh+NDA/Dbr/
 Z3rI9N48FtEgbYu/2B2DhrOANpStsKc6vG9zfUvuIwAIhkKO792IlVEEN/ne/3TDpBV2
 UMhi4YZeH4ltR34+Y1erlZG1nyZ5RNqBMezdYHN4zSt9QqeyPrjfBFHM9wEpAnv1QO1z
 /3GabGCSPZoKQPdlx6VzaT707o+ONkoZ9Yy3YgxKcPSkOCS95zyEqQqYpKHXjSJMRrcy
 iJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYJwtVX2r7KnFTDIFCTGswCpHKhjGFZMmXuYYyexqis=;
 b=Ca09GI6Vly4md5oszZT1gJe7SUepM6ctN3+YofoX9MLuFj/5u5ZrNOVy9ExsRlHRgj
 pFGhAUGF+AyOzU8GV2vN2c24m9KB3zWpPK5FfN0E0BDOeQKjpiIC/33f30gbb5h29ZxN
 0yGpetEKKb+l1zITSqd7RZzWOiY9xQYFn8LDJgwF2WCa87b3lXczig/b9asx7sL5FJpb
 bEOh4OvOsBO82cGXHgoaT+DWp9dY5/ziJL+4SYlhM3HWQJTB6wzmgt8DhvnJIBezPTaQ
 AejzPr/unQ8joTx8ZCbjVYHmtf4BiqFW0k3cB/1mcAQIg+8pBsEAb5XTnmNoqDuWYjzp
 a7hQ==
X-Gm-Message-State: APjAAAUKEmGG9w0AsmsWqG2xKYyzbEiRAoQTkGcqotKNdVPotAeSPpHZ
 CSkFgDNNf1H5YICNRwxrzbTRig==
X-Google-Smtp-Source: APXvYqyKAKMyxCAc6vR2xD8svMCql407vi8e1s9D1IiPlHCg1OCzLfGcgLf5UyySc+lgVIZBWOUuTA==
X-Received: by 2002:a05:600c:303:: with SMTP id
 q3mr16802095wmd.130.1561972391870; 
 Mon, 01 Jul 2019 02:13:11 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 02:13:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v3 01/14] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
Date: Mon,  1 Jul 2019 11:12:45 +0200
Message-Id: <20190701091258.3870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_021313_258435_46FD000B 
X-CRM114-Status: UNSURE (   9.94  )
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
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index d494492e98e9..f69af4fa7cf8 100644
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
