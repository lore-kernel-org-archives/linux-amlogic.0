Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F757C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 23:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFppx8COR01pGBAmTtwPfWpXUqRN2WlXaQ7RFBCNBC0=; b=yObHx+jJUfdRIn
	+Z4fhTWzjt7he2yZEVFtY9mjbp+wdQZZtprWVsyiMscjNKCfyH1sqs+d0/KKj0ic5zD47DHBCgzDc
	JF93GEE0aVCSCyExDvsuNCbdCfTJZeUbPBFmA62u4l53w5qiWn+BiD31+KkPwOg0ss8KNTWd4BRb4
	FoW9cSi5HbgL8QeC5G0DpCAIU2Ujb159Xao2p5fu4NY6/MqK6qQXo2hMyd1/rgeo+YN7ED71TRpHG
	SnxNxZwrLEwgDlwfyURJ4edFNpdU7XUNip6uo48is94of/aIPDRB1whMhPIlsiFpfVMAaGpInhr5+
	T1KC+YtLNQCgrIfVVikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngwtK-006bDO-Pc; Tue, 19 Apr 2022 23:04:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngwtH-006bCd-Cp; Tue, 19 Apr 2022 23:04:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94FFC1FB;
 Tue, 19 Apr 2022 16:04:09 -0700 (PDT)
Received: from [10.57.41.251] (unknown [10.57.41.251])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5405C3F5A1;
 Tue, 19 Apr 2022 16:04:07 -0700 (PDT)
Message-ID: <586f6f11-fb29-7f76-200a-d73a653f9889@arm.com>
Date: Wed, 20 Apr 2022 00:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Content-Language: en-GB
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <5fde764f-4caf-8017-3cbd-3918f3390b6a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_160411_571460_09B94924 
X-CRM114-Status: GOOD (  22.08  )
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

