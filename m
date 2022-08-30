Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91454ECAAD8
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 07:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCF5qZrU8btNBR4pzxmeZwMEGH0Jn8QYVVMssT4Aboo=; b=EPlCHfipM3R9Rkl6e1fyjnvo+Z
	i1mbZA2cOoF4sqnkEaq9BJbKBoBUM5ucC2Ku74zdSZBu4pjGEphb5dIicRHOpMy+yabtZN01XkRGb
	gMtYMJu608bxeFO0s6B7cCkCG+Ea/A7ioj94bB8qSDVyaOhByX/8ZC1YT+0JfMYyv/5k5D/U1eMSD
	kqkoPEOK6v40WroeQHah0WGBqXlynqYRDO3bdVLrwJEjSLXFQYJFAkLrtyNIIwjEKGlaqxHJn2mKq
	NCbEnO6XaYVe/Xyk9JtrkxnvKjzAh7+Y2zGHtF2Bn2vMsnAiCKGOuQuhJAMhaWLaJzVbC2c5fnpno
	EJePpoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvKy-00EfPJ-5Y; Tue, 30 Aug 2022 07:07:04 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvKf-00EfIP-Tu; Tue, 30 Aug 2022 07:06:47 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 15:06:39 +0800
Message-ID: <35507213-ea34-70f9-461b-33dc4697cc89@amlogic.com>
Date: Tue, 30 Aug 2022 15:06:39 +0800
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
 <72631035-58a6-23b5-1f7e-f1643b120432@amlogic.com>
 <1jy1v6z14n.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jy1v6z14n.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_000645_988288_68C4F8F6 
X-CRM114-Status: GOOD (  18.10  )
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

