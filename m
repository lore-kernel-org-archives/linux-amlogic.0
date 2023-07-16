Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B3FEB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jul 2023 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRtRaIPJws7PMWYBWRBLyLv+Qz33Xw8pRDEikc/a9WU=; b=y+Sbeuqoo/R/kl
	sJKYkF34iNwU8bCZt3bFlmiIpP3hswpdclNw/FtY3NhM6ZW5L4ZKdSVT/nVsx2QB3PVgWqH+O4741
	nOEvtugpn3IsItPz8JgRUhj4DpS630a9I1jsIzJHM5av/SRrWwVUHm88r4ePZLYgyzKUK0mL+pC+n
	R8sgKY1kMbk1I9hgzrG91EDtx4/e5mujr5Bw1G/+6mviz4a3OyYI8SBqf4mF1D65ERhPipqv50czA
	7dtzWGKTsy1JML7UzgCXMnDaHShZFiocpoTejRfXT5zTnMBL9IFMdkjCg+AqnpXvd8hIjSWD0X6sm
	/ayBlzdBChcsgo7QNCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL8Tx-00FAHK-1Z;
	Sun, 16 Jul 2023 20:36:41 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL8Tv-00FAEM-06;
	Sun, 16 Jul 2023 20:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689539780; x=1690144580; i=markus.elfring@web.de;
 bh=TALiqAC8tkujy2+fKARULLr24flBXIXV5UwUpXROOdc=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=TG7IvPbRiaDYgtFF/R0UbjFdcULosu1qQ+zQfaTRglS+LqTTox7eV/jP70DnQ6hZg2mIV31
 ABfrXzqZBIfaVtkJN9QsVxcll8ekq4oNKqJQKOVczyfmvcFhSpAaERVPiFOpW3ZDuY96UB9fm
 lfsAI5OfwVAfIdBov7day4M0iQ2T8+pcZNqGFK8fjpLoZtA3cEPys8tbr/vkLqqKm2IEK9BZH
 Kv2kjesqommMeYJZCiyW23OIuWxLDxLh3UojxgrAL032IAZPh1u/S2ZrYU+oJPI4uCUEKVI2Y
 b4y0ADZ34E7TDuFc58Q3Ztl5Tiq7TklaFn3h5f1rYtYKiJou23WQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4NDQ-1puHty13n4-011KDO; Sun, 16
 Jul 2023 22:36:20 +0200
Message-ID: <4b58408b-fc52-62f6-71e7-2337f80b3198@web.de>
Date: Sun, 16 Jul 2023 22:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: George Stark <gnstark@sberdevices.ru>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Cameron <jic23@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@sberdevices.ru
References: <20230715110654.6035-3-gnstark@sberdevices.ru>
Subject: Re: [PATCH 2/3] iio: adc: meson: init internal continuous ring
 counter
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230715110654.6035-3-gnstark@sberdevices.ru>
X-Provags-ID: V03:K1:nce09JW1hAGRjTC4gyfZDA8Imf8X5HAlfyrbOJp1Y6KB1OfDiif
 if7gijqIN74PttOtiKHVhAfwTKMI1ckwX0r1P+8vbJR40ZzY0plx7SaZ0mml9mxZd+2YDbf
 hR2gFEpL2VrjoWTcctlQDkyDjaSLWIwLPLiFCwMDoWhZqbOeE3WfQXPiJiAkfGUJFsyiPr1
 AG+93ZAOLZpJ0GbzVUU3A==
UI-OutboundReport: notjunk:1;M01:P0:747fYI6uiPQ=;pLK4TN82QzTlUc1l85YaTwyEYli
 mVDArEkI59C0r9CkjDmk8A5L/LtAZZf7QG/IAQsFJiPcOPhil/fqNerD5QE2JvEFpZZfgYnAS
 I871iMBDF3Ph2MvzUI7NwKT9OVPh6oK8RN5d/63WMt9p8UxVWy5H+MkGGodf1PYPTUQWDfi9l
 sB9phLp+gNXo+hCgPgIy/CATdEAb0DOlUWeuYwfkuj6I2QR/oIasM9e2/+cws/q7vWl8QizIO
 H8cviki6U4mp8j2ifsKQYeW9o4qzY9kVcPDNALZjg5llhnyr2NKwTbo3Li7AtVJay/xow6rI4
 hPPN1QvH3ixRl05KBRbRQ2kOztZx/aXqcZKRDagtd5vflHjRXL2uaQGjfLmPeqcINoQZ+3Qnv
 ohih4F02wLRRLyPT7Aer53obhhuk6U/81gFH83IRqNj6DpRzvr7eW2g5KjAU14XsjIwXEq637
 AZDwbxaSYE02I0ptkeFwTb3tb12HIhqwlXWq20xROQ28MQqa4o+H7LpISj7Y5PXRXEwenB382
 Nrv/4GdJKnXng7GMYUYRsiqcLCact0ja4M082NbiGwYEqtAxCQSJYfXWL6RcXpwNyFfDJ+B8j
 WubOSuAiJK9oYU7ASh2bAjtusPUvz6swcoRd29SrURya2y21qKrFZfo4EvjN1fNI1yi/DhjTj
 1CBZzosJl2HDRq7YadcEDSIkEYvV0Uq7EXfC/0U/hEivl5CEhJtRhfP9z8TQTnuwo+lFP6B44
 ovcHk/e/0D29ww5EcO8Bz7IAtsMUFJb9qHseKjHE7xImRGueHQ+AKSdofZD8cKmJkmLKnD+nL
 AFRMPnGugc52M88t9u/ksupJ//7ZuuqVsLvCt24o7EfcbH6zjkDB8qsLj0leTJZxKiBQ0NPwG
 R37gmxcSc/XFu7r/09vKMonf86cAJBf4aZBWg8p4Za7B6gWU3tSvDB38lnGibrIbPZ2W6x1Fg
 QBeOYA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_133639_380152_01FB30B1 
X-CRM114-Status: UNSURE (   6.24  )
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

4oCmCj4gVGhpcyBiaXQgYXJlIGluaXRlZCBpbiB2ZW5kb3IgYm9vdCBjb2RlIChibDIsIGJsMzMp
IGFscmVhZHkgc28gZG8gaXQKPiBpbiB0aGUgZHJpdmVyIHRvIG5vdCBkZXBlbmQgb24gb3RoZXIg
Y29kZS4KCkNhbiBhIHdvcmRpbmcgdmFyaWFudCAobGlrZSB0aGUgZm9sbG93aW5nKSBiZSBuaWNl
ciBmb3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KCgogIFRoZXNlIGJpdHMgYXJlIGluaXRpYWxp
c2VkIGluIHZlbmRvciBib290IGNvZGUgKGJsMiwgYmwzMykgYWxyZWFkeS4KICBUaHVzIGRvIGl0
IGluIHRoZSBkcml2ZXIgdG8gbm90IGRlcGVuZCBvbiBvdGhlciBjb2RlLgoKClJlZ2FyZHMsCk1h
cmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
