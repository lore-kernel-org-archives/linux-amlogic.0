Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F39FC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvHhlFxUasN9YPUtJEfIB/P/zOp/MfCUVmmtBBBgeMg=; b=eivB/E7tymPkjH
	moO+pXV0ZKm3HSTA3NU5nrWmLZEREQ4wiDLt/GJCZE9+96ZXMxo25amWICc69H6GGO9Pedd/yeeOs
	RnM25wOVQBOv3b3txDZh7lKxDVvy40HofIVsoab0dK0tZ/aD6supKdjbhRaBBucF2JSbL2eXxeF1J
	tsAHmU9IcUszzBlLRFvFTjTzXWG0FNQRbtiTPofnKZsaCzXMzeRghr0L+BeVFBGd1nIxNeLWOa7ew
	KpxIchI5jWyaW6qN+LeiVYI+1tQnJRnUM3A6ujXmRgeMrzb7Ma++XaethpBWPXD/MYR+06hcb+Jzi
	edeA4UT9z5h5jITWfDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDru-0000000BKy7-2hXU;
	Mon, 17 Jun 2024 15:02:02 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClL-0000000AxtV-2Wt6
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:23 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-79550284502so267291185a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632270; x=1719237070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYef8rADT2ijxxEcxYPLN7/oRY6yNh5EaRUGzmb2a/I=;
        b=ipqFRZIl5dKVVXrBpKc5Qx7KQ3C2WGQnvnK5YVsydmN/vE8DXjxWRC/MXuB2f9O6W3
         JU4sJ2z+qMnWj2kWAS5tDlAGxJ3WvRZ1pFZmMpn2cGqlFg6a5ODBJ2SlwEkwR11TiETt
         scZOSwXr0szHS+6b9dzkRvLgTjDHbP8MGbaoXDPUFkpzika+hZkYy+1KtP0wNJxN3qaL
         IwNXQokCeROeFqy29NrrwN7aNRRDMBu0xb0SLmIiZcWC3vtn3AqAluZ9WYPNtQG5rXfc
         boDTUZc9e4n/O+/Rz3Sw0TTEH6XjjkFx3wXLzB6rZtcEnhzdJmKtWdL7ftwOIoe6PhlY
         wnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632270; x=1719237070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYef8rADT2ijxxEcxYPLN7/oRY6yNh5EaRUGzmb2a/I=;
        b=Al21/Sh05iAHmvHpjhtge6IACT8/Z1b1t9+DyYrIrQhjYX+v0ZceOmiLbs7CXMi/1Y
         +sZowBsCLMYCCsoTrTwIuI6cc2kITNkWjutOpKc7i8sDeewd2SmtftbBabt5B3Q9CQYF
         6F5825FKtmAuaA0K9moCy28/gAOmCyvRi0/u7gijFaXT6dHC0Lv2v//vV2C+Z/ATNKeC
         Bor4KpQrozRSM4vsmUwD57Msp/UrmaLCi1vdObeU0y97xFlswzH1xQtSM6nrToTxFiBj
         46Z1FvoFXNEHGWhzv2lJ9n4j6v+C1j63mT7kuDOZXub9d0fO9RM6sZSmRBCri5kMJHib
         ORjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX25OaTdbxHQumlaVTvXBgZz/Iqw8vBlILfpoI8508x5mov2KV3ZZ5qHn3S4DItNiyKNNyDVeshwk9qn+JxDH4/GUiiSuoCpFEkV8++VbrM2ro=
X-Gm-Message-State: AOJu0YwtmKOKKvsEQpYTBpxyScHw2hyQxuvvyrr72FUhYvaoaNmndgTm
	AZpVjr1axT0d7wvtk6CDeHhOF7enNyQ7HF9JMTs70YyA8woLXMpg9z4LOnFPvGw=
X-Google-Smtp-Source: AGHT+IG+NTpXbmfTtgLV5kgHRYZJqicJgvBNrkkmD2PI5YKClqNlpZ4QFEOEqllRaBP9Jcn3G+Ldqw==
X-Received: by 2002:a05:620a:24d5:b0:795:50ef:4030 with SMTP id af79cd13be357-798d242f345mr1050763085a.41.1718632270523;
        Mon, 17 Jun 2024 06:51:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:20 -0400
Subject: [PATCH v3 40/41] iio: temperature: mlx90632: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-40-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065112_293329_E5087705 
X-CRM114-Status: GOOD (  10.54  )
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
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+CkFja2VkLWJ5OiBDcnQgTW9yaSA8Y21v
QG1lbGV4aXMuY29tPgpTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5
bGlicmUuY29tPgotLS0KIGRyaXZlcnMvaWlvL3RlbXBlcmF0dXJlL21seDkwNjMyLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvbWx4OTA2MzIuYyBiL2RyaXZlcnMvaWlv
L3RlbXBlcmF0dXJlL21seDkwNjMyLmMKaW5kZXggOGE1N2JlMTA4NjIwLi5lN2RlMzBmNjEzZDIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL3RlbXBlcmF0dXJlL21seDkwNjMyLmMKKysrIGIvZHJp
dmVycy9paW8vdGVtcGVyYXR1cmUvbWx4OTA2MzIuYwpAQCAtMzM0LDggKzMzNCw4IEBAIHN0YXRp
YyBpbnQgbWx4OTA2MzJfcGVyZm9ybV9tZWFzdXJlbWVudChzdHJ1Y3QgbWx4OTA2MzJfZGF0YSAq
ZGF0YSkKIAl1bnNpZ25lZCBpbnQgcmVnX3N0YXR1czsKIAlpbnQgcmV0OwogCi0JcmV0ID0gcmVn
bWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgTUxYOTA2MzJfUkVHX1NUQVRVUywKLQkJCQkg
TUxYOTA2MzJfU1RBVF9EQVRBX1JEWSwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoZGF0
YS0+cmVnbWFwLCBNTFg5MDYzMl9SRUdfU1RBVFVTLAorCQkJCU1MWDkwNjMyX1NUQVRfREFUQV9S
RFkpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCgotLSAKMi40NS4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