CgpPbiAyMDIyLzgvMzAgMTQ6MzYsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gVHVlIDMwIEF1ZyAyMDIyIGF0IDE0OjA1LCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBPbiAyMDIyLzgvMjkgMTc6NDMsIEplcm9tZSBCcnVu
ZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+IE9uIE1vbiAxNSBBdWcgMjAyMiBh
dCAxNDoxNywgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+Cj4+Pj4gSGkgSmVy
b21l77yMCj4+Pj4KPj4+PiBPbiAyMDIyLzgvMTAgMjE6MzIsIEplcm9tZSBCcnVuZXQgd3JvdGU6
Cj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+PiBPbiBGcmkgMDUgQXVnIDIwMjIgYXQgMTc6
MzksIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+PiBIaSBLcnp5
c3p0b2YsCj4+Pj4+PiAgICAgICAgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+Pj4+Pj4KPj4+
Pj4+IE9uIDIwMjIvOC81IDE3OjE2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+Pj4+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Pj4+IE9uIDA1LzA4LzIwMjIgMTA6NTcsIFl1IFR1IHdy
b3RlOgo+Pj4+Pj4+PiBBZGRlZCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgUzQgU09DIFBMTCBDbG9j
ayBjb250cm9sbGVyIGluIERULgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZdSBU
dSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgICAgIGFyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIHwgOCArKysrKysrKwo+Pj4+Pj4+PiAg
ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4+Pj4+Pj4gaW5kZXggZmYy
MTM2MThhNTk4Li5hODE2YjFmNzY5NGIgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+Pj4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+Pj4+Pj4+IEBAIC05Miw2ICs5MiwxNCBA
QCBhcGI0OiBhcGI0QGZlMDAwMDAwIHsKPj4+Pj4+Pj4gICAgICAJCQkjc2l6ZS1jZWxscyA9IDwy
PjsKPj4+Pj4+Pj4gICAgICAJCQlyYW5nZXMgPSA8MHgwIDB4MCAweDAgMHhmZTAwMDAwMCAweDAg
MHg0ODAwMDA+Owo+Pj4+Pj4+PiAgICAgICsJCQljbGtjX3BsbDogcGxsLWNsb2NrLWNvbnRyb2xs
ZXJAODAwMCB7Cj4+Pj4+Pj4gTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYyAtIGNsb2NrLWNv
bnRyb2xsZXIuCj4+Pj4+Pj4gaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVhZHRo
ZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNzLmh0bWwjZ2VuZXJp
Yy1uYW1lcy1yZWNvbW1lbmRhdGlvbgo+Pj4+Pj4+Cj4+Pj4+PiBJIHdpbGwgY2hhbmdlIHRvIGNs
a2NfcGxsOiBjbG9jay1jb250cm9sbGVyQDgwMDAsIGluIG5leHQgdmVyc2lvbi4KPj4+Pj4gU2Ft
ZSBjb21tZW50IGFwcGxpZXMgdG8gdGhlIGJpbmRpbmcgZG9jLgo+Pj4+IE9LYXkuCj4+Pj4+IEFs
c28gaXQgd291bGQgYmUgbmljZSB0byBzcGxpdCB0aGlzIGluIHR3byBzZXJpZXMuCj4+Pj4+IEJp
bmRpbmdzIGFuZCBkcml2ZXJzIGluIG9uZSwgYXJtNjQgZHQgaW4gdGhlIG90aGVyLiBUaGVzZSBj
aGFuZ2VzIGdvZXMKPj4+Pj4gaW4gdGhyb3VnaCBkaWZmZXJlbnQgdHJlZXMuCj4+Pj4gQXQgcHJl
c2VudCwgQmluZGluZ3MsIERUUyBhbmQgZHJpdmVycyBhcmUgdGhyZWUgc2VyaWVzLiBEbyB5b3Ug
bWVhbiB0byBwdXQKPj4+PiBCaW5kaW5ncyBhbmQgZHJpdmVycyB0b2dldGhlcj8gSWYgc28sIGNo
ZWNrcGF0Y2gucGwgd2lsbCByZXBvcnQgYSB3YXJuaW5nLgo+Pj4gWWVzIGJlY2F1c2UgcGF0Y2hl
cyBhcmUgbm90IGluIHlldCBzbyB0aGVyZSBpcyBhIGdvb2QgcmVhc29uIHRvIGlnbm9yZQo+Pj4g
dGhlIHdhcm5pbmcuIFdhcm5pbmcgd2lsbCBuZXZlciBzaG93IHVwIG9uIHRoZSBhY3R1YWwgdHJl
ZSBpZiB0aGUKPj4+IHBhdGNoZXMgYXJlIGNvcnJlY3RseSBvcmRlcmVkLgo+Pgo+PiBJIHRoaW5r
IEJpbmRpbmcsIERUUyBhbmQgZHJpdmVycyB1c2UgdGhyZWUgc2VyaWVzIGFuZCB5b3Ugc2FpZCB0
d28gc2VyaWVzCj4+IGlzIG5vdCBhIGJpZyBwcm9ibGVtLiBUaHJlZSBzZXJpZXMgYXJlIHJlY29t
bWVuZGVkIGZvciBjaGVja3BhdGNoLnBsLCBJCj4+IHRoaW5rIGl0IHNob3VsZCBiZSBlYXN5IGZv
ciB0aGF0IHRvIHNlcGFyYXRlIGFuZCBtZXJnZeOAggo+IAo+IE5vIC0gVGhlcmUgaXMgb25seSAy
IHNlcmllcy4gMSBmb3IgdGhlIGJpbmRpbmdzIGFuZCBjbG9jayBkcml2ZXJzIGFuZAo+IG9uZSBm
b3IgdGhlIERUIG9uY2UgdGhpbmdzIGFyZSBpbgoKQWxsIHJpZ2h0LCB3ZSdsbCBkbyBpdCB5b3Vy
IHdheS4KCj4gCj4+Cj4+IEkndmUgc2VudCBpdCB0byBWNC4gUGxlYXNlIGxvb2sgYXQgVjQgYW5k
IGdpdmUgc29tZSBjb21tZW50cy4KPj4KPiAKPiBUaGF0J3Mgbm90IGhvdyBpdCB3b3Jrcy4gWW91
IHNlbnQgdGhhdCBiZWZvcmUgdjMgcmV2aWV3IHdhcyBkb25lLiBUaGVyZQo+IGFyZSBzdGlsbCBj
b21tZW50cyB0aGF0IG5lZWRlZCB0byBiZSBhZGRyZXNzZWQKClllcy4gQnV0IGNhbiB5b3UgcmVw
bHkgZmFzdGVyPwoKPiAKPiBHaXZlbiB0aGUgdGltZSBpdCB0YWtlcyB0byBtYWtlIHRoYXQgcmV2
aWV3IEkgZ29pbmcgdG8gY29tcGxldGx5IHNraXAgdjQKPiBhbmQgSSdkIGxpa2Ugb24gdGhlIGNv
bW1lbnQgdG8gYWRkcmVzc2VkIGJlZm9yZSB5b3Ugc2VuZCBhbm90aGVyIHZlcnNpb24KPiAKCldo
YXQgY2FuIEkgc2F5PyBJdCdzIHVwIHRvIHlvdS4KCj4gCj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+Pj4g
QmVzdCByZWdhcmRzLAo+Pj4+Pj4+IEtyenlzenRvZgo+Pj4+Pj4+IC4KPj4+Pj4gLgo+Pj4gLgo+
IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
