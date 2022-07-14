Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ECBC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jul 2022 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooxnkIeMzWLDC37UZ29TthXUfGyqq509LOWVS3iCE2M=; b=gZnMcxCN+5P9iR
	klj5qrcB+Wnlupu9wKqUQBcTJLfs7zeRwMCcXOC7xMvVVe+Sllj+q6DIXP6ca107IkuMXTiIW4+id
	Rdw6tI5P+ixCgI0ct7VX+ok/Txw8P7ebtG2DlDVv9cBOgTGMp/0grDwXezPGt11NYl2iVxKaGBk/o
	S4DhsXQdmxOPrHCfMW7Hkd2s82LBuZIhOy4ccXnpghP4Ryhmz8eucC+YVxoFCUSH+itmK8xlthbLy
	9n655CYqupg48kM13ejCOWELECbWcikYAErFtiRHSwAN39HqZqgcNJ4LvRX+RjBkUPb7jnbor75aV
	ubQVCFPcJDYa9JtnRD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuuU-00ChDZ-F1; Thu, 14 Jul 2022 09:13:26 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuuD-00Ch2B-Rw; Thu, 14 Jul 2022 09:13:11 +0000
Received: from [10.88.19.41] (10.88.19.41) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2176.2; Thu, 14 Jul 2022 17:13:06 +0800
Message-ID: <79ff63fc-dbd7-bc31-ebe7-7d15d121add1@amlogic.com>
Date: Thu, 14 Jul 2022 17:13:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 4/4] dt-binding:perf: Add Amlogic DDR PMU
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
 <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
 <94ab770b-8a8a-4299-a54e-2ff77afb9e04@arm.com>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <94ab770b-8a8a-4299-a54e-2ff77afb9e04@arm.com>
X-Originating-IP: [10.88.19.41]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_021309_923458_DD9EA409 
X-CRM114-Status: GOOD (  21.46  )
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

