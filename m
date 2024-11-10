Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C83BD5D69B
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2024 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwGiMF8LcEHPy+4bDw3afI3YPehziT3YKknWu466BaM=; b=xXtryMOSQTtGIy
	bgZ71+JnQtJ96ktCEEJBpobgfYp0PkrGi9movC48+7umaaixhowa/CtpCjblqaFgg2oUJIMO+KyBF
	hxbFxGuT4QQOAVQvq5R3Sr4O1iNerchDaSGWD6+orokISvLq9eqJA548xj697oM/30G36HJgZ6B+Q
	+kDky0cRoGnUXqeHcHNcYoGnxeJxxcjnjtPjVcYGYz0RqsdVNKNaeXj1GVvP7Y+OhKVvNLsNSf1Ca
	jlk/kgUNK2Hpr3qfEhynq0zrGXvLhDJgzBnL2zElAnEmHLvoeqT93MwOeQtSw6y+U70ikYEEnBrJ6
	MEP9OuHzHt/41DXbMl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA70C-0000000Eq0y-2sGP;
	Sun, 10 Nov 2024 12:25:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA6zM-0000000Epuy-2HdV
	for linux-amlogic@lists.infradead.org;
	Sun, 10 Nov 2024 12:24:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315eac969aso20490695e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 10 Nov 2024 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731241458; x=1731846258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvXYUadJ0YY+CbymfbcOM/wzKxval+r+XKbtSthLR0Q=;
        b=Pqw2nR686iJfmPVhriVLyDwE4GDyIH2ukolbsmoGlqrQcyV+XPPpsy9KeXPJEt5vdd
         LCA5Ri9GratIW9MkqAahtonmXk0ZX45qiM72BGd6etuEDybtxkmUDGYDcEVWwJ/GMi8s
         JRGO3bjxsWH1JP0f55Jyuf1jOJwpOtPYkr7jlEHUo53BoKHZ/y567DfkO8bp6m7uh0L3
         EfAAjsqYR5JqZbxnyrlZWheel4Atp8fjSw9iaUyrbY8hPLtGN2I+C0fnqbj9PI2AGvLP
         2a0yNcH8kZEPXUh5OFklDjXBvsyVc6GHS+tj5wZ5MK+tzJfugrLJvQg0VwejmcHqMFwV
         crZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731241458; x=1731846258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvXYUadJ0YY+CbymfbcOM/wzKxval+r+XKbtSthLR0Q=;
        b=m836tZsSyBQMNSCygwTVw3oEB5nBKWdYPdUES4Ouu1IWaFAvjYqXmIOyAk64c+oB52
         8qXnNcC1vh5MyvtijXclfz+IMujgr8OPLksVADeh5yUXtlUmKkZMfHrANVZgoDdDQYgx
         aAjXvuW5kfmQbH2dD9ZkOr2a1lQQsgn3z/zwTU6rBSpYkxQ2mjzy+Rwm4e+V4gsPlehf
         HoGkN6SosZ0umym5I7WYCTNBZB8r4c4lVU0Wy1upijETKIyNDJn0hVsPTFbjG/IrKXNU
         R5LNTjVL7wBhr/tXB2s94AzRi3/QYAs9oHP+iGWoEHk77UrzB0CCKxL5t+LZ8WINfzvB
         oFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNFHOjOq28Lmf/pVViovaIdyAopto9fPkiLL7XJ9pll4ZFQ9+65CiTl/0FQ7TkuOpGAx741IVC7hCWFqM3@lists.infradead.org
X-Gm-Message-State: AOJu0YyA0Qjm/V8MVa18GSINP1H3A5dJNFxjEVNHCqN01XT6h7lzpHsE
	DWG4VQIryxuDmDRFLT7gLm0nkc3b9C5duImvsKFdAbWEoixD7d8SmnlQ41akKus=
