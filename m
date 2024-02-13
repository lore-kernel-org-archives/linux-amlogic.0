Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D55C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=co5gsW4of8RVOWRdIi8kBmj/XszTMmz0TTo1+AfBE7g=; b=S0xpyWJXwDCVBi
	6/ngMkSswKH95wwHmnmkiZRgoCq+xE717vgtKMVCAR0SWaxBTnzCjO40Vnn9PHT13yRf7hluaFGM2
	E9NKAWmEsqlSDRNYY8Ggr7xfMenlL5Idq9bxi/EbkzoZ4e96XUdcm4B1jIRt1HtLZPXlRgb4VWuVM
	NvpPDLj/7xCePaG9Xxj6j5vDCKbAZ4NgO4zBnLo9hyjzpO9Suy5OuEA82geOyEJefdC+FVjjq1wgb
	ljahI8pOEukegE0d7Md5Bq9FaDcAt2pcCs2ztG1aV3N9u175uuR9prM05N7wBU367ud5OZcbjI7hT
	AP488ddgoD4xIsmuaUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoQ7-00000008TSU-1wZF;
	Tue, 13 Feb 2024 08:45:39 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoQ4-00000008TPg-0Xbc
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:45:37 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-68cc9061c78so21854116d6.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813934; x=1708418734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Fw1my7vh+Xb3V/wK1PNZ9g8Xa8RdGdj2KqL8iOkwes=;
        b=zTclMSqW0KsaEaE7/CyHkucTMaDQZO4yGAukn+B/FVMwdJEDuvRu8lvaMIwZRbncHp
         7Cr6tncGBixUSu87oQ1h9lYD4KWXSw//M5BxYgId+l5skBY0G4KHYzmmXsd7k3HL+vuh
         JSP/QC1aelH238PHxWKQB/p0QsEyD6UqgvERzBUIJxqlPlnJ1DmFGGp8cGXf3j94xtKO
         WvsI0vqRC56pefTADXE0r0hLEOdEBXmocT7LrBsX0IjoLFaTZkqElZQGbX7/eTC9qoKb
         7hdScL7Beg3FXHHhge3TBkI3xSwPCkGEVVWbhy1So1VGhGUzhVi2H36j9WOtlFw6qeWk
         pRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813934; x=1708418734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fw1my7vh+Xb3V/wK1PNZ9g8Xa8RdGdj2KqL8iOkwes=;
        b=YbYnzb0O3YyY69rq18j/Q7Bf6gKVYEH66KtpYS2ncjT/AqLsNfNZMlW3JO7N5MSZzZ
         Qnn8Vr+YPjXvEQelzlizW4gV1/2I3D+kfbJkNaXzP45iu3u95i0kkLyAxymLvb29X8tV
         TLmQikFQYgPt+P8YUYdaLnG9pKvR1RB5sSpEk63hrzIBdCI3SzqNJTuaHkHIQOk5CPaN
         4OS0io8LrZFyxoNbMTUKSwMuMQmkcJ+jp6THIf0CMIdioCSE3QQTvFHiP6/Sx3wSuj34
         Zp5ol5Nc9xxI+KwnnsGu9Ap7QNmcIUxGaiGkZ7ecbqJfoPeL5yekcgZY3653nw0PtWo8
         XzoQ==
X-Gm-Message-State: AOJu0YyUAnFUVNXqlrrnim7hR9neaGvfCulLiOKB+UnwYL6YdxmNHsbD
	wbZoOfMiAF7+5Xm61qz9BZCI6PAUgQHStbLu5LoWg52HaaYNIBOeLcpd0IQTkx9wtl5zg7pE/nS
	M
