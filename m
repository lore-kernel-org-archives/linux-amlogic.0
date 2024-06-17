Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41CAC2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08QXOZBJmU4+vBpXX4tKZc8tisInklcsqG9vgwaV3AQ=; b=HgIn3CzjnSBB+K
	OIFE10iPsFVYVz/Ef0oU/GmaFBN946nbfXt5nvLYreiVuWlufiM0Dh8+OGLNoPMTEwYQEAylkDwk4
	DbUC6LzGyL9SkG8hykwaYCeFnbqKpKJ5XGnvqPBV4XU7f7LVRISHWrsq5gYR8lRgkPf3bZvHdjRcf
	AO5rOtpGo4mONBKhen+3x/W0Id7u6FyjaNufKX3I/QvFS5xU9QZGwZHpA8YYofovI+v4lFS8h57ab
	w2QM2HrV/vB2pVt/kVDM9uudRlBoLAMNXYqjwBS/VHZyg8mTHYltfUETwZbEMPD6ob0y/Nsi3fgTV
	TxMFVK7se9m5P1GjE0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDrI-0000000BKSK-30fX;
	Mon, 17 Jun 2024 15:01:24 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCl4-0000000Axdu-2CTg
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:58 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-795482e114cso363679985a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632253; x=1719237053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+9CxU2CvbNCydIwkwVi62wLJsPjXvn/mOpa7x+p1k8=;
        b=KNJGPmcirQ9u8fLSA34zRzrQ1AAM7xqKU5mhNoHH6lBkVcP9ln+PM+l/x6UQeXemLi
         QtgafwDjlNXEipBRKmpWDAL/vvNqA+WuCTdWgWkjY7z1diIM/fNDRsXuOJPu6WzvZXol
         IA7/8WQnDsM/yP8Qr9kbqeeQ4KyBVUgzN5FTWB5XiKdirKyJoQeqNtxvURM57zePo9iT
         IBYnE4ozbFUvXIX989x28Pv05bZFmaMQ4o41PFrsTij5KlyQl3/Q7x1kbnNyz2hmLWSO
         b726iP75dY1xaZojH2kVPuaWcgp3r1hFTxZB+3GUB3sZU1wDZ+YjakvXDX6DkOoBS+QD
         bgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632253; x=1719237053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+9CxU2CvbNCydIwkwVi62wLJsPjXvn/mOpa7x+p1k8=;
        b=bciOk+QTc2Buvg+I5KCNqGh77zwYjkfESckOBKXxxxc/+7ker1/dPYaYWW9Gyat1Ox
         WZ59MEuLnzBc+cqnEvHjmBYRArNQ3RGlzJCHcbh4hLitXrgKWTuBOCfR9/VtewFw6Oyx
         uhaZBYA9RYpOB4z35ZT6ChubrTnPW21ZOQA0Q5XcgZWR310UeakRbelWYJh/7OpGgsTH
         YYckI5dUlgZkltaQ3CnlYZNtXZjSmO9+U994s64eN5OBvOw6klePk5+bYkybQeCgpiS5
         xpKeJP+mpFLcn6BL1p9K1Kgo6a7CouA++qkzjyZWiCD7JT8VJ2Ic9nJOffXfdLb8r/ts
         nLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzV/ddwIRj0845t04CMo36bkPsVl5cK2zknVX9fDPRoz1MOXyDM4BVh4FDWokp38b0eiXfmadSn/tamxz36ZmirDAwKigxdv/ntuasqxAg7Ik=
X-Gm-Message-State: AOJu0Yz1odh6y0dMaAgc0tBoUB3eWrEReaoWfKwmGeYOJR2L0X4mEWbt
	9lBFJtt5BdVV21WzGAupu1z6lPj5psp/oArCATpZr5dFEJpHvWMwKmxApnCNdOc=
X-Google-Smtp-Source: AGHT+IF0QBpD3doG6Fp1c+vnf+YJQ81FC5gB6//3DNzmC1F9GzI4GVFvf6U3tYk3LEdICO36nL3YKg==
X-Received: by 2002:a05:620a:2a0a:b0:795:5c3e:eb45 with SMTP id af79cd13be357-798d2531f98mr1137480985a.34.1718632253384;
        Mon, 17 Jun 2024 06:50:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:12 -0400
Subject: [PATCH v3 32/41] iio: light: veml6030: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-32-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065054_706439_5A6F37FE 
X-CRM114-Status: GOOD (  10.68  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvdmVt
bDYwMzAuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC92ZW1sNjAzMC5jIGIvZHJp
dmVycy9paW8vbGlnaHQvdmVtbDYwMzAuYwppbmRleCAwNDNmMjMzZDliZGIuLmY3Y2NiY2U0NWYz
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvdmVtbDYwMzAuYworKysgYi9kcml2ZXJz
L2lpby9saWdodC92ZW1sNjAzMC5jCkBAIC0xNDQsOCArMTQ0LDggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgdmVtbDYwMzBfZXZlbnRfYXR0cl9ncm91cCA9IHsKIAogc3Rh
dGljIGludCB2ZW1sNjAzMF9hbHNfcHdyX29uKHN0cnVjdCB2ZW1sNjAzMF9kYXRhICpkYXRhKQog
ewotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBWRU1MNjAzMF9SRUdf
QUxTX0NPTkYsCi0JCQkJIFZFTUw2MDMwX0FMU19TRCwgMCk7CisJcmV0dXJuIHJlZ21hcF9jbGVh
cl9iaXRzKGRhdGEtPnJlZ21hcCwgVkVNTDYwMzBfUkVHX0FMU19DT05GLAorCQkJCSBWRU1MNjAz
MF9BTFNfU0QpOwogfQogCiBzdGF0aWMgaW50IHZlbWw2MDMwX2Fsc19zaHV0X2Rvd24oc3RydWN0
IHZlbWw2MDMwX2RhdGEgKmRhdGEpCgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
