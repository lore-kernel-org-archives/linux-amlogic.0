Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20893C982CD
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oilmlczyFGxgv2EXMVjZe1UXnawvPO7SreGrzCqB+zg=; b=uw26X6SAPOYDpO
	yduUVFv287x5ZTDLWoPa8Mp/uqJkKYIW0OzfI4zu7oxWPL9F4TkDXTGAXcpiJjthYBFtKdf1BHp3j
	KcYnJHzHtlS4cvAfVPN/98EtFxwS22zFFCSE3fxNnXPgXVMldsaChdIcWBilZuNiPcs6Z4Wd34v+K
	XI+JZXw+ZQeKYcGAq7YkSaT5FKqoEr7jB+4gGf/skRHV0NFinWQHwduTRLIAmJaHIjwXLt9RZfLjt
	O2Mj/u/Wiw/B416v62ycMhwLS6GTMqjC3xN1OEjlz18OoXr1a5b1GzRjo21s3qTzRRntYAOc+JANj
	QK2t2AFnZUYDDhPI5/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75Cy-0000000AdmJ-2WgO;
	Thu, 17 Sep 2026 06:02:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75Cw-0000000Adm7-2iYo;
	Thu, 17 Sep 2026 06:02:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98CBC60A54;
	Thu, 17 Sep 2026 06:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BB91F000FF;
	Thu, 17 Sep 2026 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789624973;
	bh=7bSiMSCEzJHVGbF2y5IbvpKJPc+IlGdFpPiZbAoOXa8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=g5q4ADcsvZP0IaR+4h0/O4Bnwpuza5aJe2t59YQy47ERg6k2tOsWYvodfwRTexJsS
	 gOAv63NAZfokKAlSgvb20h6aQTFer1aglYrF0Zd4mySk8m9nzgaL4LtgKBNlO1JUpf
	 EPf/GZur54xNXCMqCA2KX7kpXEIBGila6bdF7F2dwBKOfVyoQp8OF+0QNfZ0xV6vo8
	 ZZw3A8eve50hwOQPzF0Yszt7N2OHsvyAAhBax/YKhUfrzG/7b5OPLlUkpcy88XR5U3
	 9W2aYr5x4a6CEoLVXxQszIhb665HhO0Pg9+TD+iHIHL/MUsuo0XI75RIYE4IcvlDPI
	 f0nREJc/XgUOw==
Message-ID: <05189f26-1d24-47a7-abef-ea4c25d2964f@kernel.org>
Date: Thu, 17 Sep 2026 08:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
 <20260916-fat-enthusiastic-termite-44b2e2@quoll>
 <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
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

