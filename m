Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A75ECAAD1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ks7R/iDD+4SQMM0VyYhWLdFRQ+JS2Io0lxO6nM1p68=; b=BshKHwMHnWRlS3MXtgaXZrKYQt
	xR7GjIW2AYHem3ufPm7f1pArR7a9ls0souWiZAtbWpnTdcCWXj8V15eHc/2RQAWcT/Wx583kOq4Zp
	4hA9JMBguBWUrqHHqGgtIQCJ4EOYzFpUBQDEvDt2n9dfP7UiiZ7v5LagBLbw3p93DdtOY4sD61z5U
	xvw8jsQ/CzOavLf/KmK9Z5tpFpQNMXJ+d7kPNqFIBI8TYZ7xqZQkEi/4bV+kzq442PsY1tu+NK/Ly
	cyoXCicmVvURu7O1b6+ifBj33wrJSWqD3K8pozFaCewsiJoCCxtcrWmWrW3/kEQiaRy4RTF7fDE9j
	b3MxWC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuNd-00EJiP-HY; Tue, 30 Aug 2022 06:05:45 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuNH-00EJZp-OF; Tue, 30 Aug 2022 06:05:25 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 14:05:11 +0800
Message-ID: <72631035-58a6-23b5-1f7e-f1643b120432@amlogic.com>
Date: Tue, 30 Aug 2022 14:05:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 2/6] arm64: dts: meson: add S4 Soc PLL clock controller
 in DT
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-3-yu.tu@amlogic.com>
 <19654574-bdc0-9fa5-6465-fc88b20e20c5@linaro.org>
 <c223a85a-b76e-0e82-9a8c-6b60588dc03a@amlogic.com>
 <1jmtccz0f4.fsf@starbuckisacylon.baylibre.com>
 <edc9b0bd-6c69-0562-05ca-db0496897cf1@amlogic.com>
 <1j1qszv0wa.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1j1qszv0wa.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_230523_808927_287B005D 
X-CRM114-Status: GOOD (  13.08  )
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

CgpPbiAyMDIyLzgvMjkgMTc6NDMsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gTW9uIDE1IEF1ZyAyMDIyIGF0IDE0OjE3LCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBIaSBKZXJvbWXvvIwKPj4KPj4gT24gMjAyMi84LzEw
IDIxOjMyLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+PiBP
biBGcmkgMDUgQXVnIDIwMjIgYXQgMTc6MzksIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4+IEhpIEtyenlzenRvZiwKPj4+PiAgICAgICBUaGFuayB5b3UgZm9yIHlvdXIg
cmVwbHkuCj4+Pj4KPj4+PiBPbiAyMDIyLzgvNSAxNzoxNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4+IE9uIDA1LzA4LzIwMjIgMTA6NTcs
IFl1IFR1IHdyb3RlOgo+Pj4+Pj4gQWRkZWQgaW5mb3JtYXRpb24gYWJvdXQgdGhlIFM0IFNPQyBQ
TEwgQ2xvY2sgY29udHJvbGxlciBpbiBEVC4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
dSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICAgICBhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDggKysrKysrKysKPj4+Pj4+ICAgICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4+Pj4+IGluZGV4IGZmMjEzNjE4YTU5OC4u
YTgxNmIxZjc2OTRiIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLXM0LmR0c2kKPj4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1zNC5kdHNpCj4+Pj4+PiBAQCAtOTIsNiArOTIsMTQgQEAgYXBiNDogYXBiNEBmZTAw
MDAwMCB7Cj4+Pj4+PiAgICAgCQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4+Pj4+PiAgICAgCQkJcmFu
Z2VzID0gPDB4MCAweDAgMHgwIDB4ZmUwMDAwMDAgMHgwIDB4NDgwMDAwPjsKPj4+Pj4+ICAgICAr
CQkJY2xrY19wbGw6IHBsbC1jbG9jay1jb250cm9sbGVyQDgwMDAgewo+Pj4+PiBOb2RlIG5hbWVz
IHNob3VsZCBiZSBnZW5lcmljIC0gY2xvY2stY29udHJvbGxlci4KPj4+Pj4gaHR0cHM6Ly9kZXZp
Y2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIyLWRl
dmljZXRyZWUtYmFzaWNzLmh0bWwjZ2VuZXJpYy1uYW1lcy1yZWNvbW1lbmRhdGlvbgo+Pj4+Pgo+
Pj4+IEkgd2lsbCBjaGFuZ2UgdG8gY2xrY19wbGw6IGNsb2NrLWNvbnRyb2xsZXJAODAwMCwgaW4g
bmV4dCB2ZXJzaW9uLgo+Pj4gU2FtZSBjb21tZW50IGFwcGxpZXMgdG8gdGhlIGJpbmRpbmcgZG9j
Lgo+PiBPS2F5Lgo+Pj4gQWxzbyBpdCB3b3VsZCBiZSBuaWNlIHRvIHNwbGl0IHRoaXMgaW4gdHdv
IHNlcmllcy4KPj4+IEJpbmRpbmdzIGFuZCBkcml2ZXJzIGluIG9uZSwgYXJtNjQgZHQgaW4gdGhl
IG90aGVyLiBUaGVzZSBjaGFuZ2VzIGdvZXMKPj4+IGluIHRocm91Z2ggZGlmZmVyZW50IHRyZWVz
Lgo+PiBBdCBwcmVzZW50LCBCaW5kaW5ncywgRFRTIGFuZCBkcml2ZXJzIGFyZSB0aHJlZSBzZXJp
ZXMuIERvIHlvdSBtZWFuIHRvIHB1dAo+PiBCaW5kaW5ncyBhbmQgZHJpdmVycyB0b2dldGhlcj8g
SWYgc28sIGNoZWNrcGF0Y2gucGwgd2lsbCByZXBvcnQgYSB3YXJuaW5nLgo+IAo+IFllcyBiZWNh
dXNlIHBhdGNoZXMgYXJlIG5vdCBpbiB5ZXQgc28gdGhlcmUgaXMgYSBnb29kIHJlYXNvbiB0byBp
Z25vcmUKPiB0aGUgd2FybmluZy4gV2FybmluZyB3aWxsIG5ldmVyIHNob3cgdXAgb24gdGhlIGFj
dHVhbCB0cmVlIGlmIHRoZQo+IHBhdGNoZXMgYXJlIGNvcnJlY3RseSBvcmRlcmVkLgoKSSB0aGlu
ayBCaW5kaW5nLCBEVFMgYW5kIGRyaXZlcnMgdXNlIHRocmVlIHNlcmllcyBhbmQgeW91IHNhaWQg
dHdvIApzZXJpZXMgaXMgbm90IGEgYmlnIHByb2JsZW0uIFRocmVlIHNlcmllcyBhcmUgcmVjb21t
ZW5kZWQgZm9yIApjaGVja3BhdGNoLnBsLCBJIHRoaW5rIGl0IHNob3VsZCBiZSBlYXN5IGZvciB0
aGF0IHRvIHNlcGFyYXRlIGFuZCBtZXJnZeOAggoKSSd2ZSBzZW50IGl0IHRvIFY0LiBQbGVhc2Ug
bG9vayBhdCBWNCBhbmQgZ2l2ZSBzb21lIGNvbW1lbnRzLgoKPiAKPj4KPj4+Cj4+Pj4+IEJlc3Qg
cmVnYXJkcywKPj4+Pj4gS3J6eXN6dG9mCj4+Pj4+IC4KPj4+IC4KPiAKPiAuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
