Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B85C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb6m8J/5anOGgtzcQ59A4QktFixnY/t0SRYv6j/jekg=; b=kkWz/xq8EsCTxm
	lSaIQpGxQD3Itaj8fjVL7qFaZoQqqdztY8dxBp6E6BYPCiAaZoPvYvDTVl1QUELUMcm6pIPXWX06E
	V4bOMG7ESomwWKV1hShtthS9MsiSS15JIXGcV0v9Ito461vckVG11tjZ1K2OZmtn4uGcGTzZWSv22
	01zatUKDEJPHaIGb1WuECe1OWvY7CFUBaNOYKEIlCb0NLLFZAeAQ1/O4Ii5tfzvkiHHyD5XoT5gra
	qCj0Abowe3yP381iLCMPol1eBlnlwFF2NWwOvan4z9J8gnDgLoJf+yVzNMnrUUD2RXlEzvmzdm63M
	10Jw8s/MeMuu1d12bVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqDd-00HPfk-4u; Wed, 23 Nov 2022 13:55:17 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqDC-00HPPy-Ar; Wed, 23 Nov 2022 13:54:52 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 21:54:47 +0800
Message-ID: <322262b1-d3db-f190-ef69-f42d5d0522c0@amlogic.com>
Date: Wed, 23 Nov 2022 21:54:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
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
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <eb56ed39-cfaa-3368-a2c0-0a4e89440e40@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_055450_420837_82BB7B15 
X-CRM114-Status: GOOD (  20.52  )
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

