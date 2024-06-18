Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70BEC2BA15
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jun 2024 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3Y1VwhNZ7YaTtBM/fM3HMEpoeaBtiX6nzSEV09LTsg=; b=IzS9dLRGuG/g4p
	zRwMbsKMHF+KTvQWOYqPrwB5VOgXlIoyVKu0Qfw5sMlqs/LX7MZa8oV0cy48Da8Qf4K7T0J/1yizT
	qDjFBQPOTQvF6sxpyF/AmheEE/bbq3lQpOrGU/A5/nD4poMjFFYGR9GMnRAJSTp2IP0FJ2EVJAq1C
	lzquaCkMF69MXfDMf+tLcy0cCMZlRvWd5TpOQPXMDSZQ5TMnc3BLJtcgG6yXummZjZwNnttSDTO1H
	Gw7voExeUgbHvRmPjDB5QP8IG+rnXcWdGaClCQ3Sd8lF3aU0FnnETupGX8Xw5p7s0qbOomGEawmm+
	e+yRV0xrX83F3LY8Cbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWiX-0000000EXUL-3uLW;
	Tue, 18 Jun 2024 11:09:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWiR-0000000EXRQ-3bc1
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Jun 2024 11:09:35 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52bbf73f334so5064635e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Jun 2024 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708970; x=1719313770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
        b=JAiB0jiHLgE6uNv9VAlpcWW2+vjGJgoUW9SnazTudXcR+Aq7IfRd5vJxfQDgpAX1gc
         I2ylpBLZE5YL92rpvgNkJGhVdMGi36jY27PzC23JjU2g0L34T4Bz/WJI+eKCUQOHAp/X
         +YKgrLPZUJi1DgrWwrlTYRhEu1tGiNs4KUjREiIHkm/meomKqjL6A0hmgQ3hB/7lAC5M
         wwJQkbFPWwqXvSgirKlM4jPIBUnZeJokimP+/3qxVOTa7ccS2IIsmqp71zFUfOBMRdNO
         Z0a0MFCVjbhoinlEKlUaUHXmqho8anEleWZbzfUJBwimcO8gaQ+dvMyCOBoRW86Ebpbz
         6NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708970; x=1719313770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
        b=KU3BWkY3412Ii8qKYI6S873vsCXN1URd20MmvJdNPRiM3YzgU0LNda0G2PoxSmR09a
         4gl7mEg3V7gSKJAjtOFBSZDTbhh2VYWVoQ486JyY8CnwK+nljVL6c7KEnWDSBaIxcFfJ
         L7iyarat2kB+3TfQHZYusmGzXuFtJ0MUQi4RMIRHrO7hijW094XyauiTJXtzw5oulWaK
         ypZmR+TJlGOoi90HWUusCpYBuQqDnUb0Ix5ONp8nnHZ1PI5WIe7rG0eoUAz8Yx65G7NA
         4N5UaH/i+ranwC3CPSwJcOpVPi0ZiMFAL3yonAwWzyhy1Ucvx/CDreHLc+/AytAsyKXo
         136Q==
X-Forwarded-Encrypted: i=1; AJvYcCVM2103iOLahkAFFLK9E2cV6Vmh467VgqaRuT18K8lWnjaCnTJudTH3BHKk+VQdEV85PFF19wTLTvcTRLnx140CE0MaIn6q7p3IT8sEt4unG+U=
X-Gm-Message-State: AOJu0YzFpuI9e3gFXfFg9GwrHfBvX/M3Szu0oH/nVLjSDJi7A0deRxWn
	VcYEO2rnXTHbsHCbG+CDDW38It1TlfVGWHUYm3E5+QJK/1wyjjlTTHsiSFIIIAFPJCqeFWTn7M0
	0nfIq+GpiNtYRtZufl5h+5rRtf39F+RvhcnQ2Yw==
X-Google-Smtp-Source: AGHT+IGoKxTkRYLabjHUEETT/B3IbExJAmXPzq9+RXs6bzZ+GQ8xGK2jG8c67xHQQUvRR1JIcG5ZA4yr3WPNV/0LYAU=
X-Received: by 2002:a05:6512:2348:b0:52b:bf9c:7e28 with SMTP id
 2adb3069b0e04-52ca6e56012mr10869317e87.14.1718708970136; Tue, 18 Jun 2024
 04:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-2-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:09:19 +0200
Message-ID: <CACRpkdbos8og5=d4MXt4q11tQkhX=dOZdv382f1z2YJV44zidA@mail.gmail.com>
Subject: Re: [PATCH v3 02/41] iio: accel: kxsd9: Make use of regmap_clear_bits()
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
X-CRM114-CacheID: sfid-20240618_040931_927060_5E0EC03C 
X-CRM114-Status: UNSURE (   6.99  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzo0OeKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHZhbCA9IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4K
PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
