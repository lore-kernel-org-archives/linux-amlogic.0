Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C1CCA0EE4
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Aug 2025 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5MGt9+tnM68lM0o+g8AQyKei+jaL+tr6kHP1KGDTZNY=; b=KowqyCp7YSzPIK
	McOaWLxshqzhdMtCX2SDQzBUdcd9Ha49puDOESf9sP1X2ZbalIxVa5br7k4CleFSnpuTguuDlcWqH
	7HvVbEYE5qchUSR2svces9C5yRbDmpjr01KvPs5Wr/LpRZktMYw5FmMTt4XvMCMKipJN9Yn2gotGm
	Qjy2JBAccGPc9wouMGHvzVu2tyP3BZ57jyLChyT87KODJxk/e4SPJ5XAymFPZxIeDQSmtLiCXREJI
	cwraqsOLQjhsXntI9CnvBK7lXFR0hnaQn791wc6qM6FlO/3w/vVlp246k6D73oMgPYWThusnOIzR3
	bRIK9M5OjiFDAzCm9n7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcU0-00000000J1T-3AAK;
	Thu, 14 Aug 2025 18:15:24 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcRR-00000000Ivw-0Nn1
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Aug 2025 18:12:46 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e87068760bso139744985a.3
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Aug 2025 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755195163; x=1755799963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=;
        b=fKfrenSy4MRv2eaMAxeEaJLHwJHI/sUh3jGzmJPflSg7DoBpxSdubHasJj+f+hz825
         oc3go2zXQFYFsKgrDfXvgDJV7CbqR61cJSl8MWhdBBo6NgtycHp47e8V2vLAZsAJhG2Z
         HocF+qv+sW9Y+ZgdKB3T9x1i3rtBL4ZV5cAeFhwchWvXWd0dmI1OHmIoPZfFausyR69i
         2CyMtO797rNQ4yM45oe6amaWeZer3r+jA65ZpvgbapMIYXSuBavjIWqhp33hnU1JXeHh
         E47AbBBORDRqv+i1P15IZWEsPRU/Wku9EYFFHP3kJq5cr4GnFrd36LSVqACvVEQTi+aN
         hebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755195163; x=1755799963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/dZvvhdpeV5T70CXzzhIM2ftvucviNjA+HOyZU3hVU=;
        b=qYBX3VKIF0npBni1gTQJycbRgacINIXDG1Ns1bYijEBgGTWwOkVlND6B0huhFn3bLO
         GzU9ZpwtUCjnB27PrBe+PlzptIWYFu9je47XbH3CpsAkTMHUymjlknFmGe+++QtjBTac
         ya1W9f2g3kGzJhX/R1zYXxzdLuZ+8B0WL4GTGoIOHBtLVi8Z2lWJlJExDcKx0MZeNpfH
         tF5Lmtxbp9ZO+oNLCh4hYVfg4ytVXHvT9wgjDko4cxnHRsI9PK5+MY6/TcHYvAO6s3hp
         hHPHM0hurniQz7Qw3MBsRdK7/CA1iCLsSkJovDbho9gHIraZ5hhJSxwg7v2Vdip8SFNV
         rUhg==
X-Forwarded-Encrypted: i=1; AJvYcCW9e7OngNGIdk6IaoTdec6SyDxKc8wCiUXwMRqmHsW/CMUWS1hj1cJ6Qb7m0ur/MKuaP7Dx4RpM4/vd/1RQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOlCwZil83rCWPa5q1icnA3JUKgjq7c9jSHhIC0FshY6F+M0OX
	n2CJB5zjIwmVTAMYEG6J961kTqEdsf80m5P+mldycks+FMk/3zdHUYNWJIk0JOd8Uw==
X-Gm-Gg: ASbGncttQ1XclCKysq0CnAoPAaeqUBYl1CbnoEtHnP5SOhGhfzh7pzti0JqnRWlISKs
	HdMM5nUa+ZvXEF1iiABC4UOU9NTcgziFdteJoHF7wm8zs3PSc5EfgPxpUI4jjirk3R0WupZW9H4
	L0mNKFX0rlNeuSaWRolSxyiKl16+gxePyEAm6+NEtaOeOdxPfT9mvHZw1q8rkNJ7TXQ3CSph7lU
	L4UDv3FhbxVFdfw8fdhdPIWQ4vzXnOGBrdFHWthrFrL37q3w3qsUn7OielWcn5CeZYJ4TGRnMAC
	9VepY9iQuTQ+K5pk0PHLiyKhk/Di/GB5WpoSglRkpiNJ0yg/jAp26+q0MAwVKNUZlxMUZlUzT6M
	muZc9QRyIRW4+BFuyLi/iY9jn72Y=
X-Google-Smtp-Source: AGHT+IHZet1Jvv8jg99HpAw6hDsF8fx3/AYC1SN8lGZ35gs0uFt1zck15oaDyeVmE3ge8wvu7oeH4w==
X-Received: by 2002:a05:620a:4055:b0:7e8:2989:1149 with SMTP id af79cd13be357-7e8705b5fa2mr627043385a.49.1755195163315;
        Thu, 14 Aug 2025 11:12:43 -0700 (PDT)
Received: from localhost ([172.56.29.94])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70af5c43392sm16269836d6.84.2025.08.14.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:12:42 -0700 (PDT)
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
Subject: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
Date: Thu, 14 Aug 2025 14:12:36 -0400
Message-ID: <20250814181236.1956731-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_111245_211616_809840DC 
X-CRM114-Status: UNSURE (   8.61  )
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

Amlogic G12 exposes PCIe clock request signal on GPIOC_7 pinmux func 1

Add the relevant pinmux and pin groups

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 8b9130c6e170..117e72b4ffcb 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -442,6 +442,8 @@ static const unsigned int tdm_c_dout1_z_pins[]		= { GPIOZ_3 };
 static const unsigned int tdm_c_dout2_z_pins[]		= { GPIOZ_4 };
 static const unsigned int tdm_c_dout3_z_pins[]		= { GPIOZ_5 };
 
+static const unsigned int pcie_clkreqn_pins[]		= { GPIOC_7 };
+
 static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GPIO_GROUP(GPIOZ_0),
 	GPIO_GROUP(GPIOZ_1),
@@ -721,6 +723,7 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(pdm_din2_c,		4),
 	GROUP(pdm_din3_c,		4),
 	GROUP(pdm_dclk_c,		4),
+	GROUP(pcie_clkreqn,		1),
 
 	/* bank GPIOH */
 	GROUP(spi1_mosi,		3),
@@ -1183,6 +1186,10 @@ static const char * const tdm_c_groups[] = {
 	"tdm_c_dout2_z", "tdm_c_dout3_z",
 };
 
+static const char * const pcie_clkreqn_groups[] = {
+	"pcie_clkreqn"
+};
+
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
@@ -1309,6 +1316,7 @@ static const struct meson_pmx_func meson_g12a_periphs_functions[] = {
 	FUNCTION(tdm_a),
 	FUNCTION(tdm_b),
 	FUNCTION(tdm_c),
+	FUNCTION(pcie_clkreqn),
 };
 
 static const struct meson_pmx_func meson_g12a_aobus_functions[] = {
-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
