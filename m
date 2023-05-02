Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F94C77B73
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 May 2023 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dj142ODzsiAztxd7CPbU/kMhtcWGjNxG3Jn9hG7VXUE=; b=zZ1vtzV2JJZ519
	XKNZ80B+4WhBSGPwdT95XpnCV8Uyo6HrV8mdaAbWOmvZWSuU5ZsNR9cIQ4JhwKiNdci1WhOcxCE8r
	SHmQ0OSd6qLcuZpMqeqtH8DF4rodoITliWP7WZTT/mcqIcrhHgemlJn+p3BfweDmF2SxV5Aq+wwNu
	i7r2siGl0hvrdbYY8jc7P8Qf+9Z+4t/fmj8UH2DJhnXxejZKjQgXrAfyU1AmBdNnYt6tqFdaN8eV3
	PE44vkqlVNNlZZn47mNQxNyf2Fn6UMsEvsvqugXZwB/VQRp6kqOOonu2RpnMLQGJIxKRawNZv0BkJ
	YdIHe0nK2QWJNyhuAZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkba-000UsN-0N;
	Tue, 02 May 2023 07:39:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkbW-000UrF-1j
	for linux-amlogic@lists.infradead.org;
	Tue, 02 May 2023 07:39:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso4616733a12.3
        for <linux-amlogic@lists.infradead.org>; Tue, 02 May 2023 00:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683013154; x=1685605154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scTz1jek6y5+l9SdnFhQuw4xm0TqGFxUx1QJtMkBaKs=;
        b=a78uGnmVax8AdRjW7AZExnTkFv0eZsYVvkFy9hSpCNS7BQWv/JTxTXGsGlZC+zElEj
         KoKYLSHCYTr/1zL7bF2dOMQpw7GaKekzYVJhwCaPG8i8/e6EzraLOtrvdCCbNgcX5Xmf
         CJ/kv6zdhMDyHqFX/SXg3u3lGfxOkIpNvQkUFn4JVGKd/fzgbhkH/gUAREsh2DKlZmqp
         ZXMowX4HX2Vod+P3AwaYLgLokcFMX2nWav0jQS1A5bDmEtRaXKP8sI3h6uaiTzrDmGl9
         SQMfnLmKxhWomqVPS56m1w7efyVqycAZ9FzAyfWfEszYmkk1PtmMj0wvRnWLL0wn4VDb
         J/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683013154; x=1685605154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scTz1jek6y5+l9SdnFhQuw4xm0TqGFxUx1QJtMkBaKs=;
        b=YbbwZQfeaIbNc8PGOI27sGXVYo/oN69RR4NXxQ6wXFKd9kJD1Eu3s5nXZktWUh+cIp
         csY66wsYASdubgx1YBUaKVMkUas1NGQAHzoGUjBuVezPRNL3oGxsFyO0tGJ0LoiUe/hh
         WCRJ6PqY3hoKcoZ9VaDC07WILvHq+dG4VhGjUTwtYi4ZOlf0Fo0/H5bY6G+vNVT5we4n
         uqE1Fgt7nAQfVu9TIxmolux+wKispbq3dsNwccVKFLsNDdIjzVm9kQK4c333yZExJ3Je
         7QFlElfIGiy1lt/wI8qx+S9BFKypZgOCp05FUoOcIZomQ663/xY3Vc8JlEzKam7X9aTD
         +inA==
X-Gm-Message-State: AC+VfDyCGqmj5jKm4xoA7JWRX/9mWUguDK+hAjrMiAUeazOOXLVCPron
	l+4tuoDNg2uGYocKgO2cc4BEjw==
X-Google-Smtp-Source: ACHHUZ7YOKbuPjna9OS0ZMD0EoDB8ZuNxcxOz3Ez7c4/r1mSyr0N11xwD8t8vZieZrHbXmRjDxFyaA==
X-Received: by 2002:aa7:c758:0:b0:50b:c3a0:40e5 with SMTP id c24-20020aa7c758000000b0050bc3a040e5mr5612751eds.21.1683013154607;
        Tue, 02 May 2023 00:39:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id q9-20020aa7da89000000b005069175dcb7sm13212239eds.58.2023.05.02.00.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:39:13 -0700 (PDT)
Message-ID: <e29a7911-065a-04e2-f04f-027a0646362c@linaro.org>
Date: Tue, 2 May 2023 09:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, mturquette@baylibre.com,
 sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 AML <linux-amlogic@lists.infradead.org>, linux-clk@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
 <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_003918_587869_4AC552DF 
X-CRM114-Status: GOOD (  13.13  )
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

T24gMDIvMDUvMjAyMyAwMzozOCwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4gT24gMSBNYXkg
MjAyMywgYXQgNzo1MSBwbSwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIERtaXRyeSwKPj4KPj4gT24gV2VkLCBB
cHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo+PiA8ZGRyb2tvc292QHNi
ZXJkZXZpY2VzLnJ1PiB3cm90ZToKPj4+Cj4+PiBBZGQgdGhlIGRvY3VtZW50YXRpb24gZm9yIEFt
bG9naWMgQTEgUGVyaXBoZXJhbHMgY2xvY2sgZHJpdmVyLAo+Pj4gYW5kIEExIFBlcmlwaGVyYWxz
IGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MuCj4+IE1heWJlIGEgbmF0aXZlIEVuZ2xpc2ggc3Bl
YWtlciBjYW4gY29tbWVudCBvbiB3aGV0aGVyIGl0J3MKPj4gInBlcmlwaGVyYWwiIG9yICJwZXJp
cGhlcmFscyIuCj4gCj4gSeKAmW0gbm90IGEgZ3JhbW1hciBzcGVjaWFsaXN0LCBidXQgSSB3b3Vs
ZCB3cml0ZToKPiAKPiDigJxBZGQgZG9jdW1lbnRhdGlvbiBhbmQgYmluZGluZ3MgZm9yIHRoZSBB
bWxvZ2ljIEExIFNvQyBwZXJpcGhlcmFscwo+IGNsb2NrIGRyaXZlcuKAnQo+IAo+IFBlcmlwaGVy
YWxzIGlzIHRoZSBjb3JyZWN0IHBsdXJhbCBidXQgcmVhZHMgYmV0dGVyIHdoZW4geW91IGFkZAo+
IGNvbnRleHQgb24gdGhlIHR5cGUgb2YgcGVyaXBoZXJhbHMuCgpEcm9wIHRoZSAiZHJpdmVyIiBy
ZWZlcmVuY2VzIC0gZnJvbSB0aGUgYmluZGluZyBpdHNlbGYgYW5kIGZyb20gY29tbWl0Cm1zZy4g
VGhlIGJpbmRpbmdzIGFyZSBmb3IgaGFyZHdhcmUsIG5vdCBmb3IgdGhlIGRyaXZlciwgc286ICJm
b3IgdGhlCkFtbG9naWMgQTEgU29DIHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIuIi4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
