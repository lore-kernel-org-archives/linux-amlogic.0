Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F13C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwf8TBxcpdn8NBOXmyT8h96rldzhyFLVQSx6pxRDy7g=; b=PNHeR6u+Gkb0ft
	JhFuQAeT3+Jr2xSrzCbAG0EscBu8ROx0Z8/0s9iS4B+hzcT7kOc13BtsIEtPhBPZGXqc5zMxrU5cE
	w/Fpteqhtz0/3io58D8yTBv2cPm0OSmvtKZcPFdelCu1urkh/FFoZ+tZCi5swJPBT6Y1rsHY1Nv7v
	9JEu5pWxByrF2DmRk/1VXakbvkwVKXfkwftEiIpdemd1zt5sef/6SoJOFtaB+86TbmoZ1lfV4I/rj
	Gm+RgIfIMtaKMHeJqDNFgWULUtWoc5UeRbi69+D400AoHXyl5DaSJgmZJ5NtoEvXdZaZKS35tahRv
	/gAHdh5X2p/0FkqCkoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkI-0000000AwuY-3QQe;
	Mon, 17 Jun 2024 13:50:06 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCk3-0000000Awhw-4BLP
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:49:54 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-80ba034bb3fso1369425241.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632189; x=1719236989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Zs4CGtswXRcL4r5zLR2D5+LAoG+l8N82wbiM+7ownU=;
        b=qY0q55DHIUhO0iGnnmUPAmyPbfIpDj4DS+8DQ2Jbut6PZGk1gtIIMWVLfZ3IcMS2DT
         QjSbCEHiEFdLoNQiMbB3uDeShDPidD/7/yAJ9QlWwGKA/Gn8iCarX1Qf1+XThsZjwLbD
         1emZA3G9UmvTzne+PmhjcdgV4mhpN7yAq016mu2YoePRMd7fSdGh3aLTfdHefFp91J0S
         KZQgrH5Bf+mSbVt2UGKKtSKGZWiHJdghncDUdGTo6MRQXFioENdZJBcSkiJjTHEK7BfN
         TbqWlSfHMaexCnrKz/dghX2z5FbgmhAmhgVxb+lDr9HdP/F7V4M5Z2s7GcPhsVDnSlk7
         cDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632189; x=1719236989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Zs4CGtswXRcL4r5zLR2D5+LAoG+l8N82wbiM+7ownU=;
        b=SdpTMw1PGpviFGSnlUnCsGgv3t7mQqsw2WuxkLXGTpGFn3v00t+rErKU4NK0D1xzC8
         1vEFH3tq1KVYSBss34ece4oWvSMF9SVgu82K4yV6lC+lmvH3NK+3g4wVNrVkgH3cs9tS
         alyAk45s62qgxbMBUt8wgiSjtb+asgsfCP/YTfRVRv9OvmLxAFCCsz7xRdZfUVQLf7sS
         dPE1TMTJIdr6ayRsdU2DQ+tpqofaSRZoT67ycQEAkVas1wQh+ZExTR5iHRYMCfB6e73e
         Z8iYP0nRHuX//7z0aPyymeYEls0gy8QjTw4EY9yXFtMxVd8agFlP3I4DA6yfdAklssAC
         S3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrmZwWTsBcM9iXLT0vIscPc4xZR51tK0P49GHP7zIothiwn8Lp6Oep6Z7T884QDdLLCqP5qJm7TkegaAps5o7wvdQqtj7VteK0+sITnfowlEk=
X-Gm-Message-State: AOJu0YxbG5fSf5Miwz0rpJety6LyiaESADtlNJnNSlR41lnV+/7n4sSh
	iSNjduTFIvf9P2g4bQ50uUpXNv1QgyFAA5vEg0A5L/9bOM60yU8TE9DH247bJp8=
X-Google-Smtp-Source: AGHT+IEFmgHtaGyOVxmPD/zpG+S8mAUnggR0FqGzztaCLAyq4bVNR5GtCNAnJm1CQv7c1xou1ffjIg==
X-Received: by 2002:a67:b902:0:b0:48d:7702:99e2 with SMTP id ada2fe7eead31-48dae3e00c7mr8793212137.31.1718632188950;
        Mon, 17 Jun 2024 06:49:48 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:42 -0400
Subject: [PATCH v3 02/41] iio: accel: kxsd9: Make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_064952_262974_3AE2CF9F 
X-CRM114-Status: UNSURE (   9.65  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWNjZWwva3hz
ZDkuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5LmMgYi9kcml2ZXJz
L2lpby9hY2NlbC9reHNkOS5jCmluZGV4IGJhOTk2NDlmZTE5NS4uMDNjZTAzMmUwNmZmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lpby9hY2NlbC9reHNkOS5jCisrKyBiL2RyaXZlcnMvaWlvL2FjY2Vs
L2t4c2Q5LmMKQEAgLTM3MCwxMCArMzcwLDggQEAgc3RhdGljIGludCBreHNkOV9wb3dlcl9kb3du
KHN0cnVjdCBreHNkOV9zdGF0ZSAqc3QpCiAJICogbWFrZSBzdXJlIHdlIGNvbnNlcnZlIHBvd2Vy
IGV2ZW4gaWYgdGhlcmUgYXJlIG90aGVycyB1c2VycyBvbiB0aGUKIAkgKiByZWd1bGF0b3JzLgog
CSAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhzdC0+bWFwLAotCQkJCSBLWFNEOV9SRUdf
Q1RSTF9CLAotCQkJCSBLWFNEOV9DVFJMX0JfRU5BQkxFLAotCQkJCSAwKTsKKwlyZXQgPSByZWdt
YXBfY2xlYXJfYml0cyhzdC0+bWFwLCBLWFNEOV9SRUdfQ1RSTF9CLAorCQkJCUtYU0Q5X0NUUkxf
Ql9FTkFCTEUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
