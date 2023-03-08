Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D29AC678D5
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8yD6QrU8BhaYyop9U9tn1XPFLEak4IegDAjEPLPYzA=; b=JEVDOxcc1j7e08LQU/yiIlkGmx
	kVKegvOWKLgOaNrg/XjQ8ZHXZqwfPFgPxvwtShW3KvODfXVLa98uFYS+XeUdq3jvUVovsHgpsOyra
	kT9Cb0p7UK6ytiY+uM+18rcwtHSi41wZWm7K41zouB63CCxkwGCoqRpktTp6jgLc/MXoi8TK3iHVT
	zwOHIfxu1/E5iLiWA7a2IaCTKjmsm00ODiKeMumHAwep8V3H0GTc+fkRwWs+S0AwNWDvnHqVU5mbW
	Ewt2So8hOqKNvCQaruLe5tl3LOoW5xpe8MO6HyJftcF5bR62amCzVaJi3sB/UX8mtq2DTsOSSkHOv
	hTAnM4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxjh-006CmW-5R; Wed, 08 Mar 2023 17:37:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxje-006Cl7-8z
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 17:37:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso1630910wms.5
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 09:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678297070;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=skIGdbpVmMRPb/941SzbmTy9IEdDKFk95x2yttIkbCs=;
        b=gLbkbJvQ2YNc9skI238CxF3azuVfi6CnqdjFUgi3WHqNMS9PdlHRUBSjDi5jRGijPX
         W3sjdPenu/8Ezh+s3KGjcUtGdsfm3HEHIQUxP6AO243ZJRQqzq2gewCG4hHaxuHVSXiS
         evZL9rd+VlnqGPq4a4ASjay2s/HMJ4hLesdCaPySck/ApFuwDuV8WaFya8oXieJKn6PM
         tYis72tFHro4o2enQZob9si73lwjrnH1P2RXSlup5J5E4xyum5I7chNqmjZQhxIzxDjQ
         bqT4A7ePLkqMwbeW8ZTjY5rf1XAzWpxGVYVHewwIvnWakegeauGGE8E+WN87ZWJF5bcp
         o48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678297070;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skIGdbpVmMRPb/941SzbmTy9IEdDKFk95x2yttIkbCs=;
        b=E3Ejxzazmbp2kb2kuzJUcAN1wV+1c3VV7BrMNeOelFfKnfRwSAu5PI4U82r93HEf7u
         3531liJEd8sEWDx+XGZKJ8EQdgR/St8zZZumH9CxZCAfBqvC4cGgu4S1FInwhEpBLIFc
         CvdR2qXXsvYOYADCv64XXeqtvwNX2m++LTwEjElXFB8FQnsg6rJOMAQi3Q2PV/IPGhhR
         r1kvwAXMqPksw8Mw7UYl4x7o9VHHGsXcJ15UYEh3/SYrWpg0tI3FExXbtVDB5pG63zMw
         vTkNMwbImzjy1UpJBt7dUl4PJNKZI56gnCj/ik0U+2P7ISaeC2XGCP7xmcE6H/owQyLN
         E58w==
X-Gm-Message-State: AO0yUKUOGg6Dv5mGjbr4v/4gIPJQ2h3qLTdbF4uck6ff5ovK1hSbNTfm
	3zQ964i9/Fy8yHQxwaN651kwjg==
