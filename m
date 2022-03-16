Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00467C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uurNFVtdgkslOkXjym7lEuo/jmtakINecf4qSefhLQ=; b=fZG0uyXFIaFfU1
	Oh8NJ1iej4LDF4M1Qjaf1kxGCF1pITdLcipU2wS23yjVmKflvP5g7+IrofogGwgR/LXq6z/V5aR6H
	fMSRU/DvHo+h081K0XpC1OZwpfHkoj9h/1bBIQY4nWlOxmLa1JcywuG1gxxH4JgqjJk9IhCsx70Fs
	jrWuQAJ0+I3p+oetJBttaTY0pWCZRHCqT/VA5zygEoM7OIussJdeJ35oSHlgVxJPj6qLmgLzK4TYw
	3JMj7UyZsRGAW2aOaENOuIAyQ9CaIrozO92E0Tf9EtZAqe/pdQfftHmfdOR28rOomlGzUQzLYbhV8
	oW59QEWSLdDarVpfcR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUP5a-00C7tS-9s; Wed, 16 Mar 2022 08:33:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUP5N-00C7qq-0H
 for linux-amlogic@lists.infradead.org; Wed, 16 Mar 2022 08:32:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id a1so447728wrh.10
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Mar 2022 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A6OiZGn3W785peW6L2GCeo3dDpI9qLCBqiM06s7mTPA=;
 b=ssOh0xb2Ru1dbF/bzLRWZBYe2BIG06gq7vEpxnb53ljang4uddxWAWBorZj8WHN1k3
 fs5bWg4kWKxDk0MgizjHRUXLDBTzbKWU8MsWNbxa+XxKuRewQYHN9fybcsr6172lEcJ/
 eqQhTAwiX8icMY/8tA2N1UCnJnIYJGGmJsKjFWVusK4FmRfrIUJ8ZvpvS47kk0azHD6j
 Mlyagp2ocQ5IXG67hkkbQU7Hfm9QFNUSYnYHp1nNVCkVNz7F7dMF/ieiiHgOOqSMPPIz
 4r73UvAjT/1mwACaB6BKY+RgXOP4Ho0W08pHbNWTTkMP7XFkOErJQdvSNeThDpZtCNYt
 +zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=A6OiZGn3W785peW6L2GCeo3dDpI9qLCBqiM06s7mTPA=;
 b=X98XcsoVjBnx8mzki0Ra8WYsFtZ8VG9MvbMIPlXnCI2l+McyGcJbIAjJpTP+bMwSUa
 4MP1yA4ChoeHF+8mLajXXEPdUl0bCPN0xTnyOoZNWi/+oIwdSxGPadJ4k2nLLIyeuChL
 EyzAF6euc8KbIqbbjEcwdr5Em4OZ4aYcJ6D+LnbtQPxqXH2jb2cqHnDE38Zw8Yh2DY1t
 pLsegkPP0kBjIgjuClPJgkl7PDvQNcJVKJuBzdVpbyHDLaTCQZol+VXlBGYxRtQXPRUY
 Fw0OLVAEADTKwXOkTGHH/ZnNaX39pjpcxsL/LXC96O4iJH+95Tiox/BpolMT0Tq0MvzW
 CvwA==
X-Gm-Message-State: AOAM533elolQJMn2gXiV+CqS+NHgfCgyaPVoFibCz1AAFKv4v/8RAb0+
 93sUoFN1B88dg9wb1OzoVUgSiuyrHk/c9w==
X-Google-Smtp-Source: ABdhPJxvgJk0e/K/qRjSL5h/IDJ/hSenc4NVjfdXrDoOyEM77755TZTu3V7g92jAq6W8CsPCiMiasw==
X-Received: by 2002:adf:f9c4:0:b0:203:e021:5eb0 with SMTP id
 w4-20020adff9c4000000b00203e0215eb0mr1034634wrr.529.1647419566993; 
 Wed, 16 Mar 2022 01:32:46 -0700 (PDT)
