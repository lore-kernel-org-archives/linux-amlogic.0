Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40BC5B549
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jun 2025 04:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhJzMyp1TH459MdpEaRpCCgFTSJ/juvDCFJaaLk9a04=; b=ZY4zW/28Ld+Akh
	jAUV/Oq57PvqPjv5gzc+LAeHRYlhchOYFhMHy2WGDXvLtBqNmpkVyViIWxlq5CaNPjzYLXFmsvXyO
	bGGlq2I9iCuJdoT01TwptESt9LMX55fDcc5rWRlL1Td3ZVHDXkX545kZfMjU8leVz1WPqTiX1eFoU
	nCFZRqkH61xv4OKXjm6ujjMaXG1C8XsBfT//r3e3zY6NCdrf907l3cy6PEnQSmZ65rLoTGn1bG2zG
	HquDtu+gHPmMuhODb6a1n9Y3njaTlfMyU0XAOyp+A48j+npbr/7fdCxuuLpMaiMxq5a8HOeypOuQz
	F3jOORDz6R3wzGN86WiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfUa-0000000CWeR-1Bp9;
	Wed, 04 Jun 2025 04:12:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeOP-0000000CP1P-0GCn
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Jun 2025 03:02:18 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1210649666b.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749006135; x=1749610935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93NPImeHgH3phz/ybs8XeZoxvn1O5tzhuznryRfg/TE=;
        b=nRqFAbOYbsPnseZoD1ReBwNCFiqMioW410Q4nJtx1ZcC4ek3hhxz57DxEkX9kOO8pT
         eHBzcDiN4BFM5Jy567rF/QUZuAcchxarsQ8xHqUqQN9wRnoAXunvBIfxScBLnnsz1+N2
         K96PROBlgDL2bqYob3M2FqDCGPaJDWtFUANsRgUuEPMDLi9iaTjhHQsMr5ZHJDhn9Z5J
         FhauGSdX53rY5o9v76PSZQPSjZI5GyijZFYYXao1vsch+4aMgNvGvCZYwBgSNmvOsPJw
         PaBvuG6M7363+6MNlNS2WzvIvFxKnL3Jw9OrJzl8CV+45WHdHaSlmHLrTAyT27+/TYbc
         GnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749006135; x=1749610935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93NPImeHgH3phz/ybs8XeZoxvn1O5tzhuznryRfg/TE=;
        b=SEbo266TBmOOF7ERma13N6Ap37GXm/U9akvratDff7qXHKwroTSfGOffVMHIohhO/P
         TdLRuFUdpqkNEk0aeyto6gV1awVDjyNNQH/5dGJTCDJxfN7HRO43cVTCd0CLNslYX24M
         SGtRS2SEhlu8xU4SuoiKWXAjE9mURn5kj5+7r9rqGvBmRYtjRby0uKqKglj7UusczSfx
         iPhIZ+IgFlCFNeWIdbC7pMI4Gb+ICKCLvlO5yi45PqQj1AHtLont9fU7LlrtmGg1l53s
         dC2PE7K41r0OQJMq0GkYPzAaVTGwi9JI1U38RBYAK4SjRXSXgamI6VeiXGj8rr6Tzsp/
         9sFg==
X-Forwarded-Encrypted: i=1; AJvYcCXkuAt1xK+fxgCeWSF8VsEas8MI16ODFk3aQQ4hZnNVYXcORsl4IbV+2CB87XNOvk84uJkaufcs5hCwDD7E@lists.infradead.org
X-Gm-Message-State: AOJu0YwUB5SRwVwIoI6TZO3GkfSP9SZgGJS7gcxxRNXoAbhO5w+q6B7k
	eJ5hBkiIS8qRQvYGiY/Upgc58Wp/tXNl3uBN7ZjPhuoZMC36qqWIy97tcrJZccjcvlIeHIDVJu0
	LUM80rn30dGKGuE4CA6NS5TAetor0F8o=
X-Gm-Gg: ASbGncvpazkpQBIOMEYgP2d47gCak9Ur4DwZGXc4jOQEty/AMk3zQiWTNSAoVOaIiSu
	dqM4QvwxcibrUJhFyV00ooKivMAejn9ZQ36l9HbcdHX5eYEZkTIQKE7Ar9X2iF0fSG1gxEDIzua
	PfTB3ShrNn49mS5eljfO2kr9wp0b3NRl5H