SGkgTmVpbCwKCk9uIDIwMjIvMTEvMjMgMjE6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsg
RVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpLAo+IAo+IE9uIDIzLzExLzIwMjIgMTI6MTYsIFl1IFR1
IHdyb3RlOgo+PiBIaSBLcnp5c3p0b2YsCj4+IMKgwqDCoMKgwqBUaGFuayB5b3UgZm9yIHlvdXIg
cmVwbHkuCj4+Cj4+IE9uIDIwMjIvMTEvMjMgMTg6MDgsIEtyenlzenRvZiBLb3psb3dza2kgd3Jv
dGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiAyMy8xMS8yMDIyIDAzOjEzLCBZ
dSBUdSB3cm90ZToKPj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9jayBjb250cm9sbGVyIGZvdW5kIGFu
ZCBiaW5kaW5ncyBpbiB0aGUgczQgU29DIAo+Pj4+IGZhbWlseS4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCAuLi4vYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1swqDCoCB8wqAgNTEgKwo+Pj4KPj4+
IFRoaXMgaXMgdjUgYW5kIHN0aWxsIGJpbmRpbmdzIGFyZSBoZXJlPyBCaW5kaW5ncyBhcmUgYWx3
YXlzIHNlcGFyYXRlCj4+PiBwYXRjaGVzLiBVc2Ugc3ViamVjdCBwcmVmaXhlcyBtYXRjaGluZyB0
aGUgc3Vic3lzdGVtIChnaXQgbG9nIC0tb25lbGluZQo+Pj4gLS0gLi4uKS4KPj4+Cj4+PiBBbmQg
dGhpcyB3YXMgc3BsaXQsIHdhc24ndCBpdD8gV2hhdCBoYXBwZW5lZCBoZXJlPyE/Cj4+Cj4+IFB1
dCBiaW5kaW5ncyBhbmQgY2xvY2sgZHJpdmVyIHBhdGNoIHRvZ2V0aGVyIGZyb20gSmVyb21lLiBN
YXliZSB5b3UgCj4+IGNhbiByZWFkIHRoaXMgY2hhdCBoaXN0b3J5Lgo+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yL2FsbC8xankxdjZ6MTRuLmZzZkBzdGFyYnVja2lzYWN5bG9uLmJheWxpYnJlLmNv
bS8KPiAKPiBKZXJvbWUgd2FzIGFza2luZyB5b3UgdG8gc2VuZCAyIHBhdGNoc2V0cywgb25lIHdp
dGggOgo+IC0gYmluZGluZ3MgaW4gc2VwYXJhdGUgcGF0Y2hlcwo+IC0gZHJpdmVycyBpbiBzZXBh
cmF0ZSBwYXRjaGVzCj4gYW5kIGEgc2Vjb25kIHdpdGggRFQgY2hhbmdlcy4KPiAKPiBUaGVuIHdo
ZW4gdGhlIGJpbmRpbmdzICsgY2xvY2tzIHBhdGNoZXMgYXJlIG1lcmdlZCwgYSBwdWxsIHJlcXVl
c3Qgb2YgCj4gdGhlIGJpbmRpbmdzCj4gY2FuIGJlIGRvbmUgdG8gbWUgc28gSSBjYW4gbWVyZ2Ug
aXQgd2l0aCBEVC4KPiAKCkkgbWF5IGhhdmUgbWlzdW5kZXJzdG9vZCBKZXJvbWUncyBhZHZpY2Uu
U28gc2hvdWxkIEkgZm9sbG93IHRoZSBWNCBwYXRjaCAKZm9ybWF0IGFuZCBjaGFuZ2UgYXMgSmVy
b21lIHN1Z2dlc3RlZCBmcm9tIFYzPwoKPj4KPj4+Cj4+Pgo+Pj4+IMKgIE1BSU5UQUlORVJTwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZ8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEzICsKPj4+PiDCoCBkcml2
ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDEgKwo+Pj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA4NzUgCj4+Pj4gKysrKysrKysrKysrKysr
KysrCj4+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODggKysKPj4+PiDCoCAuLi4vZHQtYmluZGluZ3MvY2xv
Y2svYW1sb2dpYyxzNC1wbGwtY2xrYy5owqDCoCB8wqAgMzAgKwo+Pj4+IMKgIDcgZmlsZXMgY2hh
bmdlZCwgMTA1OSBpbnNlcnRpb25zKCspCj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1j
bGtjLnlhbWwKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQt
cGxsLmMKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24vczQtcGxs
LmgKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9h
bWxvZ2ljLHM0LXBsbC1jbGtjLmgKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgCj4+Pj4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy55YW1s
IAo+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
czQtcGxsLWNsa2MueWFtbAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5mZDUxN2U4ZWYxNGYKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2Mu
eWFtbAo+Pj4+IEBAIC0wLDAgKzEsNTEgQEAKPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4gKyVZQU1MIDEuMgo+Pj4+ICst
LS0KPj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9hbWxvZ2lj
LHM0LXBsbC1jbGtjLnlhbWwjCj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsKPj4+PiArdGl0bGU6IEFtbG9naWMgTWVzb24g
UyBzZXJpYWxzIFBMTCBDbG9jayBDb250cm9sbGVyCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVyczoK
Pj4+PiArwqAgLSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+Pj4g
K8KgIC0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4+Pj4gK8KgIC0gWXUg
VHUgPHl1Lmh1QGFtbG9naWMuY29tPgo+Pj4+ICsKPj4+IE9uZSBibGFuayBsaW5lLgo+Pgo+PiDC
oMKgSSB3aWxsIGRlbGV0ZSB0aGlzLCBvbiBuZXh0IHZlcnNpb24gcGF0Y2guCj4+Cj4+Pgo+Pj4+
ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArwqAgY29tcGF0aWJsZToKPj4+PiArwqDCoMKgIGNv
bnN0OiBhbWxvZ2ljLHM0LXBsbC1jbGtjCj4+Pj4gKwo+Pj4+ICvCoCByZWc6Cj4+Pj4gK8KgwqDC
oCBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArwqAgY2xvY2tzOgo+Pj4+ICvCoMKgwqAgbWF4SXRl
bXM6IDEKPj4+PiArCj4+Pj4gK8KgIGNsb2NrLW5hbWVzOgo+Pj4+ICvCoMKgwqAgaXRlbXM6Cj4+
Pj4gK8KgwqDCoMKgwqAgLSBjb25zdDogeHRhbAo+Pj4+ICsKPj4+PiArwqAgIiNjbG9jay1jZWxs
cyI6Cj4+Pj4gK8KgwqDCoCBjb25zdDogMQo+Pj4+ICsKPj4+PiArcmVxdWlyZWQ6Cj4+Pj4gK8Kg
IC0gY29tcGF0aWJsZQo+Pj4+ICvCoCAtIHJlZwo+Pj4+ICvCoCAtIGNsb2Nrcwo+Pj4+ICvCoCAt
IGNsb2NrLW5hbWVzCj4+Pj4gK8KgIC0gIiNjbG9jay1jZWxscyIKPj4+PiArCj4+Pj4gK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+ICsKPj4+PiArZXhhbXBsZXM6Cj4+Pj4gK8KgIC0g
fAo+Pj4+ICvCoMKgwqAgY2xrY19wbGw6IGNsb2NrLWNvbnRyb2xsZXJAZmUwMDgwMDAgewo+Pj4+
ICvCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC1wbGwtY2xrYyI7Cj4+Pj4gK8Kg
wqDCoMKgwqAgcmVnID0gPDB4ZmUwMDgwMDAgMHgxZTg+Owo+Pj4+ICvCoMKgwqDCoMKgIGNsb2Nr
cyA9IDwmeHRhbD47Cj4+Pj4gK8KgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAieHRhbCI7Cj4+Pj4g
K8KgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+Pj4+ICvCoMKgwqAgfTsKPj4+Cj4+Pgo+
Pj4+ICsjZW5kaWYgLyogX19NRVNPTl9TNF9QTExfSF9fICovCj4+Pj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oIAo+Pj4+IGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmgKPj4+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzQ1Zjg3MDIzODg2Cj4+Pj4g
LS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dp
YyxzNC1wbGwtY2xrYy5oCj4+Pgo+Pj4gVGhpcyBiZWxvbmdzIHRvIGJpbmRpbmdzIHBhdGNoLCBu
b3QgZHJpdmVyLgo+Pj4KPj4+PiBAQCAtMCwwICsxLDMwIEBACj4+Pj4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKSAqLwo+Pj4+ICsvKgo+Pj4+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMjEgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+Pj4+ICsg
KiBBdXRob3I6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+PiArICovCj4+Pj4gKwo+Pj4+
ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19DTE9DS19BTUxPR0lDX1M0X1BMTF9DTEtDX0gKPj4+PiAr
I2RlZmluZSBfRFRfQklORElOR1NfQ0xPQ0tfQU1MT0dJQ19TNF9QTExfQ0xLQ19ICj4+Pj4gKwo+
Pj4+ICsvKgo+Pj4+ICsgKiBDTEtJRCBpbmRleCB2YWx1ZXMKPj4+PiArICovCj4+Pj4gKwo+Pj4+
ICsjZGVmaW5lIENMS0lEX0ZJWEVEX1BMTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+Pj4+ICsj
ZGVmaW5lIENMS0lEX0ZDTEtfRElWMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMwo+Pj4KPj4+IElu
ZGV4ZXMgc3RhcnQgZnJvbSAwIGFuZCBhcmUgaW5jcmVtZW50ZWQgYnkgMS4gTm90IGJ5IDIuCj4+
Pgo+Pj4gTkFLLgo+Pgo+PiBJIHJlbWVtYmVyIEplcm9tZSBkaXNjdXNzaW5nIHRoaXMgd2l0aCB5
b3UuWW91IGNhbiBsb29rIGF0IHRoaXMgCj4+IHN1Ym1pc3Npb24gaGlzdG9yeS4KPj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2MwODhlMDFjLTA3MTQtODJiZS04MzQ3LTYxNDBkYWY1NjY0
MEBsaW5hcm8ub3JnLyAKPj4KPiAKPiBIaXN0b3JpY2FsbHkgd2UgZGlkIHRoYXQgYnkgb25seSBl
eHBvc2luZyBwYXJ0IG9mIHRoZSBudW1iZXJzLCAKPiBjb250cm9sbGluZyB3aGljaAo+IGNsb2Nr
cyB3ZXJlIHBhcnQgb2YgdGhlIGJpbmRpbmdzLgo+IAo+IEJ1dCBpdCBzZWVtcyB0aGlzIGRvZXNu
J3QgbWFrZSBzZW5zIGFueW1vcmUsIG1heWJlIGl0IHdvdWxkIGJlIHRpbWUgdG8gCj4gcHV0IGFs
bCB0aGUKPiBjbG9jayBpZHMgaW4gdGhlIGJpbmRpbmdzIGZvciB0aGlzIG5ldyBTb0MgYW5kIGJy
ZWFrIHdpdGggdGhlIHByZXZpb3VzIAo+IHN0cmF0ZWd5LgoKVGhhdCdzIE9LIHdpdGggbWUuIEJ1
dCBJIGRvbid0IGtub3cgaWYgSmVyb21lIHRoaW5rcyBpdCdzIG9rPwoKPiAKPiBOZWlsCj4gCj4+
Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gS3J6eXN6dG9mCj4+Pgo+Pj4gLgo+IAo+IC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
