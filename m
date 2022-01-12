Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15753C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 21:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxWcFR4PF2gNTc+LpyBH3yaqjBqC3XLS7jeJGvrHJP4=; b=ENgxyNHyOWBag2
	ZoUVEUiICbXZiinb3iW05BQ+TcSIrGaWFIWv/HkPVieJXUkCaUKNEJ2JOQKqXpXtyC8DyzB6iiYyc
	dDpERWNHWdjay2F9fv7S+Sa4clhEIkHohBqO24Wqk21k//CqfM2auLKGbPmlcDNq7Z3SGrVcXE5Dd
	usMOjyVSq6l7iY0gFWwG0V4mMByh/6ozOfqGCEhqWQsH2fB/5wi07/vGt4bH8NH8pbQY6muP+MjTK
	U47fHlAkPcnuhM/r4huI+TdbUFp/AcRmbrnETfJSkNTGSI5sFXM7QL3ZwLRAKFNLQoa/TfeiCWdV7
	B+xB0K6j1IJ/PKd47tNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kzU-003pfg-LI; Wed, 12 Jan 2022 21:17:08 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kzH-003paN-JX
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 21:16:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 ie23-20020a17090b401700b001b38a5318easo7435618pjb.2
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mq0Wt8Vn/qiiAup0Vg6KhdHWi/YhPSi9A/mE62zgcTY=;
 b=I2o/GL1Z5DElX/Ffgs511o4VQ1H+5gvy2qNgs9tm3qQyKkJLXirsZ7soF/AcGy6Rjq
 KBxr462PSJpcPy0gYJe5XJwVcVs5ovpAKVUAPZ5R+eUGY60ZVgIjazTHhG66ad4zZy4E
 v/E5iXihdZXc7UyogWRYzSRG/EjUEldgW6fzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mq0Wt8Vn/qiiAup0Vg6KhdHWi/YhPSi9A/mE62zgcTY=;
 b=ylzJtSTKsu/ZCZGtkfO96FnGtid8aW/nEjPtJnczbOY35yy6mGYp08ezfPdVFsINqu
 5kbljyIffQblASAlptAO5G/JafQPHYcrN3aemxfQYtBmbsUtJXU8XfnoOcWGt3H+8XJr
 TuMSY8ttGt8v2c7J5rW5bfmP6H59wQ34kYNv/Vh3sTRgA+u6iVvh6uSeVS9bztJoAQ1k
 U7isb9jznFtAnz1fchvL8t6s/A31zUg48o3D92rEFWGVieBGKFPpgBfEU1bSreccio79
 ZfGbkDTUMK/vBisHm+LYJ0eKq8f1c8kzbGyXEhBzl52s9hoL6gGZFq+WBJ88cbdfcuFz
 cMMg==
X-Gm-Message-State: AOAM533moKdX5gJ7I9kqyPgeqpz+py+t328LqBcm+kNO4SEcmp4z9+L4
 8RCMasSI/0LWBQp5rAtk6cG1nXvId5kwdQ==
X-Google-Smtp-Source: ABdhPJxpidhGuuJTbkVqZS8M496Do+5ahd77nK9hbLfhJZQp2xJx5laJfxjGwF06S6/t0BzCo4qeEw==
X-Received: by 2002:a17:902:e74a:b0:14a:3b22:5ca5 with SMTP id
 p10-20020a170902e74a00b0014a3b225ca5mr1286766plf.96.1642022214506; 
 Wed, 12 Jan 2022 13:16:54 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id h15sm507192pfc.89.2022.01.12.13.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:16:54 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: meson-g12a: add more pwm_f options
Date: Wed, 12 Jan 2022 22:16:40 +0100
Message-Id: <20220112211642.2248901-2-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_131655_659904_7493AD4A 
X-CRM114-Status: GOOD (  11.51  )
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

Add missing PWM_F pin muxing for GPIOA_11 and GPIOZ_12.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index cd9656b13836..d182a575981e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -283,6 +283,8 @@ static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
 static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
 
 /* pwm_f */
+static const unsigned int pwm_f_z_pins[]		= { GPIOZ_12 };
+static const unsigned int pwm_f_a_pins[]		= { GPIOA_11 };
 static const unsigned int pwm_f_x_pins[]		= { GPIOX_7 };
 static const unsigned int pwm_f_h_pins[]		= { GPIOH_5 };
 
@@ -618,6 +620,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(tdm_c_dout2_z,		4),
 	GROUP(tdm_c_dout3_z,		4),
 	GROUP(mclk1_z,			4),
+	GROUP(pwm_f_z,			5),
 
 	/* bank GPIOX */
 	GROUP(sdio_d0,			1),
@@ -768,6 +771,7 @@ static struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(tdm_c_dout3_a,		2),
 	GROUP(mclk0_a,			1),
 	GROUP(mclk1_a,			2),
+	GROUP(pwm_f_a,			3),
 };
 
 /* uart_ao_a */
@@ -1069,7 +1073,7 @@ static const char * const pwm_e_groups[] = {
 };
 
 static const char * const pwm_f_groups[] = {
-	"pwm_f_x", "pwm_f_h",
+	"pwm_f_z", "pwm_f_a", "pwm_f_x", "pwm_f_h",
 };
 
 static const char * const cec_ao_a_h_groups[] = {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