Ck9uIDcvMTIvMjAyMiA4OjU0IFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4KPiBPbiAyMDIyLTA3LTEyIDA3OjM2LCBKaXVjaGVuZyBYdSB3cm90ZToKPj4gQWRk
IGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEFtbG9naWMgRzEyIHNlcmllcyBERFIKPj4g
cGVyZm9ybWFuY2UgbW9uaXRvciB1bml0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKaXVjaGVuZyBY
dSA8aml1Y2hlbmcueHVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiDCoCAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9wZXJmL2FtbC1kZHItcG11LnlhbWwgfCA1MSArKysrKysrKysrKysrKysrKysrCj4+
IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQs
IDUyIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9hbWwtZGRyLXBtdS55YW1sCj4+Cj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9hbWwtZGRyLXBt
dS55YW1sIAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL2FtbC1k
ZHItcG11LnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5jNTg2YjRhYjQwMDkKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGVyZi9hbWwtZGRyLXBtdS55YW1sCj4+IEBAIC0wLDAgKzEsNTEg
QEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvcGVyZi9hbWwtZGRyLXBtdS55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBBbWxv
Z2ljIEcxMiBERFIgcGVyZm9ybWFuY2UgbW9uaXRvcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4g
K8KgIC0gSml1Y2hlbmcgWHUgPGppdWNoZW5nLnh1QGFtbG9naWMuY29tPgo+PiArCj4+ICtwcm9w
ZXJ0aWVzOgo+PiArwqAgY29tcGF0aWJsZToKPj4gK8KgwqDCoCBvbmVPZjoKPj4gK8KgwqDCoMKg
wqAgLSBlbnVtOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gYW1sLGcxMi1kZHItcG11Cj4+ICvC
oMKgwqDCoMKgIC0gaXRlbXM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBhbWwsZzEyLWRkci1wbXUKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCAtIGNvbnN0OiBhbWwsZzEyLWRkci1wbXUKPgo+IEp1ZGdpbmcgYnkgd2hhdCB0aGUg
ZHJpdmVyIGFjdHVhbGx5IGltcGxlbWVudHMsIHRoaXMgc2hvdWxkIHByb2JhYmx5IGJlOgo+Cj4g
wqAgY29tcGF0aWJsZToKPiDCoMKgwqAgaXRlbXM6Cj4gwqDCoMKgwqDCoCAtIGVudW06Cj4gwqDC
oMKgwqDCoMKgwqAgLSBhbWxvZ2ljLGcxMmEtZGRyLXBtdQo+IMKgwqDCoMKgwqDCoMKgIC0gYW1s
b2dpYyxnMTJiLWRkci1wbXUKPiDCoMKgwqDCoMKgwqDCoCAtIGFtbG9naWMsc20xLWRkci1wbXUK
PiDCoMKgwqDCoMKgIC0gY29uc3Q6IGFtbG9naWMsZzEyLWRkci1wbXUKPgo+IFRoZXJlIGRvZXNu
J3Qgc2VlbSBtdWNoIHBvaW50IGluIGFsbG93aW5nIG9ubHkgdGhlIGNvbW1vbiBjb21wYXRpYmxl
IAo+IHdpdGhvdXQgYSBTb0Mtc3BlY2lmaWMgaWRlbnRpZmllci4gTm90ZSBhbHNvIHRoYXQgImFt
bCwiIGlzIG5vdCB0aGUgCj4gZG9jdW1lbnRlZCB2ZW5kb3IgcHJlZml4LgpPa2F5LCBJIGZpbmFs
bHkga25vdyB3aGF0IHlvdSBtZWFuLgo+Cj4+ICsKPj4gK8KgIHJlZzoKPj4gK8KgwqDCoCBtYXhJ
dGVtczogMgo+PiArCj4+ICvCoCBpbnRlcnJ1cHRzOgo+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+
ICsKPj4gK3JlcXVpcmVkOgo+PiArwqAgLSBjb21wYXRpYmxlCj4+ICvCoCAtIG1vZGVsCj4KPiBS
ZW1vdmUgdGhpcywgYW5kIHVzZSB0aGUgY29tcGF0aWJsZSBzdHJpbmdzIHByb3Blcmx5IGFzIGFi
b3ZlLgpPa2F5LiBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlLgo+Cj4+ICvCoCAtIGRtY19ucgo+PiAr
wqAgLSBjaGFubl9ucgo+Cj4gSSBzdXNwZWN0IHRob3NlIGNvdWxkIHByb2JhYmx5IGJlIGluZmVy
cmVkIGZyb20gdGhlIGNvcnJlY3QgY29tcGF0aWJsZSAKPiBzdHJpbmcsIGJ1dCBpZiBub3QgKGku
ZS4gd2l0aGluIG9uZSBTb0MgeW91IGhhdmUgbXVsdGlwbGUgUE1VcyAKPiBzdXBwb3J0aW5nIHRo
ZSBzYW1lIGV2ZW50cyBidXQgd2l0aCBkaWZmZXJlbnQgbnVtYmVycyBvZiB1c2FibGUgCj4gY2hh
bm5lbHMpLCB0aGVuIGRvY3VtZW50IHdoYXQgZXhhY3RseSB0aGV5IG1lYW4uCj4KWWVzLCBhcyB5
b3UgbWVudGlvbmVkLCB0aGVzZSBjb3VsZCBiZSBpbmZlcnJlZCBmcm9tIHRoZSBjb21wYXRpYmxl
IApzdHJpbmcuIEkgd2lsbCBtYWtlIHRoZSBjaGFuZ2UuCj4+ICvCoCAtIHJlZwo+PiArwqAgLSBp
bnRlcnJ1cHRzCj4+ICvCoCAtIGludGVycnVwdC1uYW1lcwo+Cj4gQXMgbWVudGlvbmVkIGluIHRo
ZSBkcml2ZXIgcmV2aWV3LCBpZiB5b3UgcmVhbGx5IHdhbnQgdG8gdXNlIGEgbmFtZWQgCj4gaW50
ZXJydXB0ICh3aGljaCBzaG91bGQgdXN1YWxseSBiZSB1bm5lY2Vzc2FyeSB3aGVuIHRoZXJlJ3Mg
b25seSBvbmUpLCAKPiBpdCBoYXMgdG8gYmUgYSBkZWZpbmVkIG5hbWUuIERUIGlzIG5vdCBhIG1l
Y2hhbmlzbSBmb3Igb3ZlcnJpZGluZyB3aGF0IAo+IExpbnV4IHNob3dzIGluIC9wcm9jL2ludGVy
cnVwdHMuCj4KPiBUaGFua3MsCj4gUm9iaW4uCj4KPj4gKwo+PiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArwqAgLSB8Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgZGRyX3BtdTogZGRyX3BtdSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxnMTItZGRyLXBtdSI7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGVsID0gImcxMmEiOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWNfbnIgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNoYW5uX25yID0gPDQ+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4ZmY2MzgwMDAgMHgwIDB4MTAwCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwIDB4ZmY2Mzhj
MDAgMHgwIDB4MTAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDUyIElSUV9UWVBFX0VER0VfUklTSU5HPjsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0LW5hbWVzID0gImRkcl9wbXUiOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqAgfTsKPj4gZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5kZXggZmQyYTU2YTMzOWI0Li5hYzBhMWRmNDYy
MmQgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5UQUlORVJTCj4+IEBA
IC0xMDU1LDYgKzEwNTUsNyBAQCBNOsKgwqDCoCBKaXVjaGVuZyBYdSA8aml1Y2hlbmcueHVAYW1s
b2dpYy5jb20+Cj4+IMKgIFM6wqDCoMKgIFN1cHBvcnRlZAo+PiDCoCBXOsKgwqDCoCBodHRwOi8v
d3d3LmFtbG9naWMuY29tCj4+IMKgIEY6wqDCoMKgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
cGVyZi9hbWwtZGRyLXBtdS5yc3QKPj4gK0Y6wqDCoMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wZXJmL2FtbC1kZHItcG11LnlhbWwKPj4gwqAgRjrCoMKgwqAgZHJpdmVycy9w
ZXJmL2FtbG9naWMvCj4+IMKgIEY6wqDCoMKgIGluY2x1ZGUvc29jL2FtbG9naWMvCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
