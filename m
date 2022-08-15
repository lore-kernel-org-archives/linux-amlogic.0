Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F88C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0SZoWBGv7TbVbuJXkqv7qNPUbfztxg+JC+Rlb0hVyY=; b=CHgHImm+fJdJSl
	o3RgwA0DtVvcb8XCKkf9oCgChmiaxYbbvhxs63D/oHW+4jDFUBgFKqVOwnZnTh/YP8ne4meTLR8k4
	uCm3iHG3Q3pulMWHShzEDhyKRDk4lYJ0HwHa+rrdINnVNoAj97zMf/beWP1eCLwq381KDcZlUTkgy
	fV0azBHcZSRzNpc8YiG9IOCUeLZIw/2xK50OuoY7mpnpGZs2pPkmXFhLLrska8T5qOLRL2FFVj5c0
	wY46pJoprWenTwnqiOc5xqZ4RHRJ7LqK0oxZ/RFDBiuomKLW2v5ab/s3xcuPKQrdmkgZWmSf7Iynb
	bxyDKXw263om/rd3h42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNWHZ-00DlF4-LT; Mon, 15 Aug 2022 09:21:13 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNW1d-00DYtl-7k; Mon, 15 Aug 2022 09:04:50 +0000
Received: from [10.88.37.200] (10.88.37.200) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Mon, 15 Aug 2022
 17:04:28 +0800
Message-ID: <c57044ca-3742-37c1-b8ad-14806cbc05ea@amlogic.com>
Date: Mon, 15 Aug 2022 17:04:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 4/4] dt-binding: perf: Add Amlogic DDR PMU
Content-Language: en-US
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
 <20220805071426.2598818-4-jiucheng.xu@amlogic.com>
 <a3cd55ad-cec2-9570-2078-6724ab1d7300@linaro.org>
 <880842a1-a769-f228-7c91-5402e6d9391e@amlogic.com>
