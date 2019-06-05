Return-Path: <SRS0=wdVM=UE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A050C28CC5
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 12:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D08A20684
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2019 12:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RBlWxDqy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yaFsxj8c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D08A20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0UFPltvBKUYT/0lNuCMc2q8PuoSFC4rQF4JNrjzu9A=; b=RBlWxDqyFYgWrr
	KS+h2Pmy5TyhVOlFdS/j/zV6+pvUYCKOmQWjYLc6x9XIwK/uBZnbk5XSMj9stea/pvXdrc3x5Tzm9
	i46W5GasnAa08qhYyM+WOSOrFLncePRo8CB8nYtWcHvUEqcJMqhqZj7a/xU+Kh4WBsITV5NsksVxZ
	ou4UCjRzfKVVRq2ke38VHPE0VpJqZAcQbOmkr+RLMo2atz9yohViARnujccwrvc0gFRjq/sdoZryk
	t+4XcppX6dfPd1hKFVYtHMrbNwMQxNzvI1tUGLHDFQa9pE8m9Z94E9TeevchsZ2iDikMnw8syq5IV
	KYiYrvrbpSof+t2E/88Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYVVp-0003ye-2Z; Wed, 05 Jun 2019 12:59:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYVVm-0003yE-0S
 for linux-amlogic@lists.infradead.org; Wed, 05 Jun 2019 12:59:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id z23so2181000wma.4
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2019 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+hIy5lz3bZE6/4kzO9THbc36Q37XAualXeaWZ2EfADA=;
 b=yaFsxj8cVltdMdMOm4VNDMwGqqVbV6ErdfwbnPTJBtqUaQbZD8Im/B8ofS6ylkFu7F
 BAIdnPGR73fkkg7hvy9dBA0QI3PsYzJim/+FaSnIfBnV7ImTnlwP/aa+D6ETrRebMYum
 p7N9/qJHNLmRQYu+uouQbI7SQy7VJ5WUFg6YuZDTPj2LBRoWtp9mGfKyXxoYn339p5B2
 MrYkChuKavCyNmLZiiPSbNWr7BG8/3f/6sAiRP6uvJRug3iW2uU4JOnz+wA1n9tjU1Py
 edH4RlRkFUUziKsl3PAiYw52XGeU3rCJCc4m3MRiCfkVcBbubQNZ+OFCcnQeoWfFWwNs
 2YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+hIy5lz3bZE6/4kzO9THbc36Q37XAualXeaWZ2EfADA=;
 b=N0E37wvShUZgTMUclxQNsnqf4d/hm/ze0IF2T0tQGuGAGauatUt7btz4KTpzEy6Rbt
 eh72EFBdYZ+3fT7ZhxOZGrzUYihuviLW9mbj+5lr0wzoDKleUupcM1g0EncclNS6C0WK
 hRtWyFFjSECJtqaNYsRX3RZGjHq4ymfb2EpXOJ9NHIdB8c69n8Ej5HpsjfLtSMg7Ryza
 2zQL8Oyewk0Y6XepbQGhtSg7mlfmZPT3lxKw4Yc+31QTXbQ0aznXK+Z4NsgCsMoZvtJC
 ttL9yswV60HJ8F8TRiXtKhQbZZkAjQaoTk66Nfmu0AMv9m5CGoAQOJE0a351xfemz2KN
 wGGQ==
X-Gm-Message-State: APjAAAWIP7rGLoRh2XVQeQ/li0b7I13xCCL0QxwfUx+lGThk0aloIdpf
 hQOUwkLHIEupbMiwkJEKJu3NzekoTglCjg==
X-Google-Smtp-Source: APXvYqwdZDOCXe1vp00morQ7HQ4vgg8AuSLfNqYZs+v50KZbkBiR5LoZf5WJovfE26zO7Cz702XaOA==
X-Received: by 2002:a05:600c:c4:: with SMTP id
 u4mr10619368wmm.96.1559739564243; 
 Wed, 05 Jun 2019 05:59:24 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e7sm3610569wmd.0.2019.06.05.05.59.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 05:59:23 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/bridge: dw-hdmi: allow ycbcr420 modes for >=
 0x200a
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <CGME20190520133802epcas3p3e8d19d3c79e027362ac1e4cc3c09c10f@epcas3p3.samsung.com>
 <20190520133753.23871-2-narmstrong@baylibre.com>
 <020c82bc-15fd-6e23-a093-62abfa9b466d@samsung.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <956ecdbd-2ea3-6dc9-d2fa-dbba797dddc0@baylibre.com>
