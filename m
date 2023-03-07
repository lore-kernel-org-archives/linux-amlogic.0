Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B538C678D4
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPD+6D+2yfe3RyqpGKGC9lQlOayEM2aFaGHT0fEsecY=; b=wKWyWxtZNSvSewjhtZBrSHHDgz
	0YPQKWqdHETe8uXBfCwJ1yrnjk53pyYWWGpDuOlqnTtrCFywxxFs5Sl5N/05c644R00nukcNFvTbU
	JJrgnyv86Nnq7n94CX9Vr1SRwpv42Sw3lEV+vkkBbTqM93xW2J/YxcoqwlwFUgyfSVb8ArbsSbG9V
	mlVOh6zxAXoJ2VhiOm7YT2meGYF8N5FXN9a11Tu35j3vzZnz4J1zwZER03EXKTzbFPsL/wWhTIzMj
	Xtfhh05AetBzDvqmqZmEJNvQhMpjJtev56v8Pi//I065BF3rQBBdpPtTBX3zVTOdMEkJT52H4CwrP
	91NFU7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSE0-00GYbY-Ks; Tue, 07 Mar 2023 07:59:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSDq-00GYZI-22
	for linux-amlogic@lists.infradead.org; Tue, 07 Mar 2023 07:58:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id f11so11197128wrv.8
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 23:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678175934;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JdQshwHadK10TmyUGi+IO4oTSOyXtNeO1NzLyvLX7/o=;
        b=HkwxPNf+tiVkKPFF0uH1B7W5Ln/8j+HEsd8iKXyC4RD/377WMWxe56M0Pcm80EltvD
         BEOfv3OsizBjRzVfzGbs21+j+q6d2E9X/del/0572CNBjMSe7arpF9++/PJpm3KxN/21
         T0+tgr/U2lKTfQpODmlmyuwCm6lE5eZ+TLmWgn6mSR9RekC02tur80JD1q9CPrs7wywB
         aINIK/ZJyOUtM+igtlVZ3JOBqmxSICbG+xtwYulVIQxXOdZLeldiczydfL1kBt4mibUM
         35y8/kjmyjSQaI+v8rGD/P7b3IW0vRSGSsTBqglcIw796nBQJbEsaihq7YcwF+rDKmBK
         1SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678175934;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdQshwHadK10TmyUGi+IO4oTSOyXtNeO1NzLyvLX7/o=;
        b=hUG99hvCh/EkJo6mnGj8MrLS7+lw4L357+VV5pXXoAupMjGAh/YitzSTG31wBoMzdH
         Kg8h0mQJ8FgNRET/LZK8y1IdH9HFresainxBPN+pTeR7MGJH9SSg2Wp8Eez3mstfnEV6
         3t5AbphFTZoGBZGFsyZu2jmuzErlGemb6wbDfbVqXsbdgJFhsndv7zbSrcHG2B7WnwkN
         pseEt1F2ejOInPZv7Eo33vcCIuM8rzRwfWUfyeWsFZcaKK36Jr+hmrXBl9DzYjp1nTKG
         XWvUfryNw5vJBtdupR37cDnoAARpYpVdr8HWfhZpLZ91op0jv9LLLxoG1SP2oROgRvH/
         CoQw==
X-Gm-Message-State: AO0yUKU+tT7VxJiF+s91dMqdKf8lpMUaXA6fODiaUqptfpbVpJ7IzbLL
	5Nlc9E400SxYf/tg4P4maTeWdA==
X-Google-Smtp-Source: AK7set+vkYi1NjFrFf/LVhqK8+JRWiJ85O5XnmwZEXRqNBqZ8jCna39sM0MO1QyYct729rWgCSzp8Q==
X-Received: by 2002:adf:ec09:0:b0:2c7:e48:8c87 with SMTP id x9-20020adfec09000000b002c70e488c87mr10613238wrn.25.1678175934284;
        Mon, 06 Mar 2023 23:58:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6faa:6d13:586e:871d? ([2a01:e0a:982:cbb0:6faa:6d13:586e:871d])
        by smtp.gmail.com with ESMTPSA id z9-20020adfec89000000b002425be3c9e2sm11913168wrn.60.2023.03.06.23.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 23:58:53 -0800 (PST)
