Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB2EE49A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 05:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZMvAzsIJST/okfczH8zdOiHTT8HdeFznAGv80tIvww=; b=ryn1KoPCfKqHPK
	qn+VGOlmSG7X7KAeF/YkiTP9Cgp/pS94k2AmHOwBgM8v0Nq4EWSgOSJBCb5A4Gq56LLItgsiMMxn9
	/miwXCjKYW22Q2byf420t5DsQcSXhnbyx7GvTndzzf/vrrl1W4YqyjWxJjbTVTpSTL7qSyMAmzMC0
	IajFq9JTCP5kO+D/CGQdeOkGq8HQ9QRXCkhLkF5H/b0bDYRWg7t8o4SDbpAl10LG6Z3J1NAzeDZeI
	woPWw0XafWUlBla7t7JYUenRW4zYf0YE1kafJvHX5/b+iYDFt4O/Lki9HdM1sB3qBfAHuxTxRYX7e
	opz10Yf9nZjoq3fynS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYgeI-00HIoq-2n;
	Wed, 23 Aug 2023 05:43:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYgeG-00HIo4-0J
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Aug 2023 05:43:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a1681fa868so626269866b.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Aug 2023 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692769396; x=1693374196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqyD8w2Ea4iyrL9XdQdNAhbH5OmX3Ob2k4iSn8KyfIA=;
        b=bMY8d/W/LEgLPQBzWnaNhxz0dfV1gzfk2RhBG1NMcTxCaFr/nK1HoQNcPEmbR39cvU
         5TKGqc584NBHL5D9SczyQAkcpFjD3b7g5/J/i6RILhtAlkrBxcwtGlW1nuO3WC418UxH
         6sUlTPD0Ob57apybkYVJRHDAdof9oiLjjY9LaCjcH1Lpop7UrlJEnNO27yiDFuGGEeTh
         Nq2HANaFrUL2pfy4VAVVeZt9RCM5fIRZXs1Y3zqa4OA24/6CTlVv5SCpk5DpJPNWqiJm
         a+UQbjKSsepmyUsLwYKfBucwLW1sCHyWl2+JgMshLco6ziaYEBIS/jbpldGN2RQ1rISC
         Hzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692769396; x=1693374196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqyD8w2Ea4iyrL9XdQdNAhbH5OmX3Ob2k4iSn8KyfIA=;
        b=gHegOBin9ASSYH8JhHU4a3z/GJ4EMZHib+0EmmjZpm4BJq1Eu+Zzk9tAWsDiW9F3vl
         VKxGvuPJPOWW1rQDwoOKoZI9cIFr+yAkmgpqsi0E/yQdFeop7A+YTRBhhwYvF1Fjkdz9
         B8RGF8zTylxmJ9GPYEKgM1itwnumsUNjpvI+OtkslaL886jxBZY6oWL8Jetmyqpook/7
         Rg8y8TFNn3i98/SK9F80j81ZCRVwNnnc+LizrJMpl4ViBGiWxc6/1qCm/9tf88oft0Vr
         6YiXtpEy8WMboL2Jk2FKbR6R9aKYNIQlSfAZP1aXoogVyAXQj46AsEyIH7teOAbAYo23
         hs0w==
X-Gm-Message-State: AOJu0Yzi5EzG6Epdbk9sey83qwLWc13QZMQ3A0GreAZp0UpDR9URx4Db
	i1oGYGxLLGSs80tZOENmJqXUQA==
X-Google-Smtp-Source: AGHT+IF3UMH3/lRVUBShLpk35pMdpeTpLzVykKBv/KpgWa477LjlFDFlSqmgvDXTRwzRNkr1zgLvOw==
X-Received: by 2002:a17:906:7485:b0:9a1:c44d:7056 with SMTP id e5-20020a170906748500b009a1c44d7056mr2483700ejl.26.1692769396259;
        Tue, 22 Aug 2023 22:43:16 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906134600b00992d70f8078sm9372064ejb.106.2023.08.22.22.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 22:43:15 -0700 (PDT)
Message-ID: <c2faccd6-1d77-9b81-d8d9-830e95e804af@linaro.org>
Date: Wed, 23 Aug 2023 07:43:14 +0200
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e9932f90-a011-ee9b-ef09-f2e2475bdd0d@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_224320_177216_05B2AEA0 
X-CRM114-Status: GOOD (  16.22  )
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

T24gMjMvMDgvMjAyMyAwNDoyNCwgWXUgVHUgd3JvdGU6Cj4gCj4gCj4gT24gMjAyMy84LzIzIDA6
MzIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4g
T24gMjIvMDgvMjAyMyAxMDoyNywgWXUgVHUgd3JvdGU6Cj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9j
ayBjb250cm9sbGVyIGR0LWJpbmRpbmdzIGluIHRoZSBTNCBTb0MgZmFtaWx5Lgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4KPj4gTG92ZWx5LiBJIHNl
bnQgeW91YSAgZnJpZW5kbHkgcmVtaW5kZXIgYXQgdjggd2hpY2ggdHVybnMgb3VyIHlvdQo+PiBp
Z25vcmVkLiBZb3Uga2VlcCBpZ25vcmluZywgSSB3aWxsIHN0YXJ0IGlnbm9yaW5nIGFzIHdlbGwg
ZnJvbSBub3cgb24uCj4gCj4gSGkgS3J6eXN6dG9m77yMCj4gCj4gU29ycnkuIEkgZGlkIG5vdCBm
b3JnZXQgdGhlIGZyaWVuZGx5IHJlbWluZGVyIGluIHY4LCBJIGNvbnN1bHRlZCB5b3UgZm9yIAo+
IHRoaXMgYXQgdGhlIHRpbWUsIHNvIEkgcmUtc2VudCBWOSBhZnRlciBhZGRpbmcgdGhlIHRhZy4g
QmVjYXVzZSBpdCB3YXMgCj4ganVzdCAibWVzb24iIHRoYXQgd2FzIHJlbW92ZWQuIEJ1dCBWMTAg
aXMgYmFzZWQgb24gTmVpbCdzIHBhdGNoLCB3aGljaCBJIAo+IHRoaW5rIGlzIGEgYml0IG9mIGEg
Y2hhbmdlLiBTbyBJIGRpZG4ndCBkYXJlIGFkZCBpdC4gSW5zdGVhZCBvZiAKPiBmb3JnZXR0aW5n
IHlvdXIgcmVtaW5kZXIuCj4gCj4gU28gd2hhdCBzaG91bGQgSSBkbywgSSdsbCBmb2xsb3cgeW91
ciBhZHZpY2UgZXhhY3RseS4KCkkgZG9uJ3QgdGhpbmsgdGhlcmUgd2FzIG11Y2ggZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSB2ZXJzaW9uLCB3aGljaApyZWNlaXZlZCB0aGUgcmV2aWV3LCBhbmQgdGhl
IGN1cnJlbnQgcGF0Y2guIE90aGVyd2lzZSB5b3VyIGNoYW5nZWxvZwpzaG91bGQgc2F5IHRoYXQg
eW91IGRyb3AgUmIgdGFnLiBSZWJhc2luZyBvZiBzb21ldGhpbmcgc29tZXdoZXJlIGlzIG5vdAp0
aGUgcmVhc29uLCBzbyBwbGVhc2UgZGVzY3JpYmUgd2hhdCBhcmUgdGhlIGRpZmZlcmVuY2VzIGlu
IHRoZSBwYXRjaD8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
