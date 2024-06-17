Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D4C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tTuMurwVewa8TSv6lZRNCYd2ok9C2jrdfh2bqJkvjg=; b=DPXa4arzaN+GpL
	BL5Lw/HURdVcUmYGH9FF/2k9BAjfzg6H9db8/kyrwvBfToGmbD8zazh4LD/hhCoKEEDP937GG1HFW
	KKULQryMzMo0rIxDelYATye7S1GtacPkxEBxWNF2CJKj2YOJghrcd6So18qjJ1C8eos/TilxV2IEz
	V+8lnzLYPTfNsEQraczPbzHqO+mMcTbpMpz8C0/JiUyes2C/2W7dYjtcXgtWWsw+MgpDeY171OwCp
	O+ookdvWCzYHsFShmODJjLFxe8IivxMNO+n1UUIqIQRJA8cUP2gt5h3oqhs2ypK7iEbH84jhMy7s5
	uy/hj3Kwdk8J0bEO6ULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkt-0000000AxTZ-0APn;
	Mon, 17 Jun 2024 13:50:43 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkE-0000000Awp1-0ibZ
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:04 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7955af79812so246233785a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632200; x=1719237000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrcJbk8xCEXw8t4EaXrcTeVF+NCC1LSKzcpZFP4BG5g=;
        b=HkCvVIaYP7nUKus49paYihGHIeTIQa7TNKahfpiRaT1xU6ZUytRm2qRua9sATqHPSO
         LoNEQzNTbWNzyOkm/UChHHYxuRb/nT/7cC/ZNl4Trp0V/ndRareOqrYUzv63b+uhzHPV
         9Q6pc/lkbzC3cWlSGQeS8QDsEAZ0lgTVqcZaST50gWf72weCOweMWJbq+xUan+Liolzt
         PSeKJDGR7bSI7DHo7L9i3Lf3mIM4mFNiLJEmWBaSKEFqKlfVrCD7lnQhXLsuxRuS9Ct8
         omoA9hLuJPPrLlFOtHH+FLifQnoflnK/kzyiTWLWQloyoHx8xhaSlq6FQJbOiqmLHDnP
         8wnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632200; x=1719237000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrcJbk8xCEXw8t4EaXrcTeVF+NCC1LSKzcpZFP4BG5g=;
        b=BpzKNmL4atXSfArmbpr0DzJDUuVG3BC46j5Ik81mPq5N7o84SEI3T3C89KzvsNN05T
         7hZWzOsjGzEEsmH+PcuuZuqCoOYfySjSbI56McxAvbvcURyKnvPigCxR+12E2IjOQ8l0
         YXuov3BRjfz2HnZrBWM6LTpukUcKc+3hAhCRbFsn7nrG8SWEGWs5OvEs/CuyMLnmJB2y
         r3ouRZoQuarWpEGVZCHWqzGt1SnP0mAprmu61tofq3n2DUJO+5HCeQoFo30LR9G+tmwl
         /y5fBc2D1sylpJKQh9q5PI8NogrdPM6VETrcX+hkl75eM+h/G2eItwL2ixb1no45oFz0
         hIag==
X-Forwarded-Encrypted: i=1; AJvYcCWlC0ndL+xkD386McMkTDbdZqIzzvO4nXY6EUE9mxpk6k8q9QhADTuuaNjID/Ar96SfA8YKVdaem4zrla89NoAYGPK6z8D81QIuoE6mLEEk0fM=
X-Gm-Message-State: AOJu0YxokCUsz8GIAdEvP1oQ7yVnzOIiry8MiX/xs3Acx8T1RVYFOhIp
	Ju3tUjDitN9qG/MGkRyrMQF4TSd83bwCG2pDE/KeYIvFoc5+2T74AiljlVhZC1w=
X-Google-Smtp-Source: AGHT+IE5uBXfLurzd0jxJqKEavsP5xlBerQNz/5zZPhVz/sS8JYp4QTVcbxX+BgweFysUZBWMYLagg==
X-Received: by 2002:a05:620a:1a81:b0:795:4e35:ea9d with SMTP id af79cd13be357-798d2692fc4mr1312471985a.60.1718632199656;
        Mon, 17 Jun 2024 06:49:59 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:47 -0400
Subject: [PATCH v3 07/41] iio: adc: bcm_iproc_adc: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-7-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065002_470808_4412ECFE 
X-CRM114-Status: GOOD (  10.40  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2JjbV9p
cHJvY19hZGMuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2JjbV9pcHJvY19h
ZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9iY21faXByb2NfYWRjLmMKaW5kZXggNWJjNTE0YmQ1ZWJj
Li42YmMxNDljNTE0MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9iY21faXByb2NfYWRj
LmMKKysrIGIvZHJpdmVycy9paW8vYWRjL2JjbV9pcHJvY19hZGMuYwpAQCAtMzU3LDggKzM1Nyw4
IEBAIHN0YXRpYyBpbnQgaXByb2NfYWRjX2VuYWJsZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2
KQogCWludCByZXQ7CiAKIAkvKiBTZXQgaV9hbXV4ID0gM2InMDAwLCBzZWxlY3QgY2hhbm5lbCAw
ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFkY19wcml2LT5yZWdtYXAsIElQUk9DX0FO
QUxPR19DT05UUk9MLAotCQkJCUlQUk9DX0FEQ19DSEFOTkVMX1NFTF9NQVNLLCAwKTsKKwlyZXQg
PSByZWdtYXBfY2xlYXJfYml0cyhhZGNfcHJpdi0+cmVnbWFwLCBJUFJPQ19BTkFMT0dfQ09OVFJP
TCwKKwkJCQlJUFJPQ19BRENfQ0hBTk5FTF9TRUxfTUFTSyk7CiAJaWYgKHJldCkgewogCQlkZXZf
ZXJyKCZpbmRpb19kZXYtPmRldiwKIAkJCSJmYWlsZWQgdG8gd3JpdGUgSVBST0NfQU5BTE9HX0NP
TlRST0wgJWRcbiIsIHJldCk7CkBAIC01NDMsOCArNTQzLDggQEAgc3RhdGljIGludCBpcHJvY19h
ZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoYWRjX3ByaXYtPmly
cW5vIDwgMCkKIAkJcmV0dXJuIGFkY19wcml2LT5pcnFubzsKIAotCXJldCA9IHJlZ21hcF91cGRh
dGVfYml0cyhhZGNfcHJpdi0+cmVnbWFwLCBJUFJPQ19SRUdDVEwyLAotCQkJCUlQUk9DX0FEQ19B
VVhJTl9TQ0FOX0VOQSwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoYWRjX3ByaXYtPnJl
Z21hcCwgSVBST0NfUkVHQ1RMMiwKKwkJCQlJUFJPQ19BRENfQVVYSU5fU0NBTl9FTkEpOwogCWlm
IChyZXQpIHsKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHdyaXRlIElQUk9DX1JF
R0NUTDIgJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CgotLSAKMi40NS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
