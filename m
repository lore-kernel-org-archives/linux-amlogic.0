Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE08C43217
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 12:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa1cqHR5vKN4hhnK8d2Tib3Lf1htHbWZNZhviIIZMbw=; b=Lwbmye46Vg5ocafe0UqX67Wk2T
	sPRaeAE/4Mq9bblXNSra2TtLtH6Iz/bSgRWhH2w2C5xZE8J8CsUe7MxiE12OIxAuMmwQU/swVXjEk
	Nn91X5SJL6JJ0pwyDc3QML3Frd4IaJJBm3d5hrE0lXlOE5R5EXGgx+NBsdH6NkcUDb+DMV4djMQpU
	Vb7SNKb/hlxoC9Tp/wOCm9ktPPpPzisLahmgytshVDSDlVeVETHJkmcEBuafvsB0c7IFHlxy9cRuE
	UrnJY2zqWFlk4PxWTIhHHGe46ia8hjOn5xgzBM0NswILA1RBaa/8+8DZAaPB9cEthbo1O7Czw0Yz2
	vRXvW8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHS5-003M2x-Oq; Wed, 16 Nov 2022 12:23:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHRY-003Llf-1j
	for linux-amlogic@lists.infradead.org; Wed, 16 Nov 2022 12:23:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso1469559wme.5
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Nov 2022 04:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NCcvrWSluZ6xWxoxMrbOrq+h9iD8NIFWt/ldX0zWuhg=;
        b=y5/L+vS0fpgfHuv4SUDaU3im4zKnqVUZqAewsrm2yL1im0aOMqkrOFCAeyfCFuHKFk
         i3pG4dsMgGdOYxJzSRV47RSETvRsCIcJMvuVa5Y6RgUUgGS6gi5RiE9sIpSzhLxwZxkj
         owMv+z+wewK/mGatUMqLf3Z064KooAQ/4W+xYnmJ+Y0IAyu3sCjotY9kaqY3oYeHGDzf
         pb9XrrAhk+gjDwe+KnWjk2wDITh5g+q8OQVIlxies5+Zt3Nw0xoVTXGF/pDiuCJoNzV0
         PvxBapPwuDzv6N3AyIEQA2ktOz/xzYSBKVyzmO6mD2e7dnrtF3nORH8a7YGB91Rq5n9x
         dTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCcvrWSluZ6xWxoxMrbOrq+h9iD8NIFWt/ldX0zWuhg=;
        b=ZkVzVEyKEN2faIe9hERWdsvqkASxaBOH7RoYv9r/gVf+jtv4zH5bRVQ7J9SixeQBi1
         SSJLIZtV0K5/0QyAYI8qFR6UO4tYYgBTJ+xqbHAfRKf5L9+31OWgYcP7s2gx8RlByliI
         33ads6oGCUwAGi6SmDX9HewTgKiCqnu/eC67cDzdS5qENhayXyaGyvW7Vnzdi0Bb+ceX
         MAfoN/Yp7fOPVXWd+JVTt6EuQ1kfW8Tabq0/COV1ZQkb8UVgqNxbvOhZCBS8CYFAcJzV
         6u3+d0O+Fxp0/nQrV1Y7JGl7ieD7HGEIUSY+BuAuwFrkvUptbkCtwAXTHVTFTkKu5j/Y
         Anrw==
X-Gm-Message-State: ANoB5pksYO5ghx+l+Syd8GuLthFTbaMKlCzC+v5Xq2i+aidgTXrIwDg+
	0d6YsRn+sNVLPGMGS9yQB8esIA==
