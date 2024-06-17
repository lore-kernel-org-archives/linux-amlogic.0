Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD29C2BA18
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ubWdYhll37Gj6Tpr1zMPKNDkc3JxNVr7I6fKidABxo=; b=dgopSKoCUWsEvz
	/ngiFtYA1CK0PpKHv+HMbPFnnhfX9IhLYddUI4/nSmhGXckKMMvfQ1Xkmz9y2wmz92Y3Up9DaIa+Y
	YJcCR9/1hk0Exurdp6vRadNHldCxg3gWj9m8bS/fVXlZmVqrGlGGeywuJohzKxThDYJSlbuzgaAAa
	g5nNVuQKLgin2tXUWHUv6T3rUSILoms4LgPvLW6U/Pysd7M6D0b+CSL8PQyl5riFk+5wV9uAStxw/
	UX9C07UsMxyH48/cq6oFbh9gaCFz1yjuThwOrW7MmVLIY/rrTDXCr5jghZCW0goP4ENdHPhCMF6tr
	k25kxfDWxNGyT4+umMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkE-0000000Awq2-1b55;
	Mon, 17 Jun 2024 13:50:02 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCk0-0000000AwgI-1DcR
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:49:52 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-797e2834c4eso366664485a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632185; x=1719236985; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEZzvAHWKcqdW88FUmiOeBtiUSRBF94/JlX6CLy/U9k=;
        b=uUuq8G1+n8Bitl4QO4X6Zam3w+9UFOj9r6KwNWyDeumJkDL/YE00/qmZFzkcgFLE7G
         tbSw5pXqpxKO60gV9rLqI7tp7TPQuT8p70NyqewdeorCCwtnSx+nCdg7RfbvVpiPyd7p
         LEfUxnIS6nYdc0FkSLP+q6v2VLkkr865ptkt8an7CbuGo//Ii0PG4xRzZRqrjt/Ary1A
         5OY0ZZmcott4NcHvdkVmyLMpIR3yR+SnkY5SKZes+HXWxWlwKSdlA1eh+gCZYv4Wfjwl
         5/NpYwNy8aYoe5UbXPx+1h1W967TCOtbZBfUaNqKn7GwlP4hUjlqipzf26IAHN5IbPW2
         mt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632185; x=1719236985;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEZzvAHWKcqdW88FUmiOeBtiUSRBF94/JlX6CLy/U9k=;
        b=R3uhL0bEKAHFCITcLFV4BSWr/PlGulxMU3g9bqif6cHq9j77mPWQJzbPUoH+yeBoNa
         KY4veuwram1xZGCL8Ztg391oHMwULgdz8kWLWQO0YtMuff9hUnIv9x/EFqmgGs+p6S9j
         1x2sGv2kQQxYNbGTBmP7owjU//FqVEBHIopNyUtow4yIn1VhdeqjPZ62V4ntKt4rwPwG
         ydD1Q7JH100q391H95OiisbWqY29ZJgQrwxK5jAXQj28+rQWGdDVI8pHAT0mTcYF5GEK
         Duxhy76vjvOzy9XhOlQv9v2VKg+aVedtQrXpAoEZ9I9AQejl8pzd/afBq8lXMIeRf9Pv
         iDqw==
X-Forwarded-Encrypted: i=1; AJvYcCUYEvEjpUuehHb/yjmLPl6DwM1cAQUP/8HRp0s8C03tZzYxCV9wTeEqAgKq+Jckh+pY14IxhKXJRjLoq7jh3pbrQnMZd91CfNAQD8Il/fsttWo=
X-Gm-Message-State: AOJu0Yw4+dIDNz+CN6kvUwAokwXt4go3FkyE1cNH8qTufBd6TbRBz6sW
	ubIkWmpp6RMcEAHct16I1XjAzaPlE1CoNZbdVYJn0KXMZXzfGkVByWSdEAd+KFE=