T24gMTcvMDkvMjAyNiAwNTowNywgWmhlbnRhbyBHdW8gd3JvdGU6Cj4gSGnCoEtyenlzenRvZiwK
PiAKPj4gT24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMDQ6MTA6MjBQTSArMDgwMCwgWmhlbnRhbyBH
dW8gd3JvdGU6Cj4+PiBEZXNjcmliZSB0aGUgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgVjRMMiBz
dGF0ZWxlc3MgdmlkZW8gZGVjb2Rlcgo+Pj4gZHJpdmVyIHVzZWQgd2l0aCB0aGUgQW1sb2dpYyBT
NCAoUzgwNVgyKSBwbGF0Zm9ybS4KPj4gRHJvcCBkcml2ZXIuIERlc2NyaWJlIHRoZSBoYXJkd2Fy
ZSBpbnN0ZWFkLgo+IE9L77yMZ290IGl0Lgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhlbnRhbyBHdW8g
PHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sIHwgMTE0ICsrKysrKysrKysrKysrKysr
KysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMs
czQtdmRlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2Ft
bG9naWMsczQtdmRlYy55YW1sCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5kMzUwYjNlNjhhMzgKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbAo+
Pj4gQEAgLTAsMCArMSwxMTQgQEAKPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+ICsjIENvcHlyaWdodCAoQykgMjAyNSBBbWxv
Z2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPj4+ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL2FtbG9naWMsczQtdmRl
Yy55YW1sIwo+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBBbWxvZ2ljIFZpZGVvIERlY29kZSBBY2NlbGVy
YXRvcgo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4gKyAgLSBaaGVudGFvIEd1byA8emhlbnRh
by5ndW9AYW1sb2dpYy5jb20+Cj4+PiArCj4+PiArZGVzY3JpcHRpb246Cj4+PiArICBUaGUgVmlk
ZW8gRGVjb2RlciBBY2NlbGVyYXRvciBwcmVzZW50IG9uIEFtbG9naWMgU09Dcy4KPj4+ICsgIEl0
IHN1cHBvcnRzIHN0YXRlbGVzcyBoMjY0IGRlY29kaW5nLgo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6
Cj4+PiArICBjb21wYXRpYmxlOgo+Pj4gKyAgICBjb25zdDogYW1sb2dpYyxzNC12ZGVjCj4+PiAr
Cj4+PiArICByZWc6Cj4+PiArICAgIG1heEl0ZW1zOiAyCj4+PiArCj4+PiArICByZWctbmFtZXM6
Cj4+PiArICAgIGl0ZW1zOgo+Pj4gKyAgICAgIC0gY29uc3Q6IGRvcwo+Pj4gKyAgICAgIC0gY29u
c3Q6IGRtYwo+Pj4gKwo+Pj4gKyAgaW50ZXJydXB0czoKPj4+ICsgICAgbWF4SXRlbXM6IDIKPj4+
ICsKPj4+ICsgIGludGVycnVwdC1uYW1lczoKPj4+ICsgICAgaXRlbXM6Cj4+PiArICAgICAgLSBj
b25zdDogY29yZV9odmRlYwo+Pj4gKyAgICAgIC0gY29uc3Q6IGNvcmVfdmRlYwo+PiBEcm9wICJj
b3JlXyIgZnJvbSBib3RoLi4uIG9yIHJhdGhlciBzb21lIGNvbnNpc3RlbmN5IHdvdWxkIGJlIG1v
cmUKPj4gdXNlZnVsLiBCZWxvdyB5b3UgY2FsbCB0aGVtIGNvcmVfdiBhbmQgY29yZV9oLCBidXQg
dGhlcmUgaXMgYWxzbzoKPj4KPj4+ICsKPj4+ICsgIGNsb2NrczoKPj4+ICsgICAgaXRlbXM6Cj4+
PiArICAgICAgLSBkZXNjcmlwdGlvbjogQ2xvY2sgZm9yIGRvcyBjb3JlCj4+IGNvcmUgZG9zPwo+
IAo+IFRvIGV4cGxhaW4gdGhpcywgSSB3b3VsZCBsaWtlIHRvIHNob3cgeW91IHRoZSBzdHJ1Y3R1
cmUgZGlhZ3JhbSBvZiB0aGUgCj4gQW1sb2dpYyBoYXJkd2FyZSBkZWNvZGVyIElQOgo+IAo+ICst
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gfMKgwqDCoMKgwqAgICAgICB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfAo+IHzCoMKg
wqDCoMKgICAgICAgfMKgwqDCoMKgwqDCoMKgwqB2ZGVjwqDCoCAgICAgICAgICB8Cj4gfMKgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gfMKgwqDCoMKgZG9zICDCoCArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+IHwgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICB8Cj4gfMKgwqDCoMKgICAgICDCoCB8wqDCoMKgwqDCoMKgICBodmRlY8KgwqDCoMKgwqDC
oMKgwqDCoMKgIHwKPiB8ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfAo+ICst
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCj4gCj4gVGhlIElQIGNvbnNpc3Rz
IG9mIHRocmVlIGNvcmVzLiBEb3MgY29yZSBpcyBpbiB0aGUgZnJvbnQgb2YgdGhlIElQLCAKPiB3
aGljaCBjb250cm9scyB0aGUgcmVzdCB0d28gY29yZXMuIFRoZSBhY3R1YWwgaGFyZHdhcmUgZGVj
b2RpbmcgaXMgCj4gaGFuZGxlZCBieSB0aGUgdHdvIGNvcmVzIHZkZWMgYW5kIGh2ZGVjLgo+IAo+
IEVhY2ggb2YgdGhlIHRocmVlIGNvcmVzIGhhcyBpdHMgb3duIGluZGVwZW5kZW50IGNsb2NrIHNv
dXJjZS4KClNvIGV2ZXJ5dGhpbmcgY291bGQgYmUgY2FsbGVkIGNvbnNpc3RlbnRseSAiZG9zIiwg
InZkZWMiIGFuZCAiaHZkZWMiIGluCmFsbCBwcm9wZXJ0aWVzIChjbG9ja3MsIGludGVycnVwdHMg
ZXRDKS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
