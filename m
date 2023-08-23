Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85160EE49AB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 06:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IqZhMPtDRqO9qGKU7b72miQUe6h9d8he/DK7XT7F+k=; b=1GDmwc7E9STkUZ
	LdwETgNSpOOKQSfSft36iUGbzLW9DN5lDB3ZKURi4Y58N5Ve16XH2jXa16feRLeu9HnIyE0Nq5raZ
	kxZx3iloNPQYVhN+rW8kuRO0xGaB36ngm+Z7473B930LLTriaoLmJ04p8byZGVDlYxqNEw9mBJHrL
	RnGnXkzG9hjfdbODbHBG8ozcagqvOOBKB4QipLmxvNLK1bXr+gUhIvqyoJ0YD+wjtk+CNgkPCZP+M
	FseV5YlPSxdAhLNrShj5GdjRRbp5BR20FOKtEbRSK0T2wyAlSlmt1Ua4OjPXU/fV6+H7kNK3rQkNa
	X5Xuol07k4KcT8wxwf4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhLJ-00HOOZ-1Y;
	Wed, 23 Aug 2023 06:27:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhLF-00HONX-1J
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Aug 2023 06:27:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-523476e868dso6541069a12.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Aug 2023 23:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692772063; x=1693376863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5Oc56VzNR2aVjs0jVSRnsJUhpw2zj/HD9VsbzcLo7s=;
        b=DUiAx5xPzaUEZONVMv/ajlmwn6R13EUUZ7ZqxvWYO3m5GscO0lfvmEJFZGy9fUOsQP
         LqrScyfvELcdX76u+yPg8TFUaOvdT2Lff02UQtqw9prb3BZdbYRQ1kQh7FjJRMSpWPNe
         EqtL/DwTTylXCruh0A4PSIt/gYClH5V90YeZKB6IWfnq7fCTvLjc9LaXdUxvHMLgxdj2
         d+6/IXtixR4Jw+YgakSPL33/NQPZoDhcEgzZtAbMh+g6D0p/JyJI/p1wH/ea6XcDYywH
         om8LoKCHd5jEQaYWSFr3GINfOGKpWSycqQcgbarPRRVPiciqXStydTp9luPi/kiK4pQE
         fY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692772063; x=1693376863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5Oc56VzNR2aVjs0jVSRnsJUhpw2zj/HD9VsbzcLo7s=;
        b=eJKbCcKTDIwr+xy8trSsfAOxadiTBh/iNOoTRKWM3m20i19OXJC+k1WsZ3VA2+RpqD
         FJizmJrbfqEv9YSZlB3SgQQW0qbPJpmdbHQKfi8WkJ74UMEnwef6Ba9cMjrUFFRxd1R7
         IJ3macNCNikea5vhPq/jWZBqdzIe5RrPe9TyFcZUAkUeUSnIQGs9nka48cJmeMD2Vu2x
         0+sblEFY5iShueo088tbReERPIW96Rb224rxOtykteJEaexxDsQWbloKxNmkPvwrNVNs
         eBS2wlDunNKA+vnMzAuezNxo/kZJUzkyBnwgGdLm3hxvM14lU86EluqVSLqgv5pAnVOM
         K0QQ==
X-Gm-Message-State: AOJu0YwCkE+z21twD3bmv5lcW+CFVLaY+uOZcaLMLZioWYqSUFT8DJh5
	9mb0AqmmPg/v1vSkSsNf5qRu6g==
X-Google-Smtp-Source: AGHT+IHi1b/spa02y3F0OEnt2M1o/GMERkoNPp3UJjEHhkC9Gqexbv7cyCGUeH5zfIvKXMN3JFPEAA==
X-Received: by 2002:a17:906:8445:b0:99c:281:9987 with SMTP id e5-20020a170906844500b0099c02819987mr9804003ejy.36.1692772062737;
        Tue, 22 Aug 2023 23:27:42 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906705000b0099bd6026f45sm9441832ejj.198.2023.08.22.23.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 23:27:42 -0700 (PDT)
Message-ID: <4db8ba95-0d0d-0d1c-1d90-29833f0405ae@linaro.org>
Date: Wed, 23 Aug 2023 08:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V10 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-2-yu.tu@amlogic.com>
 <d2a6060a-c8a0-51c7-f621-1bed2c3074b4@linaro.org>
 <e9932f90-a011-ee9b-ef09-f2e2475bdd0d@amlogic.com>
 <c2faccd6-1d77-9b81-d8d9-830e95e804af@linaro.org>
 <eee9e730-f69b-1150-07fe-0d40a14b5a50@amlogic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eee9e730-f69b-1150-07fe-0d40a14b5a50@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_232745_461586_FBC965D7 
X-CRM114-Status: GOOD (  18.40  )
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

