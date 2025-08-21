Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C650CA0EEB
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Aug 2025 03:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b+JeXuxoBU5c0ZG4RJrO4FRtF4rOHIlhL++VsmGI938=; b=tT35f7oHnmqPRv
	YcRiTWP1HzFweGVNBXz/A5GeuuOL7mW02hy91a0vfO/VsEH7jmpmTOB6U6TLPgrtuG7thgAKUNJph
	FOwRNcwZF6HBESdoI/3Lc6ISHhW3v3RbsE7oAePBDoEpkUBf9A/A3kio10NsndAXhDG1VMVM6y2KF
	pBZF5ecD/XhffkmBBPpCm4npl9UYi7bXhSb/6ixc4wPq1GEUHtqUcYpvo0s2q6GRyPejcypOUvw5B
	fQtF8uKf5SQ60Gsnsh0rrg+ODehzzC8TxN4RbSYgnDOnyB8FGVlTXuojb/T4xAMDaYAvLhwQekC4o
	Jgnn4GGyn3NGD9fc/meA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIlK-00000001RAv-1a5j;
	Fri, 22 Aug 2025 03:48:22 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEmu-00000000waI-1itm
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Aug 2025 23:33:45 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7e8706764d2so208561785a.2
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Aug 2025 16:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755819223; x=1756424023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=;
        b=aWy+ED+ePTLcS+KxPESAaIqz1QSv0yGRYPbOZK1qJcXOxyJjmEXy+JdUx8yg6vc6DP
         7F6N9KF1FWoEUIrrV3BxCJtlhHuW/ByjqzuwEGCIuZBqnFq0e5ekPdz9UTbML6cdYGC3
         1T+xuOzrnItkJqY4CCJ5tjUebOv9u4FFCfIA/DfZyfdOLqXoB6pI6VvgBEd1Wo57IzWO
         qeBp7EN3ewkZmN6MQHb0mjvP2ykRdTyEikm5XqI0tuKP+rSNCHCGYSk8OGB0VHIJpJf7
         H3UmiCqPzHZoZjurjognf8FFcL1ovKS0bsyo1mAzoDliMVxiZWi2GRM+kUnAgV8NxHTy
         /hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755819223; x=1756424023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=;
        b=f8NNRT/kt0BcmqnnbdZNBmc7CfO2j95vEtbd/3xIhdjRhkK86aV/zkRuNuSlvjG00g
         kLM3wvkBOIE3oQstVA6P9XNv9jH1l6eHIQJ8BdPyGSiIfGzX3Ejjp9Ft26g6apuq+KL/
         NnD7wtAYXNf/h06f3olnAVxILgmLfkslyiv5j7WmfhgBkKKFGIR52dsWETS3vObh0AKB
         WIHOa5TR0TBREeE6GEI2n+mgSm7TVccFsh6PYtJU0L93HPs+zhr7ODUSmNaoGynfej0D
         NxRWsPNMTERHtQrHj/KYek6CQRUjTTWrNyKVMevBqMWDZtAvIL1oyzfGDQ2GYnUHQ0IE
         LbtA==
X-Forwarded-Encrypted: i=1; AJvYcCXbuS1QGrxUe2IAC3D1WneW9ImTtR82Bcrc0HLjKonRXFwwMibrHdFE0uXlg3kTKdEQXndqPyFQhD7Ty+rw@lists.infradead.org
X-Gm-Message-State: AOJu0YxM3RvLeyYhkZj1V1B9iv12OoeHm9WvB2G3MydHGcJ2JjkBahny
	X0LsDoBNSRMUbwEhF9e/bTm6GCnuPpx1+37RmHBLGWXqZyXQyqngKi+sQEpshG8slw==
