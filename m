Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C7DC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Apr 2022 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbZIU37kQ8UeN7tC5Q1h0i+eIldrLjVTvLVWTOd7LU0=; b=deg4J3sAJNDVMA
	6FjX9XR4o5Gua1b0A6B38y3nlJ3Dl5gDdzqRh/S4fE7iJHzVoovYEbNSbMSWGLE0vmKE/xI9Ed6Vp
	0m4dBKCx1eELmBmcJ/OO+5FehNWbzADNsknqgMmllLLc3vlaUfA+X9/GYFNESZkE74LHvmBZb9EpC
	fzDSBKhg10OPRgDokNRiAf1F5fKhgghMEiKJp2KWUQTxUVGpF/ak1o0sXXfPkbOg4O1PgV64BCsGA
	6c41U1lyrkF/rYm+GPTwVgqHEnnRumxlFYBSrGuaRkEkkFQcAyxZWlCGqg3m57ko5v75vwma9AWmO
	AGQzkN3RUUBSMrDWkBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhDAr-009gfu-1K; Wed, 20 Apr 2022 16:27:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhDAe-009gc7-3Z; Wed, 20 Apr 2022 16:27:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so4061714wmb.4; 
 Wed, 20 Apr 2022 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=YuoLu4qqTNwUsnLh7FVwMbSxnFqCd0u7cHyaNxa6tZ8=;
 b=VeajzzdqMwBU20EgOqUCmqUjlkWSfHCU+wgHjLjfPn4Ofqc5b3sxbLfrLEIKRwOsie
 TAKz3t8iV8ElPRIAHLJFUz6fvOOz11/hIyw/mKX2BbbWVtzhqmZrG2I7SEMD8xeF9AJC
 0vTNh33go4ByJi0GzeVyF8p/07od1enKvKjR4gOzMzwF4j10+aj3CjR6DwAmJirImxrr
 lccnoby7O4Z7lmzm8Z08g8bbLfJLxfprfN8ifUmbSZNjTtOMsG7Hgo1axWwva161oxvu
 O3QTEkpQpWac4aBMpYbmBZdkphmV4Jy7Tc9PEDYm+lX5GC5FZ8lzxZ2G0u6fAluvXGPF
 TAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=YuoLu4qqTNwUsnLh7FVwMbSxnFqCd0u7cHyaNxa6tZ8=;
 b=v+6MDSBP40k6LFyBGIQ57ZKygpX25JqwPyadWCe+Ly6+YYtGl5M8m5vcr3MFt74QSJ
 MvpLzajEVAjIC60pDnAdrfRYAw1+6l7RSBY8G0HX+qJAnMv8uArAkc6Bs2ITNJi0kyZX
 qc2kTNXBvjr5KawERjvIg6wR/Zw/g5rjSyn+fE5/HwkXU4SEvqfjuld8EJDeXCqzXAg5
 s/XSwxbcGv/hfdZMvjRlZt0KpJ4hhgUXshWLVSZ393KwALAKMZ2bzu1MHMMyAL/CH5oF
 Qso+OTNYiK8sFO0fo7T/34ZPEGd2CRqW6nEaJAm8ZtUY4OmFQ90XcOuGhA3d4TubGZVM
 vvHg==
X-Gm-Message-State: AOAM532n0huqDMMiV7PoFcDZQgv/N7uV+z9jYfSZFbHf32oISARfrI9K
 UBZm9Z/XgWccyKiWSA4G0OY=
X-Google-Smtp-Source: ABdhPJyu8kZNJZukKtBcSgYEM/L2bR1iN6NWspjlmcOCdNPXn2wqr27FWAbxq+y6xw13D7eS1Oiy3w==
X-Received: by 2002:a05:600c:3d06:b0:38e:d74d:ac4c with SMTP id
 bh6-20020a05600c3d0600b0038ed74dac4cmr4616638wmb.42.1650472029040; 
 Wed, 20 Apr 2022 09:27:09 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c184:a600:e563:f5ff:504a:6c0d?
 (dynamic-2a01-0c23-c184-a600-e563-f5ff-504a-6c0d.c23.pool.telefonica.de.
 [2a01:c23:c184:a600:e563:f5ff:504a:6c0d])
 by smtp.googlemail.com with ESMTPSA id
 m8-20020a056000008800b00207b3fa7fc0sm255073wrx.108.2022.04.20.09.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 09:27:08 -0700 (PDT)
