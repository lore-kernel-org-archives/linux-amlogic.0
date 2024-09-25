Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7852CCF9EC
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wpv3kutrdBECPA1IH8vt3bbG6gyqZaLaG8tRxTC9ED4=; b=49PHvKzlnu1X9g
	1hHewWFuuAizglto+kfJvDZaXgV6kT3hPuDzFQWtSYI0wBzoE90bY4t/8unU/4JDpAG9du0MKTDep
	Riez1g+Doyzhv6bykQ3L+W0jdCV3BVZfuTsUeFnl4cZRy6HyC6a26dxU9ZOuUatOzlNurv0QMmn7E
	ss50BHxpG6ugfaz5UpSbUOmV03hocatSK/hHSkXiyWA+K6yssLM+Cq8L6ZlInA+Y1lCslNZQ+3Pdg
	Kgk6+DI4HeQhpn8+dzMx8ce0iMNVfVjrvB1RErt28DgQ9nm3AVyFoJFvXTegREtZ2wCQu8F20qDGj
	sztk4wipIgbk8BikpnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stXjV-00000006P7w-0ezh;
	Wed, 25 Sep 2024 19:31:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stXjS-00000006P7V-3Atb;
	Wed, 25 Sep 2024 19:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 071EB5C5BB6;
	Wed, 25 Sep 2024 19:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D22C4CEC3;
	Wed, 25 Sep 2024 19:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727292685;
	bh=Zw8NRhd8Kj3Wp7zD5zXcK8TNN/qjT42LyVLnuxRSETM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezqRXrmU476GNOoLcrgM5RmFHqTyDDa+JjHTgd+rnzSaSaodmLwLUupuu5qN2f+kQ
	 A0a0UU6+j/IlWSswt9juu7QfXKuz5e92fbmjgdFg1YbJMKOiF3FlFxCnglq0cCI2O/
	 f8Y5Ya6z+Wgb6AsdjNMkX3YiLqQkNJBDPD1qfOYYvC+UEiXVv+w8weBsiB7hYQsX6Z
	 7NNMOXVaQWHDu3lVk3sYSvlScK+KuVTrsZjQIPFXmBPS/Qz1pSKYDrs/bn4UhX10zk
	 AWyTVKhe2+MUqe28uCNyeiZc3U+JtlmZ8j3hoJbxz3ZrVb8R/L1XI/DFQq7cwx8Frb
	 blf1qBViyo9QA==
Message-ID: <a3777c1f-b01d-41eb-acd3-61b0814668a2@kernel.org>
Date: Wed, 25 Sep 2024 21:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: mmc: convert
 amlogic,meson-mx-sdio.txt to dtschema
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-3-5aa8bdfe01af@linaro.org>
 <mbc2cacow73vmwn3w42aucq6x6xijbpgustkv3v6etgv35xih7@truf2rbgf3vo>
 <CAFBinCDu0P8QEvxrUdXXSVCn-1061fjyhYd2nve9QCCvXmoe5Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAFBinCDu0P8QEvxrUdXXSVCn-1061fjyhYd2nve9QCCvXmoe5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_123126_954807_1AC40520 
X-CRM114-Status: GOOD (  17.16  )
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

T24gMjUvMDkvMjAyNCAxOToyOSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBLcnp5
c3p0b2YsCj4gCj4gT24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMTE6MTjigK9BTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFsuLi5dCj4+PiArICAgICAgICBl
bnVtOiBbMCwgMSwgMl0KPj4+ICsKPj4+ICsgICAgICBidXMtd2lkdGg6Cj4+PiArICAgICAgICBl
bnVtOiBbMSwgNF0KPj4+ICsKPj4+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+
Pgo+PiBIbSwgSSB3b25kZXIgd2h5IG5vdCBhbGwgc2xvdHMgYXJlIGRlZmluZWQgaW4geW91ciBE
VFM/IFdoeSBub3QgYWxsIG9mCj4+IHRoZW0gYXJlIHJlcXVpcmVkPyBJIGFzc3VtZSB0aGUgc2xv
dHMgYXJlIHRoZXJlIGFsd2F5cywgYXMgcGFydCBvZiB0aGUKPj4gY29udHJvbGxlci4KPj4KPj4g
SXMgdGhpcyBiZWNhdXNlIG9mIGRyaXZlciBsaW1pdGF0aW9uIG1lbnRpb25lZCBpbiB0aGUgb2xk
IGJpbmRpbmc/Cj4gVGhlIE1NQyBjb3JlIChzdGlsbCkgaGFzIGEgbGltaXRhdGlvbiBvZiBvbmx5
IHN1cHBvcnRpbmcgb25lIHNsb3QgcGVyCj4gY29udHJvbGxlciAtIHNvIGEgbGltaXRhdGlvbiB3
aWxsIHN0YXkgaW4gcGxhY2UuCj4gCj4gSG93ZXZlciwgdGhlIGRyaXZlciAoZHJpdmVycy9tbWMv
aG9zdC9tZXNvbi1teC1zZGlvLmMpIHVzZXMKPiBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZCgpLCBt
ZWFuaW5nIGl0IHdpbGwgYWxzbyBwaWNrIHRoZSBmaXJzdCBjaGlsZAo+IG5vZGUgd2l0aCB0aGUg
Y29ycmVjdCBjb21wYXRpYmxlIHN0cmluZywgZXZlbiBpZiBpdCBoYXMgc3RhdHVzID0KPiAiZGlz
YWJsZWQiLgo+IEkgY2FuIHNlbmQgYSBwYXRjaCB0byByZWR1Y2UgdGhlIHNjb3BlIG9mIHRoaXMg
bGltaXRhdGlvbjogYWxsIHNsb3RzCj4gY2FuIGJlIGRlZmluZWQgYnV0IG9ubHkgdGhlIGZpcnN0
IGVuYWJsZWQgb25lIGlzIHVzZWQuCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpGb3IgdGhlIGNvbnZl
cnNpb24gaXQgY2FuIHN0YXkgYXMgaXMuIEZvbGxvdy11cCBwYXRjaGVzIGFsbG93aW5nCm11bHRp
cGxlIHNsb3RzLCBhZGRpbmcgdGhlbSBpbiBEVEMgZXRjLiBhcmUgbmljZSwgYnV0IG5vdCBuZWNl
c3NhcnkgaGVyZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
