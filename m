Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEC2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315EC610A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 315EC610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t5gIW2YSzdmT8/outpph3pvz1p7kAe9nGbY9hTrZGFk=; b=nD/TWIaTeUhVx0qvchd4UjUFRO
	q4CTtLI/bjVPhQaSDGhvBdgW34whCWIPQzhyQoqvE4p6X8gCgc/JAMs8pBU9upYJIXvzvekcXQ6Ay
	o2LRWfvRKiuCe1OvTT45a3i3NhXfcVMOUSSBruLo5h7Paau99QT0x2rlP7FmZqcWaWUglzIcPG2ZH
	BP4vHt7qMrxiZlxEB2tv7fiivOAcLw5q9XKuB15Fuzn4iffAmY7bGG5yyc2zHF1rZHsTDVck5uoyn
	9O30w7DmYn9H9I2MiGZNdHPNK0t78oD6X+yEas//isI3KXEvjhG1e7wLNhzRSYFqy2IDLHdIx/RZC
	bBwwEcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSETO-000tKg-PG; Mon, 20 Sep 2021 08:16:22 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSETB-000tHf-3n
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 08:16:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id t18so27387480wrb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OjCsG8znUIIxw69JhRvMxK/wK/kMPyWgexeghKjT/KY=;
 b=1Rq60h4DsPfMwnngpHsLJbkprDAZfAnLguNF0Ptl0opKaEVXX21fr0T8ssgutrDsUp
 xzh0OpgrxelOADL5dzEf8bf2/vaqZa+FwmPF13LMxA7dbxgtFni2IxPZigcw1MAIR1gE
 dKhmcM7IQnLMrtYccndKt0Vj87n1D6mCWcGMGnhWnMgYCkxWQ0fxsxl2VhQSiKU5QWJ6
 NoYWR4TLdeifkJz3LkQZEmuv5JaXBoj+h2h/JhOARj3gL2537aL7KRlQY1Fx5R/b7RVC
 CzVJDwdykPhqwyNMK33mO3qyIO51QRTq2yqoRUGxRLwk3nRGcmcjvpIZbOgw9ckoI3hJ
 JONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OjCsG8znUIIxw69JhRvMxK/wK/kMPyWgexeghKjT/KY=;
 b=rpL7u2NR38F3JywOscC/xKy9Y8EO6lnbKDZRGZSOJvRT36YmP1bqHiNhq7TvHivvJF
 nquh4dsC0vBv946/aKtCsET4FWIoRRxDCSF3H+JksCvyexY1pcdDhaKWo+VU6kUS9Dvu
 TxlaOAD4emoENGzg0vNWKcLPRx0XsV+PTtmd5MuOy5kprszD7T77tma3G5pK0IfUBNqR
 i17mNo451N4t0X2H3Ukih964u7jIX/7FejvfPJouDnEz5sQ7dGR5q4ae5SnvIDDJAAvL
 X2k9DXZJBoVwV4vgSPsGQs8SBkDZbk3yn5wwkqVEpzPjIHdwU2LQL9j85oKPZesvdAkc
 xfQQ==
X-Gm-Message-State: AOAM530vEDkoyPzzk+pkUnvl536kqy9tdUWpDRTqThaWbk5gbhQZv25E
 2TSiNQkBr2tKkjPKGFogGR14Vg==
X-Google-Smtp-Source: ABdhPJw8f5dW8a6oaZDekvZLLte4S7oEas9MqpgR0itNRrUWD/s/TP/g8EY7kME74Xex/QnY1EvZ1w==
X-Received: by 2002:adf:ed92:: with SMTP id c18mr26295941wro.86.1632125766286; 
 Mon, 20 Sep 2021 01:16:06 -0700 (PDT)
Received: from [172.20.10.7] ([37.169.24.17])
 by smtp.gmail.com with ESMTPSA id v18sm14264137wml.44.2021.09.20.01.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 01:16:05 -0700 (PDT)
Subject: Re: [PATCH v2] hwrng: meson - Improve error handling for core clock
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <27b24b0e-7804-0a92-6022-ad828e1a45b5@baylibre.com>
Date: Mon, 20 Sep 2021 10:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_011609_256750_03DA562E 
X-CRM114-Status: GOOD (  23.93  )
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