Received: from [192.168.1.10]
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm5439026wmp.13.2022.03.16.01.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 01:32:46 -0700 (PDT)
Message-ID: <4e4f630e-adbd-79a9-ea04-6f981d40485e@baylibre.com>
Date: Wed, 16 Mar 2022 09:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 05/16] hwrng: meson - Don't open-code
 devm_clk_get_optional_enabled()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-clk@vger.kernel.org, kernel@pengutronix.de,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-6-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220314141643.22184-6-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_013249_141219_95743244 
X-CRM114-Status: GOOD (  18.17  )
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

T24gMTQvMDMvMjAyMiAxNToxNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gZGV2bV9jbGtf
Z2V0X2VuYWJsZWQoKSByZXR1cm5zIGEgY2xvY2sgcHJlcGFyZWQgYW5kIGVuYWJsZWQgYW5kIGFs
cmVhZHkKPiByZWdpc3RlcnMgYSBkZXZtIGV4aXQgaGFuZGxlciB0byBkaXNhYmxlIChhbmQgdW5w
cmVwYXJlKSB0aGUgY2xvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgIGRyaXZlcnMvY2hhci9o
d19yYW5kb20vbWVzb24tcm5nLmMgfCAyMCArKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vbWVzb24tcm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdf
cmFuZG9tL21lc29uLXJuZy5jCj4gaW5kZXggOGJiMzAyODJjYTQ2Li4wNmRiNWE5M2UyNTcgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tZXNvbi1ybmcuYwo+ICsrKyBiL2Ry
aXZlcnMvY2hhci9od19yYW5kb20vbWVzb24tcm5nLmMKPiBAQCAtMzMsMTYgKzMzLDEwIEBAIHN0
YXRpYyBpbnQgbWVzb25fcm5nX3JlYWQoc3RydWN0IGh3cm5nICpybmcsIHZvaWQgKmJ1Ziwgc2l6
ZV90IG1heCwgYm9vbCB3YWl0KQo+ICAgCXJldHVybiBzaXplb2YodTMyKTsKPiAgIH0KPiAgIAo+
IC1zdGF0aWMgdm9pZCBtZXNvbl9ybmdfY2xrX2Rpc2FibGUodm9pZCAqZGF0YSkKPiAtewo+IC0J
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEpOwo+IC19Cj4gLQo+ICAgc3RhdGljIGludCBtZXNv
bl9ybmdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIHsKPiAgIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAgCXN0cnVjdCBtZXNvbl9ybmdfZGF0YSAq
ZGF0YTsKPiAtCWludCByZXQ7Cj4gICAKPiAgIAlkYXRhID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFkYXRhKQo+IEBAIC01NCwyMCArNDgs
MTAgQEAgc3RhdGljIGludCBtZXNvbl9ybmdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgIAlpZiAoSVNfRVJSKGRhdGEtPmJhc2UpKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihk
YXRhLT5iYXNlKTsKPiAgIAo+IC0JZGF0YS0+Y29yZV9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9u
YWwoZGV2LCAiY29yZSIpOwo+ICsJZGF0YS0+Y29yZV9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9u
YWxfZW5hYmxlZChkZXYsICJjb3JlIik7Cj4gICAJaWYgKElTX0VSUihkYXRhLT5jb3JlX2Nsaykp
Cj4gICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihkYXRhLT5jb3JlX2Nsayks
Cj4gLQkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IGNvcmUgY2xvY2tcbiIpOwo+IC0KPiAtCWlmIChk
YXRhLT5jb3JlX2Nsaykgewo+IC0JCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkYXRhLT5jb3Jl
X2Nsayk7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0dXJuIHJldDsKPiAtCQlyZXQgPSBkZXZtX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBtZXNvbl9ybmdfY2xrX2Rpc2FibGUsCj4gLQkJCQkJICAg
ICAgIGRhdGEtPmNvcmVfY2xrKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+IC0J
fQo+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCBlbmFibGVkIGNvcmUgY2xvY2tcbiIpOwo+ICAg
Cj4gICAJZGF0YS0+cm5nLm5hbWUgPSBwZGV2LT5uYW1lOwo+ICAgCWRhdGEtPnJuZy5yZWFkID0g
bWVzb25fcm5nX3JlYWQ7CgpBY2tlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