X-Google-Smtp-Source: AGHT+IFrLk1sPD8RHDy3ppQFwO93B09ttmuuSOKZ4IFaVZNSRV2Df/8audvBQwCbwFybmCILd8dYq+ORQKrff6N3LDQ=
X-Received: by 2002:a17:906:6a16:b0:ad8:af1f:938d with SMTP id
 a640c23a62f3a-addf8e3e0f5mr81959866b.37.1749006134673; Tue, 03 Jun 2025
 20:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748933789.git.zhoubinbin@loongson.cn> <68e752931552e95667191c2641076a1bfaea3dc6.1748933789.git.zhoubinbin@loongson.cn>
 <CAFBinCA6f6jJQZEgHTiK8FqXW=v465a5rB0BZutDhct-4yhX_Q@mail.gmail.com>
In-Reply-To: <CAFBinCA6f6jJQZEgHTiK8FqXW=v465a5rB0BZutDhct-4yhX_Q@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 4 Jun 2025 11:02:02 +0800
X-Gm-Features: AX0GCFtNQ6tHAbcqFzIRYEwd8arzq_HkNvot9pjUSmTfSnaQtZaam0vScKyUZzk
Message-ID: <CAMpQs4LYc76RMJU0JRG9Rcihx8zoOeaJgYHb1CNrgg1GFzA9Hw@mail.gmail.com>
Subject: Re: [PATCH v3 36/36] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_200217_104330_033300E9 
X-CRM114-Status: GOOD (  29.06  )
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