Date: Wed, 5 Jun 2019 14:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <020c82bc-15fd-6e23-a093-62abfa9b466d@samsung.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_055926_055799_16145206 
X-CRM114-Status: GOOD (  15.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: jernej.skrabec@siol.net, heiko@sntech.de, jonas@kwiboo.se,
 maxime.ripard@bootlin.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjIvMDUvMjAxOSAwODowNywgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBPbiAyMC4wNS4yMDE5
IDE1OjM3LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gTm93IHRoZSBEVy1IRE1JIENvbnRyb2xs
ZXIgc3VwcG9ydHMgdGhlIEhETUkyLjAgbW9kZXMsIGVuYWJsZSBzdXBwb3J0Cj4+IGZvciB0aGVz
ZSBtb2RlcyBpbiB0aGUgY29ubmVjdG9yIGlmIHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyB0aGVtLgo+
PiBXZSBsaW1pdCB0aGVzZSBtb2RlcyB0byBEVy1IRE1JIElQIHZlcnNpb24gPj0gMHgyMDBhIHdo
aWNoCj4+IGFyZSBkZXNpZ25lZCB0byBzdXBwb3J0IEhETUkyLjAgZGlzcGxheSBtb2Rlcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29t
Pgo+PiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4+IC0tLQo+
PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA2ICsrKysrKwo+
PiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgfCAxICsKPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCj4+IGluZGV4IGFiNzk2OGM4ZjZhMi4uYjUwYzQ5Y2FmN2Fl
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+PiBA
QCAtMjYyOSw2ICsyNjI5LDEyIEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LAo+PiAgCWlmIChoZG1pLT5waHkub3BzLT5zZXR1cF9ocGQpCj4+ICAJCWhkbWkt
PnBoeS5vcHMtPnNldHVwX2hwZChoZG1pLCBoZG1pLT5waHkuZGF0YSk7Cj4+ICAKPj4gKwlpZiAo
aGRtaS0+dmVyc2lvbiA+PSAweDIwMGEpCj4+ICsJCWhkbWktPmNvbm5lY3Rvci55Y2Jjcl80MjBf
YWxsb3dlZCA9Cj4+ICsJCQloZG1pLT5wbGF0X2RhdGEtPnljYmNyXzQyMF9hbGxvd2VkOwo+PiAr
CWVsc2UKPj4gKwkJaGRtaS0+Y29ubmVjdG9yLnljYmNyXzQyMF9hbGxvd2VkID0gZmFsc2U7Cj4+
ICsKPiAKPiAKPiBJIHN1c3BlY3QgZWxzZSBjbGF1c2UgY2FuIGJlIGRyb3BwZWQuCgpZb3UgYXJl
IHJpZ2h0LCB0aGFua3MgZm9yIHRoZSByZXZpZXcuCgpEbyB5b3UgaGF2ZSBjb21tZW50cyBvbiB0
aGUgcGF0Y2hlcyAyLCAzICYgNCBvZiBzZXJpZSA/CgpUaGFua3MsCk5laWwKCj4gCj4gQmVzaWRl
IHRoaXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+Cj4gCj4gwqAtLQo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4gCj4+ICAJbWVtc2V0KCZwZGV2
aW5mbywgMCwgc2l6ZW9mKHBkZXZpbmZvKSk7Cj4+ICAJcGRldmluZm8ucGFyZW50ID0gZGV2Owo+
PiAgCXBkZXZpbmZvLmlkID0gUExBVEZPUk1fREVWSURfQVVUTzsKPj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5o
Cj4+IGluZGV4IDY2ZTcwNzcwY2NlNS4uMGYwZTgyNjM4ZmJlIDEwMDY0NAo+PiAtLS0gYS9pbmNs
dWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19o
ZG1pLmgKPj4gQEAgLTEzMCw2ICsxMzAsNyBAQCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgewo+
PiAgCQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7Cj4+ICAJdW5z
aWduZWQgbG9uZyBpbnB1dF9idXNfZm9ybWF0Owo+PiAgCXVuc2lnbmVkIGxvbmcgaW5wdXRfYnVz
X2VuY29kaW5nOwo+PiArCWJvb2wgeWNiY3JfNDIwX2FsbG93ZWQ7Cj4+ICAKPj4gIAkvKiBWZW5k
b3IgUEhZIHN1cHBvcnQgKi8KPj4gIAljb25zdCBzdHJ1Y3QgZHdfaGRtaV9waHlfb3BzICpwaHlf
b3BzOwo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