Message-ID: <378325a3-0b2b-149f-c336-54f0e63f4134@gmail.com>
Date: Wed, 20 Apr 2022 18:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
 <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
 <9e2fc38a-a51e-7635-970c-64948fc6eae4@kernel.org>
 <80937566-6455-b1bf-0a5d-a7b54dd3adc5@gmail.com>
 <5fde764f-4caf-8017-3cbd-3918f3390b6a@gmail.com>
 <586f6f11-fb29-7f76-200a-d73a653f9889@arm.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
In-Reply-To: <586f6f11-fb29-7f76-200a-d73a653f9889@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_092712_209039_F73C48DE 
X-CRM114-Status: GOOD (  24.15  )
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

T24gMjAuMDQuMjAyMiAwMTowNCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjItMDMtMzAg
MDY6NTQsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4gT24gMjMuMDMuMjAyMiAyMTozMywgSGVp
bmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4gT24gMjEuMDMuMjAyMiAwOTozNCwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPj4+PiBPbiAxOC8wMy8yMDIyIDIxOjUwLCBSb2JpbiBNdXJwaHkgd3Jv
dGU6Cj4+Pj4+IE9uIDIwMjItMDItMjUgMjE6MTMsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4+
Pj4+IEFkZCBhIFlBTUwgc2NoZW1hIGJpbmRpbmcgZm9yIFRNMTYyOCBhdXhkaXNwbGF5Cj4+Pj4+
PiAoNy8xMS1zZWdtZW50IExFRCkgY29udHJvbGxlci4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIHBhdGNo
IGlzIHBhcnRpYWxseSBiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGZyb20KPj4+Pj4+IEFuZHJlYXMg
RsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4uCj4+Pj4+Pgo+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5
OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+
PiB2NToKPj4+Pj4+IC0gYWRkIHZlbmRvciBwcmVmaXggdG8gZHJpdmVyLXNwZWNpZmljIHByb3Bl
cnRpZXMKPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoCAuLi4vYmluZGluZ3MvYXV4ZGlzcGxheS90aXRh
bm1lYyx0bTE2MjgueWFtbMKgIHwgOTIgKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gwqDCoCAx
IGZpbGUgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4gwqDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5t
ZWMsdG0xNjI4LnlhbWwKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2Mjgu
eWFtbAo+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4+IGluZGV4IDAwMDAwMDAwMC4u
MmExZWY2OTJjCj4+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+Pj4+
Pj4gQEAgLTAsMCArMSw5MiBAQAo+Pj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9yLWxhdGVyIE9SIEJTRC0yLUNsYXVzZSkKPj4+Pj4+ICslWUFNTCAxLjIKPj4+Pj4+
ICstLS0KPj4+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2F1eGRpc3Bs
YXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwjCj4+Pj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4+PiArCj4+Pj4+PiArdGl0bGU6IFRp
dGFuIE1pY3JvIEVsZWN0cm9uaWNzIFRNMTYyOCBMRUQgY29udHJvbGxlcgo+Pj4+Pj4gKwo+Pj4+
Pj4gK21haW50YWluZXJzOgo+Pj4+Pj4gK8KgIC0gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBz
dXNlLmRlPgo+Pj4+Pj4gK8KgIC0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNv
bT4KPj4+Pj4+ICsKPj4+Pj4+ICthbGxPZjoKPj4+Pj4+ICvCoCAtICRyZWY6IC9zY2hlbWFzL3Nw
aS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sIwo+Pj4+Pj4gKwo+Pj4+Pj4gK3Byb3BlcnRpZXM6
Cj4+Pj4+PiArwqAgY29tcGF0aWJsZToKPj4+Pj4+ICvCoMKgwqAgY29uc3Q6IHRpdGFubWVjLHRt
MTYyOAo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgIHJlZzoKPj4+Pj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEK
Pj4+Pj4+ICsKPj4+Pj4+ICvCoCB0aXRhbm1lYyxncmlkOgo+Pj4+Pj4gK8KgwqDCoCBkZXNjcmlw
dGlvbjoKPj4+Pj4+ICvCoMKgwqDCoMKgIE1hcHBpbmcgb2YgZGlzcGxheSBkaWdpdCBwb3NpdGlv
biB0byBncmlkIG51bWJlci4KPj4+Pj4+ICvCoMKgwqDCoMKgIFRoaXMgaW1wbGljaXRseSBkZWZp
bmVzIHRoZSBkaXNwbGF5IHNpemUuCj4+Pj4+PiArwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQ4LWFycmF5Cj4+Pj4+PiArwqDCoMKgIG1pbkl0ZW1zOiAx
Cj4+Pj4+PiArwqDCoMKgIG1heEl0ZW1zOiA3Cj4+Pj4+PiArCj4+Pj4+PiArwqAgdGl0YW5tZWMs
c2VnbWVudC1tYXBwaW5nOgo+Pj4+Pj4gK8KgwqDCoCBkZXNjcmlwdGlvbjoKPj4+Pj4+ICvCoMKg
wqDCoMKgIE1hcHBpbmcgb2YgNyBzZWdtZW50IGRpc3BsYXkgc2VnbWVudHMgQS1HIHRvIGJpdCBu
dW1iZXJzIDEtMTIuCj4+Pj4+PiArwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQ4LWFycmF5Cj4+Pj4+PiArwqDCoMKgIG1pbkl0ZW1zOiA3Cj4+Pj4+PiAr
wqDCoMKgIG1heEl0ZW1zOiA3Cj4+Pj4+PiArCj4+Pj4+PiArwqAgIiNhZGRyZXNzLWNlbGxzIjoK
Pj4+Pj4+ICvCoMKgwqAgY29uc3Q6IDIKPj4+Pj4+ICsKPj4+Pj4+ICvCoCAiI3NpemUtY2VsbHMi
Ogo+Pj4+Pj4gK8KgwqDCoCBjb25zdDogMAo+Pj4+Pj4gKwo+Pj4+Pj4gK3JlcXVpcmVkOgo+Pj4+
Pj4gK8KgIC0gY29tcGF0aWJsZQo+Pj4+Pj4gK8KgIC0gcmVnCj4+Pj4+Cj4+Pj4+IFdvdWxkIGl0
IGJlIGZhaXIgdG8gc2F5IHRoYXQgInNwaS1sc2ItZmlyc3QiIGFuZCAic3BpLTN3aXJlIiBhcmUg
YWxzbwo+Pj4+PiByZXF1aXJlZD8gVGhlIGNoaXBzIGFyZW4ndCBjb25maWd1cmFibGUgc28gd29u
J3QgZXhhY3RseSBiZSB1c2FibGUgYW55Cj4+Pj4+IG90aGVyIHdheS4gRnVydGhlcm1vcmUgSSBi
ZWxpZXZlIHRoZSB0cmFuc21pc3Npb24gZm9ybWF0IGFjdHVhbGx5IHdvcmtzCj4+Pj4+IG91dCBl
cXVpdmFsZW50IHRvIFNQSSBtb2RlIDMsIHNvIHNob3VsZCB3YXJyYW50ICJzcGktY3BoYSIgYW5k
Cj4+Pj4+ICJzcGktY3BvbCIgYXMgd2VsbC4KPj4+Pj4KPj4+Pj4+ICsKPj4+Pj4+ICtwYXR0ZXJu
UHJvcGVydGllczoKPj4+Pj4+ICvCoCAiXi4qQFsxLTddLChbMS05XXwxWzAtNl0pJCI6Cj4+Pj4+
PiArwqDCoMKgIHR5cGU6IG9iamVjdAo+Pj4+Pj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9sZWRz
L2NvbW1vbi55YW1sIwo+Pj4+Pj4gK8KgwqDCoCB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNl
Cj4+Pj4+PiArwqDCoMKgIGRlc2NyaXB0aW9uOiB8Cj4+Pj4+PiArwqDCoMKgwqDCoCBQcm9wZXJ0
aWVzIGZvciBhIHNpbmdsZSBMRUQuCj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIHByb3BlcnRpZXM6
Cj4+Pj4+PiArwqDCoMKgwqDCoCByZWc6Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRp
b246IHwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgMS1iYXNlZCBncmlkIG51bWJlciwgZm9s
bG93ZWQgYnkgMS1iYXNlZCBzZWdtZW50IGJpdCBudW1iZXIuCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgbWF4SXRlbXM6IDEKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgcmVxdWlyZWQ6Cj4+Pj4+PiAr
wqDCoMKgwqDCoCAtIHJlZwo+Pj4+Pgo+Pj4+PiBJJ20gY29uY2VybmVkIHRoYXQgdGhpcyBsZWF2
ZXMgdXMgbm8gcm9vbSB0byBzdXBwb3J0IHRoZSBhZGRpdGlvbmFsCj4+Pj4+IGtleXBhZCBmdW5j
dGlvbmFsaXR5IGluIGZ1dHVyZS4gSGF2aW5nIG5vdyBkb3VibGUtY2hlY2tlZCBhIGRhdGFzaGVl
dCwKPj4+Pj4gdGhlIGlucHV0cyBhcmUgYWxzbyBhIHR3by1kaW1lbnNpb25hbCBtdXggKHNoYXJp
bmcgdGhlIHNlZ21lbnQgbGluZXMpLAo+Pj4+PiBzbyB0aGUgZGV2aWNlIGVmZmVjdGl2ZWx5IGhh
cyB0d28gZGlzdGluY3QgYnV0IG51bWVyaWNhbGx5LW92ZXJsYXBwaW5nCj4+Pj4+IGNoaWxkIGFk
ZHJlc3Mgc3BhY2VzIC0gb25lIGFkZHJlc3NlZCBieSAoZ3JpZCxzZWdtZW50KSBhbmQgdGhlIG90
aGVyIGJ5Cj4+Pj4+IChzZWdtZW50LGtleSkuCj4+Pj4+Cj4+Pj4+IFJvYiwgS3J5c3p0b2YsIGFu
eSB0aG91Z2h0cyBvbiB0aGUgYmVzdCBEVCBpZGlvbSB0byBsZWF2ZSBhY2NvbW1vZGF0aW9uCj4+
Pj4+IGZvciB0aGF0PyBJJ20gdGhpbmtpbmcgZWl0aGVyIHJlcXVpcmUgYW4gaW50ZXJtZWRpYXRl
IG5vZGUgdG8gY29udGFpbgo+Pj4+PiBlYWNoIG5vdGlvbmFsIGFkZHJlc3Mgc3BhY2UsIG9yIHBl
cmhhcHMgYWRkIGFub3RoZXIgbGVhZGluZyBhZGRyZXNzIGNlbGwKPj4+Pj4gdG8gc2VsZWN0IGJl
dHdlZW4gdGhlbT8gSSBkb24ndCBiZWxpZXZlIGFueSBvZiB0aGVzZSB0aGluZ3MgaGF2ZSBmdXJ0
aGVyCj4+Pj4+IGZ1bmN0aW9uYWxpdHkgYmV5b25kIHRoYXQuCj4+Pj4KPj4+PiBJIHRoaW5rIGlu
dGVybWVkaWF0ZSBub2RlcyAtIGxlZHMsIGtleXMgLSBhcmUgbW9yZSBhcHByb3ByaWF0ZSwgYmVj
YXVzZQo+Pj4+IGl0IGlzIHNlbGYtZGVzY3JpYmluZy4gQWRkaXRpb25hbCBhZGRyZXNzIHNwYWNl
IG51bWJlciB3b3VsZCByZXF1aXJlCj4+Pj4gZGVjb2RpbmcgdGhpcyAiMCIgb3IgIjEiIGludG8g
TEVEL2tleS4gRm9yIGNvbXBsZXggZGV2aWNlcyAtIGxpa2UgUE1JQ3MKPj4+PiB3aXRoIHJlZ3Vs
YXRvcnMsIFJUQyBhbmQgY2xvY2tzIC0gd2UgYWxyZWFkeSBoYXZlIHN1Y2ggcGF0dGVybnMuCj4+
Pj4KPj4+IFRoZW4gaXQncyBqdXN0IHRoZSBxdWVzdGlvbiB3aG8gY2FuIGltcGxlbWVudCBzdWNo
IGFuIGludGVybWVkaWF0ZSBub2RlCj4+PiBiYXNlZCBvbiB3aGF0IGhhcyBiZWVuIGRvbmUgc28g
ZmFyLgo+Pj4KPj4gQXMgaXQgaXMgbm93IGl0IHNlZW1zIHdlIGVuZCB1cCB3aXRoIGVtcHR5IGhh
bmRzIGFnYWluIGFuZCBoYXZlIHRvIHdhaXQKPj4gZnVydGhlciB0d28geWVhcnMgZm9yIHRoZSBu
ZXh0IG9uZSB0byBtYWtlIGFuIGF0dGVtcHQuCj4+IFRoYXQncyBhIHBpdHkgYmVjYXVzZSBmb3Ig
bW9zdCB1c2VycyB0aGUgcmVsZXZhbnQgdXNlIGNhc2VzIGFyZSBzdXBwb3J0ZWQuCj4gCj4gT3Is
IHkna25vdywgd2UgY291bGQganVzdCByZWFjaCBhIHByb2R1Y3RpdmUgY29uY2x1c2lvbiByYXRo
ZXIgdGhhbiBkb29tLWFuZC1nbG9vbSBjYXRhc3Ryb3BoaXNpbmcuIEkgYXBvbG9naXNlIGZvciBu
b3QgaGF2aW5nIG11Y2ggdGltZSBmb3Igbm9uLXdvcmstcmVsYXRlZCBrZXJuZWwgaGFja2luZyBh
dCB0aGUgbW9tZW50LCBidXQgaXQgZGlkbid0IHNlZW0gcGFydGljdWxhcmx5IHVyZ2VudCB0byBm
b2xsb3cgdXAgb24gdGhpcyBpbiB0aGUgbWlkZGxlIG9mIGEgbWVyZ2Ugd2luZG93IGFueXdheS4g
SW4gdGhlIGNvdXJzZSBvZiBoZWxwZnVsbHkgYmVpbmcgbGVmdCB0byBhZGRyZXNzIG15IG93biBy
ZXZpZXcgZmVlZGJhY2ssIEkgZGlkIGV2ZW50dWFsbHkgZ2V0IHJvdW5kIHRvIGltcGxlbWVudGlu
ZyB0aGUgaW50ZXJtZWRpYXRlICJsZWRzIiBub2RlWzFdIGxhc3Qgd2Vla2VuZCwgYnV0IGhhdmlu
ZyBub3cgc3R1bWJsZWQgYWNyb3NzIHRoZSBtYXRyaXgta2V5bWFwIGhlbHBlcnMgYW5kIGNvbW1v
biAibGludXgsa2V5bWFwIiBwcm9wZXJ0eSwgSSdtIHBlcnNvbmFsbHkgaW5jbGluZWQgdG8gdGhp
bmsgdGhhdCB0aGF0J3MgZXZlbiBjbGVhbmVyIHRoYW4gYSAia2V5cyIgbm9kZSB3aXRoIGNoaWxk
cmVuIHRoYXQgd2UnZCBoYXZlIHRvIHdyaXRlIG1vcmUgcGFyc2luZyBjb2RlIGZvciwgYW5kIHRo
dXMgbWF5IHdlbGwgbWFrZSB0aGUgd2hvbGUgaW50ZXJtZWRpYXRlIG5vZGUgbm90aW9uIG1vb3Qg
YW55d2F5LiBJZiBvbmx5IGFueW9uZSBoYWQgcG9pbnRlZCBpdCBvdXQgc29vbmVyLi4uCj4gClRo
YW5rcyBmb3IgZm9sbG93aW5nIHVwIG9uIHRoZSByZWNlbnQgZGlzY3Vzc2lvbi4gR29vZCB0byBz
ZWUgdGhhdCB0aGUgcGFycm90CmlzIG5vdCBkZWFkIGJ1dCB3YXMganVzdCByZXN0aW5nLiBNeSBy
ZWFjdGlvbiB3YXMgYmFzZWQgb24gYSBudW1iZXIgb2YgZGlzY3Vzc2lvbnMgCkkgd2l0bmVzc2Vk
IHRoYXQgZW5kZWQgaW4gbm93aGVyZS4gT25lIGV4YW1wbGUgdGhhdCBjb21lcyB0byBteSBtaW5k
IGlzCkxFRCBzdWJzeXN0ZW0gc3VwcG9ydCBmb3IgbmV0d29yayBkZXZpY2VzIHdpdGggaGFyZHdh
cmUtdHJpZ2dlcmVkIExFRHMuCgo+IFRoYW5rcywKPiBSb2Jpbi4KCkhlaW5lciAKCj4gWzFdIGh0
dHBzOi8vZ2l0bGFiLmFybS5jb20vbGludXgtYXJtL2xpbnV4LXJtLy0vY29tbWl0cy90bTE2MjgK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
