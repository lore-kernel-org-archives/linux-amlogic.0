Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A0BC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkr/0zSm79NScoc57cPxr4Wkoj2rxwhRJ1HUfaJD8iQ=; b=R/Uk5xJiRZJChz
	71XBAh8LoCd2D5vVqGK5RRgCNmg0Y/i1dWgWdDbYmYE4pk/I1DdGg0VyT5KqM24GeroGQVrouBjE2
	g9syS3TINcoT2srM5K88/SYCGDaUfQzNTFd7PNfP/Z0bvRQWoIhbsECY3MWCp2pUfYTFbBjeOH39S
	hWlwJBaog0iFZLSgYHy126L1IY54c8M6r2x3mybRRDxX1b6ly9nXDZ6jsg88bku3FGhAjPOeS5rfX
	uBixhoxfI9+l5PMHASCQzNPIIPTAtk5mMdREfBQQ4iBrvHHmRPf+SwQKmZC+/eGaZFaKBXriHn/n5
	KG6sOUgJrm6WARp+Q18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PYJ-009ONc-Nc; Mon, 03 Jan 2022 15:47:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PY0-009OFw-MX
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:46:58 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so37960713pjo.5
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mGd2tehqllUPXzMzPxa45XALLgMArX9xtGYlZrmeREY=;
 b=WvtxB1ung9NzUxIWNt+S8bbVr7Oo/WYuoF1OH9gg15H9VGzCZDxkFMYB6WJB0j54PM
 Eb9HjuoT5rA5xMB3aY1+5NI5/68dutfwSltaz1WOMLZGjc9BOAqXKEF7NDoZRUGGmm7e
 u3crLy0GnKkTWuD2EUHEusSLAhntfBkG3uAYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mGd2tehqllUPXzMzPxa45XALLgMArX9xtGYlZrmeREY=;
 b=DUin8YAk4ykkz3uyqLQ6xrCTMQYuBsm4BIcHbahaYHsEMHG67e64G9YSbJ5FAlboDU
 uqAMppKeaKLu0p9MWI3hLQbNYbbNC+aE7I/o3quOYUT8yz1PT0QpzwW0+RQc43u75bzd
 CPNrMIlIihNTuSYYQf3erVQWGOKL5DLwIwd71vu2vAKZZPDKSIsnYqEbwssWc/ZTcbzT
 YJgay7owfNaWxx4K7yeP2aZNTHvLIFTDsRVVkNN0By6LheoWEbRCA7AuOsPdo08HYlvT
 1p7l06XTlcSVU8DDXd3mg+SkvNTWd5cx5w6TWBJFyNdljJVL68MtPWMDHBJDfLCcXw/3
 W9fQ==
X-Gm-Message-State: AOAM530ym+Z1HC52iyg3L2NeX5wByIy56UEtktSX7eCZ3zaUW5xo0Ikx
 F2R5q8Hw4j7kh3ORRaumHdqnYSgzJoIZJQ==
X-Google-Smtp-Source: ABdhPJzUBnOMa3u341HSV7yD1MmYO/74k9hrxYCcrAiKRckCANPf4WLP8hN5nqUEW6OFbqayue0rVQ==
X-Received: by 2002:a17:902:8e82:b0:149:b26a:b9c8 with SMTP id
 bg2-20020a1709028e8200b00149b26ab9c8mr10850854plb.143.1641224814429; 
 Mon, 03 Jan 2022 07:46:54 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-idf1-1-1088-186.w82-125.abo.wanadoo.fr. [82.125.191.186])
 by smtp.gmail.com with ESMTPSA id l2sm41080153pfc.42.2022.01.03.07.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 07:46:54 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: meson-g12a: add more pwm_f options
Date: Mon,  3 Jan 2022 16:46:14 +0100
Message-Id: <20220103154616.308376-2-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_074656_748311_6510E75F 
X-CRM114-Status: GOOD (  11.21  )
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
