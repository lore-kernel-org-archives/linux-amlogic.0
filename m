Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D28C54E4A
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Mar 2024 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpZLHK/JtEtll7cRQ5HErvzGlawiDNBU75KgUbtrykc=; b=epCSqNrYN1qIJY
	GX5gpLMSNTyNm3AU7C2R7tL3JJspTGaIgVKydNps+eVqMqQnatTNMl7u9FaZ0eY/FLPLZyL/Ku3Au
	CWgKtlmnPNmmCdpQ7RyG918UFaZhe8va8go4vjV+E2ZagaRIRqdJPiyXiIybXmW3QwThdoG0RWyMa
	O28IlzWZXD4iaeN0qIo8WUwuGDZlXNfkhSz2LD6p3dPnQZG73iDVlf7ofsbV3VftSwNYuZi3WQi1z
	Cg7Wvm7uFNLHvanjCgEqTNDiIFEu0loncGVxLOQHnuE7neoB54ksXIvty9Fn8JDHf72woQaocgfNz
	RLKTFM2SY+uFlLnGGpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ridkE-0000000APIr-0b0t;
	Fri, 08 Mar 2024 17:10:54 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ridk9-0000000APEQ-0jhb
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Mar 2024 17:10:52 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29bb557cb05so514913a91.1
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Mar 2024 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709917842; x=1710522642; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2kWEuzgRtKwEAwMhmmNmodaPq/DI7wxcR5vXLJ04Wo=;
        b=jcB3olB/BD77o34D8Is8k8CisE8wchnnmeDyqWhB0/rAI0F4ddNZq64Qr/EPOyJI60
         4u2y00kZVsZLXRG7gvGTYo51YKLpwKyF7P7MNI7jcGMvkgSFEn06oV324SAKs0ceZEyt
         jDN8cuhq18N8l5tL/jcDDFcYL7MR9FNeiX8rhHzdFlZWvBcU07ZfYYTzoWe4B3YbAUCX
         G3gCK8IiHStOW7B+EnNcqDEfWVcGvd/bd+/vTasV6lRfzRpNX6bjojqmA/iSjxRpavYV
         Wkn/W2YIXetvXrA/EAUp0QK0s8neVzULchTyHnm6cZ2x8rKIUZryHUVI+9xAeaUjIptX
         F8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709917842; x=1710522642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w2kWEuzgRtKwEAwMhmmNmodaPq/DI7wxcR5vXLJ04Wo=;
        b=gEuofO5ms2nLzTmJmBneZdQ2GJ0FHEU/DDXvTZUoMvtorLTehgii4MfNEbusQ4jOl5
         0WKBkGBnKo2C41sZtAtzAxHN1jGwE66WDuJGCIN6/klX7JAjEqQz3nikzkPiB+Sqxmez
         jyrF+nQtMhAy7Ttjq2EBFY3NDqFlgQj1LST3j7YZnK1B2rD7q0zCTd3EYRRy0CCKaHr6
         wUR+qzt2FRIlPGaVA7JQGsp1jmiLFRHQEeWZMn5pqTDIn1gaxYS2tCQApUnsn44kF0Uw
         g/iavpO89NJyuIPdAQ/5VO+HCS72tUc5/CpAW1Mlb4M3fbcK1FCgtbx2KvhmgRspw8OB
         SUOw==
X-Forwarded-Encrypted: i=1; AJvYcCV0urjnb8vIDjDDqggVHfv+veM+YCfsjgkSnKxe2ZxHiQpZLRU8yuBtZhP7iaZy32MigsMjSKE0dhD5aX4UXnaBUvWZkr7TzKbHRjuHk1UtBR4=
X-Gm-Message-State: AOJu0Yy7sDTP7//TmBg73fGz/CI37reB3ZJcjN4wJmLDJh8RONZ1Qn0L
	pO8j9/HNmnZ9D902bwPEaDrL3lw1ls4VnLGjHmcNpgADd1Bqhg5W8avrCtVkvQ==
X-Google-Smtp-Source: AGHT+IFZZccyoD4Rjms9sGylhl/6bi13hc3TIZoTOmk5GJOEjCrpAwbGuEHC37AMF3es6hymzRJPLA==
X-Received: by 2002:a17:90b:318:b0:29b:b6bb:17ba with SMTP id ay24-20020a17090b031800b0029bb6bb17bamr567988pjb.46.1709917841853;
        Fri, 08 Mar 2024 09:10:41 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id k61-20020a17090a3ec300b0029ba1b5a692sm2470187pjc.12.2024.03.08.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:10:41 -0800 (PST)