X-Google-Smtp-Source: AGHT+IHBFg+4DXI7iIENZtgDE1sySAz5Z73HvSRJHXtD9kFtj/p003pU5cjn/cKs9mALkfaAIaKe9Q==
X-Received: by 2002:a0c:e393:0:b0:68c:930e:5ae3 with SMTP id a19-20020a0ce393000000b0068c930e5ae3mr8639250qvl.44.1707813933845;
        Tue, 13 Feb 2024 00:45:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjpqgLjJIQZrXW+BAG1ycOsH0wex7GttQqm5t2pl5hFWtSjbhTlCYSSYTjn3weQan9YPwHFnpsy3TqCDeb7px2v/Y/KRoj/CIeZdU2K7WT+P9Pw5gG/fidZCD8jMl+G6u4WDCPGwXRZty4EKFTBEBZk7sgdmhVgpfbQ9P98DE8c437dUvKhm1B45wQdQYO3VUu9dtiq2ttVBF0+IRChJiVMXetRpOziFZxfsk5N9en8PdsjpbIZUSxHgvuVJX7it6CqAknKCsnVduevkMGonXzGOFl1c9gth7rYuTmWUl9l1rogPO51UZ+RUU1pP5k0sR9vZ5fDz8ysNGUg57E5oFHtHh1Hi1ODOotfyWrpi7i/NljD8m/JTgc+rkB6Ojj
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id lq7-20020a0562145b8700b0068caf5c5fe5sm1068049qvb.77.2024.02.13.00.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:45:33 -0800 (PST)
Message-ID: <60cec93b-aa80-4230-baa3-0f64aa0a4832@linaro.org>
Date: Tue, 13 Feb 2024 09:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Content-Language: en-US
To: neil.armstrong@linaro.org, Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <64f65168-c7b0-4365-8d0a-e57b47797d95@linaro.org>
 <6274df9e-bda6-44b8-aa7e-e4bba5c7c96a@linaro.org>
 <fb26c6cc-53d8-40c3-9248-d41f7598e2e8@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fb26c6cc-53d8-40c3-9248-d41f7598e2e8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004536_238768_FF51EA67 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

T24gMTMvMDIvMjAyNCAwOTo0NCwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBP
biAxMy8wMi8yMDI0IDA5OjQxLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAxMy8w
Mi8yMDI0IDA5OjM4LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+IEhpIE1hcmMsCj4+Pgo+Pj4g
T24gMTIvMDIvMjAyNCAxODo0NywgTWFyYyBHb256YWxleiB3cm90ZToKPj4+PiBBZGQgc3VwcG9y
dCBmb3IgRnJlZWJveCBmYng4YW0gYm9hcmRzCj4+Pj4KPj4+PiBNYXJjIEdvbnphbGV6ICg0KToK
Pj4+PiAgIMKgIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IGFkZCBmcmVlYm94Cj4+Pj4g
ICDCoCBkdC1iaW5kaW5nczogYXJtOiBhbWxvZ2ljOiBhZGQgZmJ4OGFtIGJpbmRpbmcKPj4+PiAg
IMKgIGFybTY0OiBkdHM6IGFtbG9naWM6IGFkZCBmYng4YW0gYm9hcmQKPj4+PiAgIMKgIGFybTY0
OiBkdHM6IGFtbG9naWM6IGFkZCBmYng4YW0gRFQgb3ZlcmxheXMKPj4+Pgo+Pj4+ICAgwqBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgMSArCj4+Pj4gICDCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbMKgwqDCoMKgIHzCoMKgIDIgKwo+Pj4KPj4+IFRoaXMgY2hh
bmdlIGRvZXNuJ3QgYXBwbHkgb24gdG9wIG9mIGVpdGhlciB2Ni44LXJjMSBvciBsaW51eC1uZXh0
LCBjb3VsZCB5b3UgcmViYXNlIG9uIHY2LjgtcmMxID8KPj4KPj4gUGxlYXNlIGRvbid0IGFwcGx5
LCBJIGhhdmUgZG91YnRzIGJpbmRpbmdzIHdlcmUgZXZlciB0ZXN0ZWQuCj4gCj4gSSBuZWVkIHRo
ZSBwYXRjaGVzIHRvIGFwcGx5IHRvIGJlIGFibGUgdG8gY2hlY2sgdGhlbSEKClRydWUgOiksIEkg
bWlzdW5kZXJzdG9vZC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