X-Google-Smtp-Source: AA0mqf5IwVD4rl/ORoKYsGl8D8jAfmH8GhkGCPt7qRpoPNnSYVvMMs/Qz7TOI1ONBlHx5rk8KVrHcw==
X-Received: by 2002:a05:600c:354d:b0:3cf:6b14:1033 with SMTP id i13-20020a05600c354d00b003cf6b141033mr1995260wmq.103.1668601382220;
        Wed, 16 Nov 2022 04:23:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71? ([2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d63d1000000b002322bff5b3bsm18299131wrw.54.2022.11.16.04.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:23:01 -0800 (PST)
Message-ID: <1fdd6b67-c7c4-b927-8d01-485ce8ee645f@linaro.org>
Date: Wed, 16 Nov 2022 13:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Content-Language: en-US
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
 <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
 <12f645b5-2820-0618-1271-6c254425099c@fi.rohmeurope.com>
Organization: Linaro Developer Services
In-Reply-To: <12f645b5-2820-0618-1271-6c254425099c@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_042304_158682_A222D9B9 
X-CRM114-Status: GOOD (  22.23  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTYvMTEvMjAyMiAxMzowMiwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToKPiBIaSBkZWUgSG8g
TGF1cmVudCAmIEFsbCwKPiAKPiBPbiAxMC8yMS8yMiAxODoyOSwgTmVpbCBBcm1zdHJvbmcgd3Jv
dGU6Cj4+IEhpLAo+Pgo+PiBPbiAyMS8xMC8yMDIyIDE3OjAyLCBMYXVyZW50IFBpbmNoYXJ0IHdy
b3RlOgo+Pj4gSGkgTWF0dGksCj4+Pgo+Pj4gT24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMDQ6MTg6
MDFQTSArMDMwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOgo+Pj4+IFNpbXBsaWZ5IHVzaW5nIHRo
ZSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKCkuIEFsc28gZHJvcCB0aGUKPj4+
PiBzZWVtaW5nbHkgdW51c2VkIHN0cnVjdCBtZW1iZXIgJ2hkbWlfc3VwcGx5Jy4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF6emllc2FjY291bnRAZ21haWwuY29t
Pgo+Pj4+Cj4+Pj4gLS0tCj4+Pj4gdjMgPT4gdjQ6Cj4+Pj4gLSBzcGxpdCBtZXNvbiBwYXJ0IHRv
IG93biBwYXRjaAo+Pj4+Cj4+Pj4gUkZDdjEgPT4gdjI6Cj4+Pj4gLSBDaGFuZ2UgYWxzbyBzaWk5
MDJ4IHRvIHVzZSBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldF9lbmFibGUoKQo+Pj4+Cj4+Pj4gUGxl
YXNlIG5vdGUgLSB0aGlzIGlzIG9ubHkgY29tcGlsZS10ZXN0ZWQgZHVlIHRvIHRoZSBsYWNrIG9m
IEhXLiBDYXJlZnVsCj4+Pj4gcmV2aWV3IGFuZCB0ZXN0aW5nIGlzIF9oaWdobHlfIGFwcHJlY2lh
dGVkLgo+Pj4+IC0tLQo+Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRt
aS5jIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+Pj4+IGIvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+Pj4+IGluZGV4IDVjZDJiMmViYmJkMy4uNzY0MmY3
NDAyNzJiIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19o
ZG1pLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4+
Pj4gQEAgLTE0MCw3ICsxNDAsNiBAQCBzdHJ1Y3QgbWVzb25fZHdfaGRtaSB7Cj4+Pj4gIMKgwqDC
oMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKmhkbWl0eF9hcGI7Cj4+Pj4gIMKgwqDCoMKgwqAg
c3RydWN0IHJlc2V0X2NvbnRyb2wgKmhkbWl0eF9jdHJsOwo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVj
dCByZXNldF9jb250cm9sICpoZG1pdHhfcGh5Owo+Pj4+IC3CoMKgwqAgc3RydWN0IHJlZ3VsYXRv
ciAqaGRtaV9zdXBwbHk7Cj4+Pj4gIMKgwqDCoMKgwqAgdTMyIGlycV9zdGF0Owo+Pj4+ICDCoMKg
wqDCoMKgIHN0cnVjdCBkd19oZG1pICpoZG1pOwo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
YnJpZGdlICpicmlkZ2U7Cj4+Pj4gQEAgLTY2NSwxMSArNjY0LDYgQEAgc3RhdGljIHZvaWQgbWVz
b25fZHdfaGRtaV9pbml0KHN0cnVjdAo+Pj4+IG1lc29uX2R3X2hkbWkgKm1lc29uX2R3X2hkbWkp
Cj4+Pj4gIMKgIH0KPj4+PiAtc3RhdGljIHZvaWQgbWVzb25fZGlzYWJsZV9yZWd1bGF0b3Iodm9p
ZCAqZGF0YSkKPj4+PiAtewo+Pj4+IC3CoMKgwqAgcmVndWxhdG9yX2Rpc2FibGUoZGF0YSk7Cj4+
Pj4gLX0KPj4+PiAtCj4+Pj4gIMKgIHN0YXRpYyB2b2lkIG1lc29uX2Rpc2FibGVfY2xrKHZvaWQg
KmRhdGEpCj4+Pj4gIMKgIHsKPj4+PiAgwqDCoMKgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUo
ZGF0YSk7Cj4+Pj4gQEAgLTcyMywyMCArNzE3LDkgQEAgc3RhdGljIGludCBtZXNvbl9kd19oZG1p
X2JpbmQoc3RydWN0IGRldmljZQo+Pj4+ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPj4+
PiAgwqDCoMKgwqDCoCBtZXNvbl9kd19oZG1pLT5kYXRhID0gbWF0Y2g7Cj4+Pj4gIMKgwqDCoMKg
wqAgZHdfcGxhdF9kYXRhID0gJm1lc29uX2R3X2hkbWktPmR3X3BsYXRfZGF0YTsKPj4+PiAtwqDC
oMKgIG1lc29uX2R3X2hkbWktPmhkbWlfc3VwcGx5ID0gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlv
bmFsKGRldiwKPj4+PiAiaGRtaSIpOwo+Pj4+IC3CoMKgwqAgaWYgKElTX0VSUihtZXNvbl9kd19o
ZG1pLT5oZG1pX3N1cHBseSkpIHsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKFBUUl9FUlIobWVz
b25fZHdfaGRtaS0+aGRtaV9zdXBwbHkpID09IC1FUFJPQkVfREVGRVIpCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IG1lc29uX2R3X2hkbWktPmhkbWlfc3VwcGx5ID0gTlVMTDsKPj4+PiAtwqDCoMKgIH0gZWxzZSB7
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IHJlZ3VsYXRvcl9lbmFibGUobWVzb25fZHdfaGRt
aS0+aGRtaV9zdXBwbHkpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG1lc29uX2Rpc2FibGVfcmVndWxhdG9yLAo+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1lc29uX2R3X2hkbWktPmhkbWlfc3VwcGx5KTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHJl
dCkKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+IC3CoMKgwqAg
fQo+Pj4+ICvCoMKgwqAgcmV0ID0gZGV2bV9yZWd1bGF0b3JfZ2V0X2VuYWJsZV9vcHRpb25hbChk
ZXYsICJoZG1pIik7Cj4+Pj4gK8KgwqDCoCBpZiAocmV0ICE9IC1FTk9ERVYpCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pgo+Pj4gQXMgbm90ZWQgaW4gdGhlIHJldmlldyBvZiB0
aGUgc2VyaWVzIHRoYXQgaW50cm9kdWNlZAo+Pj4gZGV2bV9yZWd1bGF0b3JfZ2V0X2VuYWJsZV9v
cHRpb25hbCgpLCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaXMgdG8KPj4+IGltcGxlbWVudCBydW50
aW1lIFBNIGluIHRoaXMgZHJpdmVyIHRvIGF2b2lkIHdhc3RpbmcgcG93ZXIuCj4+Cj4+IFdoaWxl
IEkgYWdyZWUsIGl0J3Mgbm90IHJlYWxseSB0aGUgc2FtZSBsZXZlbCBvZiBlZmZvcnQgYXMgdGhp
cyBwYXRjaAo+PiBzaG91bGQgYmUgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQuCj4gCj4gV2hpbGUg
d2UgYWxsIGFncmVlIHRoYXQgcG93ZXIgc2F2aW5ncyBnYWluZWQgYnkgcnVudGltZSBQTSB3b3Vs
ZCBiZQo+IGdyZWF0IC0gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgc3RvcCBtaW5vciBpbXByb3Zl
bWVudHMgd2hpbGUgd2FpdGluZwo+IGZvciB0aGF0IHRvIG1hZ2ljYWxseSBoYXBwZW4gOykKPiAK
PiBJIGxpa2UgdGhlIHNheWluZyBJIGZpcnN0IGhlYXJkIGZyb20gSm9uYXRoYW4gQ2FtZXJvbiAt
ICJEb24ndCBsZXQgdGhlCj4gcGVyZmVjdCBiZSBhbiBlbmVteSBvZiBnb29kIi4KPiAKPiBBZnRl
ciB0aGF0IGJlaW5nIHNhaWQsIHNob3VsZCBJIHJlLXNwaW4gdGhpcyBvciBqdXN0IGRyb3AgaXQ/
IChJIGFtCj4gY2xlYW5pbmcgdXAgbXkgbG9jYWwgZ2l0IGZyb20gb2xkIHN0dWZmLCBhbmQgdGhl
c2UgYXJlIGFib3V0IHRvIHZhbmlzaAo+IGZyb20gbXkgYm9va3MpLgoKSSdtIG9rIHdpdGggeW91
LCBwbGVhc2UgcmUtc3BpbiBpdC4KCk5laWwKCj4gCj4gWW91cnMsCj4gCS0tIE1hdHRpCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