T24gMjAvMDkvMjAyMSAwOTo0NCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gLUVOT0VOVCAo
aWUuICJ0aGVyZSBpcyBubyBjbG9jayIpIGlzIGZpbmUgdG8gaWdub3JlIGZvciBhbiBvcHRpb25h
bAo+IGNsb2NrLCBvdGhlciB2YWx1ZXMgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSBpZ25vcmVkIGFu
ZCBzaG91bGQgYmUKPiBlc2NhbGF0ZWQgdG8gdGhlIGNhbGxlciAoZS5nLiAtRVBST0JFX0RFRkVS
KS4gSWdub3JlIC1FTk9FTlQgYnkgdXNpbmcKPiBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoKS4KPiAK
PiBXaGlsZSB0b3VjaGluZyB0aGlzIGNvZGUgYWxzbyBhZGQgYW4gZXJyb3IgbWVzc2FnZSBmb3Ig
dGhlIGZhdGFsIGVycm9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IEhlbGxvLAo+IAo+IGNvbXBh
cmVkIHRvIChpbXBsaWNpdCkgdjEKPiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDkx
NDE0MjQyOC41NzA5OS0xLXUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSkKPiB0aGlzIHVz
ZWQgZGV2X2Vycl9wcm9iZSgpIGFzIHN1Z2dlc3RlZCBieSBNYXJ0aW4gQmx1bWVuc3RpbmdsLgo+
IAo+IHYxIGdvdCBhICJSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPiIsIEkgZGlkbid0IGFkZAo+IHRoYXQgYmVjYXVzZSBvZiB0aGUgYWJvdmUgY2hh
bmdlLgo+IAoKSG9wZWZ1bGx5IG1hcnRpbiBkaWQgYSBiZXR0ZXIgcmV2aWV3IHRoYW4gbWUgIQoK
QW55d2F5LApSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgoKTmVpbAoKPiAoSG1tLCBteSBzZXR1cCBpcyBicm9rZW4sIHRoZSBiNCBwYXRjaCBzaWdu
YXR1cmUgd2FzIGRvbmUgYmVmb3JlIEkgYWRkZWQgdGhpcwo+IG1lc3NhZ2UuIEkgd29uZGVyIGlm
IHRoaXMgd2lsbCBicmVhayB0aGUgc2lnbmF0dXJlIC4uLikKPiAKPiBCZXN0IHJlZ2FyZHMKPiBV
d2UKPiAKPiAgZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYyB8IDUgKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYyBiL2RyaXZlcnMvY2hh
ci9od19yYW5kb20vbWVzb24tcm5nLmMKPiBpbmRleCBlNDQ2MjM2ZTgxZjIuLjhiYjMwMjgyY2E0
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5jCj4gKysr
IGIvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYwo+IEBAIC01NCw5ICs1NCwxMCBA
QCBzdGF0aWMgaW50IG1lc29uX3JuZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAJaWYgKElTX0VSUihkYXRhLT5iYXNlKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihkYXRhLT5i
YXNlKTsKPiAgCj4gLQlkYXRhLT5jb3JlX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJjb3JlIik7
Cj4gKwlkYXRhLT5jb3JlX2NsayA9IGRldm1fY2xrX2dldF9vcHRpb25hbChkZXYsICJjb3JlIik7
Cj4gIAlpZiAoSVNfRVJSKGRhdGEtPmNvcmVfY2xrKSkKPiAtCQlkYXRhLT5jb3JlX2NsayA9IE5V
TEw7Cj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRhdGEtPmNvcmVfY2xr
KSwKPiArCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgY29yZSBjbG9ja1xuIik7Cj4gIAo+ICAJaWYg
KGRhdGEtPmNvcmVfY2xrKSB7Cj4gIAkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRhdGEtPmNv
cmVfY2xrKTsKPiAKPiBiYXNlLWNvbW1pdDogN2QyYTA3Yjc2OTMzMGMzNGI0ZGVhYmVlZDkzOTMy
NWM3N2E3ZWMyZgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