In-Reply-To: <880842a1-a769-f228-7c91-5402e6d9391e@amlogic.com>
X-Originating-IP: [10.88.37.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_020445_983353_D350E796 
X-CRM114-Status: GOOD (  13.06  )
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

Ck9uIDIwMjIvOC81IDE4OjAwLCBKaXVjaGVuZyBYdSB3cm90ZToKPgo+IE9uIDIwMjIvOC81IDE2
OjIxLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4K
Pj4gT24gMDUvMDgvMjAyMiAwOToxNCwgSml1Y2hlbmcgWHUgd3JvdGU6Cj4+PiBBZGQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgQW1sb2dpYyBHMTIgc2VyaWVzIEREUgo+Pj4gcGVyZm9y
bWFuY2UgbW9uaXRvciB1bml0Lgo+Pj4KPj4gQmluZGluZ3MgZ28gZmlyc3QgaW4gdGhlIHNlcmll
cywgYmVmb3JlIHRoZWlyIGltcGxlbWVudGF0aW9uLgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSml1
Y2hlbmcgWHUgPGppdWNoZW5nLnh1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIHYz
IC0+IHY0Ogo+Pj4gwqDCoCAtIEZpeCAiJGlkOiByZWxhdGl2ZSBwYXRoL2ZpbGVuYW1lIGRvZXNu
J3QgbWF0Y2ggYWN0dWFsIHBhdGggb3IKPj4+IMKgwqDCoMKgIGZpbGVuYW1lIiB3YXJuaW5nCj4+
Pgo+Pj4gQ2hhbmdlcyB2MiAtPiB2MzoKPj4+IMKgwqAgLSBSZW1vdmUgb25lT2YKPj4+IMKgwqAg
LSBBZGQgZGVzY3JpcHRpb25zCj4+PiDCoMKgIC0gRml4IGNvbXBpbGluZyB3YXJuaW5nCj4+Pgo+
Pj4gQ2hhbmdlcyB2MSAtPiB2MjoKPj4+IMKgwqAgLSBSZW5hbWUgZmlsZSwgZnJvbSBhbWxfZGRy
X3BtdS55YW1sIHRvIGFtbG9naWMsZzEyX2Rkcl9wbXUueWFtbAo+Pj4gwqDCoCAtIERlbGV0ZSAi
bW9kZWwiLCAiZG1jX25yIiwgImNoYW5uX25yIiBuZXcgcHJvcGVydGllcwo+Pj4gwqDCoCAtIEZp
eCBjb21waWxpbmcgZXJyb3IKPj4+IC0tLQo+Pj4gwqAgLi4uL2JpbmRpbmdzL3BlcmYvYW1sb2dp
YyxnMTItZGRyLXBtdS55YW1swqDCoMKgIHwgNTIgCj4+PiArKysrKysrKysrKysrKysrKysrCj4+
PiDCoCBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPj4+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgNTMgaW5zZXJ0aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvYW1sb2dpYyxnMTItZGRyLXBtdS55YW1s
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCAKPj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BlcmYvYW1sb2dpYyxnMTItZGRyLXBtdS55YW1sIAo+Pj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGVyZi9hbWxvZ2ljLGcxMi1kZHItcG11LnlhbWwKPj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjRkMDE4NTc0ZmZkMQo+Pj4g
LS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BlcmYvYW1sb2dpYyxnMTItZGRyLXBtdS55YW1sCj4+PiBAQCAtMCwwICsxLDUyIEBACj4+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
Cj4+PiArJVlBTUwgMS4yCj4+PiArLS0tCj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9wZXJmL2FtbG9naWMsZzEyLWRkci1wbXUueWFtbCMKPj4+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+ICsKPj4+ICt0aXRs
ZTogQW1sb2dpYyBHMTIgRERSIHBlcmZvcm1hbmNlIG1vbml0b3IKPj4+ICsKPj4+ICttYWludGFp
bmVyczoKPj4+ICvCoCAtIEppdWNoZW5nIFh1IDxqaXVjaGVuZy54dUBhbWxvZ2ljLmNvbT4KPj4+
ICsKPj4+ICtkZXNjcmlwdGlvbjogfAo+Pj4gK8KgIEFtbG9naWMgRzEyIHNlcmllcyBTb0MgaW50
ZWdyYXRlIEREUiBiYW5kd2lkdGggbW9uaXRvci4KPj4+ICvCoCBBIHRpbWVyIGlzIGluc2lkZSBh
bmQgY2FuIGdlbmVyYXRlIGludGVycnVwdCB3aGVuIHRpbWVvdXQuCj4+PiArwqAgVGhlIGJhbmR3
aWR0aCBpcyBjb3VudGVkIGluIHRoZSB0aW1lciBJU1IuIERpZmZlcmVudCBwbGF0Zm9ybQo+Pj4g
K8KgIGhhcyBkaWZmZXJlbnQgc3Vic2V0IG9mIGV2ZW50IGZvcm1hdCBhdHRyaWJ1dGUuCj4+PiAr
Cj4+PiArcHJvcGVydGllczoKPj4+ICvCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDCoCBpdGVtczoK
Pj4gWW91IGhhdmUgb25seSBvbmUgaXRlbSwgc28gcmVtb3ZlICJpdGVtcyIuCgpIaSBLcnp5c3p0
b2YsCgpJIGhhdmUgdHJpZWQgdG8gcmVtb3ZlICJpdGVtcyIsIGJ1dCBlcnJvciBjb21lcy4KCnBy
b3BlcnRpZXM6CiDCoCBjb21wYXRpYmxlOgogwqDCoMKgIC0gZW51bToKIMKgwqDCoMKgwqAgLSBh
bWxvZ2ljLGcxMmEtZGRyLXBtdQogwqDCoMKgwqDCoCAtIGFtbG9naWMsZzEyYi1kZHItcG11CiDC
oMKgwqDCoMKgIC0gYW1sb2dpYyxzbTEtZGRyLXBtdQoKRG8gSSBnZXQgbWlzdW5kZXJzdGFuZD8g
SSB0aGluayB0aGUgIml0ZW0iIGlzIG5lY2Vzc2FyeS4KCj4+Cj4+PiArwqDCoMKgwqDCoCAtIGVu
dW06Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sb2dpYyxnMTJiLWRkci1wbXUKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgLSBhbWxvZ2ljLGcxMmEtZGRyLXBtdQo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCAtIGFtbG9naWMsc20xLWRkci1wbXUKPj4+ICsKPj4+ICvCoCByZWc6Cj4+PiArwqDC
oMKgIGl0ZW1zOgo+Pj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUGh5c2ljYWwgYWRkcmVz
cyBvZiBETUMgYmFuZHdpZHRoIHJlZ2lzdGVyCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGFuZCBz
aXplIG9mIHRoZSBjb25maWd1cmF0aW9uIGFkZHJlc3Mgc3BhY2UuCj4+IFNraXAgb2J2aW91cyBw
aWVjZXMsIHNvIG9ubHk6Cj4+Cj4+IGRlc2NyaXB0aW9uOiBETUMgYmFuZHdpZHRoIHJlZ2lzdGVy
IHNwYWNlCj4+Cj4+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBQaHlzaWNhbCBhZGRyZXNz
IG9mIERNQyBQTEwgcmVnaXN0ZXIgYW5kCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUgb2Yg
dGhlIGNvbmZpZ3VyYXRpb24gYWRkcmVzcyBzcGFjZS4KPj4gZGVzY3JpcHRpb246IERNQyBQTEwg
YmFuZHdpZHRoIHJlZ2lzdGVyIHNwYWNlCj4+Cj4+Cj4+PiArCj4+PiArwqAgaW50ZXJydXB0czoK
Pj4+ICvCoMKgwqAgaXRlbXM6Cj4+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBUaGUgSVJR
IG9mIHRoZSBpbnNpZGUgdGltZXIgdGltZW91dC4KPj4+ICsKPj4+ICtyZXF1aXJlZDoKPj4+ICvC
oCAtIGNvbXBhdGlibGUKPj4+ICvCoCAtIHJlZwo+Pj4gK8KgIC0gaW50ZXJydXB0cwo+Pj4gKwo+
Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4gKwo+Pj4gK2V4YW1wbGVzOgo+Pj4g
K8KgIC0gfAo+Pj4gK8KgwqDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvYXJtLWdpYy5oPgo+Pj4gK8KgwqDCoCBkZHJfcG11QGZmNjM4MDAwIHsKPj4gTm8gdW5k
ZXJzY29yZXMgaW4gbm9kZSBuYW1lcywgZ2VuZXJpYyBub2RlIG5hbWVzLCBzbyBqdXN0ICJwbXUi
Lgo+PiBodHRwczovL2RldmljZXRyZWUtc3BlY2lmaWNhdGlvbi5yZWFkdGhlZG9jcy5pby9lbi9s
YXRlc3QvY2hhcHRlcjItZGV2aWNldHJlZS1iYXNpY3MuaHRtbCNnZW5lcmljLW5hbWVzLXJlY29t
bWVuZGF0aW9uIAo+Pgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dp
YyxnMTJhLWRkci1wbXUiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IDwweGZmNjM4MDAwIDB4
MTAwCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGZmNjM4YzAwIDB4MTAwPjsK
Pj4gVGhpcyBpcyBzdGlsbCBub3QgZml4ZWQuIEJpbmRpbmcgc2F5cyB5b3UgaGF2ZSB0d28gaXRl
bXMsIGJ1dCB5b3UKPj4gZGVjbGFyZWQgaGVyZSBvbmx5IG9uZSBpdGVtLgo+Cj4gT2theSwgSSB3
aWxsIGNoYW5nZSBpdCBhcyB5b3VyIGNvbW1lbnRzLgo+Cj4KPj4gQmVzdCByZWdhcmRzLAo+PiBL
cnp5c3p0b2YKPj4KLS0gClRoYW5rcywKSml1Y2hlbmcKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