X-Google-Smtp-Source: AGHT+IGhj9FWXxXNMyiRS3rVPR92d2i9obKrk1HDWxw33l4TLDIFDIzAxuSd6E/CWeUFU724XoVgXA==
X-Received: by 2002:a05:600c:4f4e:b0:431:4a82:97f2 with SMTP id 5b1f17b1804b1-432b6858db8mr83883675e9.6.1731241458324;
        Sun, 10 Nov 2024 04:24:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e984:9f27:9cbb:71ca? ([2a01:e0a:982:cbb0:e984:9f27:9cbb:71ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a1d8sm180707145e9.27.2024.11.10.04.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 04:24:17 -0800 (PST)
Message-ID: <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
Date: Sun, 10 Nov 2024 13:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
Content-Language: en-GB
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_042420_621841_761A4EC9 
X-CRM114-Status: GOOD (  18.89  )
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

SGksCgpMZSAwMS8xMS8yMDI0IMOgIDA5OjI3LCBYaWFud2VpIFpoYW8gdmlhIEI0IFJlbGF5IGEg
w6ljcml0wqA6Cj4gQWRkIHBpbmN0cmwgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9pZ2MgQTQgU29D
Cj4gCj4gSSB3YW50IHRvIGZpbmQgb3V0IHdoYXQga2luZCBvZiBzb2x1dGlvbiBpcyBmZWFzaWJs
ZSB0bwo+IG1lZXQgdGhlIG5lZWRzIG9mIGFsbCBwYXJ0aWVzLiBUaGlzIFJGQyB2ZXJpb24gaXMg
b25lIG9mIHRoZW0uCj4gCj4gQWxsIG9mIEFtb2dpYyBTb0NzIEdQSU8gZGV2aWNlIHJlcXVpcmVt
ZW50IGlzIG1ldCBoZXJlIGJ5Cj4gYWRkaW5nIEdQSU8gYmFuayBkZWZpbml0aW9uIGluc3RlYWQg
b2YgdGhlIHBpbiBkZWZpbml0aW9uLgo+IEJpbmRpbmcgaGVhZGVyIGZpbGVzIHdpbGwgbm8gbG9u
Z2VyIGJlIGFkZGVkIHRvIGZ1dHVyZQo+IFNvQ3MncyBwaW4gZGV2aWNlcy4KPiAKPiBUaGUgcGlu
Y3RybCBzb2Z0d2FyZSBvbmx5IGFkZHMgaW5zdGVyZmFjZSBvZiBvZl94bGF0ZSB0byBzdXBwb3J0
Cj4gZm9yIHRyYW5zZm9ybWF0aW9uIHdpdGhvdXQgYWZmZWN0aW5nIHRoZSBvdmVyYWxsIGZyYW1l
d29yayBhbmQKPiBpcyBjb21wYXRpYmxlIHdpdGggcHJldmlvdXMgZHJpdmVycy4KPiAKPiBUaGUg
Y29kZSBpbiBEVFMgZmlsZSBpcyBhbHNvIHJlYWRhYmxlIHdoZW4gdXNpbmcgR1BJTywgYXMgYmVs
b3c6Cj4gCj4gcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gQU1MT0dJQ19HUElPKEFNTE9HSUNfR1BJT19Y
LCA2KSBHUElPX0FDVElWRV9MT1c+OwoKRmluZSwgYnV0IHdoeSBub3QgdXNlIDMgY2VsbHMgaW5z
dGVhZCBvZiB0aGlzIG1hY3JvID8gU2luY2UgeW91IGludHJvZHVjZWQgdGhlCmN1c3RvbSB4bGF0
ZSwgcGFyc2luZyB0aGUgMyBjZWxscyB3b3VsZCBiZSBlYXNpZXIgdGhhdCB1c2luZyBhIG1hY3Jv
OgoKcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gQU1MT0dJQ19HUElPX1ggNiBHUElPX0FDVElWRV9MT1c+
OwoKTmVpbAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0Bh
bWxvZ2ljLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gQWRkIGludGVyZmFjZSBvZiBv
Zl94bGF0ZSBzdXBwb3J0Lgo+IC0gQWRkIGNvbnN0IGZvciBzb21lIHZhcmlhYmxlLgo+IC0gTGlu
ayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTAxOC1hNF9waW5jdHJsLXYz
LTAtZTc2ZmQxY2YwMWQ3QGFtbG9naWMuY29tCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIFJlbW92
ZSBoZWFkIGZpbGUgZnJvbSBiaW5kaW5nLgo+IC0gTW92ZSBHUElPIGRlZmluZSB0byBmaWxlICou
Yy4KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEwMTQtYTRf
cGluY3RybC12Mi0wLTNlNzRhNjVjMjg1ZUBhbWxvZ2ljLmNvbQo+IAo+IENoYW5nZXMgaW4gdjI6
Cj4gLSBVc2Ugb25lIG1hcmNvIGluc3RlYWQgb2YgYWxsIHBpbiBkZWZpbmUuCj4gLSBBZGQgdW5p
dCBuYW1lIGZvciBkdHMgbm9kZS4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDYxMS1hNF9waW5jdHJsLXYxLTAtZGM0ODdiMTk3N2IzQGFtbG9naWMuY29t
Lwo+IAo+IC0tLQo+IFhpYW53ZWkgWmhhbyAoNCk6Cj4gICAgICAgIGR0LWJpbmRpbmdzOiBwaW5j
dHJsOiBBZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBBNCBTb0NzCj4gICAgICAgIHBpbmN0cmw6IG1l
c29uOiBhZGQgaW50ZXJmYWNlIG9mIG9mX3hsYXRlCj4gICAgICAgIHBpbmN0cmw6IG1lc29uOiBB
ZGQgZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9naWMgQTQgU29Dcwo+ICAgICAgICBhcm02NDogZHRz
OiBhbWxvZ2ljOiBhNDogYWRkIHBpbmN0cmwgbm9kZQo+IAo+ICAgLi4uL2JpbmRpbmdzL3BpbmN0
cmwvYW1sb2dpYyxtZXNvbi1waW5jdHJsLWExLnlhbWwgfCAgICAyICsKPiAgIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE0LmR0c2kgICAgICAgIHwgICAzNiArCj4gICBkcml2
ZXJzL3BpbmN0cmwvbWVzb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgIDYgKwo+
ICAgZHJpdmVycy9waW5jdHJsL21lc29uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAg
ICAxICsKPiAgIGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLWFtbG9naWMtYTQuYyAgICAg
ICAgIHwgMTMyMSArKysrKysrKysrKysrKysrKysrKwo+ICAgZHJpdmVycy9waW5jdHJsL21lc29u
L3BpbmN0cmwtbWVzb24uYyAgICAgICAgICAgICAgfCAgICA0ICsKPiAgIGRyaXZlcnMvcGluY3Ry
bC9tZXNvbi9waW5jdHJsLW1lc29uLmggICAgICAgICAgICAgIHwgICAgNCArCj4gICBpbmNsdWRl
L2R0LWJpbmRpbmdzL2dwaW8vYW1sb2dpYy1ncGlvLmggICAgICAgICAgICB8ICAgNTAgKwo+ICAg
OCBmaWxlcyBjaGFuZ2VkLCAxNDI0IGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNvbW1pdDog
NThlMmQyOGVkMjhlNWJjODgzNmY4YzE0ZGYxZjk0YzI3YzFmOWUyZgo+IGNoYW5nZS1pZDogMjAy
NDEwMTItYTRfcGluY3RybC0wOWQxYjJhMTdlNDcKPiAKPiBCZXN0IHJlZ2FyZHMsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