X-Gm-Gg: ASbGnctTuGkVfXqe5mXUo3YCBHTv/jwzLXS8dXILko8O62MHdDm6IxQnUItH/JKhQZc
	YUprBU3cE9mWe3G/+6jodP5vdXPRyiBI1J2iDZQR5ANw/iwOX48KoLzWR/Up9Rg1+dCuDRD6ENR
	OdW9Xup0fxsl1dYj6DoN5My0CRSaj/9bmmM5yvqKE7wYSglizlyq/+PSabwt8pNQD47QjLPfMh7
	4wX4yipgmMaUIW6BKxambovthXlC0y0ElZfgOTMWmzqTKyUIXTrBeDGivnKn6vbGMGVRq31MBqj
	dzm+QSz8aiTSwRGpnPOWufAFrOH+rEN0a6T8RQLMNrALfJfwg4TdjHlLIipLiKDacsMDEr1RkzV
	hBWQPUO5MGaUQsXZhZitA/l3rWjGUxw==
X-Google-Smtp-Source: AGHT+IEE8fYgK55NmdoQhhgPInOhivLoo6o9lQD203iWvd3p+5PTTXRIeOG74yZ2ZatbGTKv9Gbgbw==
X-Received: by 2002:a05:620a:4590:b0:7e2:23c2:e55a with SMTP id af79cd13be357-7ea10f73cf5mr175527285a.27.1755819223112;
        Thu, 21 Aug 2025 16:33:43 -0700 (PDT)
Received: from localhost ([2607:fb91:3b82:29b4:add9:bee5:e413:378f])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e87e0204ddsm1216833585a.10.2025.08.21.16.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 16:33:42 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-gxl: add missing i2c_d pinmux
Date: Thu, 21 Aug 2025 19:33:34 -0400
Message-ID: <20250821233335.1707559-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_163344_461731_AFFA3E1C 
X-CRM114-Status: UNSURE (   8.63  )
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

Amlogic GXL has 4 I2C attached to gpio-periphs. I2C_D is on GPIOX_10/11.

Add the relevant func 3 pinmux per the datasheet for S805X/S905X/S905D.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 9171de657f97..a75762e4d264 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -187,6 +187,9 @@ static const unsigned int i2c_sda_c_pins[]	= { GPIODV_28 };
 static const unsigned int i2c_sck_c_dv19_pins[] = { GPIODV_19 };
 static const unsigned int i2c_sda_c_dv18_pins[] = { GPIODV_18 };
 
+static const unsigned int i2c_sck_d_pins[]	= { GPIOX_11 };
+static const unsigned int i2c_sda_d_pins[]	= { GPIOX_10 };
+
 static const unsigned int eth_mdio_pins[]	= { GPIOZ_0 };
 static const unsigned int eth_mdc_pins[]	= { GPIOZ_1 };
 static const unsigned int eth_clk_rx_clk_pins[] = { GPIOZ_2 };
@@ -411,6 +414,8 @@ static const struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GPIO_GROUP(GPIO_TEST_N),
 
 	/* Bank X */
+	GROUP(i2c_sda_d,	5,	5),
+	GROUP(i2c_sck_d,	5,	4),
 	GROUP(sdio_d0,		5,	31),
 	GROUP(sdio_d1,		5,	30),
 	GROUP(sdio_d2,		5,	29),
@@ -651,6 +656,10 @@ static const char * const i2c_c_groups[] = {
 	"i2c_sck_c", "i2c_sda_c", "i2c_sda_c_dv18", "i2c_sck_c_dv19",
 };
 
+static const char * const i2c_d_groups[] = {
+	"i2c_sck_d", "i2c_sda_d",
+};
+
 static const char * const eth_groups[] = {
 	"eth_mdio", "eth_mdc", "eth_clk_rx_clk", "eth_rx_dv",
 	"eth_rxd0", "eth_rxd1", "eth_rxd2", "eth_rxd3",
@@ -777,6 +786,7 @@ static const struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(i2c_a),
 	FUNCTION(i2c_b),
 	FUNCTION(i2c_c),
+	FUNCTION(i2c_d),
 	FUNCTION(eth),
 	FUNCTION(pwm_a),
 	FUNCTION(pwm_b),
-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
