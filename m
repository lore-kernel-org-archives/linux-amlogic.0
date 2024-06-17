Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6CCC2BB9A
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8YULb8v1sn3GDlNsUVTylV3HxE+kmj1LUMr99y6lFU=; b=XbWQjhTLYpzA0d
	Dg+sQ0o9I0iOR/0hAlM1rqF9jfqN+gyDHpUyZlZLSOhstd5EDZMaZXOaBaj8w52hHP4c0nWsGREf5
	Ash6nybnYk70k0NC64rU9FWPSOmwjULROATcxYintmwLrmQ4nV9AnRtSNUuuXp8HM8A34RKqM/gey
	3sQzSCK+5DaZUVpkRdVTVx/vLyAJKXV/nhv04NCFjA0V/59mRb35iLMjuN3UwBz9vDvKli2dnhoYK
	Bz8+rl5vybClKf+yTegdn0eATijWptTeYC0Fmbw+HIkeNPDlQWUusdFYPwhc1WZAJ6njf4E3/GrXG
	/XXG+aK2oAZTu2+/8b/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCo0-0000000AzsS-12pd;
	Mon, 17 Jun 2024 13:53:56 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCl2-0000000Axby-3urt
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:58 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7955841fddaso361935285a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632251; x=1719237051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
        b=cg3m+UNm5cj53SiOCopffSu2NrqsqVryVEFNFdIQ2hXMJcsvJQo++7XitZxgt5zlxB
         Wr9+hcNO9yCxxGweqiXArTiyE8iKuLVHMFhyQUQ4eVBTPzDQ2Ho82FKUT4BggamkdXEw
         SpyRd4mgH7lxwIEo6fqCqgBEc+P+IIeVwG8lgqcUk0bczTDx7Ra6SDCldl0jiynsXtek
         De3pF4e1+MDj51KBNO5K9FlMQ/ExP+Rd+d+05S8QLDX2iCjrsKyz0EBpYjSllaqh/xYQ
         pQfzgniJvZzr5DkJltiGPokl+X5YzWub84S2lZpxIlWa3DYeFSEnzHTz/VQ0YE70fEdN
         wL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632251; x=1719237051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
        b=CVVdsZZEonvW9wkn/qjthdAD0ah6pOtsWz4gZqqOt3gvsfv8Zjm1BPFTXCkQ5FkjMA
         r/36WW6dxNLF4w00LpthtMqJDjm6uDTQI0bnAjuHy+osRHOCXgjsgFgTGPGjAdmAEJjW
         UHrxln7NC6QLgYvpOdDvuvJG/xpMIJHgOdmQrDr71QwEFyxdViDQjG5RQHdc34uk6k/D
         dEL79YOs/Oms9GK7ArlMl3kGS3znQYUUI4xz6cOQ+EuRJmHFOlk5EpeRfTWuiGKyy+wS
         Bb04JOmWCJNXCNdrE5epHfM2wU//yyLis2tc8x9pGGnBuUDhAZ5zWfwISCYphDMAQ2Yq
         j1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpX9BTlC1bq1KlDu1pr2U82bhxcD9NfSt5n8RoYqlR9IQa0uImrlYkG60w0DH/o1AiheNDSc4exwn4D4MtQjaIbF1aGfzBj05kbtCmEKKLjwQ=
X-Gm-Message-State: AOJu0Yym9o58P8paTAs0eGbqdpG0lyxinUYH037G+hPi+/PKOeU4nEsu
	lxzjR8nyc137oY7xwOQpPXo6BzWcYGLadckRnbQez/9wmUUfbjTAh5oYtJiX4Eo=
X-Google-Smtp-Source: AGHT+IFhD2JefGeiJgsg6Ae7QRIe/BDndSP0Z/WiCRPC91zIn6+wpqBzLsiQzn3/JIP4kN+hagVe4g==
X-Received: by 2002:a05:620a:4056:b0:795:56a1:6c0a with SMTP id af79cd13be357-798d03b78c4mr1852443685a.30.1718632251285;
        Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:11 -0400
Subject: [PATCH v3 31/41] iio: light: st_uvis25_core: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-31-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_065053_315826_5D1F29ED 
X-CRM114-Status: GOOD (  10.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvc3Rf
dXZpczI1X2NvcmUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC9zdF91dmlzMjVf
Y29yZS5jIGIvZHJpdmVycy9paW8vbGlnaHQvc3RfdXZpczI1X2NvcmUuYwppbmRleCBkNGUxNzA3
OWIyZjQuLmZiYTM5OTc1NzRiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvc3RfdXZp
czI1X2NvcmUuYworKysgYi9kcml2ZXJzL2lpby9saWdodC9zdF91dmlzMjVfY29yZS5jCkBAIC0z
MzAsOCArMzMwLDggQEAgc3RhdGljIGludCBzdF91dmlzMjVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAJc3RydWN0IGlpb19kZXYgKmlpb19kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
IAlzdHJ1Y3Qgc3RfdXZpczI1X2h3ICpodyA9IGlpb19wcml2KGlpb19kZXYpOwogCi0JcmV0dXJu
IHJlZ21hcF91cGRhdGVfYml0cyhody0+cmVnbWFwLCBTVF9VVklTMjVfUkVHX0NUUkwxX0FERFIs
Ci0JCQkJICBTVF9VVklTMjVfUkVHX09EUl9NQVNLLCAwKTsKKwlyZXR1cm4gcmVnbWFwX2NsZWFy
X2JpdHMoaHctPnJlZ21hcCwgU1RfVVZJUzI1X1JFR19DVFJMMV9BRERSLAorCQkJCSBTVF9VVklT
MjVfUkVHX09EUl9NQVNLKTsKIH0KIAogc3RhdGljIGludCBzdF91dmlzMjVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