X-Google-Smtp-Source: AGHT+IGl+FE2+2KgsFe4nDCWU6ldgP4GuYAR3dN1AUsj37hFWlNJf2lL8nOBoXUFKBqFYKKh6gBcWA==
X-Received: by 2002:a05:620a:24c9:b0:795:233c:6980 with SMTP id af79cd13be357-79810103071mr2016071085a.20.1718632184654;
        Mon, 17 Jun 2024 06:49:44 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:44 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v3 00/41] iio: simplify with regmap_set_bits(),
 regmap_clear_bits()
Date: Mon, 17 Jun 2024 09:49:40 -0400
Message-Id: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPQ+cGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0MTXZCi1HJd81QzgxRDU8tUc9MUJaDigqLUtMwKsEHRsbW1AEPlT+1
 YAAAA
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
X-CRM114-CacheID: sfid-20240617_064948_368398_4213B646 
X-CRM114-Status: GOOD (  10.24  )
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

U2ltcGxpZnkgdGhlIHdheSByZWdtYXAgaXMgYWNjZXNzZWQgaW4gaWlvIGRyaXZlcnMuCgpJbnN0
ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHRoZSBtYXNrIHR3
aWNlLCB1c2UKcmVnbWFwX3NldF9iaXRzKCkuCgpJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRh
dGVfYml0cygpIGFuZCBwYXNzaW5nIHZhbCA9IDAsIHVzZQpyZWdtYXBfY2xlYXJfYml0cygpLgoK
VGhlIHNlcmllcyBpcyBtYXJrZWQgYXMgdjMsIGJ1dCB0aGUgcHJldmlvdXMgdHdvIHJldmlzaW9u
cyB3ZXJlIHNpbmdsZQpwYXRjaGVzLiBUaGVyZSB3YXMgYWxzbyBhIHJlc2VuZCBvZiB2MSBkdWUg
dG8gbm90IHByb3Blcmx5IENDaW5nIHRoZQptYWlsaW5nIGxpc3RzIG9uIHRoZSBmaXJzdCBhdHRl
bXB0LiBUcmFpbGVycyB3ZXJlIHB1bGxlZCBpbiBmcm9tIHRob3NlCndoZXJlIHJlbGV2YW50LgoK
TGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaWlvLzIwMjQwNjEzMTMz
OTI3LjM4NTEzNDQtMS10Z2FtYmxpbkBiYXlsaWJyZS5jb20vCkxpbmsgdG8gdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWlpby8yMDI0MDYxMTE2NTIxNC40MDkxNTkxLTEtdGdhbWJs
aW5AYmF5bGlicmUuY29tLwoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1i
bGluQGJheWxpYnJlLmNvbT4KLS0tClRyZXZvciBHYW1ibGluICg0MSk6CiAgICAgIGlpbzogYWNj
ZWw6IGZ4bHM4OTYyYWYtY29yZTogTWFrZSB1c2Ugb2YgcmVnbWFwX3NldF9iaXRzKCksIHJlZ21h
cF9jbGVhcl9iaXRzKCkKICAgICAgaWlvOiBhY2NlbDoga3hzZDk6IE1ha2UgdXNlIG9mIHJlZ21h
cF9jbGVhcl9iaXRzKCkKICAgICAgaWlvOiBhY2NlbDogbXNhMzExOiBtYWtlIHVzZSBvZiByZWdt
YXBfY2xlYXJfYml0cygpCiAgICAgIGlpbzogYWRjOiBhZDQxMzA6IG1ha2UgdXNlIG9mIHJlZ21h
cF9jbGVhcl9iaXRzKCkKICAgICAgaWlvOiBhZGM6IGF4cDIweF9hZGM6IG1ha2UgdXNlIG9mIHJl
Z21hcF9zZXRfYml0cygpCiAgICAgIGlpbzogYWRjOiBheHAyODhfYWRjOiBtYWtlIHVzZSBvZiBy
ZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IGFkYzogYmNtX2lwcm9jX2FkYzogbWFrZSB1c2Ug
b2YgcmVnbWFwX2NsZWFyX2JpdHMoKQogICAgICBpaW86IGFkYzogYmVybGluMi1hZGM6IG1ha2Ug
dXNlIG9mIHJlZ21hcF9jbGVhcl9iaXRzKCksIHJlZ21hcF9zZXRfYml0cygpCiAgICAgIGlpbzog
YWRjOiBjcGNhcC1hZGM6IG1ha2UgdXNlIG9mIHJlZ21hcF9jbGVhcl9iaXRzKCksIHJlZ21hcF9z
ZXRfYml0cygpCiAgICAgIGlpbzogYWRjOiBmc2wtaW14MjUtZ2NxOiBtYWtlIHVzZSBvZiByZWdt
YXBfY2xlYXJfYml0cygpLCByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IGFkYzogaW5hMnh4
LWFkYzogbWFrZSB1c2Ugb2YgcmVnbWFwX2NsZWFyX2JpdHMoKQogICAgICBpaW86IGFkYzogaW50
ZWxfbXJmbGRfYWRjOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xlYXJfYml0cygpCiAgICAgIGlpbzog
YWRjOiBtZXNvbl9zYXJhZGM6IG1ha2UgdXNlIG9mIHJlZ21hcF9jbGVhcl9iaXRzKCksIHJlZ21h
cF9zZXRfYml0cygpCiAgICAgIGlpbzogYWRjOiBtcDI2MjlfYWRjOiBtYWtlIHVzZSBvZiByZWdt
YXBfY2xlYXJfYml0cygpLCByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IGFkYzogcWNvbS1z
cG1pLXJyYWRjOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xlYXJfYml0cygpLCByZWdtYXBfc2V0X2Jp
dHMoKQogICAgICBpaW86IGFkYzogcm41dDYxOC1hZGM6IG1ha2UgdXNlIG9mIHJlZ21hcF9zZXRf
Yml0cygpCiAgICAgIGlpbzogYWRjOiBzYzI3eHhfYWRjOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xl
YXJfYml0cygpLCByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IGFkYzogc3RtMzItZGZzZG0t
YWRjOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xlYXJfYml0cygpLCByZWdtYXBfc2V0X2JpdHMoKQog
ICAgICBpaW86IGRhYzogbHRjMjY4ODogbWFrZSB1c2Ugb2YgcmVnbWFwX3NldF9iaXRzKCkKICAg
ICAgaWlvOiBkYWM6IHN0bTMyLWRhYy1jb3JlOiBtYWtlIHVzZSBvZiByZWdtYXBfc2V0X2JpdHMo
KQogICAgICBpaW86IGd5cm86IGJtZzE2MF9jb3JlOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xlYXJf
Yml0cygpCiAgICAgIGlpbzogZ3lybzogbXB1MzA1MC1jb3JlOiBtYWtlIHVzZSBvZiByZWdtYXBf
Y2xlYXJfYml0cygpLCByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IGhlYWx0aDogYWZlNDQw
MzogbWFrZSB1c2Ugb2YgcmVnbWFwX2NsZWFyX2JpdHMoKSwgcmVnbWFwX3NldF9iaXRzKCkKICAg
ICAgaWlvOiBoZWFsdGg6IGFmZTQ0MDQ6IG1ha2UgdXNlIG9mIHJlZ21hcF9jbGVhcl9iaXRzKCks
IHJlZ21hcF9zZXRfYml0cygpCiAgICAgIGlpbzogaGVhbHRoOiBtYXgzMDEwMDogbWFrZSB1c2Ug
b2YgcmVnbWFwX3NldF9iaXRzKCkKICAgICAgaWlvOiBoZWFsdGg6IG1heDMwMTAyOiBtYWtlIHVz
ZSBvZiByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IGltdTogaW52X2ljbTQyNjAwOiBtYWtl
IHVzZSBvZiByZWdtYXBfY2xlYXJfYml0cygpLCByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86
IGxpZ2h0OiBhZHV4MTAyMDogbWFrZSB1c2Ugb2YgcmVnbWFwX2NsZWFyX2JpdHMoKSwgcmVnbWFw
X3NldF9iaXRzKCkKICAgICAgaWlvOiBsaWdodDogaXFzNjIxLWFsczogbWFrZSB1c2Ugb2YgcmVn
bWFwX2NsZWFyX2JpdHMoKQogICAgICBpaW86IGxpZ2h0OiBpc2wyOTAxODogbWFrZSB1c2Ugb2Yg
cmVnbWFwX2NsZWFyX2JpdHMoKQogICAgICBpaW86IGxpZ2h0OiBzdF91dmlzMjVfY29yZTogbWFr
ZSB1c2Ugb2YgcmVnbWFwX2NsZWFyX2JpdHMoKQogICAgICBpaW86IGxpZ2h0OiB2ZW1sNjAzMDog
bWFrZSB1c2Ugb2YgcmVnbWFwX2NsZWFyX2JpdHMoKQogICAgICBpaW86IG1hZ25ldG9tZXRlcjog
YWs4OTc0OiBtYWtlIHVzZSBvZiByZWdtYXBfc2V0X2JpdHMoKQogICAgICBpaW86IG1hZ25ldG9t
ZXRlcjogbW1jMzUyNDA6IG1ha2UgdXNlIG9mIHJlZ21hcF9zZXRfYml0cygpCiAgICAgIGlpbzog
cHJlc3N1cmU6IGJtcDI4MC1jb3JlOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xlYXJfYml0cygpCiAg
ICAgIGlpbzogcHJveGltaXR5OiBzeDkzMjQ6IG1ha2UgdXNlIG9mIHJlZ21hcF9zZXRfYml0cygp
CiAgICAgIGlpbzogcHJveGltaXR5OiBzeDkzNjA6IG1ha2UgdXNlIG9mIHJlZ21hcF9zZXRfYml0
cygpCiAgICAgIGlpbzogcHJveGltaXR5OiBzeDk1MDA6IG1ha2UgdXNlIG9mIHJlZ21hcF9jbGVh
cl9iaXRzKCksIHJlZ21hcF9zZXRfYml0cygpCiAgICAgIGlpbzogcHJveGltaXR5OiBzeF9jb21t
b246IG1ha2UgdXNlIG9mIHJlZ21hcF9jbGVhcl9iaXRzKCksIHJlZ21hcF9zZXRfYml0cygpCiAg
ICAgIGlpbzogdGVtcGVyYXR1cmU6IG1seDkwNjMyOiBtYWtlIHVzZSBvZiByZWdtYXBfY2xlYXJf
Yml0cygpCiAgICAgIGlpbzogdHJpZ2dlcjogc3RtMzItdGltZXItdHJpZ2dlcjogbWFrZSB1c2Ug
b2YgcmVnbWFwX2NsZWFyX2JpdHMoKSwgcmVnbWFwX3NldF9iaXRzKCkKCiBkcml2ZXJzL2lpby9h
Y2NlbC9meGxzODk2MmFmLWNvcmUuYyAgICAgICAgICAgICAgICB8ICAxOCArKy0tCiBkcml2ZXJz
L2lpby9hY2NlbC9reHNkOS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogZHJp
dmVycy9paW8vYWNjZWwvbXNhMzExLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0K
IGRyaXZlcnMvaWlvL2FkYy9hZDQxMzAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0
ICstCiBkcml2ZXJzL2lpby9hZGMvYXhwMjB4X2FkYy5jICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNSArLQogZHJpdmVycy9paW8vYWRjL2F4cDI4OF9hZGMuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDQgKy0KIGRyaXZlcnMvaWlvL2FkYy9iY21faXByb2NfYWRjLmMgICAgICAgICAgICAg
ICAgICAgIHwgICA4ICstCiBkcml2ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICAyNCArKystLQogZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNDYgKysrKy0tLS0tLQogZHJpdmVycy9paW8vYWRjL2ZzbC1p
bXgyNS1nY3EuYyAgICAgICAgICAgICAgICAgICAgfCAgMTYgKystLQogZHJpdmVycy9paW8vYWRj
L2luYTJ4eC1hZGMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvaWlv
L2FkYy9pbnRlbF9tcmZsZF9hZGMuYyAgICAgICAgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJz
L2lpby9hZGMvbWVzb25fc2FyYWRjLmMgICAgICAgICAgICAgICAgICAgICB8IDEwMSArKysrKysr
KystLS0tLS0tLS0tLS0KIGRyaXZlcnMvaWlvL2FkYy9tcDI2MjlfYWRjLmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDE5ICsrLS0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktcnJhZGMuYyAg
ICAgICAgICAgICAgICAgIHwgIDUwICsrKysrLS0tLS0KIGRyaXZlcnMvaWlvL2FkYy9ybjV0NjE4
LWFkYy5jICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL2lpby9hZGMvc2My
N3h4X2FkYy5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0MSArKysrLS0tLS0KIGRyaXZlcnMv
aWlvL2FkYy9zdG0zMi1kZnNkbS1hZGMuYyAgICAgICAgICAgICAgICAgIHwgIDI5ICsrKy0tLQog
ZHJpdmVycy9paW8vZGFjL2x0YzI2ODguYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUg
Ky0KIGRyaXZlcnMvaWlvL2RhYy9zdG0zMi1kYWMtY29yZS5jICAgICAgICAgICAgICAgICAgIHwg
ICA1ICstCiBkcml2ZXJzL2lpby9neXJvL2JtZzE2MF9jb3JlLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQogZHJpdmVycy9paW8vZ3lyby9tcHUzMDUwLWNvcmUuYyAgICAgICAgICAgICAg
ICAgICAgfCAgMzMgKysrLS0tLQogZHJpdmVycy9paW8vaGVhbHRoL2FmZTQ0MDMuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDkgKy0KIGRyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDA0LmMgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA5ICstCiBkcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDAu
YyAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9paW8vaGVhbHRoL21heDMw
MTAyLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvaWlvL2ltdS9pbnZf
aWNtNDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jIHwgIDE0ICsrLQogZHJpdmVycy9paW8vaW11
L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfY29yZS5jICAgfCAgIDkgKy0KIGRyaXZlcnMvaWlv
L2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2kyYy5jICAgIHwgICA0ICstCiBkcml2ZXJz
L2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYwMF9zcGkuYyAgICB8ICAgNCArLQogZHJp
dmVycy9paW8vbGlnaHQvYWR1eDEwMjAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKyst
CiBkcml2ZXJzL2lpby9saWdodC9pcXM2MjEtYWxzLmMgICAgICAgICAgICAgICAgICAgICB8ICAg
NCArLQogZHJpdmVycy9paW8vbGlnaHQvaXNsMjkwMTguYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDYgKy0KIGRyaXZlcnMvaWlvL2xpZ2h0L3N0X3V2aXMyNV9jb3JlLmMgICAgICAgICAgICAg
ICAgIHwgICA0ICstCiBkcml2ZXJzL2lpby9saWdodC92ZW1sNjAzMC5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNCArLQogZHJpdmVycy9paW8vbWFnbmV0b21ldGVyL2FrODk3NC5jICAgICAg
ICAgICAgICAgICAgfCAgMTEgKy0tCiBkcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvbW1jMzUyNDAu
YyAgICAgICAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9paW8vcHJlc3N1cmUvYm1wMjgwLWNv
cmUuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkz
MjQuYyAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL2lpby9wcm94aW1pdHkv
c3g5MzYwLmMgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9paW8vcHJveGlt
aXR5L3N4OTUwMC5jICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKy0tCiBkcml2ZXJzL2lpby9w
cm94aW1pdHkvc3hfY29tbW9uLmMgICAgICAgICAgICAgICAgICB8ICAgOSArLQogZHJpdmVycy9p
aW8vdGVtcGVyYXR1cmUvbWx4OTA2MzIuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZl
cnMvaWlvL3RyaWdnZXIvc3RtMzItdGltZXItdHJpZ2dlci5jICAgICAgICAgIHwgIDM0ICsrKyst
LS0KIDQ0IGZpbGVzIGNoYW5nZWQsIDI3MyBpbnNlcnRpb25zKCspLCAzNDcgZGVsZXRpb25zKC0p
Ci0tLQpiYXNlLWNvbW1pdDogMTYxM2U2MDRkZjBjZDM1OWNmMmE3ZmJkOWJlN2EwYmNmYWNmYWJk
MApjaGFuZ2UtaWQ6IDIwMjQwNjE0LXJldmlldy03ZTYwZDE1OWU3NWQKCkJlc3QgcmVnYXJkcywK
LS0gClRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
