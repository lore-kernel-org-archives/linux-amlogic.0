Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D483C369A5
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1tfv4heTH8s5csib2Gso+wHS7Wr1+8P/gylq6cuaoM=; b=34unIHMJb8dI+w
	PeJQO/MgyaQNkFYCUSHzgM0loA4Ss3dNulDNqskGgElnGUxEcJAU/IwojEucbh96W7NVisQWeKX2F
	rkGml15HYlO9fVezUgykhGPKdN8/aciiSZf8fvXjAIG7FSwVn7NZan2BKwKZqxTjG9gE2w+XP2P63
	jcGmVQjc8d+YAMrVfO2J7JaSTPh35hzt+lOAXuS8GO1birvPVBz3HNKQG+lMZNLHhmh+tVtOJdN5c
	hXYaL28T6pts7/XBJ+v7XaF7H7vZmeiVkHl9fXvuYnXaz0LVxMAEEsHU+7Q3EC2CwANUFnt6EB4aG
	qWO6Bdnp5MlLMBx6hutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23T9-000000035Ij-2gNA;
	Tue, 08 Apr 2025 07:34:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23KR-000000033CE-3SRM
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:25:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so51293425e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097102; x=1744701902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=Vz6Geq9q2+zUYRrxxp6MASbOhaLXImkz5UoBp5ZHi0fP79Bq2GmrK6b6QTUfKDpok6
         hYkmX2cvYR/V2oeH10oOShWk1zvBI+KE0//K2HmbiIM6A5yS4B/ATB/GycK3Gm8x86hn
         z3Sb/wUnUB1RK0j4WQJlQ2K0xDgPR410bNlUbQkwPe7HcIejTNBc73fiHRAbCtPRyt+E
         vJjvN9uHaC5isfqs/OlhVgj3AeyATxD0nfHnDe4oZfq5MeCo7EAJfnP+a7LFgxLtiMuz
         nJO27xeoDQDT6bXKWFcsxrMzcQGoeESaSq4l4KMOHw66/WJyOWufrQ+p2b1HT6Kw976K
         hAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097102; x=1744701902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=m0N64RkKRcWso5/L40fCyKXTXlU7cfK6VgMxI01usFRGnQyK/U2zZK6DOYrR9BJk6n
         VWYJEQKJex8oxEbCBfNoGfbZIr7b4s9SFj7Q5JTZT8VDKdhtiYko0IegOlo2nn4YWhH1
         De9QreGlwSweDwcjIP+EW08TLuVXvv1e94N7vCtSbMFv/5GwIihqRbc+B4Futbu8YWpr
         h1OqsSZ7Ila4nYgAwdq7ZL4SfWV3i8No/clSIE37myYwIzDKyq0nooV+drbMgP4DPMvs
         yVF7t6DUVRCYR0Z6dvxhC05UDfEPNxIJBUUfcOdhAExCVhNMQyBCHi06y1ees0U/pCWI
         Spwg==
X-Forwarded-Encrypted: i=1; AJvYcCVwaRODoEKR4UnxDvI1pW4AwTJroo7qevHRMXEHmEGimnTLXFOgj/7A+2XBEhz2qrUiISaViPHs2/YHXA0S@lists.infradead.org
X-Gm-Message-State: AOJu0YxXyBATeDDW6FstPBDkg0Md6A9zBUgp9FWMYQJGCF0TKNVpFwzu
	tLUY3mZNwzZ3hCpf/vbDG6ojUggtjFGY75Pnesl9pHxFZ8NqFIoWmRI72+iMymQ=
X-Gm-Gg: ASbGnctbgvNnsI7Vi/a6x9/1I4GxdKvFWwiRF8xJTuBA+97qD/5y2p1SDs6604b1YbJ
	h0RWNNlwB27NfzV+7YRkT68xlFS0vqAtNULJrf+K3BbTlPIiVURkTXaBa/1xh4m8oMHiwYs9bu2
	N2SSUndF8OK/SVwhgz4F54KN/KXpJ9FqIAvMFdhNzY004mkO6xDukWgUn90mpBRW733dJjlHRpk
	+R5o4zXsOYg6PGPLwNnaVL6OLooX4KRVSCslS3VofHswciKUixFvgVJQ+UG7l0/x4mS06W98p0O
	T80BpTHTnPlMEe+8qCd+a/PA2ODCd+LnQQW5hw==
X-Google-Smtp-Source: AGHT+IHzySH+p8lRsbpEKp8XdjRw3BmN8WdHjMLgCKHMXaLLom4rGv3xsF4growXW8khurtrZ60whA==
X-Received: by 2002:a05:6000:1846:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39cb36b298fmr15212511f8f.5.1744096677281;
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:44 +0200
Subject: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
MIME-Version: 1.0
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YmzRn8TzGA6hsDQ4Ls1ViAlvgo7b9jMn9Wlo//Y9vfE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a3aI8tyRJWFB0j50+lYKjuGbu/ifeaeFQ/
 4M0t4m17MyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnJ4EACh4EPB2PiBQrpFxrQpn3I5/hHOewyCLs6D3bGW26OisrbJ6BrXg5SN88KZnurmvDHsuP3
 MvwP+6leXhNTitXtnj5TQxtJin6NVZ0Al8MJyd9xwa21k8YTlRMm7rgA4Vx9CNvjDV9gf5XOdBF
 o3JYv1QhJr/SgcdkDr5Ox/diUgdt5Z+bjO2zMLW0i90TN8XxW/blNaWT5xnj070aBbwHIva6E+l
 v1y1VlHp/I4MrpZmV4MtqxBFHCOAQZEOd+itR+n/S8LP50+qens7NAVqfZhfaQQ7KSmLbRKJpm5
 kiG1CDXKTkVqJunSULnVtRahqu1J6ZcmwDJeXTo5PtKQZiFIlUHRjOs60Av24wdhwd+FY4ptQOp
 pU+EYeQcKSLcEMkga3AqSlN+IrU5XJAo9Y4FLczzGc6/9kTe7Y/MLq04J3fmVsp5KDuJR98aytJ
 6m/1/sJrIyiE38hKgq9Ta2I/s9/NjynRehGmP87FTcRsCV1bnl97G4/o6CZtPg/knk7WmCFCogS
 WBIkWDQrNxAYw16mjSeY+350vXO3jYh+7OIbRVqdjqYiZKSAy9A2h4HULcXVra+fEX2z6ALsNmI
 gsWEWEJpEXYy62lnL9J9OTf1+ihsnQZFt0jOnnge9cZzyJTQW7bhCj2GDkVkcgK5wezSQQbuork
 C6IVZWbEkEfQnFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002503_863121_BD72AC60 
X-CRM114-Status: GOOD (  10.37  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase the build coverage by enabling the sx150x modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..94eb41bb9cf2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -541,7 +541,7 @@ config PINCTRL_STMFX
 
 config PINCTRL_SX150X
 	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
-	depends on I2C=y
+	depends on I2C=y || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
