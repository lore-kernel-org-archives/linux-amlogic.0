Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92358C2BA18
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zce7n/G6byYgJj0kqQoWaEjPk+PBq3R9HhNSpX9T2g=; b=lDWlpYLtH6+SD5
	I6mZc/HT0oFZWK9/5g2fdfHMXb2XnfE8NqGYG7BbfW3+jZZNW+BSkbYqoeDXb7BomMhY+k7iyUmU8
	KDmGMG3AvBgQCL50NQYEYiXn+Fm++ARcRADXD1CHt69z0Qp9y4IYbzXftXE04paFrd45757YTkbO2
	LPDbCkRFNRHDD9XwvTC/yr39qxsgXkkA79g+ZycsAeGEgAWmMFx3Wk0GHrk+OGgxljKv/8Ldg/3eD
	mAiyRML7Y0d1A3dcJjLSEx0fqZO/ADP3l6Th+Mfyj6WLqlHkIcWCLjhZl+lXWhyofWaexBALy+aY3
	x0u660E9aK0CzgD7f9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDZm-0000000BFAX-3ppe;
	Mon, 17 Jun 2024 14:43:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDZi-0000000BF7N-0iy9;
	Mon, 17 Jun 2024 14:43:15 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a6ef64b092cso539641166b.1;
        Mon, 17 Jun 2024 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718635391; x=1719240191; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
        b=g29soAfUjzjCDDrf9m//+zMgFp2lsOZbHDxl4AEsX4aB76Vj3NMLRE8T5TNsr+nQI9
         CWTsspzxjGVtOmkngMxieBui/wS9Cx8KDxW0Dmsg4lp9JSPgGXTTItKHqtS9ryA0VxGo
         OR1s3yXTfCsgY2Y2FJjAg6nTZqWTiZcGggHWpY195Bhm4yGSIa2PrVYpNgWiIKekOwx6
         eEcCRS/H2WnUZs5bKVGbzInr0Ik9te7aHGJLlQ0hO1dUISA2Ge7d2an2ETqCXPaJz2sc
         hTs12TVzeJRvkgQIuHake7Z5oNxwjubqD3KlC5uFpZd/MgYdR01BEsXLTVSAOxF5yD+n
         4ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635391; x=1719240191;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
        b=PZx8NlyGa8+OnsR/EVuxQ+NE7BKDzQFNZ9bsWbrxehFSbcTxJPD0kLqA4Q9DDzvzi0
         NU93K3oPFJ1HfrNdg3ywDqUV3efXC8Y461wiT7boBPUYq7afAQl+pZQBslDaSB8XCBF+
         MXa2Udv/td384ZRgx2tLXIptj4IfcBgam8dzTktvi2751ctfsNjEdw7OSKAfPCQGWV2M
         Lv/0Lqx2bmYqJcPdjspvmc/PqlFH0DsRYq5mzK03slvQsg6ZIPzswoeBYN4zuw1AG2eY
         NfwcqMJnA/cxULOmI29M3YFYQFQOQvRB1o0Ca/dIUMbfyKlTSwqvVX4SPAJFDK85xxHF
         Rh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKMrbRaC0rG085YNnf9Jhyv6WYM4kwfjxbcaypSvfek2fHyYSzAJiEynsz2RpxfyhxbvMhlo8FSAW45n88IiPtHMKsFjM2OY19LyqprDBlnuVgksJnj1kO9gfoNN8FCWs7tw25gISkBmHvO0w9qUOSdBGp08PbHw==
X-Gm-Message-State: AOJu0YwmdJUdmaM72ASG/F76kZWOw6Eo/dQ+N3W39HHR/1c7ImmlDw6e
	C5rrTKZ6Sn84BEuejGmlDjwYJXfJaAnwxIu9mBRi/FIhK8hQNwkc
X-Google-Smtp-Source: AGHT+IFZCLJUyzlf8fNXs1wSr7SW5vQG+3gjx8K9mMt6pzU9bVkMHLl1SBxe9dWS51TWvl5kQfUcKQ==
X-Received: by 2002:a17:907:970b:b0:a59:b590:5d71 with SMTP id a640c23a62f3a-a6f60bc9ac8mr839107966b.0.1718635391235;
        Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f427a5sm514062766b.180.2024.06.17.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
Message-ID: <63cd8d0e250a77c1201945ebe13e19ab0fb59ce9.camel@gmail.com>
Subject: Re: [PATCH v3 19/41] iio: dac: ltc2688: make use of
 regmap_set_bits()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>,  Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,  Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 17 Jun 2024 16:43:09 +0200
In-Reply-To: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	 <20240617-review-v3-19-88d1338c4cca@baylibre.com>
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_074314_270203_322B77E1 
X-CRM114-Status: UNSURE (   6.34  )
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

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDA5OjQ5IC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToK
PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHRoZSBt
YXNrIHR3aWNlLCB1c2UKPiByZWdtYXBfc2V0X2JpdHMoKS4KPiAKPiBTdWdnZXN0ZWQtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogTnVubyBTYSA8bnVuby5zYUBhbmFsb2cuY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