T24gMjMvMDgvMjAyMyAwODoyMCwgWXUgVHUgd3JvdGU6Cj4gCj4gCj4gT24gMjAyMy84LzIzIDEz
OjQzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0K
Pj4KPj4gT24gMjMvMDgvMjAyMyAwNDoyNCwgWXUgVHUgd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDIw
MjMvOC8yMyAwOjMyLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Pj4+PiBPbiAyMi8wOC8yMDIzIDEwOjI3LCBZdSBUdSB3cm90ZToKPj4+Pj4gQWRk
IHRoZSBTNCBQTEwgY2xvY2sgY29udHJvbGxlciBkdC1iaW5kaW5ncyBpbiB0aGUgUzQgU29DIGZh
bWlseS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29t
Pgo+Pj4+Cj4+Pj4gTG92ZWx5LiBJIHNlbnQgeW91YSAgZnJpZW5kbHkgcmVtaW5kZXIgYXQgdjgg
d2hpY2ggdHVybnMgb3VyIHlvdQo+Pj4+IGlnbm9yZWQuIFlvdSBrZWVwIGlnbm9yaW5nLCBJIHdp
bGwgc3RhcnQgaWdub3JpbmcgYXMgd2VsbCBmcm9tIG5vdyBvbi4KPj4+Cj4+PiBIaSBLcnp5c3p0
b2bvvIwKPj4+Cj4+PiBTb3JyeS4gSSBkaWQgbm90IGZvcmdldCB0aGUgZnJpZW5kbHkgcmVtaW5k
ZXIgaW4gdjgsIEkgY29uc3VsdGVkIHlvdSBmb3IKPj4+IHRoaXMgYXQgdGhlIHRpbWUsIHNvIEkg
cmUtc2VudCBWOSBhZnRlciBhZGRpbmcgdGhlIHRhZy4gQmVjYXVzZSBpdCB3YXMKPj4+IGp1c3Qg
Im1lc29uIiB0aGF0IHdhcyByZW1vdmVkLiBCdXQgVjEwIGlzIGJhc2VkIG9uIE5laWwncyBwYXRj
aCwgd2hpY2ggSQo+Pj4gdGhpbmsgaXMgYSBiaXQgb2YgYSBjaGFuZ2UuIFNvIEkgZGlkbid0IGRh
cmUgYWRkIGl0LiBJbnN0ZWFkIG9mCj4+PiBmb3JnZXR0aW5nIHlvdXIgcmVtaW5kZXIuCj4+Pgo+
Pj4gU28gd2hhdCBzaG91bGQgSSBkbywgSSdsbCBmb2xsb3cgeW91ciBhZHZpY2UgZXhhY3RseS4K
Pj4KPj4gSSBkb24ndCB0aGluayB0aGVyZSB3YXMgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IHZlcnNpb24sIHdoaWNoCj4+IHJlY2VpdmVkIHRoZSByZXZpZXcsIGFuZCB0aGUgY3VycmVudCBw
YXRjaC4gT3RoZXJ3aXNlIHlvdXIgY2hhbmdlbG9nCj4+IHNob3VsZCBzYXkgdGhhdCB5b3UgZHJv
cCBSYiB0YWcuIFJlYmFzaW5nIG9mIHNvbWV0aGluZyBzb21ld2hlcmUgaXMgbm90Cj4+IHRoZSBy
ZWFzb24sIHNvIHBsZWFzZSBkZXNjcmliZSB3aGF0IGFyZSB0aGUgZGlmZmVyZW5jZXMgaW4gdGhl
IHBhdGNoPwo+IAo+IFRoZSBjdXJyZW50IHBhdGNoIGFuZCBWOSBwYXRjaCBkaWZmZXJlbmNlIGlz
IG1haW5seSBiYXNlZCBvbiBOZWlsIHBhdGNoIAo+IEkgcHV0ICJpbmNsdWRlL2R0IC0gYmluZGlu
Z3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oIiB0aGlzIGRvY3VtZW50IAo+IGRlc2NyaWJl
cyB0aGUgY2xvY2sgaW5kZXggYWxsIGV4cG9zZWQuCgpBZGRpbmcgb25lIGluY2x1ZGUgaXMgaW5z
aWduaWZpY2FudCBjaGFuZ2UsIHRodXMgYW55IFJiIHRhZ3Mgc2hvdWxkIHN0YXkuCj4gCj4gTmV4
dCwgSSBzaG91bGQgYWRkIFJvYidzIHRhZyBhbmQgcmVzZW5kIGl0LiBJZiB5b3UgaGF2ZSBhbnkg
b3RoZXIgCj4gc3VnZ2VzdGlvbnMsIHBsZWFzZSB0ZWxsIG1lIGFuZCBJIHdpbGwgc3RyaWN0bHkg
Zm9sbG93IHlvdXIgc3VnZ2VzdGlvbnMuCgpJIGNhbm5vdCBhZGQgc29tZW9uZSdzIHRhZywgdGh1
cyBvbiB5b3VyIG5leHQgdmVyc2lvbiB5b3UgbXVzdCBpbmNsdWRlCml0LiBJIHRvbGQgdGhpcyBs
YXN0IHRpbWUuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