Date: Fri, 8 Mar 2024 22:40:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/1] PCI: dwc: Remove unused of_gpio.h
Message-ID: <20240308171029.GB53064@thinkpad>
References: <20240307122840.3682287-1-andriy.shevchenko@linux.intel.com>
 <20240308095547.GI3789@thinkpad>
 <Zer_9VTVJqCNoOFG@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zer_9VTVJqCNoOFG@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_091049_428918_1AD4F7B9 
X-CRM114-Status: GOOD (  21.69  )
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

T24gRnJpLCBNYXIgMDgsIDIwMjQgYXQgMDI6MDk6MjVQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIEZyaSwgTWFyIDA4LCAyMDI0IGF0IDAzOjI1OjQ3UE0gKzA1MzAsIE1hbml2
YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDA3LCAyMDI0IGF0IDAyOjI4
OjQwUE0gKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+ID4gb2ZfZ3Bpby5oIGlzIGRl
cHJlY2F0ZWQgYW5kIHN1YmplY3QgdG8gcmVtb3ZlLgo+ID4gPiBUaGUgZHJpdmVyIGRvZXNuJ3Qg
dXNlIGl0LCBzaW1wbHkgcmVtb3ZlIHRoZSB1bnVzZWQgaGVhZGVyLgo+IAo+ID4gV2hhdCBhYm91
dCB0aGUgcmVzdD8KPiA+IAo+ID4gZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1raXJp
bi5jCj4gPiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jCj4gCj4gSGF2ZSB5
b3UgY2hhbmNlIHRvIGxvb2sgYXQgdGhlbT8KPiAKCk9rLiBJIGZhaWxlZCB0byBzcG90IHRoZSB1
c2FnZSBvZiBvZl9nZXRfbmFtZWRfZ3BpbygpIGluIGJvdGggZHJpdmVycy4gQnV0IHlvdQphbHJl
YWR5IHN1Ym1pdHRlZCBhIHBhdGNoIHRvIGNvbnZlcnQga2lyaW4gbGFzdCB5ZWFyIFsxXSwgYW5k
IHRoYXQgZGlkbid0IGdldAphbnkgbG92ZSBmcm9tIHRoZSBtYWludGFpbmVycy4gQ291bGQgeW91
IHBsZWFzZSByZXNwaW4/IFBlcmhhcHMgY29udmVydCBpbXg2CmFsc28/CgpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMjEzMTgwNzM1LjQyMTE3LTEtYW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tLwoKPiA+IFRoZXJlIGlzIGFsc28gb25lIG5vbi1kd2MgZHJpdmVy
Ogo+ID4gCj4gPiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jCj4gCj4gS2V5
d29yZDogbm9uLWR3Yy4KPiBUaGlzIHBhdGNoIGlzIGZvciBEZXNpZ25XYXJlIGNvbnRyb2xsZXJz
IHRoYXQgY29uZmlybWVkIG5vdCB1c2luZyB0aGUgaGVhZGVyLgo+IAo+ID4gSXQgaXMgYmV0dGVy
IHRvIHJlbW92ZSBpdCBmcm9tIGFsbCBQQ0kgZHJpdmVycyBpbiBhIHNpbmdsZSBwYXRjaC4KPiAK
PiBJIGRpc2FncmVlIG9uIHRoaXMuIFRoZXNlIGFyZSBkaWZmZXJlbnQgZHJpdmVycyBhbmQgZXZl
biBpbnNpZGUgRGVzaWduV2FyZSBub3QKPiBhbGwgb2YgdGhlbSBjYW4gYmUgY29udmVydGVkIHdp
dGggYSBzaW1wbGUgY2hhbmdlIGxpa2UgdGhpcyBvbmUuCj4gCgpTaW5jZSB0aGlzIGlzIGp1c3Qg
YSBoZWFkZXIgcmVtb3ZhbCBJIHRob3VnaHQgeW91IGNhbiBqdXN0IHNlbmQgYSBzaW5nbGUgcGF0
Y2gKZm9yIHRoZXNlIGRyaXZlcnMgc2luY2UgdGhlcmUgaXMgbm90aGluZyBzcGVjaWFsIHRoYXQg
d2FycmFudHMgYSBzZXBhcmF0ZSBwYXRjaApmb3IgYWFyZHZhcmsgKGJvdGggYXJlIGluc2lkZSB0
aGUgZHJpdmVycy9wY2kvIGhpZXJhcmNoeSkuCgpCdXQgYW55d2F5LCBJIHdvdWxkbid0IHByZXNz
IGZvciBpdC4KCj4gVGhhdCBzYWlkLCBwbGVhc2UgY29uc2lkZXIgYXBwbHlpbmcgdGhpcyBvbmUg
YXMgaXMuCj4gCgpJIGNhbiBnaXZlIG15IFItby1iIHRhZywgYnV0IExvcmVuem8gb3IgS3J6eXN6
dG9mIHdpbGwgYXBwbHkgdGhpcy4KClJldmlld2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
PG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/
4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
