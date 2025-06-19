Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0196AC7115A
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jun 2025 02:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mdjoa22+5ve941qF/kWZtX2JAplwNDilpApVS2w+t/g=; b=qZgbTsvMUl/2Xk
	l2hXTncIJ1yAQEzVpA+3ZEm8JivNX1qi7cDtbQnJmo7oQ8t+MErFiN2xpE4dNxR2tAvsd+uyia+uO
	QOICL64jaQQ/A9+epe0yHUl3c6tuzgFLIOTfZKXtZPJZ+ZxPW/DD7M9KAh9Bs2nHq8dy/k1EkPudd
	ocFur8S2MS/0PjVzQDA3vs4EOy7Bug7+TRPLRC+nc2ykmS0CRx/0Lu6dSZXQqFdlDXV2Fkgkftpts
	mAIl/XjVVLEUa1r1DiuFD50QmcjupIMWnR3lPEGwKNQN2miZ96C1GNqeQKMqMm7t+e0yxbmP7uFW4
	QBJXcgQayIRSvG/qx1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS50V-0000000Bocu-1Vdo;
	Thu, 19 Jun 2025 02:28:03 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4wd-0000000BoG9-11qR
	for linux-amlogic@lists.infradead.org;
	Thu, 19 Jun 2025 02:24:05 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7d38cfa9773so33956285a.2
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jun 2025 19:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1750299842; x=1750904642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIc69jZZtauTnE08yUtmztNBMw9hE7gd1ymlUgClN+8=;
        b=R0jnkljwnIapIC+J8S5v4wjVriNFKQFa0PKpSD7dFZwUJsPAYZtbFipRfT/rqIS1DI
         73q3pJ2MZAgwaBw5KatGrSxPymnCZaMNgD0F/XDq2fZdYl7XC4N0IMb/iH3MNdZqiYDl
         +EtAKHZcdST3KnZajkZimAdhFagosfmFihLuKICGklDFUmVXg8DNXJUXW7I87QPZ2IrI
         hrC7JzcNyGbMzCgVKTLIh+gE7i8V8xofvz3cP54y3Hcp1vpD9XmONqGYHjOWI0GLxvdc
         0crqZT0MDF7ETPXh6jsRMXgAR9cUwCuh8z1lgmvTKKQ884WPBXNkF0rskyv1eJ4WXzia
         wmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750299842; x=1750904642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIc69jZZtauTnE08yUtmztNBMw9hE7gd1ymlUgClN+8=;
        b=K1MgrGTQrPP+KEg890PVDKt0U5HD5XZUGqSQSgCERhPzu5Y2hKd8JsikZBhU2VcyjR
         maB8gfDtQYleoJ2hCnD33oyi33MnjnNc6YTa4q53hBWRQJ5Ajw9nMT9BQNrkl7p9bmn5
         H4l10wH8ygqFfvrIvSc/hCeD7Q1tqF3ReC8MDxcUGt37KAeR7NBCjRpFHsrv09vRmHB7
         4+DdzN3ux33Tw2EE6W+Fo1TBGq3ZslQD5c1BbYUMCgVi8Pyt+gp1joZE3w0FChZQOhHP
         ARZZ25cP2IFFTLiIj9IsS2gtOlYmHUs6okC+e8hWLaSRMouKcrA3TD3FlcpVgqMAwyrY
         iSHg==
X-Forwarded-Encrypted: i=1; AJvYcCVYzYUCjMngsQoFCBimpNlPvvJiJjMDrWcE3bTwwOapC87BUf6kPb3ZjIyciZOSvoJrWh6X7H1mwDOliczu@lists.infradead.org
X-Gm-Message-State: AOJu0YwD7xdMCIdZOYI3CdlBV08M+4Ifs2J0V5E4NbV3XGmXXFMyljft
	/oqz/HDJRjavBGVNVzwPOxNMtl/IdPFgqIv7bBjo35zfJ23Y5AYEqV7VG3fy1X/XjQ==
X-Gm-Gg: ASbGnctItyZHJ+FoH+18P0g3jTFOuKrN/TssB0AsKDi1C8UTURRB/DtlzRwKCWnq/37
	CKZvsQfDyZ/GBtOd7CYqMTDQFsjGNCBaoCTg+JU/tnVsMnhgxip47IXq52sV2YMjHmhGTFjgYH8
	fM3R3yVkSWSoSMXm/NSxHOjBC69+c0E9pmK4O7D29JMlUb/vVn6Htuz5xwTgk/+OJiAYdL9JWMN
	9h6n1mVAWst20RWRTO+jq0KmX+FlMJ/PGtqX7Bjsia3/kRdbPkOhiOMLSuccsMlIstSLmlsrmjZ
	7EdTBqQegFMzPGSqcDYJATooAgmG52skwvfMTAiKzBMRKqxYzftjdYtLhWU=
