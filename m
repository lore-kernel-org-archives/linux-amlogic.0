Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0010C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zGTOLXVL73M9J3v9Mz9FmOLTrO51NdPpKj3cxwlurM=; b=D+2/qNCPoyMWNU
	mwYynUsUGgfpy6uRWQ/7j6jKjtJ2aYdU7Jsc33Gr9xj167glebSQiSHjJx04fsCd+K1cAoW4YY7YT
	jhud8gzgtmb1aD++rC9mF4fYq8lv7dTqjKHbMov38oxokz4nNopusFfxxtf1ANwXDLPkHqBRovqTZ
	3So7aGxbywQN8nQ2OpeZAqaADREJE/QQFfhvG43to8KqlksMZI7AfkBW71wImjsKXTW1xf4Nl+aGI
	9HwYNsDNYzNix267GqFqp1ruOf5gGgB5u7yXJ0QiaWsg5DvDvErhFq8NBXIRBMQPrO0pC5sro+Yy4
	k55tkMTcm3urD7nlWPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYtZ-00HQud-D2; Mon, 28 Nov 2022 07:49:41 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYjP-00HNNd-J5; Mon, 28 Nov 2022 07:39:14 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 28 Nov
 2022 15:39:01 +0800
Message-ID: <a6cf1b3f-259d-44b7-8a9a-2a0cd29c714b@amlogic.com>
Date: Mon, 28 Nov 2022 15:39:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <neil.armstrong@linaro.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
 <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
 <5b7176b4-d7a2-c67f-31c6-e842e0870836@linaro.org>
 <1jfse72wqk.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jfse72wqk.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_233911_731108_AC618EDB 
X-CRM114-Status: GOOD (  24.32  )
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

