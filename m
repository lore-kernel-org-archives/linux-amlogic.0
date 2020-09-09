Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74EAC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:28:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433AB21D81
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ScbQEDfX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HwTdDD0X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433AB21D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Klsqb5BJPIVllqWohptLXWteGbamsd7hzS+Q5g+1KXM=; b=ScbQEDfXUmGb72Bgy8hTuwgAB
	o6efk2TclEhBnlOGJD9kEGczgDzr9/5lpqAh2Mau5IIRddj7Bvbv07fSrz4AeLADGxM+xB9qW4l7f
	F+3uEqoQuuIDFWh7qJEjVXt7QMdvmf1qHKzABhcTER48ORhFfncW3108Q3r7/lne7TEN6JlVEDqh4
	Olg8KSVkUZMelor77L6idEavHTdd27tUKyj4jIT27ZLsS7VmWPwArRTs/MlHRgyu+2hufoiysuox8
	OR8y8qjeb5LQZER7Qgz9kaFL7XqohOxeDIYNLpkXuB+9wpf1n+e2w8RnKMLmxwvExOYRSJQF6CIRa
	NW5dzFNaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFzCu-00047J-Kx; Wed, 09 Sep 2020 12:28:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFzCi-00041P-TW
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 12:28:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id k18so2147954wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bzjsTr5kC67DEeYAVhxYZ6Zkc76tWoGyMm9YFgDJ7W0=;
 b=HwTdDD0X+rwiiQin2TkIDpkh88a6lCE3QyKtyAXwZ7m5ea9XJb2s3LW9La77utJeSH
 2rHKjyEKnpu1cPngR2Mhz8dj1WrmtauSu+Go5Q+W8lc+CrXcet4klBHOksn8s80CDenh
 Ee7WY//OYs1C+EQY/3R+w9TvjZMTe1gtKHFmsbEtfD0Vq6ZXovL+hL45uNHtHBi/ncXt
 zbhR+e5qdg4fbdG8zAvUb6eFYgO/oyIkQYmcQepgmJtlDLXNTOk56Kj4i0JwyZxpiyQM
 MNGlMihmMH+p617vfGrFkMmPple0coJuyLpUYbA7b7nT/XGH7AskRatDFA3mG897nrWx
 lvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bzjsTr5kC67DEeYAVhxYZ6Zkc76tWoGyMm9YFgDJ7W0=;
 b=BP1+f3M7fQZavJGvbylepZbG+RxDkxcwcHblwu6B5LecoBZFwWD9xSUOS/gW5y2Vkq
 fi/SfdubladKYSsfnTncup4nIAsp3g0wk7ccOT03XyNRGAyU3Zsnd+XYIcLyoB6jPpjP
 AmNXVgrQEvdV9xrgCrIObYYBU6+DPeSrfDxNSEW2tTUzFyacnopzqPuo08CA97VoloLF
 vqxsiPHWRzv5AhAWke9TlMuSV8z2yGP9mSn89boemsa+b4FwOwhRUcldaCIN2iA8edNB
 bmFpvmtM66dx2vw+os4Lh3DXeObTvr+PauljbIN7qgO452KX2E+jejcE7wQlRmQMrlPJ
 //RQ==
X-Gm-Message-State: AOAM532emlM33k2yL9sx8Xu0tKfZmKhz2EB+pzHuxwLfBHjCSRmnXASF
 MPOgUAiuEol1COUI7IkGP/mgwqPE1WN7ZEHv
X-Google-Smtp-Source: ABdhPJxuUnuBWGaJoZ859QwCIJF5VXyQRPPa5JNmtgVgaf5Zy7CIIa+C1x/2AMNOyjn9IVz476/onA==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr3331056wma.158.1599654479560; 
 Wed, 09 Sep 2020 05:27:59 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id l19sm3726548wmi.8.2020.09.09.05.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 05:27:58 -0700 (PDT)
Subject: Re: [PATCH 1/5] iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable
 shareability on ARM LPAE
To: Steven Price <steven.price@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-2-narmstrong@baylibre.com>
 <f8ec460a-d61f-852d-2620-a49306bb1de4@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <b6886f02-d2a0-22cc-8419-e964656e4967@baylibre.com>
