Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9979DC2BA18
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeZKIWYBvEc6pmXHulXD23/Cub67+7Nh50ngEjwZYWs=; b=daN90e4OCDrDKW
	h2O2VeC6kiXdjkOAXe9386x+mCRP7qh9Ycij4ji/CQa/V4l2O8y8kEKSVQBbVuZSPtlwh0dPa8TKU
	Gz/sZkjSOpn0HL2gFBnqlglu6rjbBb9Gv4kn4GGJ759O1bIbjq6dzS443HsmxprPF3ey1qBdHnJ6f
	HZVDghhJSHqzTlYtEImbIOWyBgfi3M9TqxaJzicIQYui0UBib8NRWlPPW2bUukk38mVrit6q3JdQj
	MJowYQWtDxzBDnSKZpk8vnacx6sHpodkDeXhTfpcmsFVr9J6h07+4NtXf10bf2DhfFK1l3nQiuWfO
	HMEejDmakBP6Neo47f7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkc-0000000AxCm-0vyv;
	Mon, 17 Jun 2024 13:50:26 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkB-0000000Awms-1PwT
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:02 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-48d9cbfe0ffso1586566137.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632197; x=1719236997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6UQvfPsoXnGJXINmWjQmEBO62NliLdepCpDJh/A7YM=;
        b=pGLnMn5E1BgmvnMnMs5clVKrJX9klikxlOFiGsSQ63/oXjQ8m3P1PjV3WqQLyXilKt
         SZ3jZFEhso8D2AQ3UU20U9vDgcT858k7hJBzCginSWIvI7Q4q5T74PkaW0qEo/k3b8gy
         +HhA/+tjnQVV+kMQe2ucsJ4NkE7N/DYQK9eIXywv3tjeqFAlWB529SqlIAXChYABu7ji
         kBkVbIuoHV0TFABIIF05i2HCYfbwmiyb74ihBVXV7ZUewAE6I096WXxPHGv4x7VcUTYt
         r1tlQSScC4so0CJfyGpLVsSdwVmxdj9uTYIdmTVQkI2RJg1eW2DBuKuFMovsSQdFJbyP
         2Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632197; x=1719236997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6UQvfPsoXnGJXINmWjQmEBO62NliLdepCpDJh/A7YM=;
        b=m/Ny+M2r/wRLuAI/4nhctt3Qdut+hv4G6JF4AsqBhRp5gkrTclWvRltoZYeAKT3eTM
         BtZX6MsVHSGB1QyZBRC95Nrfxv9DX1dmhwZPlnW+1mXHmMFUH14bbGWVpE7KTnZ7uewI
         w2QQnQW48bp82cOzIWdH/17IIBCgDCmvn25T4NXPTZrKBfddpXSPFwRDBT64H5Uyov8n
         hXpbBoSAu8sZisX0ayxe3NoXu7XNJzUKe1AUIYpMof3QAFb8kO1alSu5ZM55NojHt3p+
         jAyfcKqBPuXYaQCuURWoxf+DQKBd/LyfDf4y3CrlamRfpxA6yZBAe+mxzJVfYhU/CNFo
         AA4A==
X-Forwarded-Encrypted: i=1; AJvYcCXFQimJPg7j6Y1mtWHnTEbsKE0dPn7G/AdlxS275vCnnTX7gX1BMl7rFQ/i3gAYTXlZYSD4aeHvqHhPONyTH8OrFUhV0hheZXljOAzh3Qw34LE=
X-Gm-Message-State: AOJu0YzgF+avmsd3Uuf8+KDjHohhfFtiK6r2QzmKw8iAksypVK51kfFA
	fy6M+H5yqNBVUaY45aYKBzIiYh24moIZ1rRDbMKuaj+5NwVG/Et2XffcMHzmwoo=
X-Google-Smtp-Source: AGHT+IHh1rKlzT8+664YalrD1JcHiwA7k7yzEL0kYz4H+P2//V4FMw+RVSrpyNsoJMn06TFOuuRyhA==
X-Received: by 2002:a67:f452:0:b0:48d:a159:dd80 with SMTP id ada2fe7eead31-48dae329fbdmr9819998137.12.1718632197524;
        Mon, 17 Jun 2024 06:49:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:46 -0400
Subject: [PATCH v3 06/41] iio: adc: axp288_adc: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-6-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_064959_490412_E016529D 
X-CRM114-Status: GOOD (  11.14  )
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9hZGMv
YXhwMjg4X2FkYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMg
Yi9kcml2ZXJzL2lpby9hZGMvYXhwMjg4X2FkYy5jCmluZGV4IDQ5ZmZmMWNhYmQwZC4uZjEzNWNm
MjM2MmRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvYXhwMjg4X2FkYy5jCisrKyBiL2Ry
aXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMKQEAgLTI0Nyw4ICsyNDcsOCBAQCBzdGF0aWMgaW50
IGF4cDI4OF9hZGNfaW5pdGlhbGl6ZShzdHJ1Y3QgYXhwMjg4X2FkY19pbmZvICppbmZvKQogCQly
ZXR1cm4gcmV0OwogCiAJLyogVHVybiBvbiB0aGUgQURDIGZvciBhbGwgY2hhbm5lbHMgZXhjZXB0
IFRTLCBsZWF2ZSBUUyBhcyBpcyAqLwotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoaW5mby0+
cmVnbWFwLCBBWFAyMFhfQURDX0VOMSwKLQkJCQkgIEFYUDI4OF9BRENfRU5fTUFTSywgQVhQMjg4
X0FEQ19FTl9NQVNLKTsKKwlyZXR1cm4gcmVnbWFwX3NldF9iaXRzKGluZm8tPnJlZ21hcCwgQVhQ
MjBYX0FEQ19FTjEsCisJCQkgICAgICAgQVhQMjg4X0FEQ19FTl9NQVNLKTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBpaW9faW5mbyBheHAyODhfYWRjX2lpb19pbmZvID0gewoKLS0gCjIuNDUu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