SGkgSmVyb21lLAoJVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LgoKT24gMjAyMi8xMS8yNSAxNzoy
MywgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiAKPiBPbiBX
ZWQgMjMgTm92IDIwMjIgYXQgMTQ6NTMsIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4+IE9uIDIzLzExLzIwMjIgMTQ6MjMsIE5l
aWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMjMvMTEvMjAyMiAxMjoxNiwg
WXUgVHUgd3JvdGU6Cj4+Pj4gSGkgS3J6eXN6dG9mLAo+Pj4+ICAgwqDCoMKgwqBUaGFuayB5b3Ug
Zm9yIHlvdXIgcmVwbHkuCj4+Pj4KPj4+PiBPbiAyMDIyLzExLzIzIDE4OjA4LCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+Pj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Pj4KPj4+Pj4gT24g
MjMvMTEvMjAyMiAwMzoxMywgWXUgVHUgd3JvdGU6Cj4+Pj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9j
ayBjb250cm9sbGVyIGZvdW5kIGFuZCBiaW5kaW5ncyBpbiB0aGUgczQgU29DIGZhbWlseS4KPj4+
Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+Pj4+
PiAtLS0KPj4+Pj4+ICDCoCAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55
YW1swqDCoCB8wqAgNTEgKwo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIHY1IGFuZCBzdGlsbCBiaW5kaW5n
cyBhcmUgaGVyZT8gQmluZGluZ3MgYXJlIGFsd2F5cyBzZXBhcmF0ZQo+Pj4+PiBwYXRjaGVzLiBV
c2Ugc3ViamVjdCBwcmVmaXhlcyBtYXRjaGluZyB0aGUgc3Vic3lzdGVtIChnaXQgbG9nIC0tb25l
bGluZQo+Pj4+PiAtLSAuLi4pLgo+Pj4+Pgo+Pj4+PiBBbmQgdGhpcyB3YXMgc3BsaXQsIHdhc24n
dCBpdD8gV2hhdCBoYXBwZW5lZCBoZXJlPyE/Cj4+Pj4KPj4+PiBQdXQgYmluZGluZ3MgYW5kIGNs
b2NrIGRyaXZlciBwYXRjaCB0b2dldGhlciBmcm9tIEplcm9tZS4gTWF5YmUgeW91IGNhbiByZWFk
IHRoaXMgY2hhdCBoaXN0b3J5Lgo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3IvYWxsLzFqeTF2
NnoxNG4uZnNmQHN0YXJidWNraXNhY3lsb24uYmF5bGlicmUuY29tLwo+Pj4KPj4+IEplcm9tZSB3
YXMgYXNraW5nIHlvdSB0byBzZW5kIDIgcGF0Y2hzZXRzLCBvbmUgd2l0aCA6Cj4+PiAtIGJpbmRp
bmdzIGluIHNlcGFyYXRlIHBhdGNoZXMKPj4+IC0gZHJpdmVycyBpbiBzZXBhcmF0ZSBwYXRjaGVz
Cj4+PiBhbmQgYSBzZWNvbmQgd2l0aCBEVCBjaGFuZ2VzLgo+IAo+IEluZGVlZCwgdGhpcyBpcyB3
aGF0IHdhcyBhc2tlZC4gSXQgaXMgYWxpZ25lZCB3aXRoIEtyenlzenRvZidzIHJlcXVlc3QuCgpB
Y2NvcmRpbmcgdG8geW91ciBkaXNjdXNzaW9uLCBJIHN0aWxsIHNob3VsZCBzZW5kIHBhdGNoZXMg
aW4gdGhlIApwcmV2aW91cyB3YXkgaW4gc2VyaWVzLiBCdXQgSSdtIGdvaW5nIHRvIGNoYW5nZSBp
dCBsaWtlIHlvdSBzdWdnZXN0ZWQuCkkgZG9uJ3Qga25vdywgYW0gSSBnZXR0aW5nIGl0IHJpZ2h0
PwoKPiAKPj4+Cj4+PiBUaGVuIHdoZW4gdGhlIGJpbmRpbmdzICsgY2xvY2tzIHBhdGNoZXMgYXJl
IG1lcmdlZCwgYSBwdWxsIHJlcXVlc3Qgb2YgdGhlIGJpbmRpbmdzCj4+PiBjYW4gYmUgZG9uZSB0
byBtZSBzbyBJIGNhbiBtZXJnZSBpdCB3aXRoIERULgo+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+
Pj4gIMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4+PiAgwqAgZHJpdmVy
cy9jbGsvbWVzb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEzICsKPj4+Pj4+ICDCoCBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+Pj4gIMKgIGRyaXZl
cnMvY2xrL21lc29uL3M0LXBsbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCA4NzUgKysrKysrKysrKysrKysrKysrCj4+Pj4+PiAgwqAgZHJpdmVycy9jbGsvbWVzb24v
czQtcGxsLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODggKysK
Pj4+Pj4+ICDCoCAuLi4vZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5owqDC
oCB8wqAgMzAgKwo+Pj4+Pj4gIMKgIDcgZmlsZXMgY2hhbmdlZCwgMTA1OSBpbnNlcnRpb25zKCsp
Cj4+Pj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+Pj4+ICDCoCBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmMKPj4+Pj4+ICDCoCBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmgKPj4+Pj4+ICDCoCBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtj
LmgKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLnlhbWwKPj4+Pj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmZkNTE3ZThlZjE0
Zgo+Pj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MueWFtbAo+Pj4+Pj4gQEAgLTAs
MCArMSw1MSBAQAo+Pj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQo+Pj4+Pj4gKyVZQU1MIDEuMgo+Pj4+Pj4gKy0tLQo+Pj4+Pj4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svYW1sb2dpYyxzNC1wbGwt
Y2xrYy55YW1sIwo+Pj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+Pj4+Pj4gKwo+Pj4+Pj4gK3RpdGxlOiBBbWxvZ2ljIE1lc29uIFMg
c2VyaWFscyBQTEwgQ2xvY2sgQ29udHJvbGxlcgo+Pj4+Pj4gKwo+Pj4+Pj4gK21haW50YWluZXJz
Ogo+Pj4+Pj4gK8KgIC0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+
Pj4+Pj4gK8KgIC0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+Pj4+PiAr
wqAgLSBZdSBUdSA8eXUuaHVAYW1sb2dpYy5jb20+Cj4+Pj4+PiArCj4+Pj4+IE9uZSBibGFuayBs
aW5lLgo+Pj4+Cj4+Pj4gICDCoEkgd2lsbCBkZWxldGUgdGhpcywgb24gbmV4dCB2ZXJzaW9uIHBh
dGNoLgo+Pj4+Cj4+Pj4+Cj4+Pj4+PiArCj4+Pj4+PiArcHJvcGVydGllczoKPj4+Pj4+ICvCoCBj
b21wYXRpYmxlOgo+Pj4+Pj4gK8KgwqDCoCBjb25zdDogYW1sb2dpYyxzNC1wbGwtY2xrYwo+Pj4+
Pj4gKwo+Pj4+Pj4gK8KgIHJlZzoKPj4+Pj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+Pj4+ICsK
Pj4+Pj4+ICvCoCBjbG9ja3M6Cj4+Pj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4+PiArCj4+
Pj4+PiArwqAgY2xvY2stbmFtZXM6Cj4+Pj4+PiArwqDCoMKgIGl0ZW1zOgo+Pj4+Pj4gK8KgwqDC
oMKgwqAgLSBjb25zdDogeHRhbAo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgICIjY2xvY2stY2VsbHMiOgo+
Pj4+Pj4gK8KgwqDCoCBjb25zdDogMQo+Pj4+Pj4gKwo+Pj4+Pj4gK3JlcXVpcmVkOgo+Pj4+Pj4g
K8KgIC0gY29tcGF0aWJsZQo+Pj4+Pj4gK8KgIC0gcmVnCj4+Pj4+PiArwqAgLSBjbG9ja3MKPj4+
Pj4+ICvCoCAtIGNsb2NrLW5hbWVzCj4+Pj4+PiArwqAgLSAiI2Nsb2NrLWNlbGxzIgo+Pj4+Pj4g
Kwo+Pj4+Pj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+Pj4gKwo+Pj4+Pj4gK2V4
YW1wbGVzOgo+Pj4+Pj4gK8KgIC0gfAo+Pj4+Pj4gK8KgwqDCoCBjbGtjX3BsbDogY2xvY2stY29u
dHJvbGxlckBmZTAwODAwMCB7Cj4+Pj4+PiArwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9n
aWMsczQtcGxsLWNsa2MiOwo+Pj4+Pj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4ZmUwMDgwMDAgMHgx
ZTg+Owo+Pj4+Pj4gK8KgwqDCoMKgwqAgY2xvY2tzID0gPCZ4dGFsPjsKPj4+Pj4+ICvCoMKgwqDC
oMKgIGNsb2NrLW5hbWVzID0gInh0YWwiOwo+Pj4+Pj4gK8KgwqDCoMKgwqAgI2Nsb2NrLWNlbGxz
ID0gPDE+Owo+Pj4+Pj4gK8KgwqDCoCB9Owo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4gKyNlbmRpZiAvKiBf
X01FU09OX1M0X1BMTF9IX18gKi8KPj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2MuaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNDVmODcwMjM4ODYKPj4+Pj4+IC0tLSAvZGV2L251bGwK
Pj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xr
Yy5oCj4+Pj4+Cj4+Pj4+IFRoaXMgYmVsb25ncyB0byBiaW5kaW5ncyBwYXRjaCwgbm90IGRyaXZl
ci4KPj4+Pj4KPj4+Pj4+IEBAIC0wLDAgKzEsMzAgQEAKPj4+Pj4+ICsvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkgKi8KPj4+Pj4+ICsvKgo+Pj4+Pj4gKyAqIENv
cHlyaWdodCAoYykgMjAyMSBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+Pj4+
PiArICogQXV0aG9yOiBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+Pj4+PiArICovCj4+Pj4+
PiArCj4+Pj4+PiArI2lmbmRlZiBfRFRfQklORElOR1NfQ0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xL
Q19ICj4+Pj4+PiArI2RlZmluZSBfRFRfQklORElOR1NfQ0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xL
Q19ICj4+Pj4+PiArCj4+Pj4+PiArLyoKPj4+Pj4+ICsgKiBDTEtJRCBpbmRleCB2YWx1ZXMKPj4+
Pj4+ICsgKi8KPj4+Pj4+ICsKPj4+Pj4+ICsjZGVmaW5lIENMS0lEX0ZJWEVEX1BMTMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMQo+Pj4+Pj4gKyNkZWZpbmUgQ0xLSURfRkNMS19ESVYywqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAzCj4+Pj4+Cj4+Pj4+IEluZGV4ZXMgc3RhcnQgZnJvbSAwIGFuZCBhcmUg
aW5jcmVtZW50ZWQgYnkgMS4gTm90IGJ5IDIuCj4+Pj4+Cj4+Pj4+IE5BSy4KPj4+Pgo+Pj4+IEkg
cmVtZW1iZXIgSmVyb21lIGRpc2N1c3NpbmcgdGhpcyB3aXRoIHlvdS5Zb3UgY2FuIGxvb2sgYXQg
dGhpcyBzdWJtaXNzaW9uIGhpc3RvcnkuCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L2MwODhlMDFjLTA3MTQtODJiZS04MzQ3LTYxNDBkYWY1NjY0MEBsaW5hcm8ub3JnLwo+Pj4KPj4+
IEhpc3RvcmljYWxseSB3ZSBkaWQgdGhhdCBieSBvbmx5IGV4cG9zaW5nIHBhcnQgb2YgdGhlIG51
bWJlcnMsIGNvbnRyb2xsaW5nIHdoaWNoCj4+PiBjbG9ja3Mgd2VyZSBwYXJ0IG9mIHRoZSBiaW5k
aW5ncy4KPj4+Cj4+PiBCdXQgaXQgc2VlbXMgdGhpcyBkb2Vzbid0IG1ha2Ugc2VucyBhbnltb3Jl
LCBtYXliZSBpdCB3b3VsZCBiZSB0aW1lIHRvIHB1dCBhbGwgdGhlCj4+PiBjbG9jayBpZHMgaW4g
dGhlIGJpbmRpbmdzIGZvciB0aGlzIG5ldyBTb0MgYW5kIGJyZWFrIHdpdGggdGhlIHByZXZpb3Vz
IHN0cmF0ZWd5Lgo+IAo+IEtyenlzenRvZiBhbmQgSSBhZ3JlZWQgdGhlcmUgaXMgbm90aGluZyB3
cm9uZyB3aXRoIHRoZSBjdXJyZW50Cj4gYXBwcm9hY2gsIEkgYmVsaWV2ZS4KPiAKPiBJdCBkb2Vz
IG5vdCBwcmV2ZW50IHNvbWVvbmUgZnJvbSB1c2luZyBhbiB1bi1leHBvc2VkIGNsb2NrLCBzdXJl
LCBvcgo+IGV4cG9zaW5nIGl0IGluIHRoZSBmdXR1cmUgaWYgbmVjZXNzYXJ5Lgo+IAo+IEhvd2V2
ZXIsIEkgdGhpbmsgaXQgY2xlYXJseSBzaG93cyB0aGF0IGFuIHVuLWV4cG9zZWQgZWxlbWVudCBp
cyBub3QKPiBleHBlY3RlZCB0byBiZSB1c2VkIGJ5IGFuIGV4dGVybmFsIGNvbnN1bWVycy4gSXQg
c2hvdWxkIGJlIGVub3VnaCB0bwo+IHRyaWdnZXIgYSBkaXNjdXNzaW9uIGlmIHRoaXMgZXhwZWN0
YXRpb24gaXMgd3JvbmcuCj4gCj4+Cj4+IFNvIHRoZSBvdXRjb21lIG9mIHRoZSBwcmV2aW91cyBk
aXNjdXNzaW9uIHdhcyBzb21ld2hlcmUgbGF0ZXIgaW4gdGhhdAo+PiB0aHJlYWQ6Cj4+Cj4+PiBJ
dCBpcyBqdXN0IGEgY2hvaWNlIHRvIG5vdCBleHBvc2Ugc29tZSBJRHMuCj4+PiBJdCBpcyBub3Qg
dGllZCB0byB0aGUgaW1wbGVtZW50YXRpb24gYXQgYWxsLgo+Pj4gSSB0aGluayB3ZSBhY3R1YWxs
eSBmb2xsb3cgdGhlIHJ1bGVzIGFuZCB0aGUgaWRlYSBiZWhpbmQgaXQuCj4+Cj4+Cj4+IEJlc3Qg
cmVnYXJkcywKPj4gS3J6eXN6dG9mCj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