X-Google-Smtp-Source: AK7set88DVG9CWAtTspajqrUjWpjJ01hMHVoibkhTu1MDm2Om+vXV1B+witcqffqp8E4eiiXeCGQLw==
X-Received: by 2002:a05:600c:a49:b0:3e2:6ec:61ea with SMTP id c9-20020a05600c0a4900b003e206ec61eamr16323844wmq.28.1678297070469;
        Wed, 08 Mar 2023 09:37:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34? ([2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c3b0800b003eae73ee4a1sm108749wms.17.2023.03.08.09.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 09:37:50 -0800 (PST)
Message-ID: <629435a5-fb47-2cb5-78b6-e42c943aa397@linaro.org>
Date: Wed, 8 Mar 2023 18:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: en-US
To: Franky Lin <franky.lin@broadcom.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Arend van Spriel <aspriel@gmail.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>, linux-wireless@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
 <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
 <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr>
 <CA+8PC_du5dMwkmAshG2mM9TdeJft5aeAbEdDp0_q3Rxdvpq4MQ@mail.gmail.com>
 <f14407f1-e16f-0074-6e29-c597754ae617@free.fr>
 <CA+8PC_dFTvv9VtY9jBWLLwSoQzGxQd57zWMsnN6amddop4Yw-g@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CA+8PC_dFTvv9VtY9jBWLLwSoQzGxQd57zWMsnN6amddop4Yw-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_093754_367181_5ED4B731 
X-CRM114-Status: GOOD (  16.28  )
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

T24gMDgvMDMvMjAyMyAxODoyMSwgRnJhbmt5IExpbiB3cm90ZToKPiBPbiBXZWQsIE1hciA4LCAy
MDIzIGF0IDQ6NDjigK9BTSBNYXJjIEdvbnphbGV6IDxtYXJjLncuZ29uemFsZXpAZnJlZS5mcj4g
d3JvdGU6Cj4+Cj4+IE9uIDA4LzAzLzIwMjMgMDA6MTUsIEZyYW5reSBMaW4gd3JvdGU6Cj4+Cj4+
PiBPbiBUdWUsIE1hciA3LCAyMDIzIGF0IDY6NDDigK9BTSBNYXJjIEdvbnphbGV6IHdyb3RlOgo+
Pj4KPj4+PiBUaHJvdWdoIHRoZSBTRElPIGJ1cywgdGhlIFdpRmkgY2hpcCByZXBvcnRzIDB4YWFl
NyAoaS5lLiA0Mzc1MSkKPj4+PiBoZW5jZSB0aGUgL3N5cy9idXMvc2Rpby9kZXZpY2VzIG91dHB1
dCBhYm92ZS4KPj4+Pgo+Pj4+IHNkaW9fcmVhZF9mdW5jX2NpcygpIC0+IHNkaW9fcmVhZF9jaXMo
KSB3aGljaCBzZXRzCj4+Pj4gZnVuYy0+dmVuZG9yL2Z1bmMtPmRldmljZSB0byAyZDAvYWFlNwo+
Pj4+Cj4+Pj4KPj4+PiBCdXQgd2hlbiBicmNtZl9jaGlwX3JlY29nbml0aW9uKCkgY2FsbHMgY2kt
Pm9wcy0+cmVhZDMyKCkKPj4+PiBpLmUuIGJyY21mX3NkaW9fYnVzY29yZV9yZWFkMzIoKQo+Pj4+
IFsgdnMgYnJjbWZfc2Rpb2RfcmVhZGwoKSBpbiBicmNtZl9zZGlvX3Byb2JlX2F0dGFjaCgpIF0K
Pj4+Pgo+Pj4+IFsgICAgMS4xNzcyODNdIGJyY21mbWFjOiBGMSBzaWduYXR1cmUgcmVhZCBAMHgx
ODAwMDAwMD0weDEwNDJhYWU4Cj4+Pj4gWyAgICAxLjE4MjkxMl0gZm91bmQgQVhJIGNoaXA6IEJD
TTQzNzUyLzIKPj4+PiBbICAgIDEuMTg2Mzg0XSBCQ000Mzc1Mi8yOiBjaGlwPWFhZTggcmV2PTIg
dHlwZT0xCj4+Pj4KPj4+PiBIZXJlIGl0IHJlcG9ydHMgMHhhYWU4IChpLmUuIDQzNzUyKQo+Pj4+
Cj4+Pj4gV2h5IHRoZSBkaXNjcmVwYW5jeT8KPj4+PiBDYW4gaXQgY2F1c2UgaXNzdWVzPwo+Pj4+
IChTb21ldGltZXMsIHRoZSB3aG9sZSBTRElPIGJ1cyBkb2Vzbid0IHByb2JlIGF0IGJvb3QuCj4+
Pj4gSSBhbSBzdGlsbCBpbnZlc3RpZ2F0aW5nIHRoZXNlIGludGVybWl0dGVudCBwcm9ibGVtcy4p
Cj4+Pj4KPj4+PiBTaG91bGQgSSB1c2UgNDM3NTEgb3IgNDM3NTIgZmlybXdhcmUuLi4/Cj4+Pgo+
Pj4gVGhpcyBxdWVzdGlvbiBzaG91bGQgYmUgYW5zd2VyZWQgYnkgdGhlIEN5cHJlc3MvSW5maW5l
b24gZm9sa3MgYnV0Cj4+PiB1bmZvcnR1bmF0ZWx5IHRoZXkgaGF2ZSBiZWVuIHF1aWV0IGZvciBh
IGxvbmcgdGltZS4gSW4gZ2VuZXJhbCB3ZSB1c2UKPj4+IHRoZSBpZCByZWFkIGZyb20gMHgxODAw
MDAwMCB0byBkZWNpZGUgd2hpY2ggZmlybXdhcmUgdG8gbG9hZC4gQnV0IGJlCj4+PiBhd2FyZSB0
aGF0IHRoZSByZXYgYWxzbyBtYXR0ZXJzLiBUaGVyZSBhcmUgc29tZSBleGFtcGxlcyBpbgo+Pj4g
YnJjbWZfc2Rpb19md25hbWVzIHRhYmxlIHRoYXQgdGhlIGRpZmZlcmVudCBmaXJtd2FyZSBuYW1l
IGNhbiBiZQo+Pj4gZGVyaXZlZCBmcm9tIHRoZSBzYW1lIGNoaXAgY29tbW9uIGlkIGJ1dCBkaWZm
ZXJlbnQgcmV2Lgo+Pj4KPj4+IEhvd2V2ZXIgc2RpbyBkZXZpY2UgZW51bWVyYXRpb24gaGFwcGVu
cyBiZWZvcmUgZmlybXdhcmUgZG93bmxvYWQgc28KPj4+IHRoZSBpbnRlcm1pdHRlbnQgcHJvYmxl
bSB5b3UgYXJlIGZhY2luZyBwcm9iYWJseSBpcyBub3QgcmVsYXRlZCB0bwo+Pj4gZmlybXdhcmUg
dmVyc2lvbi4KPj4KPj4gRGlzY2xvc3VyZTogTXkga25vd2xlZGdlIG9mIFNESU8gZGV2aWNlIGVu
dW1lcmF0aW9uIGlzIDAuCj4+Cj4+IFdoZW4gdGhlIGhvc3Qgc2VuZHMgdGhlIGVxdWl2YWxlbnQg
b2YgYW4gImlkZW50aWZ5IHlvdXJzZWxmIiBtZXNzYWdlCj4+IG9uIHRoZSBTRElPIGJ1cywgZG9l
c24ndCB0aGUgcmVwbHkgY29tZSBmcm9tIHRoZSBXaUZpIGRldmljZT8KPj4gV2h5IHdvdWxkIHRo
ZSBkZXZpY2UgcmVwbHkgMHhhYWU3IGluc3RlYWQgb2YgMHhhYWU4Pwo+Pgo+PiBJbiBvdGhlciB3
b3Jkcywgd2hvIGlzIHJlcGx5aW5nIDB4YWFlNz8KPiAKPiBUaGUgZW51bWVyYXRpb24gcmVzcG9u
c2UgaXMgZG9uZSBieSB0aGUgSFcgc2RpbyBjb3JlIG9uIHRoZSBjaGlwLiAgTm8KPiBzb2Z0d2Fy
ZSBpbnZvbHZlZC4KCk1hcmssCgpUaGlzIHdvdWxkIGJlIHRoZToKCUJSQ01GX1NESU9fREVWSUNF
KFNESU9fREVWSUNFX0lEX0JST0FEQ09NX0NZUFJFU1NfNDM3NTEsIENZVyksCndoaWNoIGlzIHJl
dHVybmVkIGJ5IHRoZSBTRElPIGJ1cyBhbmQgYXNzb2NpYXRlZCB0aGUgU0RJTyBkZXZpY2Ugd2l0
aCB0aGUgYnJjbWYgZHJpdmVyLgoKQWxsIHRoZSBvdGhlciBJRHMgYXJlIHJldHVybmVkIGJ5IHJl
YWRpbmcgcmVnaXN0ZXJzL3NlbmQgY29tbWFuZHMgdG8gdGhlIFNESU8gZGV2aWNlLgoKTmVpbAo+
IAo+IFJlZ2FyZHMsCj4gLSBGcmFua3kKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
