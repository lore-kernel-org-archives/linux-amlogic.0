Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93355C5479D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Jan 2023 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5xNmRSeFvs2lhf9Tnvk0UAD8WqDZclO5a4vG+gV4sE=; b=eao4zRF4uT3Z+3
	O4h2He2OJ5Zknodz+9/lD6NF1vNLIQRbC6PhzP0k6guQqQaBqtwUpYprueLXOpbpqaXTN9IhciJmD
	3uZ5QIbgCjYsF45JocI0xIWQoOJK65mL7GGlge0nXiSK7pkFHH/n6jEc1uHz6y/6sx7vXRoMXxX2r
	4uAJ67l7AEwgp5ywQJBUII5v5U8c/VgM/+8A/7kVxt2noHi56GErurjsDRnG6PS6KnI9W2Gntlmi3
	lJzNSPYff1pkUQtmFW9I9+y/8yVUXnjE1Qel6AvQfYYH3/qpRuI5oJjRI7N5bYj7VvbPubes27dF/
	7F1/iuJx0OH7qCt++vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhrg-006WTZ-JZ; Fri, 06 Jan 2023 08:14:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhrW-006WQ2-Sm
	for linux-amlogic@lists.infradead.org; Fri, 06 Jan 2023 08:14:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so3021799wmb.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Jan 2023 00:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LgfaxQBxMkYdezPSKlR6TiaF4qemCs5BgQKFqSeUefE=;
        b=ii1382cFov7OVo7cz9Xy6m8b+mLMopI5ciXgUlgPZBpB/ncWlw4LJWgIKFYP+n+0ZT
         T/E5Z2LCrRgRy0KojdKrdEcXrOS55g51w4PXpUCNk5cfwlX9+Sr9WDtIrnakTLvWICbF
         tY3PZ8J2t/+ID+swfPsAAK9McWCQzWUiaTueSG1ONPbllzc214J+A6B6f53IltsKVhWB
         pi8vO1Ccp/iQjsOeic0rZf48hcc13kaV4mFdqW8icw8LDlTEsM0ijQ6XkHQ0R19zPv4h
         fVWhDbDTejBpPBjmxyxPgVq/wqNR/Z+AyOhZo8W84b8CVeDmlEGeNCB8hclU9tQrH7IW
         dabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgfaxQBxMkYdezPSKlR6TiaF4qemCs5BgQKFqSeUefE=;
        b=2mdLnbKSMgbk0TbkH4Z5F2dTyJXLjKHM+Zltb8m7e7HHjLjk4Vl+xNbBpbcfFltgok
         UiAfp4lirwmk1u4B4f6y+0GGwgVt+B2r3/beio3sptwNGFDYUXtL/UqEO4Az+zzxtOOc
         ukTKp5JrXcWwYgbCwu3fMKHiVogbVWr17Q56Ys1I8yARGw9dhIThFnOb2B81LTlZOtUt
         JBrc5xAe4uzMA3WevNcVMuxSb0uFvHnMnBbBp+OMydMuOwObof85WEdWSxXAyvfcbiQJ
         pH8xzwNSrJu5WATNpr+c0wGQ4k/gtZ04XXsipizJwVQtuP3KPq/4cdXFVxGuyhjqS4lS
         7Yiw==
X-Gm-Message-State: AFqh2koyQw6wf50vnkrub0Xi0Hag1RSW03PDFD8gzDK5Q3HEGr/SjVpK
	VyrmH6jAfyRkxCT2v4FVaKS9yWFurFvNQFcn
X-Google-Smtp-Source: AMrXdXvDBz8Fo5guGIVo2bfZgAb8qBNJG9qwCKL7+3+Xy1Izugnwq+tLFWLDeETQ9Quvf0OYucTyQg==
X-Received: by 2002:a1c:4b14:0:b0:3d3:5ade:4317 with SMTP id y20-20020a1c4b14000000b003d35ade4317mr37629711wma.8.1672992840668;
        Fri, 06 Jan 2023 00:14:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a0ba:a5f3:d9f1:7e25? ([2a01:e0a:982:cbb0:a0ba:a5f3:d9f1:7e25])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c198c00b003d9de0c39fasm569137wmq.36.2023.01.06.00.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 00:14:00 -0800 (PST)
