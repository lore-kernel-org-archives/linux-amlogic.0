Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A941C7EE29
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 00:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+idkA4grUcsJBHD2wQO8Da+53TwEKMtZw8B2j7Zy7M=; b=y/EwCalq4nK25Q
	KkW0IO+dO0mW0UfkPKcBRsnf+TB9nm6cFau1QMYUvqJI205bPoUFbLq9Y+FhOXMhPXyszuqhvpG9+
	XQ95au4Wk+Y+BuYgQ27HToZnMR0yD3tjpJagRxYw8BdrBqgUMbqYOJ1hCgGSLcR+LoZ6UOuYRUUVY
	YVqnyZguIB3/sqB5GhpeUdLkVaUmudz7t3VlKIn2HMX/8gRaQuVChc4Cit+jkOmn80//1/oYGdytn
	Dok/ovTXCx03Unu+CudtPjcz9t44ZxSy0ObfQdqyyB0uZ1Gp64hT8O1KOnTiheIq70Kr+ygY/U0Bf
	7oWNVtbodjVL3JmjGv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cnh-00BxlS-1N;
	Wed, 24 May 2023 00:56:25 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cnd-00BxkR-0Q;
	Wed, 24 May 2023 00:56:23 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7F1085FD1B;
	Wed, 24 May 2023 03:56:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684889777;
	bh=6UJu4At4JTYJZJm3ufdH8BuFWlW2L/vFJ5Zl0oCFuaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=DyrqPvLXGsYToa8iWySrhnm3P5Z/mM8+b7Ss+5iIy3ovu7u3BaO9/wkN1Etw9JcaC
	 KM+5eMnqEmclo/iRjGd1wbCsLYLRtR1RoyTQCBIh8jGIpXL94EUUWsynGEoFzXu/zQ
	 MGn2eFGDaedaH+FQ4a7EpO66CEP27dhPSjU8+Z0iLoBCzpX0d1gqziMwLIO49gjoal
	 0OhojjOEUcuE+5KLhe3++MIy7NihYhcUR7G4GPd2XMb7PqyGzrvDS8JLFlq4+Au+m5
	 J5CtV3pjcKpje3XRe36ZjodKBhW7PaL+TYPwu2E3dfg2//oRq4wxjJ2gLdqgAkQDLt
	 KwzwYfM0U4DOw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 24 May 2023 03:56:16 +0300 (MSK)
Message-ID: <3fb39050-9543-f4a4-c8f2-a996e24c8e16@sberdevices.ru>
Date: Wed, 24 May 2023 03:52:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jian.hu@amlogic.com"
	<jian.hu@amlogic.com>, kernel <kernel@sberdevices.ru>, "rockosov@gmail.com"
	<rockosov@gmail.com>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<DDRokosov@sberdevices.ru>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-7-ddrokosov@sberdevices.ru>
 <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
 <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021>
 <CAFBinCA8e9evk+9hTEgoNOD_+3DBst6vYDcradmr2c996jdUmw@mail.gmail.com>
 <20230517103456.p3sjxzbepvg7cr2r@CAB-WSD-L081021>
 <CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com>
 <573d96df-7b08-4fa2-668b-58ff674a314e@gmail.com>
 <20230522134425.pc5fhojf53v6q2jz@CAB-WSD-L081021>
 <a121266a-110a-8c4e-cd71-4e35165fc789@gmail.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <a121266a-110a-8c4e-cd71-4e35165fc789@gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/23 21:43:00 #21378639
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_175621_521976_D7D4DB60 
X-CRM114-Status: GOOD (  30.42  )
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