SGkgTWFydGluOgoKVGhhbmtzIGZvciB5b3VyIHRlc3RpbmcgYW5kIHJlcGx5LgoKT24gV2VkLCBK
dW4gNCwgMjAyNSBhdCA0OjQ54oCvQU0gTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIFR1ZSwgSnVu
IDMsIDIwMjUgYXQgMjoyOOKAr1BNIEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25nc29uLmNu
PiB3cm90ZToKPiA+Cj4gPiBVc2UgbmV3IGZ1bmN0aW9uIGRldm1fbW1jX2FsbG9jX2hvc3QoKSB0
byBzaW1wbGlmeSB0aGUgY29kZS4KPiA+Cj4gPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+Cj4gPiBDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJl
LmNvbT4KPiA+IENjOiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiA+IENj
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
Pgo+ID4gQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gUmV2aWV3ZWQt
Ynk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgo+ID4gU2lnbmVkLW9mZi1i
eTogQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL21tYy9ob3N0L21lc29uLW14LXNkaW8uYyB8IDIwICsrKysrKysrLS0tLS0tLS0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2Rpby5jIGIvZHJpdmVy
cy9tbWMvaG9zdC9tZXNvbi1teC1zZGlvLmMKPiA+IGluZGV4IGUwYWU1YTBjOTY3MC4uYjZjYjQ3
NWYxYTVmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1teC1zZGlvLmMK
PiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tbXgtc2Rpby5jCj4gPiBAQCAtNjQwLDcg
KzY0MCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbXhfbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgIGVsc2UgaWYgKElTX0VSUihzbG90X3BkZXYpKQo+ID4g
ICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNsb3RfcGRldik7Cj4gPgo+ID4gLSAgICAg
ICBtbWMgPSBtbWNfYWxsb2NfaG9zdChzaXplb2YoKmhvc3QpLCAmc2xvdF9wZGV2LT5kZXYpOwo+
ID4gKyAgICAgICBtbWMgPSBkZXZtX21tY19hbGxvY19ob3N0KCZzbG90X3BkZXYtPmRldiwgc2l6
ZW9mKCpob3N0KSk7Cj4gVGhpcyBjaGFuZ2UgaXMgZmluZSBhdCBydW50aW1lIChvbiBteSBPZHJv
aWQtQzEgYm9hcmQpIGJ1dCBpdCBjYW4gbGVhZAo+IHRvIGEgdXNlLWFmdGVyLWZyZWUgaXNzdWUu
Cj4gbWVzb25fbXhfbW1jX3JlZ2lzdGVyX2Nsa3MoKSBkZXZtXyByZWdpc3RlcnMgdHdvIGNsb2Nr
cyBhbmQgdXNlcwo+IGhvc3QtPmNvbnRyb2xsZXJfZGV2IGFzIGRldmljZS4KPiBUaGlzIGxlYWRz
IHRvIHRoZSBmYWN0IHRoYXQgZHVyaW5nIGRyaXZlciByZW1vdmFsIHN0cnVjdAo+IG1lc29uX214
X21tY19ob3N0IGlzIGZyZWUnZCBiZWZvcmUgaG9zdC0+Y29udHJvbGxlcl9kZXYsIHdoaWNoIG1l
YW5zCj4gdGhlIGNsb2NrcyBhcmUgYWxzbyBmcmVlJ2QgYWZ0ZXIgc3RydWN0IG1lc29uX214X21t
Y19ob3N0IGlzIGFscmVhZHkKPiBnb25lLiBUaGUgcHJvYmxlbSBoZXJlOiB0aGUgY2xvY2tzIG5l
ZWQgdGhlIHN0cnVjdCBjbGtfZGl2aWRlciBhbmQKPiBzdHJ1Y3QgY2xrX2ZpeGVkX2ZhY3RvciBm
cm9tIHN0cnVjdCBtZXNvbl9teF9tbWNfaG9zdC4KClNvcnJ5LCBJIGhhdmUgYSBzbGlnaHRseSBk
aWZmZXJlbnQgb3Bpbmlvbiwgd2hpY2ggbWF5IG5vdCBuZWNlc3NhcmlseQpiZSBjb3JyZWN0LgoK
bWVzb25fbXhfbW1jX2hvc3QgaXMga3phbGxvYyBhcyBgZXh0cmFgIGluIG1tY19hbGxvY19ob3N0
KClbMV0sIGJ1dCBpbgpmYWN0LCB0aGUgZW50aXJlIGhvc3QgaXMgcmVsZWFzZWQgaW4gbW1jX2hv
c3RfY2xhc3NkZXZfcmVsZWFzZSgpWzJdLApzbyBJIGRvbid0IHRoaW5rIGl0IHdpbGwgYWZmZWN0
IHRoZSB1c2Ugb2YgaG9zdC0+Y29udHJvbGxlcl9kZXYuCgpbMV06IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y2LjE1LXJjMS9zb3VyY2UvZHJpdmVycy9tbWMvY29yZS9ob3N0LmMj
TDUyMwpbMl06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1LXJjMS9zb3Vy
Y2UvZHJpdmVycy9tbWMvY29yZS9ob3N0LmMjTDc4Cj4KPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5
IEknbSBub3Qgc2VlaW5nIGFueSBwcm9ibGVtcyB3aXRoIHRoaXMgcGF0Y2ggYXQKPiBydW50aW1l
IC0gbWF5YmUgd2hhdCBJJ20gZGVzY3JpYmluZyBpcyBqdXN0IGEgdGhlb3JldGljYWwgaXNzdWUK
PiAoYmVjYXVzZSBpdCB3b3VsZCBvbmx5IGl0IGlmIHNvbWV0aGluZyB3b3VsZCBhY2Nlc3MgdGhl
IGNsb2NrcyBiZXR3ZWVuCj4gZnJlZWluZyBzdHJ1Y3QgbWVzb25fbXhfbW1jX2hvc3QgYW5kIHJl
bW92YWwgb2YgdGhlIGNsb2NrcyBhIGZldwo+IG1pbGxpc2Vjb25kcyBsYXRlcikuCj4KPiBXaGF0
IGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXM/Cj4gSWYgd2UncmUgY29uY2VybmVkIGFib3V0IHRo
ZSBwb3RlbnRpYWwgVUFGIHRoZW4gSSBjYW4gcmVmYWN0b3IKPiBtZXNvbl9teF9tbWNfcmVnaXN0
ZXJfY2xrcygpIGZpcnN0IGFuZCB0aGVuIGFwcGx5IHRoaXMgcGF0Y2gKPiBhZnRlcndhcmRzLgo+
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgoKLS0gClRoYW5rcy4KQmluYmluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
