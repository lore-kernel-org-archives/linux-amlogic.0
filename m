Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2291C2BA15
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jun 2024 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9dth8WZx1b+ouQybnYXcf7JG/cSyCA9edMCNta2AeI=; b=NTLEmV2hZW2+g6
	hORH7v+dIgbtPRqeA4+vZLIl2JWf9V9LmW3+I104Cuby33Y7PyZHnHelr0pvBah97uqd7dFt8lraD
	4pHZH9kDbXVcHI4zRUaBDTGVu6tNRjDtVN6lGKb4Az8hKyT6cvQ2w8XO/XuyQlyDhRlRK58qe/mat
	ONnGQJyXXPZVZNKUDkr9dkn/NtiP5UDEKvnxpLSLS1ydZtI77kMABtuDLXxB06apSDJ7onGmcADH3
	K9YUZAnkEAo66BgaofjFV1kf2JMbqpOcK0CmdrYHdoWH5k2lfJWSkr+d1ZKTt714n0d1F43vlooAu
	zLB8YB/YRamYnoIShCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWlX-0000000EYXf-44Xn;
	Tue, 18 Jun 2024 11:12:43 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWlS-0000000EYUd-3Iu8
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Jun 2024 11:12:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52c85a7f834so6816751e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Jun 2024 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709157; x=1719313957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
        b=mbACC+piwzqg0QMP7xloBAx7aS2NqEl7MaRAsfUBRAWYhx4QgsEblz66HuV0z2buAD
         1zQBKrXj4fTw2Tf/3iiuOYNEOUuooeORtZCVzLNPydtLdcnvAe1q1/i7UD8sFrZs8Me5
         F2WTZUzdy2YvTOKgEXzUHSdgb0XvR1YH4xigmcg5STOPNkw0GQkBhWFE/H//Srir668/
         ZOq92MR/EngC58833dTnr+2ut2EzCo4j30E72fLZgqNA5Sp8RJUEC9AtdSq0JWmdYyDi
         ZMMbWdxaXcToI0O2k0fPyI+rv3vHavSLDS2gr6UjY+zB2yQge9dNO8sctZTHVj7N22/Q
         PQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709157; x=1719313957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
        b=sSc0qJCgIM3Q8ukB5hBSv0+CfZ1Xv1Fb9TJuwOFLNwBPTk0lQmnt7JXP2Qc0gDlkTl
         8Pj8AoMXprUxsxtlOSZ4pm81JwZNH3ZnjEGmCCDyKoNtM1dL3y3WDNos6+xp8oD2dAUF
         kUkNJO7c4ehIHhg+LMIQ84tFk0FQPM0m9hLMKhxYfmdbNXua+QAs8Gb+4ru5hzZ81ZoB
         pg7K8AAN/tZi9SFrEBXwa9ncdD4DWeWg0GjzvAgFeU9RmOuikCurVft00GhuvoGY8de7
         WbRLu3M8gjSdAJGpK+bJw5/vKt69M43soUKN54RoK9NJvuxhvQ8x5IpxffRmCa+2TzSn
         v62A==
X-Forwarded-Encrypted: i=1; AJvYcCUCPDxRNExzJluvcPplCxONOiHA+mHAnKuVkzPE19VqS/lyoS3QNxVp7CJscaZ2O5TzVJmOLo6/0qDJNBBL2beRfhpeyqmyw0cRjpzv69sXfXQ=
X-Gm-Message-State: AOJu0YyubeZapxDXvqxxFWVY4rApYVzHIs34Y8LKr9tnmsawKobYY4Mi
	d0xgb+5ExpqO+QZ2lhtjCchmlw42mo/tATUMQ4L3tst7/DOHM1rSKfbC0bZ9o7AIRZo0I1NxpEC
	BXF30g4gu/RkmLfzrfRXsQYCealmvy/PoHeE0qw==
X-Google-Smtp-Source: AGHT+IFCeIOoRy25rTwUHZ/n6vBdkCPzCkJ8a//pB4Qa6c+3jDe2XeC/62v2ldwWc8Yh5JI+ho23V5WmsKqsRfZrbxc=
X-Received: by 2002:ac2:5307:0:b0:52c:998a:77ba with SMTP id
 2adb3069b0e04-52ca6e6e5f2mr6662065e87.36.1718709157060; Tue, 18 Jun 2024
 04:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-35-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:12:26 +0200
Message-ID: <CACRpkdYchu+muvbinPpUFvppMMQCFe9zTcApj46ip4PYUGUhVg@mail.gmail.com>
Subject: Re: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of regmap_clear_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_041238_967161_D65D699E 
X-CRM114-Status: UNSURE (   6.96  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzo1MeKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHZhbCA9IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4K
PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