X-Google-Smtp-Source: AGHT+IE1rdDNmDG+3USJoAPdiCN3kxUYolutEerz4uopIsgF3VHmc6V3hXOEqTVlOlkynA8dHGaIbg==
X-Received: by 2002:a05:620a:24ca:b0:7d3:c501:63da with SMTP id af79cd13be357-7d3c6d081d2mr3217739885a.48.1750299841762;
        Wed, 18 Jun 2025 19:24:01 -0700 (PDT)
Received: from localhost ([2607:fb90:6159:6306:2d25:3966:6b37:2813])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eb80c7sm834149085a.61.2025.06.18.19.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:24:01 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
Date: Wed, 18 Jun 2025 22:23:37 -0400
Message-Id: <20250619022337.43900-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_192403_420041_DDAFC6A7 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

g12b and sm1 have additional pwm pinmuxes for b, c, and d

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index e2788bfc5874..8b9130c6e170 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -270,15 +270,21 @@ static const unsigned int pwm_a_pins[]			= { GPIOX_6 };
 /* pwm_b */
 static const unsigned int pwm_b_x7_pins[]		= { GPIOX_7 };
 static const unsigned int pwm_b_x19_pins[]		= { GPIOX_19 };
+static const unsigned int pwm_b_z0_pins[]		= { GPIOZ_0 };
+static const unsigned int pwm_b_z13_pins[]		= { GPIOZ_13 };
+static const unsigned int pwm_b_h_pins[]		= { GPIOH_7 };
 
 /* pwm_c */
 static const unsigned int pwm_c_c_pins[]		= { GPIOC_4 };
 static const unsigned int pwm_c_x5_pins[]		= { GPIOX_5 };
 static const unsigned int pwm_c_x8_pins[]		= { GPIOX_8 };
+static const unsigned int pwm_c_z_pins[]		= { GPIOZ_1 };
 
 /* pwm_d */
 static const unsigned int pwm_d_x3_pins[]		= { GPIOX_3 };
 static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
+static const unsigned int pwm_d_z_pins[]		= { GPIOZ_2 };
+static const unsigned int pwm_d_a_pins[]		= { GPIOA_4 };
 
 /* pwm_e */
 static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
@@ -649,12 +655,22 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(pwm_a,			1),
 	GROUP(pwm_b_x7,			4),
 	GROUP(pwm_b_x19,		1),
+	GROUP(pwm_b_z0,			5),
+	GROUP(pwm_b_z13,		5),
+	GROUP(pwm_b_h,			5),
 	GROUP(pwm_c_x5,			4),
 	GROUP(pwm_c_x8,			5),
+	GROUP(pwm_c_c,			5),
+	GROUP(pwm_c_z,			5),
+	GROUP(pwm_d_z,			4),
+	GROUP(pwm_d_a,			3),
 	GROUP(pwm_d_x3,			4),
 	GROUP(pwm_d_x6,			4),
 	GROUP(pwm_e,			1),
+	GROUP(pwm_f_a,			3),
+	GROUP(pwm_f_h,			4),
 	GROUP(pwm_f_x,			1),
+	GROUP(pwm_f_z,			5),
 	GROUP(tsin_a_valid,		3),
 	GROUP(tsin_a_sop,		3),
 	GROUP(tsin_a_din0,		3),
@@ -1058,15 +1074,15 @@ static const char * const pwm_a_groups[] = {
 };
 
 static const char * const pwm_b_groups[] = {
-	"pwm_b_x7", "pwm_b_x19",
+	"pwm_b_h", "pwm_b_x7", "pwm_b_x19", "pwm_b_z0", "pwm_b_z13"
 };
 
 static const char * const pwm_c_groups[] = {
-	"pwm_c_c", "pwm_c_x5", "pwm_c_x8",
+	"pwm_c_c", "pwm_c_x5", "pwm_c_x8", "pwm_c_z",
 };
 
 static const char * const pwm_d_groups[] = {
-	"pwm_d_x3", "pwm_d_x6",
+	"pwm_d_a", "pwm_d_x3", "pwm_d_x6", "pwm_d_z",
 };
 
 static const char * const pwm_e_groups[] = {
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
