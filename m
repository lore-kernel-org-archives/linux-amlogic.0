Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9169BC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0DHYaBhSJ4cvW7/FSy6BQFoUs4R+i7l2xsOgRmhapI=; b=cVtw17OoJazxVS
	Wd7jbB1qYjuu7fjoRQKTbuYNLn+WrojeJheCWpDVNNZbisfY0v/FwpYev1zLm1/IvqhYVJWRg+Czd
	nLGo3VJfjEnBRsY2g0jJXQZHT3h3gqCo24o6dqpYgWsKzZKs33ONR3hO7ucl0cZTGnfMYOEAfCzFO
	rFBheuJN0epcoyk0VbUULaS8ziYnYB2ZtUlKQ0S7804B913dHElaAoBoUQ1ISaAkiT3oYbQzkGALO
	KEkIkyGwSkAFDdVgVmtS+S7GCLihw2CfY7GVCRolUvo9y0R0TL7gD6967pb0XcdS/RWVME+bqhobV
	em+pg+7yQqS8nQQHDupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCmU-0000000Ayd4-0hjS;
	Mon, 17 Jun 2024 13:52:22 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCke-0000000AxFj-3wxP
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:41 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-79767180a15so302145885a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632228; x=1719237028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XakTIALlxEv0HYj2MxlbOtZFxZOxjUYZWhXJH4zlh0=;
        b=Y4kbC2qzRBRLdhdJRHO7JuMrWj2eL27tKZfHfvBlxnaTKV+i7BQfnBszyAgu3ZBsaJ
         tLpTGCz7yzxXCl+nT2MYfFM7agRM4fvdn+cKwGU6FCgrU6xEHylj7us2IBIy0L8WYqvo
         //YIE5B8aOm8UJmASb6FlvwqR5vuJX9Y/kDG4yXLLTfHPldY+gSpe/ojMjWNipIdlwKB
         kTrsBArDKrGbqtK3va48rPcwgX/8mc8fkgMFhwWvEc9JmKIKneK7nezplPlRsjjkfhDK
         /uiV9N8IWrj7FvZoCluKEjxU8+PhrwnTFCBGTKqbL1aUREqOeAn738MmNler6n4bZcsK
         VkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632228; x=1719237028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XakTIALlxEv0HYj2MxlbOtZFxZOxjUYZWhXJH4zlh0=;
        b=vejyEOsDU+k5TUQDbKbyGkLFgEbvDxtrALAPWDhIvxyqZ58XYi3tANIMkdwZm2Ifzd
         1OgchVYeS64qEwyexuNVhdPl39lJI8zttIs3rSx/iSpdPo3jq48w+i4BwDzO3SFJ8XPL
         tPot9MDFmV7ViICV7PNXrJ3mF2dEoFv00ZcyP1iRURVKHqg4gjKeNcOz69gzY4tJmQNC
         ANY6eSpx6vo4iMFwEjD//khBwmBnHWV+IvMySrsprxJXHOCoCtL0gCG4pOUBZ6mfZNQE
         C9SzoS759/K0Gi/0VW5ZFy5+hGanNCzhYCa+qf770sgx19PxH0mfZomMMzDUNNReDuv+
         ESBw==
X-Forwarded-Encrypted: i=1; AJvYcCXmi3LuakkKPWM6AdpbQdr3/2oaQzvY1AToH9Vz+ciHQkqv/UYba4VNH/XiGjJwApYoOj87d4FH/IQtJjfIdw10WoYha5NtezjSgYuAlr/O7dM=
X-Gm-Message-State: AOJu0Yz5EkQaNXzjR8wpFhir0q726yLGxFyV+wXR8r/m5/zXPiDcrlx0
	iZPSeHW5i6km+LUk14+bmp+vg6r1DHTnlHaFPG1kfwtyXNoyfODwaRAtov7jnbU=
X-Google-Smtp-Source: AGHT+IG8ABD9tEwAKr1/xa6bdVCx92iQnTrVgELPE/Lymo3q9zF8m5xvFoyu+g0K7+PoHeaETQDP6g==
X-Received: by 2002:a05:620a:29d1:b0:795:967d:b1f4 with SMTP id af79cd13be357-798d26b5261mr1162014985a.70.1718632227786;
        Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:00 -0400
Subject: [PATCH v3 20/41] iio: dac: stm32-dac-core: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-20-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065029_431937_D81B257B 
X-CRM114-Status: UNSURE (   9.93  )
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9kYWMv
c3RtMzItZGFjLWNvcmUuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRh
Yy1jb3JlLmMgYi9kcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLWNvcmUuYwppbmRleCBlMTUwYWM3
MjkxNTQuLjJkNTY3MDczOTk2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRh
Yy1jb3JlLmMKKysrIGIvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRhYy1jb3JlLmMKQEAgLTIwMCw5
ICsyMDAsOCBAQCBzdGF0aWMgaW50IHN0bTMyX2RhY19jb3JlX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIAlpZiAocHJpdi0+Y29tbW9uLmhmc2VsKSB7CiAJCS8qIHJlc3RvcmUgaGZzZWwg
KG1heWJlIGxvc3QgdW5kZXIgbG93IHBvd2VyIHN0YXRlKSAqLwotCQlyZXQgPSByZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+Y29tbW9uLnJlZ21hcCwgU1RNMzJfREFDX0NSLAotCQkJCQkgU1RNMzJI
N19EQUNfQ1JfSEZTRUwsCi0JCQkJCSBTVE0zMkg3X0RBQ19DUl9IRlNFTCk7CisJCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhwcml2LT5jb21tb24ucmVnbWFwLCBTVE0zMl9EQUNfQ1IsCisJCQkJICAg
ICAgU1RNMzJIN19EQUNfQ1JfSEZTRUwpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAl9
CgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