T24gNS8yMi8yMyAyMzozNiwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IE9uIDIyLjA1LjIwMjMg
MTU6NDQsIERtaXRyeSBSb2tvc292IHdyb3RlOgo+PiBIZWluZXIsCj4+Cj4+IE9uIEZyaSwgTWF5
IDE5LCAyMDIzIGF0IDA2OjEwOjUwUE0gKzAyMDAsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4+
IE9uIDE4LjA1LjIwMjMgMjI6MDQsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+Pj4gSGkg
RG1pdHJ5LAo+Pj4+Cj4+Pj4gT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMTI6MzTigK9QTSBEbWl0
cnkgUm9rb3Nvdgo+Pj4+IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Pj4+IFsu
Li5dCj4+Pj4+Pj4gQWRkaXRpb25hbGx5LCB0aGUgQ0NGIGRldGVybWluZXMgdGhlIGJlc3QgYW5j
ZXN0b3IgYmFzZWQgb24gaG93IGNsb3NlCj4+Pj4+Pj4gaXRzIHJhdGUgaXMgdG8gdGhlIGdpdmVu
IG9uZSwgYmFzZWQgb24gYXJpdGhtZXRpYyBjYWxjdWxhdGlvbnMuIEhvd2V2ZXIsCj4+Pj4+Pj4g
d2UgaGF2ZSBpbmRlcGVuZGVudCBrbm93bGVkZ2UgdGhhdCBhIGNlcnRhaW4gY2xvY2sgd291bGQg
YmUgYmV0dGVyLCB3aXRoCj4+Pj4+Pj4gbGVzcyBqaXR0ZXIgYW5kIGZld2VyIGludGVybWVkaWFy
aWVzLCB3aGljaCB3aWxsIGxpa2VseSBpbXByb3ZlIGVuZXJneQo+Pj4+Pj4+IGVmZmljaWVuY3ku
IFNhZGx5LCB0aGUgQ0NGIGNhbm5vdCB0YWtlIHRoaXMgaW50byBhY2NvdW50Lgo+Pj4+Pj4gSSBh
Z3JlZSB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBDQ0YgaXMgZmFpcmx5IHNpbXBsZS4gVGhl
cmUncyB3YXlzCj4+Pj4+PiB0byB0cmljayBpdCB0aG91Z2g6IElJUkMgaWYgdGhlcmUgYXJlIG11
bHRpcGxlIGVxdWFsbHkgc3VpdGFibGUgY2xvY2tzCj4+Pj4+PiBpdCBwaWNrcyB0aGUgZmlyc3Qg
b25lLiBGb3IgbWUgYWxsIG9mIHRoaXMgaGFzIHdvcmtlZCBzbyBmYXIgd2hpY2ggaXMKPj4+Pj4+
IHdoYXQgbWFrZXMgbWUgY3VyaW91cyBpbiB0aGlzIGNhc2UgKG5vdCBzYXlpbmcgdGhhdCBhbnl0
aGluZyBpcyB3cm9uZwo+Pj4+Pj4gd2l0aCB5b3VyIGFwcHJvYWNoKS4KPj4+Pj4+Cj4+Pj4+PiBE
byB5b3UgaGF2ZSBhIChyZWFsIHdvcmxkKSBleGFtcGxlIHdoZXJlIHRoZSBSVEMgY2xvY2sgc2hv
dWxkIGJlCj4+Pj4+PiBwcmVmZXJyZWQgb3ZlciBhbm90aGVyIGNsb2NrPwo+Pj4+Pj4KPj4+Pj4g
WWVzLCBhIHJlYWwtbGlmZSBleGFtcGxlIGlzIHRoZSBuZWVkIGZvciBhIDMyS2h6IGNsb2NrIGZv
ciBhbiBleHRlcm5hbAo+Pj4+PiB3aWZpIGNoaXAuIFRoZXJlIGlzIG9uZSBvcHRpb24gdG8gcHJv
dmlkZSB0aGlzIGNsb2NrIHdpdGggaGlnaAo+Pj4+PiBwcmVjaXNpb24sIHdoaWNoIGlzIFJUQyAr
IEdFTkNMSy4KPj4+Pj4KPj4+Pj4+IEknbSB0aGlua2luZyBhYm91dCB0aGUgZm9sbG93aW5nIHNj
ZW5hcmlvLgo+Pj4+Pj4gUFdNIHBhcmVudHM6Cj4+Pj4+PiAtIFhUQUw6IDI0TUh6Cj4+Pj4+PiAt
IHN5czogbm90IHN1cmUgLSBsZXQncyBzYXkgMTY2LjY3TUh6Cj4+Pj4+PiAtIFJUQzogMzJrSHoK
Pj4+Pj4+Cj4+Pj4+PiBUaGVuIGFmdGVyIHRoYXQgdGhlcmUncyBhIGRpdmlkZXIgYW5kIGEgZ2F0
ZS4KPj4+Pj4+Cj4+Pj4+PiBMZXQncyBzYXkgdGhlIFBXTSBjb250cm9sbGVyIG5lZWRzIGEgMU1I
eiBjbG9jazogaXQgY2FuIHRha2UgdGhhdCBmcm9tCj4+Pj4+PiBYVEFMIG9yIHN5cy4gU2luY2Ug
WFRBTCBpcyBldmVubHkgZGl2aXNpYmxlIHRvIDFNSHogQ0NGIHdpbGwgcGljayB0aGF0Cj4+Pj4+
PiBhbmQgdXNlIHRoZSBkaXZpZGVyLgo+Pj4+Pj4gQnV0IGxldCdzIHNheSB0aGUgUFdNIGNvbnRy
b2xsZXIgbmVlZHMgYSAzMmtIeiBjbG9jazogQ0NGIHdvdWxkCj4+Pj4+PiBhdXRvbWF0aWNhbGx5
IHBpY2sgdGhlIFJUQyBjbG9jay4KPj4+Pj4+IFNvIGlzIHlvdXIgaW1wbGVtZW50YXRpb24gdGhl
cmUgdG8gY292ZXIgbGV0J3Mgc2F5IDFrSHogd2hlcmUKPj4+Pj4+IG1hdGhlbWF0aWNhbGx5IDI0
TUh6IGNhbiBiZSBkaXZpZGVkIGV2ZW5seSB0byAxa0h6IChhbmQgdGh1cyBzaG91bGQKPj4+Pj4+
IG5vdCByZXN1bHQgaW4gYW55IGppdHRlcikgYnV0IFJUQyBnaXZlcyBiZXR0ZXIgcHJlY2lzaW9u
IGluIHRoZSByZWFsCj4+Pj4+PiB3b3JsZCAoZXZlbiB0aG91Z2ggaXQncyBvZmYgYnkgMjRIeik/
Cj4+Pj4+Pgo+Pj4+PiBJIGRvbid0IHRoaW5rIHNvLiBUaGUgaGlnaGVzdCBwcmVjaXNpb24gdGhh
dCBSVEMgY2FuIHByb3ZpZGUgaXMgZnJvbSBhCj4+Pj4+IDMyS0h6IHJhdGUgb25seS4gSG93ZXZl
ciwgSSBiZWxpZXZlIHRoYXQgYSAxa0h6IGZyZXF1ZW5jeSBjYW4gYWxzbyBiZQo+Pj4+PiBhY2hp
ZXZlZCBieSB1c2luZyB4dGFsIDI0TUh6IHdpdGggYSBkaXZpZGVyLCB3aGljaCBjYW4gcHJvdmlk
ZSBoaWdoCj4+Pj4+IHByZWNpc2lvbiBhcyB3ZWxsLgo+Pj4+IFRoYW5rIHlvdSBhZ2FpbiBmb3Ig
dGhlIGdyZWF0IGRpc2N1c3Npb24gb24gSVJDIHRvZGF5Lgo+Pj4+IEhlcmUncyBteSBzaG9ydCBz
dW1tYXJ5IHNvIEkgZG9uJ3QgZm9yZ2V0IGJlZm9yZSB5b3UnbGwgZm9sbG93IHVwIG9uIHRoaXMu
Cj4+Pj4KPj4+PiBJbiBnZW5lcmFsIHRoZXJlJ3MgdHdvIGtub3duIGNhc2VzIHdoZXJlIHRoZSBS
VEMgY2xvY2sgbmVlZHMgdG8gYmUgdXNlZDoKPj4+PiBhKSBXaGVuIHVzaW5nIHRoZSBHRU5DTEsg
b3V0cHV0IG9mIHRoZSBTb0MgdG8gb3V0cHV0IHRoZSAzMmtIeiBSVEMKPj4+PiBjbG9jayBhbmQg
Y29ubmVjdCB0aGF0IHRvIGFuIFNESU8gV2lGaSBjaGlwIGNsb2NrIGlucHV0ICh0aGlzIHNlZW1z
Cj4+Pj4gdXNlZnVsIGluIG15IHVuZGVyc3RhbmRpbmcgYmVjYXVzZSB0aGUgUlRDIGNsb2NrIHBy
b3ZpZGVzIGhpZ2gKPj4+PiBwcmVjaXNpb24pCj4+Pj4gYikgV2hlbiB1c2luZyB0aGUgUFdNIGNv
bnRyb2xsZXIgdG8gb3V0cHV0IGEgMzJrSHogY2xvY2sgc2lnbmFsLiBJbgo+Pj4+IHRoaXMgY2Fz
ZSBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdXNpbmcgdGhlIFJUQyBjbG9jayBhcyBpbnB1dCB0
byB0aGUKPj4+PiBQV00gY29udHJvbGxlciByZXN1bHRzIGluIHRoZSBiZXN0IHBvc3NpYmxlIHNp
Z25hbAo+Pj4+Cj4+Pj4gVGhlIHNlY29uZCBjYXNlIHdvbid0IGJlIHN1cHBvcnRlZCB3aXRoIEhl
aW5lcidzIHBhdGNoZXMgWzBdIHRoYXQgdXNlCj4+Pj4gQ0NGIChjb21tb24gY2xvY2sgZnJhbWV3
b3JrKSBpbiB0aGUgUFdNIGNvbnRyb2xsZXIgZHJpdmVyLgo+Pj4+IEluIHRoaXMgc2VyaWVzIHRo
ZSBwYXJlbnQgY2xvY2sgaXMgY2FsY3VsYXRlZCB1c2luZzoKPj4+PiAgICBmcmVxID0gZGl2NjRf
dTY0KE5TRUNfUEVSX1NFQyAqICh1NjQpMHhmZmZmLCBwZXJpb2QpOwo+Pj4+Cj4+Pj4gQSAzMmtI
eiBjbG9jayBtZWFucyBhIFBXTSBwZXJpb2Qgb2YgMzA1MThucy4gU28gd2l0aCB0aGUgYWJvdmUK
Pj4+IFRvIGJlIHByZWNpc2U6IDMwNTE3LDU3ODEyNW5zCj4+PiBXaGF0IG1lYW5zIHRoYXQgdGhl
IFBXTSBmcmFtZXdvcmsgY2FuJ3Qgc2F5ICJJIHdhbnQgMzI3NjhIeiIsCj4+PiBidXQganVzdCAi
SSB3YW50IHNvbWV0aGluZyBiZWluZyB2ZXJ5IGNsb3NlIHRvIDMyNzY4SHoiLgo+Pj4gU28gd2hh
dCB5b3UgbmVlZCBpcyBzb21lIHNpbXBsZSBoZXVyaXN0aWMgdG8gaW50ZXJwcmV0IHRoZQo+Pj4g
UFdNIHJlcXVlc3QgLT4gIlBXTSByZXF1ZXN0cyAzMDUxOG5zLCBidXQgc3VwcG9zZWRseSBpdCB3
YW50cwo+Pj4gMzI3NjhIeiIKPj4+Cj4+PiBOU0VDX1BFUl9TRUMgLyAzMDUxOCA9IDMyNzY3IChy
b3VuZGVkIGRvd24gZnJvbSAzMjc2Nyw1NDcpCj4+PiBjbGtfcm91bmRfcmF0ZShjaGFubmVsLT5j
bGssIDMyNzY3KSB3b3VsZCByZXR1cm4gMCAoSSAqdGhpbmsqKSwKPj4+IGJlY2F1c2UgaXQgdHJp
ZXMgdG8gZmluZCB0aGUgbmV4dCBsb3dlciBjbG9jay4KPj4+Cj4+PiBUaGUgU29DIGZhbWlsaWVz
IEknbSBmYW1pbGlhciB3aXRoIGhhdmUgZmNsa2luMiBhcyBQV00gcGFyZW50Lgo+Pj4gVGhhdCdz
IDEgR0h6IGluIG15IGNhc2UsIHdoYXQgcmVzdWx0cyBpbiBhIGZyZXF1ZW5jeSBvZiAzMi43Njcs
NTQ3SHoKPj4+IGZvciBwZXJpb2QgPSAzMDUxOG4uCj4+PiBXaGF0IHlvdSdyZSBzYXlpbmcgaXMg
dGhhdCBuZXdlciBnZW5lcmF0aW9ucyBkb24ndCBoYXZlIFBXTSBwYXJlbnRzCj4+Pj4gMjRNSHog
YW55IGxvbmdlcj8KPj4gTm8sIG9mIGNvdXJzZSBub3QuIEZvciBleGFtcGxlLCBhIGZpeGVkIFBM
TCAod2l0aCBhbGwgZmNsa19kaXZYCj4+IHNldHRpbmdzKSBoYXMgcmF0ZXMgaGlnaGVyIHRoYW4g
MjRNSHouIEhvd2V2ZXIsIHdlIG5lZWQgdG8gY29uc2lkZXIgdGhlCj4+ICdoZWF2eScgYmFja2dy
b3VuZCBvZiBzdWNoIFBXTS4KPj4KPj4gSG93ZXZlciwgd2UgaGF2ZSBhICJsaWdodHdlaWdodCIg
Y2xraW4gKHNwZWNpYWwgcnRjMzJrKSB3aXRoIGEgcmF0ZSBvZgo+PiAzMmtIeiB0aGF0IHdlIGNv
dWxkIHBvdGVudGlhbGx5IHVzZSBhcyBhbiBpbnB1dCB0byBwcm9kdWNlIGEgMzJrSHoKPj4gb3V0
cHV0IG9uIHRoZSBQV00gbGluZXMuIEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gd2h5IHdlIHNob3Vs
ZCBub3QKPj4gc3VwcG9ydCBzdWNoIHNwZWNpYWwgY2FzZXMuCj4+Cj4gVHdvIG1vcmUgdGhpbmdz
IHRvIGNvbnNpZGVyOgo+IDEuIFdoZW4gd2FudGluZyBhIDMya0h6ICh3ZWxsLCAzMjc2OEh6KSBv
dXRwdXQgd2l0aCBhIDUwJSBkdXR5IGN5Y2xlLAo+ICAgICB0aGVuIHdlIG5lZWQgaGk9MCBhbmQg
bG89MCB3aXRoIGEgNjRrSHogaW5wdXQgY2xvY2suCj4gICAgIFNlZSBwb2ludCAyIGZvciBhbiBl
eHBsYW5hdGlvbiBvZiB3aHkgMCBhbmQgbm90IDEuCj4gICAgIE1lYW5zIHdlIGNvdWxkbid0IHVz
ZSB0aGUgUlRDIGlucHV0IGNsb2NrLiBEaWQgeW91IGNvbnNpZGVyIHRoaXM/Cj4gICAgIE9yIGRv
IEkgbWlzcyBzb21ldGhpbmc/Cj4gMi4gU2VlbXMgdGhlIFBXTSBibG9jayBpbnRlcm5hbGx5IGlu
Y3JlbWVudHMgaGkgYW5kIGxvLCBleGNlcHQgdGhlCj4gICAgIGNvbnN0YW50X2VuIGJpdCBpcyBz
ZXQgb24gbmV3ZXIgUFdNIGJsb2NrIHZlcnNpb25zLgo+ICAgICBGb3IgYmlnZ2VyIGNudCB2YWx1
ZXMgdGhlIGltcGFjdCBpcyBuZWdsaWdpYmxlLCBidXQgZm9yIHZlcnkgc21hbGwKPiAgICAgdmFs
dWVzIGl0J3Mgc29tZXRoaW5nIHdlIGhhdmUgdG8gY29uc2lkZXIuCj4gICAgIFRoaXMgd2FzIG9u
ZSBhZGRpdGlvbmFsIG1vdGl2YXRpb24gZm9yIG1lIHRvIGNob29zZSBhbiBpbnB1dAo+ICAgICBm
cmVxdWVuY3kgdGhhdCBjcmVhdGVzIGJpZyBjbnQgdmFsdWVzLgo+CkhlbGxvIEhlaW5lcgoKQXMg
SSBtZW50aW9uZWQgZWFybGllciBJIGhhdmUgc29tZSBjaGFuZ2VzIHRvIHRha2UgaW50byBhY2Nv
dW50IGxvIGFuZCBoaSByZWdzIGluY3JlbWVudGluZy4KCkJ1dCBpdCdzIG1vcmUgY29udmVuaWVu
dCB0byBiYXNlIG15IHBhdGNoIG9uIHRvcCBvbiBvbmUgb2YgeW91cnMgKGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjNmZTYyNWUtZGMyMy00ZGI4LTNkY2UtODMxNjdjZDNi
MjA2QGdtYWlsLmNvbS8pCgpJcyB0aGF0IG9rIGlmIEkgcmVzZW5kIHlvdXIgcGF0Y2ggYWxvbmcg
d2l0aCBtaW5lIGluIHNlcmllcz8KCkJlc3QgcmVnYXJkcwpHZW9yZ2UKCj4+Pgo+Pj4+IGNhbGN1
bGF0aW9uIHRoZSBQV00gZHJpdmVyIGlzIGFza2luZyBmb3IgYSBjbG9jayByYXRlIG9mID49MkdI
ei4KPj4+PiBXZSBjb25jbHVkZWQgdGhhdCBsZXR0aW5nIHRoZSBjb21tb24gY2xvY2sgZnJhbWV3
b3JrIGNob29zZSB0aGUgYmVzdAo+Pj4+IHBvc3NpYmxlIHBhcmVudCAobWVhbmluZzogcmVtb3Zp
bmcgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5UIGhlcmUpIGNhbgo+Pj4+IGJlIGEgd2F5IGZvcndh
cmQuCj4+Pj4gQnV0IHRoaXMgbWVhbnMgdGhhdCB0aGUgUFdNIGNvbnRyb2xsZXIgZHJpdmVyIG11
c3QgdHJ5IHRvIGZpbmQgdGhlCj4+Pj4gYmVzdCBwb3NzaWJsZSBwYXJlbnQgc29tZWhvdy4gVGhl
IGVhc2llc3Qgd2F5IHdlIGNhbWUgdXAgd2l0aAo+Pj4+IChwc2V1ZG8tY29kZSk6Cj4+Pj4gICAg
ZnJlcSA9IE5TRUNfUEVSX1NFQyAvIHBlcmlvZDsKPj4+PiAgICBmaW5fZnJlcSA9IGNsa19yb3Vu
ZF9yYXRlKGNoYW5uZWwtPmNsaywgZnJlcSk7Cj4+Pj4gICAgaWYgKGZpbl9mcmVxICE9IGZyZXEp
IHsKPj4+PiAgICAgIGZyZXEgPSBkaXY2NF91NjQoTlNFQ19QRVJfU0VDICogKHU2NCkweGZmZmYs
IHBlcmlvZCk7Cj4+Pj4gICAgICBmaW5fZnJlcSA9IGNsa19yb3VuZF9yYXRlKGNoYW5uZWwtPmNs
aywgZnJlcSk7Cj4+Pj4gICAgfQo+Pj4+Cj4+Pj4gVGhlIGlkZWEgaXM6IGZvciBhIHJlcXVlc3Rl
ZCAzMmtIeiBzaWduYWwgdGhlIFBXTSBwZXJpb2QgaXMgMzA1MThucy4KPj4+PiBUaGUgdXBkYXRl
ZCBsb2dpYyB3b3VsZCBmaW5kIHRoYXQgdGhlcmUncyBhIG1hdGNoaW5nIGNsb2NrIGlucHV0IGFu
ZAo+Pj4+IHVzZSB0aGF0IGRpcmVjdGx5LiBJZiBub3Q6IHVzZSB0aGUgb3JpZ2luYWwgbG9naWMg
YXMgc3VnZ2VzdGVkIGJ5Cj4+Pj4gSGVpbmVyLgo+Pj4+Cj4+Pj4KPj4+PiBCZXN0IHJlZ2FyZHMs
Cj4+Pj4gTWFydGluCj4+Pj4KPj4+Pgo+Pj4+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1hbWxvZ2ljLzlmYWNhMmU2LWI3YTEtNDc0OC03ZWIwLTQ4ZjgwNjRlMzIzZUBnbWFpbC5j
b20vCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