T24gMjAyMi0wMy0zMCAwNjo1NCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDIzLjAzLjIw
MjIgMjE6MzMsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4gT24gMjEuMDMuMjAyMiAwOTozNCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDE4LzAzLzIwMjIgMjE6NTAsIFJvYmlu
IE11cnBoeSB3cm90ZToKPj4+PiBPbiAyMDIyLTAyLTI1IDIxOjEzLCBIZWluZXIgS2FsbHdlaXQg
d3JvdGU6Cj4+Pj4+IEFkZCBhIFlBTUwgc2NoZW1hIGJpbmRpbmcgZm9yIFRNMTYyOCBhdXhkaXNw
bGF5Cj4+Pj4+ICg3LzExLXNlZ21lbnQgTEVEKSBjb250cm9sbGVyLgo+Pj4+Pgo+Pj4+PiBUaGlz
IHBhdGNoIGlzIHBhcnRpYWxseSBiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGZyb20KPj4+Pj4gQW5k
cmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPi4KPj4+Pj4KPj4+Pj4gQ28tZGV2ZWxvcGVk
LWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+
IHY1Ogo+Pj4+PiAtIGFkZCB2ZW5kb3IgcHJlZml4IHRvIGRyaXZlci1zcGVjaWZpYyBwcm9wZXJ0
aWVzCj4+Pj4+IC0tLQo+Pj4+PiAgICAuLi4vYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0
bTE2MjgueWFtbCAgfCA5MiArKysrKysrKysrKysrKysrKysrCj4+Pj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCA5MiBpbnNlcnRpb25zKCspCj4+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFt
bAo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+Pj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAwMDAuLjJhMWVmNjkyYwo+Pj4+PiAt
LS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4+Pj4+IEBAIC0wLDAgKzEsOTIgQEAK
Pj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9yLWxhdGVyIE9SIEJT
RC0yLUNsYXVzZSkKPj4+Pj4gKyVZQU1MIDEuMgo+Pj4+PiArLS0tCj4+Pj4+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwj
Cj4+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMKPj4+Pj4gKwo+Pj4+PiArdGl0bGU6IFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzIFRNMTYy
OCBMRUQgY29udHJvbGxlcgo+Pj4+PiArCj4+Pj4+ICttYWludGFpbmVyczoKPj4+Pj4gKyAgLSBB
bmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+Pj4+ICsgIC0gSGVpbmVyIEthbGx3
ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPj4+Pj4gKwo+Pj4+PiArYWxsT2Y6Cj4+Pj4+ICsg
IC0gJHJlZjogL3NjaGVtYXMvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwjCj4+Pj4+ICsK
Pj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4+ICsgIGNvbXBhdGlibGU6Cj4+Pj4+ICsgICAgY29uc3Q6
IHRpdGFubWVjLHRtMTYyOAo+Pj4+PiArCj4+Pj4+ICsgIHJlZzoKPj4+Pj4gKyAgICBtYXhJdGVt
czogMQo+Pj4+PiArCj4+Pj4+ICsgIHRpdGFubWVjLGdyaWQ6Cj4+Pj4+ICsgICAgZGVzY3JpcHRp
b246Cj4+Pj4+ICsgICAgICBNYXBwaW5nIG9mIGRpc3BsYXkgZGlnaXQgcG9zaXRpb24gdG8gZ3Jp
ZCBudW1iZXIuCj4+Pj4+ICsgICAgICBUaGlzIGltcGxpY2l0bHkgZGVmaW5lcyB0aGUgZGlzcGxh
eSBzaXplLgo+Pj4+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQ4LWFycmF5Cj4+Pj4+ICsgICAgbWluSXRlbXM6IDEKPj4+Pj4gKyAgICBtYXhJdGVtczog
Nwo+Pj4+PiArCj4+Pj4+ICsgIHRpdGFubWVjLHNlZ21lbnQtbWFwcGluZzoKPj4+Pj4gKyAgICBk
ZXNjcmlwdGlvbjoKPj4+Pj4gKyAgICAgIE1hcHBpbmcgb2YgNyBzZWdtZW50IGRpc3BsYXkgc2Vn
bWVudHMgQS1HIHRvIGJpdCBudW1iZXJzIDEtMTIuCj4+Pj4+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDgtYXJyYXkKPj4+Pj4gKyAgICBtaW5JdGVtczog
Nwo+Pj4+PiArICAgIG1heEl0ZW1zOiA3Cj4+Pj4+ICsKPj4+Pj4gKyAgIiNhZGRyZXNzLWNlbGxz
IjoKPj4+Pj4gKyAgICBjb25zdDogMgo+Pj4+PiArCj4+Pj4+ICsgICIjc2l6ZS1jZWxscyI6Cj4+
Pj4+ICsgICAgY29uc3Q6IDAKPj4+Pj4gKwo+Pj4+PiArcmVxdWlyZWQ6Cj4+Pj4+ICsgIC0gY29t
cGF0aWJsZQo+Pj4+PiArICAtIHJlZwo+Pj4+Cj4+Pj4gV291bGQgaXQgYmUgZmFpciB0byBzYXkg
dGhhdCAic3BpLWxzYi1maXJzdCIgYW5kICJzcGktM3dpcmUiIGFyZSBhbHNvCj4+Pj4gcmVxdWly
ZWQ/IFRoZSBjaGlwcyBhcmVuJ3QgY29uZmlndXJhYmxlIHNvIHdvbid0IGV4YWN0bHkgYmUgdXNh
YmxlIGFueQo+Pj4+IG90aGVyIHdheS4gRnVydGhlcm1vcmUgSSBiZWxpZXZlIHRoZSB0cmFuc21p
c3Npb24gZm9ybWF0IGFjdHVhbGx5IHdvcmtzCj4+Pj4gb3V0IGVxdWl2YWxlbnQgdG8gU1BJIG1v
ZGUgMywgc28gc2hvdWxkIHdhcnJhbnQgInNwaS1jcGhhIiBhbmQKPj4+PiAic3BpLWNwb2wiIGFz
IHdlbGwuCj4+Pj4KPj4+Pj4gKwo+Pj4+PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+Pj4+ICsgICJe
LipAWzEtN10sKFsxLTldfDFbMC02XSkkIjoKPj4+Pj4gKyAgICB0eXBlOiBvYmplY3QKPj4+Pj4g
KyAgICAkcmVmOiAvc2NoZW1hcy9sZWRzL2NvbW1vbi55YW1sIwo+Pj4+PiArICAgIHVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UKPj4+Pj4gKyAgICBkZXNjcmlwdGlvbjogfAo+Pj4+PiArICAg
ICAgUHJvcGVydGllcyBmb3IgYSBzaW5nbGUgTEVELgo+Pj4+PiArCj4+Pj4+ICsgICAgcHJvcGVy
dGllczoKPj4+Pj4gKyAgICAgIHJlZzoKPj4+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246IHwKPj4+
Pj4gKyAgICAgICAgICAxLWJhc2VkIGdyaWQgbnVtYmVyLCBmb2xsb3dlZCBieSAxLWJhc2VkIHNl
Z21lbnQgYml0IG51bWJlci4KPj4+Pj4gKyAgICAgICAgbWF4SXRlbXM6IDEKPj4+Pj4gKwo+Pj4+
PiArICAgIHJlcXVpcmVkOgo+Pj4+PiArICAgICAgLSByZWcKPj4+Pgo+Pj4+IEknbSBjb25jZXJu
ZWQgdGhhdCB0aGlzIGxlYXZlcyB1cyBubyByb29tIHRvIHN1cHBvcnQgdGhlIGFkZGl0aW9uYWwK
Pj4+PiBrZXlwYWQgZnVuY3Rpb25hbGl0eSBpbiBmdXR1cmUuIEhhdmluZyBub3cgZG91YmxlLWNo
ZWNrZWQgYSBkYXRhc2hlZXQsCj4+Pj4gdGhlIGlucHV0cyBhcmUgYWxzbyBhIHR3by1kaW1lbnNp
b25hbCBtdXggKHNoYXJpbmcgdGhlIHNlZ21lbnQgbGluZXMpLAo+Pj4+IHNvIHRoZSBkZXZpY2Ug
ZWZmZWN0aXZlbHkgaGFzIHR3byBkaXN0aW5jdCBidXQgbnVtZXJpY2FsbHktb3ZlcmxhcHBpbmcK
Pj4+PiBjaGlsZCBhZGRyZXNzIHNwYWNlcyAtIG9uZSBhZGRyZXNzZWQgYnkgKGdyaWQsc2VnbWVu
dCkgYW5kIHRoZSBvdGhlciBieQo+Pj4+IChzZWdtZW50LGtleSkuCj4+Pj4KPj4+PiBSb2IsIEty
eXN6dG9mLCBhbnkgdGhvdWdodHMgb24gdGhlIGJlc3QgRFQgaWRpb20gdG8gbGVhdmUgYWNjb21t
b2RhdGlvbgo+Pj4+IGZvciB0aGF0PyBJJ20gdGhpbmtpbmcgZWl0aGVyIHJlcXVpcmUgYW4gaW50
ZXJtZWRpYXRlIG5vZGUgdG8gY29udGFpbgo+Pj4+IGVhY2ggbm90aW9uYWwgYWRkcmVzcyBzcGFj
ZSwgb3IgcGVyaGFwcyBhZGQgYW5vdGhlciBsZWFkaW5nIGFkZHJlc3MgY2VsbAo+Pj4+IHRvIHNl
bGVjdCBiZXR3ZWVuIHRoZW0/IEkgZG9uJ3QgYmVsaWV2ZSBhbnkgb2YgdGhlc2UgdGhpbmdzIGhh
dmUgZnVydGhlcgo+Pj4+IGZ1bmN0aW9uYWxpdHkgYmV5b25kIHRoYXQuCj4+Pgo+Pj4gSSB0aGlu
ayBpbnRlcm1lZGlhdGUgbm9kZXMgLSBsZWRzLCBrZXlzIC0gYXJlIG1vcmUgYXBwcm9wcmlhdGUs
IGJlY2F1c2UKPj4+IGl0IGlzIHNlbGYtZGVzY3JpYmluZy4gQWRkaXRpb25hbCBhZGRyZXNzIHNw
YWNlIG51bWJlciB3b3VsZCByZXF1aXJlCj4+PiBkZWNvZGluZyB0aGlzICIwIiBvciAiMSIgaW50
byBMRUQva2V5LiBGb3IgY29tcGxleCBkZXZpY2VzIC0gbGlrZSBQTUlDcwo+Pj4gd2l0aCByZWd1
bGF0b3JzLCBSVEMgYW5kIGNsb2NrcyAtIHdlIGFscmVhZHkgaGF2ZSBzdWNoIHBhdHRlcm5zLgo+
Pj4KPj4gVGhlbiBpdCdzIGp1c3QgdGhlIHF1ZXN0aW9uIHdobyBjYW4gaW1wbGVtZW50IHN1Y2gg
YW4gaW50ZXJtZWRpYXRlIG5vZGUKPj4gYmFzZWQgb24gd2hhdCBoYXMgYmVlbiBkb25lIHNvIGZh
ci4KPj4KPiBBcyBpdCBpcyBub3cgaXQgc2VlbXMgd2UgZW5kIHVwIHdpdGggZW1wdHkgaGFuZHMg
YWdhaW4gYW5kIGhhdmUgdG8gd2FpdAo+IGZ1cnRoZXIgdHdvIHllYXJzIGZvciB0aGUgbmV4dCBv
bmUgdG8gbWFrZSBhbiBhdHRlbXB0Lgo+IFRoYXQncyBhIHBpdHkgYmVjYXVzZSBmb3IgbW9zdCB1
c2VycyB0aGUgcmVsZXZhbnQgdXNlIGNhc2VzIGFyZSBzdXBwb3J0ZWQuCgpPciwgeSdrbm93LCB3
ZSBjb3VsZCBqdXN0IHJlYWNoIGEgcHJvZHVjdGl2ZSBjb25jbHVzaW9uIHJhdGhlciB0aGFuIApk
b29tLWFuZC1nbG9vbSBjYXRhc3Ryb3BoaXNpbmcuIEkgYXBvbG9naXNlIGZvciBub3QgaGF2aW5n
IG11Y2ggdGltZSBmb3IgCm5vbi13b3JrLXJlbGF0ZWQga2VybmVsIGhhY2tpbmcgYXQgdGhlIG1v
bWVudCwgYnV0IGl0IGRpZG4ndCBzZWVtIApwYXJ0aWN1bGFybHkgdXJnZW50IHRvIGZvbGxvdyB1
cCBvbiB0aGlzIGluIHRoZSBtaWRkbGUgb2YgYSBtZXJnZSB3aW5kb3cgCmFueXdheS4gSW4gdGhl
IGNvdXJzZSBvZiBoZWxwZnVsbHkgYmVpbmcgbGVmdCB0byBhZGRyZXNzIG15IG93biByZXZpZXcg
CmZlZWRiYWNrLCBJIGRpZCBldmVudHVhbGx5IGdldCByb3VuZCB0byBpbXBsZW1lbnRpbmcgdGhl
IGludGVybWVkaWF0ZSAKImxlZHMiIG5vZGVbMV0gbGFzdCB3ZWVrZW5kLCBidXQgaGF2aW5nIG5v
dyBzdHVtYmxlZCBhY3Jvc3MgdGhlIAptYXRyaXgta2V5bWFwIGhlbHBlcnMgYW5kIGNvbW1vbiAi
bGludXgsa2V5bWFwIiBwcm9wZXJ0eSwgSSdtIHBlcnNvbmFsbHkgCmluY2xpbmVkIHRvIHRoaW5r
IHRoYXQgdGhhdCdzIGV2ZW4gY2xlYW5lciB0aGFuIGEgImtleXMiIG5vZGUgd2l0aCAKY2hpbGRy
ZW4gdGhhdCB3ZSdkIGhhdmUgdG8gd3JpdGUgbW9yZSBwYXJzaW5nIGNvZGUgZm9yLCBhbmQgdGh1
cyBtYXkgCndlbGwgbWFrZSB0aGUgd2hvbGUgaW50ZXJtZWRpYXRlIG5vZGUgbm90aW9uIG1vb3Qg
YW55d2F5LiBJZiBvbmx5IGFueW9uZSAKaGFkIHBvaW50ZWQgaXQgb3V0IHNvb25lci4uLgoKVGhh
bmtzLApSb2Jpbi4KClsxXSBodHRwczovL2dpdGxhYi5hcm0uY29tL2xpbnV4LWFybS9saW51eC1y
bS8tL2NvbW1pdHMvdG0xNjI4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
