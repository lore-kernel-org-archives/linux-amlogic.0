Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D5C27C77
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyW+7CNZEHE6ToXPJpOCLeWgzBWZTTOJPcNmiIyp1FI=; b=kX6M2ySOW8qM0S
	KLbBgC1JwhYPpe58zdSE5eFSWvQPLQ9L1r8PHFMZ4c5zlaNc7LSUoXUZetsfs+PfcoQBE57gKCq1v
	XdTH6ARgRtwDPVxKM9+bItJKxaGUH9IG7WCcOuw+TwjJ+PUvwRz9xOBjJUr9ULmt9ys7yZaZJYsPC
	qasvLoRO6wFACycW8+9yqEXzmgH1TKbwQTCNCK8AZF7/GTAg0j0oMemi+xUfA8jlQRCpu4trhP30l
	PUdAPpFFnijbrnpZlENrhHNmiwFkoBlRUWPaXmbKvWiyC416Dmi65vVXyQFjEkRNv5rL7ZkB0HnnK
	3lQthkjRQB3mZNiRl73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJR3-0000000BjbY-1vGJ;
	Wed, 12 Jun 2024 08:34:25 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJQz-0000000BjaS-3F2Q
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jun 2024 08:34:24 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2506fc3a6cfso3105763fac.2
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2024 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1718181258; x=1718786058; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
        b=dbViAE7rgE6MvU2kZ4P6jQrUdSi1O5MsC8G7iF6CLQT6NdhPqGRoT7s2QGNxMv96F1
         gq2PLi+6F2j5ZTizAABSnjVn8uqXb/73+rt/TcPlMX6V8jqDnAvSwx0Gu5hdRbpgMLKA
         U/C9oOjugFBi/+dO++baFzidmfN8UvEs7Ps+ENgmt4QBM5pVNbJnd3lhki4hbPr4ze3N
         +lpg2XsJrqct3UFFlSNAdmRgR98heKP6VdFQOumZm/pN3v8s/uV+yztNlOt6wFDH2gzw
         PSoh8LJK+V51iZaD+5WKBexOyV5jnDJ6WEcMo0p9wdCYv6a469MS3HI2YWkx2BJ3+OWX
         dKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181258; x=1718786058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
        b=RDL4mnGUhv+62O8S0Qs4Hs0WSCbQcl7Q+wUUiglkjKA34QFcwKW/7/zEXi3iWqXya9
         QqO/FLOfL967i0GtINU44rVmP52CU+zDB+sVLXO+zRZTUu3ITFrYo4TTEKQ7fW3rou+U
         kOkHLQgmx/VzVdmnY+XLPDAVxS0+USPxRztN20r1t7rVQPKBbK9zPcBylqsQclappLMk
         YkxxD3g/x1O3z59KCZIT/+Woqa+KBzfVqdbehIAXLYjd0MiBLR161wRg1u5G2Cn2lTfv
         PI1TDPKJ0NLrsYB6ax9e+iqyaVZHmuhE3DGIj/d9TN7XRLyAUpvL83uiqBRDFAAeqWZt
         mBaA==
X-Forwarded-Encrypted: i=1; AJvYcCW2bSDMmGMJtQcx2ksWjMOTWnMxquBgKibA2qSCYddrraeq52GzBr6X2aNysvvWVVUVUWs8Jik/QTWO7oHEBFceqTKIFTBEU0N7/emVxd/dHOY=
X-Gm-Message-State: AOJu0YyiVtFRY3IrMVSFqhdd5pBa4KT7W1h7Up9jBvK7ktzdTNxQnOWd
	TFfn13c9UKXrKRgLMFe+C5WHeMl72ooBO1HdIQuzBqcPeuz7C8yVpCuw9KDc12A6u1uWuAvDFKN
	HrI/f+8TWLwDbvcHgwrmJ3A2j1qPppppy0TCC
X-Google-Smtp-Source: AGHT+IF2c1FL0fqOMuwGFXItue1Pz8K0VY5CQ9QXgEnYWVlMd7GYFa+wcDzIz9YylVcb2zSif5XgvNLrC8xGpqwxyEQ=
X-Received: by 2002:a05:6870:b625:b0:250:7973:8092 with SMTP id
 586e51a60fabf-25514ef5f86mr1113389fac.56.1718181257361; Wed, 12 Jun 2024
 01:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
From: Crt Mori <cmo@melexis.com>
Date: Wed, 12 Jun 2024 10:33:40 +0200
Message-ID: <CAKv63usQDFuz9s06GNTq=3fzYm-OVPAxgxwxTNEw6zw2rYxyig@mail.gmail.com>
Subject: Re: [RESEND][PATCH] iio: simplify with regmap_set_bits(), regmap_clear_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Lucas Stankus <lucas.p.stankus@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_013422_278940_C8DFC51B 
X-CRM114-Status: UNSURE (   8.25  )
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

Rm9yIG1seDkwNjMyIHBhcnQKQWNrZWQtYnk6IENydCBNb3JpIDxjbW9AbWVsZXhpcy5jb20+CgpU
aGFua3MgZm9yIHRoZSB1cGRhdGUuCgpPbiBUdWUsIDExIEp1biAyMDI0IGF0IDE4OjUyLCBUcmV2
b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFNpbXBsaWZ5IHRo
ZSB3YXkgcmVnbWFwIGlzIGFjY2Vzc2VkIGluIGlpbyBkcml2ZXJzLgo+Cj4gSW5zdGVhZCBvZiB1
c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFzayB0d2ljZSwgdXNl
Cj4gcmVnbWFwX3NldF9iaXRzKCkuCj4KPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHZhbCA9IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4K
PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gQ0MgbGlzdCBnb3Qgc3VwcHJlc3NlZCBvbiBmaXJzdCBzdWJtaXNzaW9u
LCBzbyByZXNlbmRpbmcuIFNvcnJ5IGFib3V0Cj4gdGhhdC4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
