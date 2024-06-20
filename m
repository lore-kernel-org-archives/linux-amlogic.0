Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0239FC27C79
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2024 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKwVHbSfU2XN0YPdA0wz1s/He/TkaBCjaQK1hI/S8DE=; b=fpjKUfdcBkNl/u
	DgULXPB+D7yni94OHO1YdHzqIjGHPRjCg4uE60a5s/3GpuzW1aHnS5IwcZkt4SULemY8I3N+o/iG8
	PSjuSw4IzxCpgVlJJ2X+IR4/4JhJTU0qNI7ovVgT5NHZwJIEnUHUT6pU/6rvacWBYh9Dore9uZc4+
	vCuCbwwUWrdMhEKlk9v9TIhtFqUXezSxYJS6W86RWlTC9s/gtmF2AlJxpG2bP9eCokgcUt9OjPyIe
	zrqg8Wao1OBZAGgr9Q7uDgYUNc6Ca6UvGGHnk0ZrdftJaaOKWYbG/kkSPcXz7dUDZUGUlqI0MWlSe
	VQPR1w9NKx7Lf6zQEkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEIp-00000004Qdn-3RO5;
	Thu, 20 Jun 2024 09:41:59 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEIm-00000004Qaj-18eV;
	Thu, 20 Jun 2024 09:41:58 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 095FB10001E;
	Thu, 20 Jun 2024 12:41:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 095FB10001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718876507;
	bh=eHWSHU6IOFj9d81lzeTSCSoajp29AFtL+A3T39sy4lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=SJ9C2RT/3zxNcETOlA+R7zdR9bgqCBWrTAJKs6yKjHsLD92MS0HKFRJ6tgF47uJdC
	 2D8JzU4ZBZKqQnlDmhNQ+jJtM1LsUuZBkWCbqfNu2SC19RrO0B826IIgjtAkuiNku/
	 qBYufLJfpgbHyadnxpSGN91F/1bTEMqag/3CjsSxfsBxyU+Hzwmh/fAn5uZs9e27rS
	 8oFLwkDs8ETXGGDo8UvUi5s1W0z8adnonSe/14p0m+nKmy8Hi7+NN62ydlW+kqKcR0
	 rpbSQTmuo0fxX2N5/quj+Z7SS1mGSIC/X9sZm23PbhFf7smSqqyLTNQZASjKuMF15q
	 OepCAAht5MUOg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 20 Jun 2024 12:41:46 +0300 (MSK)
Received: from [172.28.129.141] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 20 Jun 2024 12:41:46 +0300
Message-ID: <dc787966-2920-459f-b091-ce09fe97315d@salutedevices.com>
Date: Thu, 20 Jun 2024 12:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/41] iio: adc: meson_saradc: make use of
 regmap_clear_bits(), regmap_set_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: <linux-iio@vger.kernel.org>, Jean-Baptiste Maneyrol
	<jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>, Fabio Estevam
	<festevam@gmail.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Chen-Yu Tsai
	<wens@csie.org>, Shawn Guo <shawnguo@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Saravanan Sekar <sravanhome@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Lars-Peter Clausen
	<lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>, <imx@lists.linux.dev>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Hans de
 Goede <hdegoede@redhat.com>, Orson Zhai <orsonzhai@gmail.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-13-88d1338c4cca@baylibre.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240617-review-v3-13-88d1338c4cca@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186025 [Jun 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/20 08:22:00 #25655230
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_024157_272783_25EB4629 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gNi8xNy8yNCAxNjo0OSwgVHJldm9yIEdhbWJsaW4gd3JvdGU6Cj4gSW5zdGVhZCBvZiB1c2lu
ZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFzayB0d2ljZSwgdXNlCj4g
cmVnbWFwX3NldF9iaXRzKCkuCj4gCj4gSW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2Jp
dHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKPiByZWdtYXBfY2xlYXJfYml0cygpLgo+IAo+
IFN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJl
LmNvbT4KClJldmlld2VkLWJ5OiBHZW9yZ2UgU3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2aWNlcy5j
b20+CgotLSAKQmVzdCByZWdhcmRzCkdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