Message-ID: <af9de47d-ade9-0fa4-5b37-5a05308cc2e8@linaro.org>
Date: Fri, 6 Jan 2023 09:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] Revert "arm64: dts: meson-sm1-odroid-hc4: disable
 unused USB PHY0"
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Pierre-Olivier Mercier <nemunaire@nemunai.re>,
 martin.blumenstingl@googlemail.com
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230104140608.28432-1-nemunaire@nemunai.re>
 <20230105120206.28964-1-nemunaire@nemunai.re>
 <dfeff261-53cf-54b5-b3dd-dc0ce0d1e6a0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <dfeff261-53cf-54b5-b3dd-dc0ce0d1e6a0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_001402_934678_36EDFF04 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDUvMDEvMjAyMyAxODo1MiwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBP
biAwNS8wMS8yMDIzIDEzOjAyLCBQaWVycmUtT2xpdmllciBNZXJjaWVyIHdyb3RlOgo+PiBUaGlz
IHJldmVydHMgY29tbWl0IDcwM2U4NGQ2NjE1YTRhOTVmYjUwNGM4ZjJlNGM5NDI2Yjg2ZjM5MzAu
Cj4+Cj4+IFVTQiBkZXZpY2UgZW51bWVyYXRpb24gd2FzIG5vdCB3b3JraW5nIG9uIE9kcm9pZCBI
QzQgYXMgYm90aCBVU0IyIFBIWXMKPj4gbmVlZCB0byBiZSBlbmFibGVkLiBUaGlzIGlzIGluaGVy
aXRlZCBmcm9tIHRoZSBHTFggVVNCIGRlc2lnbiBbMV0uCj4+Cj4+IFsxXTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMTcwODE0MjI0NTQyLjE4MjU3LTEtbWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbS9ULwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtT2xpdmllciBN
ZXJjaWVyIDxuZW11bmFpcmVAbmVtdW5haS5yZT4KPj4gLS0tCj4+IHYyOgo+PiDCoCAtIEZpeCBj
b21taXQgbG9nCj4+IC0tLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
c20xLW9kcm9pZC1oYzQuZHRzIHwgOCArKy0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQtaGM0LmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEtb2Ryb2lkLWhjNC5kdHMKPj4gaW5kZXggZTM0ODZm
NjA2NDVhLi5hMWYwYzM4Y2NhZGQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1zbTEtb2Ryb2lkLWhjNC5kdHMKPj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1vZHJvaWQtaGM0LmR0cwo+PiBAQCAtMTMxLDEwICsxMzEs
NiBAQCBmbGFzaEAwIHsKPj4gwqAgfTsKPj4gwqAgJnVzYiB7Cj4+IC3CoMKgwqAgcGh5cyA9IDwm
dXNiMl9waHkxPjsKPj4gLcKgwqDCoCBwaHktbmFtZXMgPSAidXNiMi1waHkxIjsKPj4gLX07Cj4+
IC0KPj4gLSZ1c2IyX3BoeTAgewo+PiAtwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICvC
oMKgwqAgcGh5cyA9IDwmdXNiMl9waHkwPiwgPCZ1c2IyX3BoeTE+Owo+PiArwqDCoMKgIHBoeS1u
YW1lcyA9ICJ1c2IyLXBoeTAiLCAidXNiMi1waHkxIjsKPj4gwqAgfTsKPiAKPiBPSyB3ZWlyZCwg
dGhpcyBlbWFpbCBkb2Vzbid0IGFwcGVhciBvbiBhbnkgbWFpbGluZy1saXN0cyBhcmNoaXZlLCBu
ZWl0aGVyIG91ciByZXBsaWVzICEKClNlZW1zIGluZnJhZGVhZCB3YXMgc3RydWdnbGluZyB5ZXN0
ZXJkYXksIGV2ZXJ5dGhpbmcgaXMgYmFjayB0byBub3JtYWwgYW5kIHJldmVydCBpcyBzZW50IHRv
IFNvQyBtYWludGFpbmVycy4KCj4gCj4gTmVpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