Message-ID: <ef4ef0da-f6e3-7235-5178-3ef579f17a21@linaro.org>
Date: Tue, 7 Mar 2023 08:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: Add initial support for
 BPI-CM4 module with BPI-CM4IO baseboard
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
 <20230303-topic-amlogic-upstream-bpi-cm4-v2-2-2ecfde76fc4d@linaro.org>
 <CAFBinCDSWHg1uc8+c_QwoQy2j8K5Ny6xfMfXm-zp67eYH_Zxdg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCDSWHg1uc8+c_QwoQy2j8K5Ny6xfMfXm-zp67eYH_Zxdg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_235858_125114_131FFB77 
X-CRM114-Status: GOOD (  18.96  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDYvMDMvMjAyMyAyMzoxMSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBOZWls
LAo+IAo+IE9uIE1vbiwgTWFyIDYsIDIwMjMgYXQgOTozMeKAr0FNIE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gQWRkIHN1cHBvcnQgZm9yIGJv
dGggdGhlIEJhbmFuYVBpIEJQSS1DTTQgbW9kdWxlIGFuZCB0aGUgQmFuYW5hUGkKPj4gYmFzZWJv
YXJkIHdoaWNoIGlzIGNvbW5wYXRpYmxlIHdpdGggdGhlIFJhc3BiZXJyeVBpIENNNElPIGJhc2Vi
b2FyZC4KPiBzL2NvbW5wYXRpYmxlL2NvbXBhdGlibGUvCj4gCj4+Cj4+IFRoZSBCYW5hbmFQaSBC
UEktQ000IG1vZHVsZSBmb2xsb3dzIHRoZSBDTTQgc3BlY2lmaWNhdGlvbnMgYXQgWzFdLAo+PiBi
dXQgd2l0aCBhIHNpbmdsZSBIRE1JIHBvcnQgYW5kIGEgc2luY2UgRFNJIG91dHB1dC4KPiBzL3Np
bmNlL3NpbmdsZS8KPiAKPj4KPj4gVGhlIGN1cnJlbnQgQ000SU8gYmFzZWJvYXJkIERUIHNob3Vs
ZCB3b3JrIGZpbmUgb24gdGhlIFJhc3BiZXJyeSBDTTQKPj4gYmFzZWJvYXJkIGFuZCBvdGhlciBk
ZXJpdmF0aXZlcyBiYXNlYm9hcmRzLCBidXQgcHJvcGVyIERUIHNob3VsZAo+PiBiZSB3cml0dGVu
IGZvciBvdGhlciBiYXNlYm9hcmRzLgo+Pgo+PiBUaGUgc3BsaXQgaXMgZG9uZSBzbyBpdCdzIGVh
c3kgdG8gZGVzY3JpYmUgYSBuZXcgQ000IGJhc2Vib2FyZCwgZW5hYmxpbmcKPj4gb25seSB0aGUg
bmVjZXNzYXJ5IEhXIHVzZWQgb24gdGhlIGJhc2Vib2FyZC4KPj4KPj4gWzFdIGh0dHBzOi8vZGF0
YXNoZWV0cy5yYXNwYmVycnlwaS5jb20vY200aW8vY200aW8tZGF0YXNoZWV0LnBkZgo+Pgo+PiBU
ZXN0ZWQtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9y
Zz4KPiBXaXRoIHRoZSB0eXBvcyBhYm92ZSBmaXhlZDoKCkknbGwgZml4IHRob3NlIHdoaWxlIGFw
cGx5aW5nCgoKPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPiAKPiBbLi4uXQo+PiArJmV4dF9tZGlvIHsKPj4gKyAg
ICAgICBleHRlcm5hbF9waHk6IGV0aGVybmV0LXBoeUAwIHsKPj4gKyAgICAgICAgICAgICAgIC8q
IFJlYWx0ZWsgUlRMODIxMUYgKDB4MDAxY2M5MTYpICovCj4+ICsgICAgICAgICAgICAgICByZWcg
PSA8MD47Cj4+ICsgICAgICAgICAgICAgICBtYXgtc3BlZWQgPSA8MTAwMD47Cj4+ICsKPj4gKyAg
ICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9faW50Yz47Cj4+ICsgICAgICAg
ICAgICAgICAvKiBNQUNfSU5UUiBvbiBHUElPWl8xNCAqLwo+PiArICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwyNiBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+IEl0IHdvdWxkIGJlIGdyZWF0IHRv
IGhhdmUgdGhlIHJlc2V0IEdQSU8gKEdQSU9aXzE1KSBkZXNjcmliZWQgYXMgd2VsbC4KPiBCdXQg
dGhpcyBjYW4gYmUgZG9uZSBpbiBhIGZvbGxvdy11cCBwYXRjaC4KCkknbGwgc2VuZCBhIGZvbGxv
dy11cAoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpUaGFua3MgIQpOZWlsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