Date: Wed, 9 Sep 2020 14:27:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8ec460a-d61f-852d-2620-a49306bb1de4@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_082801_125142_0D700C0B 
X-CRM114-Status: GOOD (  19.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDkvMDkvMjAyMCAxNDoyMywgU3RldmVuIFByaWNlIHdyb3RlOgo+IFN1YmplY3Q6IHMvQlJP
S0VOX05TL0JST0tFTl9TSC8KClRoYW5rcywKTmVpbAoKPiAKPiBTdGV2ZQo+IAo+IE9uIDA4LzA5
LzIwMjAgMTY6MTgsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBUaGUgY29oZXJlbmN5IGludGVn
cmF0aW9uIG9mIHRoZSBJT01NVSBpbiB0aGUgTWFsaS1HNTIgZm91bmQgaW4gdGhlIEFtbG9naWMg
RzEyQiBTb0NzCj4+IGlzIGJyb2tlbiBhbmQgbGVhZHMgdG8gY29uc3RhbnQgYW5kIHJhbmRvbSBm
YXVsdHMgZnJvbSB0aGUgSU9NTVUuCj4+Cj4+IERpc2FibGluZyBzaGFyZWFiaWxpdHkgY29tcGxl
dGVseSBmaXhlcyB0aGUgaXNzdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaW9tbXUvaW8t
cGd0YWJsZS1hcm0uYyB8IDcgKysrKy0tLQo+PiDCoCBpbmNsdWRlL2xpbnV4L2lvLXBndGFibGUu
aMKgwqDCoMKgIHwgNCArKysrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pby1wZ3Rh
YmxlLWFybS5jIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+IGluZGV4IGRjN2Jj
Zjg1OGI2ZC4uZDJkNDhkYzg2NTU2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvLXBn
dGFibGUtYXJtLmMKPj4gKysrIGIvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+IEBA
IC00NDAsNyArNDQwLDkgQEAgc3RhdGljIGFybV9scGFlX2lvcHRlIGFybV9scGFlX3Byb3RfdG9f
cHRlKHN0cnVjdCBhcm1fbHBhZV9pb19wZ3RhYmxlICpkYXRhLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDw8IEFSTV9MUEFFX1BURV9BVFRSSU5EWF9TSElGVCk7Cj4+IMKg
wqDCoMKgwqAgfQo+PiDCoCAtwqDCoMKgIGlmIChwcm90ICYgSU9NTVVfQ0FDSEUpCj4+ICvCoMKg
wqAgaWYgKGRhdGEtPmlvcC5jZmcucXVpcmtzICYgSU9fUEdUQUJMRV9RVUlSS19BUk1fQlJPS0VO
X1NIKQo+PiArwqDCoMKgwqDCoMKgwqAgcHRlIHw9IEFSTV9MUEFFX1BURV9TSF9OUzsKPj4gK8Kg
wqDCoCBlbHNlIGlmIChwcm90ICYgSU9NTVVfQ0FDSEUpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBw
dGUgfD0gQVJNX0xQQUVfUFRFX1NIX0lTOwo+PiDCoMKgwqDCoMKgIGVsc2UKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHB0ZSB8PSBBUk1fTFBBRV9QVEVfU0hfT1M7Cj4+IEBAIC0xMDA1LDggKzEwMDcs
NyBAQCBhcm1fbWFsaV9scGFlX2FsbG9jX3BndGFibGUoc3RydWN0IGlvX3BndGFibGVfY2ZnICpj
ZmcsIHZvaWQgKmNvb2tpZSkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhcm1fbHBhZV9p
b19wZ3RhYmxlICpkYXRhOwo+PiDCoCAtwqDCoMKgIC8qIE5vIHF1aXJrcyBmb3IgTWFsaSAoaG9w
ZWZ1bGx5KSAqLwo+PiAtwqDCoMKgIGlmIChjZmctPnF1aXJrcykKPj4gK8KgwqDCoCBpZiAoY2Zn
LT5xdWlya3MgJiB+KElPX1BHVEFCTEVfUVVJUktfQVJNX0JST0tFTl9TSCkpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4gwqAgwqDCoMKgwqDCoCBpZiAoY2ZnLT5pYXMgPiA0
OCB8fCBjZmctPm9hcyA+IDQwKQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pby1wZ3Rh
YmxlLmggYi9pbmNsdWRlL2xpbnV4L2lvLXBndGFibGUuaAo+PiBpbmRleCAyMzI4NWJhNjQ1ZGIu
LmVmYjljOGYyMDkwOSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9pby1wZ3RhYmxlLmgK
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9pby1wZ3RhYmxlLmgKPj4gQEAgLTg2LDYgKzg2LDkgQEAg
c3RydWN0IGlvX3BndGFibGVfY2ZnIHsKPj4gwqDCoMKgwqDCoMKgICoKPj4gwqDCoMKgwqDCoMKg
ICogSU9fUEdUQUJMRV9RVUlSS19BUk1fVFRCUjE6IChBUk0gTFBBRSBmb3JtYXQpIENvbmZpZ3Vy
ZSB0aGUgdGFibGUKPj4gwqDCoMKgwqDCoMKgICrCoMKgwqAgZm9yIHVzZSBpbiB0aGUgdXBwZXIg
aGFsZiBvZiBhIHNwbGl0IGFkZHJlc3Mgc3BhY2UuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDC
oCAqIElPX1BHVEFCTEVfUVVJUktfQVJNX0JST0tFTl9TSDogKEFSTSBMUEFFIGZvcm1hdCkgRGlz
YWJsZXMgc2hhcmVhYmlsaXR5Cj4+ICvCoMKgwqDCoCAqwqDCoMKgIHdoZW4gY29oZXJlbmN5IGlu
dGVncmF0aW9uIGlzIGJyb2tlbi4KPj4gwqDCoMKgwqDCoMKgICovCj4+IMKgwqDCoMKgwqAgI2Rl
ZmluZSBJT19QR1RBQkxFX1FVSVJLX0FSTV9OU8KgwqDCoMKgwqDCoMKgIEJJVCgwKQo+PiDCoMKg
wqDCoMKgICNkZWZpbmUgSU9fUEdUQUJMRV9RVUlSS19OT19QRVJNU8KgwqDCoCBCSVQoMSkKPj4g
QEAgLTkzLDYgKzk2LDcgQEAgc3RydWN0IGlvX3BndGFibGVfY2ZnIHsKPj4gwqDCoMKgwqDCoCAj
ZGVmaW5lIElPX1BHVEFCTEVfUVVJUktfQVJNX01US19FWFTCoMKgwqAgQklUKDMpCj4+IMKgwqDC
oMKgwqAgI2RlZmluZSBJT19QR1RBQkxFX1FVSVJLX05PTl9TVFJJQ1TCoMKgwqAgQklUKDQpCj4+
IMKgwqDCoMKgwqAgI2RlZmluZSBJT19QR1RBQkxFX1FVSVJLX0FSTV9UVEJSMcKgwqDCoCBCSVQo
NSkKPj4gK8KgwqDCoCAjZGVmaW5lIElPX1BHVEFCTEVfUVVJUktfQVJNX0JST0tFTl9TSMKgwqDC
oCBCSVQoNikKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBxdWlya3M7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZ8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGdzaXplX2JpdG1hcDsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlhczsKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
