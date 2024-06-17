Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D2CC2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYIFOTuinNWw9H0+koFafqPnGBUvI8/piBoBtG7nVTY=; b=dyUYUxxqT0hIFB
	+sP428Mp+XdIaLpqjFsl+2YBjuf0bZyFV2MPchWbiTWm8cHZ6he/YPDTgmbiz2LNeaI1Cce46YIBq
	+nJXE21HEQI6NzrdDvu4NoRftJj1y0Q+lh17dPi7sTDOtdappCstYKcJzmBjoxSpFiLZnmxZhSmJa
	GOHGk+w4xOmXcq9on4iVHl19R22Ne90Q5opll6KN1rdJUPbVsp+SLJYK5mlfA+ljPyE23eiVC4WmF
	65HsPprNkdF+CjemuIvddFPIxxYf5+eq6S+5ajN21sAfH01pXomWZyQSEL4Vwx8cPb/GZgF5jQWwW
	vGcnz7Ogux1hV2EALsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkF-0000000AwrM-2rWw;
	Mon, 17 Jun 2024 13:50:03 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCk3-0000000Awih-44qZ
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:49:53 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-795a4fde8bfso264070685a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632191; x=1719236991; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qpLBIScyQiW6pZURHAKIC6sw71J1lEFsgxMlm6mPzw=;
        b=yVZgKwHk530v03/MT+KAndO/eQMEd08pC5cQXCX1gXrQdI8PrhRaA8CJmT0QrULoIY
         /QJnMt8QTl/zAXo1AG8bz9/qFuWSfI9ZbQBO+B7YFkfB39RRuNW2XcGZ9ty1vF4uostS
         IzKsXs6fWDpS2FlxP1XrwNgwEYIyZxBKK2VIohcy042O547bQx2ADKCPoajWcUgBTV7a
         x4kaktg9leW6n/vd/5PsLEWiQST1Nh3Z809Vm0VaxFWbkVNxIJ/5wucESK2WkHZFLS5q
         WzOWJYYsxrQ5RlbxvX+D27pu+ZGptKeraHtAAJFW7d/qK/1X/ijRBtP9c38eLFlpZUrF
         UOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632191; x=1719236991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qpLBIScyQiW6pZURHAKIC6sw71J1lEFsgxMlm6mPzw=;
        b=MWFfd8ZGegtUN7MDZ3C9uufiZlek74qzW0pp0uUZ5VHlTx7aksqxG2FK+efedN7aL4
         tmXh+twsGyglNb1GT6FsYD+2+qfolIljKF0BSDCB5dr6Do6+UrTkhT5FTCU/u/u36Qaj
         iLKV0uRgIxGVEvgwG7wunzLQbYxN/PE73lrX8SE2YKoJ+CzQoj1CiaOAMUzkn0Se7JmT
         nonAwhHeNJBfo+VM6gbjuykJm7n2FOa96jxaZxOHxRS6FGfpOK2uzxhsxR7c7DzPigAa
         +1TcxOQH9dnK+8KK8L34wsSw+TBvXee4N5r1ORCyJBrfjtLJwiUHTPDL3O9iK4JZJ19C
         as5w==
X-Forwarded-Encrypted: i=1; AJvYcCWtpcFIaF/KPPuk1e0KlaODEcrHMdoWtgIvzgXGHOUTyYcs0icnxgKn6lWvYaO83kQjWXRx62M+tNE+pwBpsXM3Qj4vXN6W2BhazVO74XLKpE8=
X-Gm-Message-State: AOJu0YxdXP5uaRNGVsO+EHHMcxWbOCenkEhW2+l+coQNLBQH6Ptcjmh/
	HdcCHqIRSUT2z2gjSfJ7+Da7cKh+HwAPgnR7obqT9vxzOjlTq70KSMIIsary4/0=
X-Google-Smtp-Source: AGHT+IECnYQvKUI7WwTgcSFed1zXdKR1H19TPysNu9rY9UY+uM67szMwUskr66DbaCdyM94wmFAuyQ==
X-Received: by 2002:a05:620a:372a:b0:797:b2a9:90a7 with SMTP id af79cd13be357-798d26b9321mr1211989385a.69.1718632191103;
        Mon, 17 Jun 2024 06:49:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:43 -0400
Subject: [PATCH v3 03/41] iio: accel: msa311: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-3-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_064952_232640_2EFB7347 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWNjZWwvbXNh
MzExLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jIGIvZHJp
dmVycy9paW8vYWNjZWwvbXNhMzExLmMKaW5kZXggYjhkZGJmZDk4ZjExLi40Y2RiZjU0MjRhNTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jCisrKyBiL2RyaXZlcnMvaWlv
L2FjY2VsL21zYTMxMS5jCkBAIC0xMDM0LDEwICsxMDM0LDEwIEBAIHN0YXRpYyBpbnQgbXNhMzEx
X2NoaXBfaW5pdChzdHJ1Y3QgbXNhMzExX3ByaXYgKm1zYTMxMSkKIAkJCQkgICAgICJmYWlsZWQg
dG8gdW5tYXAgbWFwMC9tYXAxIGludGVycnVwdHNcbiIpOwogCiAJLyogRGlzYWJsZSBhbGwgYXhl
cyBieSBkZWZhdWx0ICovCi0JZXJyID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1zYTMxMS0+cmVncywg
TVNBMzExX09EUl9SRUcsCi0JCQkJIE1TQTMxMV9HRU5NQVNLKEZfWF9BWElTX0RJUykgfAotCQkJ
CSBNU0EzMTFfR0VOTUFTSyhGX1lfQVhJU19ESVMpIHwKLQkJCQkgTVNBMzExX0dFTk1BU0soRl9a
X0FYSVNfRElTKSwgMCk7CisJZXJyID0gcmVnbWFwX2NsZWFyX2JpdHMobXNhMzExLT5yZWdzLCBN
U0EzMTFfT0RSX1JFRywKKwkJCQlNU0EzMTFfR0VOTUFTSyhGX1hfQVhJU19ESVMpIHwKKwkJCQlN
U0EzMTFfR0VOTUFTSyhGX1lfQVhJU19ESVMpIHwKKwkJCQlNU0EzMTFfR0VOTUFTSyhGX1pfQVhJ
U19ESVMpKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGVyciwgImNh
bid0IGVuYWJsZSBhbGwgYXhlc1xuIik7CiAKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
