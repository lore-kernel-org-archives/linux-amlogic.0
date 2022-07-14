Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A666C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jul 2022 03:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgXSb9VmxRQSlfGs6KUfal8WyzInvbfIJ2jjS2KCuyU=; b=aSBRc/5eVrHmj7
	5fW5t+gOHFN2ijqILdUGHUVlZ1i/2QfIaFaX3NXfLYucnCpqBeBfQbpwZjiNhp+num+9UbhhIq5pt
	d0JMj7KyYo0wCIOVJ2JY9z5J+eRK2QJ3AnG4Gbs8tTwKvuaXOcFZ8ly51gwFLydLAA3vWDV7Drkr7
	/xHu0ddmjy30R+t1llrfNxj5yTMDXTri6hcQzpiAvrrA03eNAk5vo8x0wDuxY0uj3MfL2IwZNlEiA
	zqVFdgUvpAcpXLaw6CvL2lt3eoyyD2XeQVxIo8y7WOi4gUlU7Sn1uYLh9bPfpCfl+20DDx3Np1WQD
	5ULgBULNT2X4QFUx3Rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBpRO-00AHU0-Fl; Thu, 14 Jul 2022 03:23:02 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBpRD-00AHOv-I8; Thu, 14 Jul 2022 03:22:53 +0000
Received: from [10.88.19.41] (10.88.19.41) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2176.2; Thu, 14 Jul 2022 11:22:42 +0800
Message-ID: <6543a75a-fd9f-7395-70b2-15a19d872339@amlogic.com>
Date: Thu, 14 Jul 2022 11:22:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 4/4] dt-binding:perf: Add Amlogic DDR PMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
 <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
 <1aa8e9aa-8cb3-8537-6d65-dd9441d5ee07@linaro.org>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <1aa8e9aa-8cb3-8537-6d65-dd9441d5ee07@linaro.org>
X-Originating-IP: [10.88.19.41]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_202251_641538_28EA00E1 
X-CRM114-Status: GOOD (  16.51  )
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

VGhhbmtzIGZvciB5b3VyIHRpbWUgXl4uCgpPbiA3LzEyLzIwMjIgMzoxNSBQTSwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+IE9uIDEyLzA3LzIwMjIg
MDg6MzYsIEppdWNoZW5nIFh1IHdyb3RlOgo+PiBBZGQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZv
ciB0aGUgQW1sb2dpYyBHMTIgc2VyaWVzIEREUgo+PiBwZXJmb3JtYW5jZSBtb25pdG9yIHVuaXQu
Cj4gWW91IG5lZWQgdG8gZml4IHN1YmplY3QgLSB1c2UgYSBwcmVmaXggbWF0Y2hpbmcgc3Vic3lz
dGVtLiBTcGFjZSBhZnRlcgo+IGVhY2ggJzonLgpJIHdpbGwgbWFrZSB0aGUgY2hhbmdlLgo+Cj4+
IFNpZ25lZC1vZmYtYnk6IEppdWNoZW5nIFh1IDxqaXVjaGVuZy54dUBhbWxvZ2ljLmNvbT4KPj4g
LS0tCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9hbWwtZGRyLXBtdS55YW1sIHwg
NTEgKysrKysrKysrKysrKysrKysrKwo+PiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlv
bnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BlcmYvYW1sLWRkci1wbXUueWFtbAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvYW1sLWRkci1wbXUueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL2FtbC1kZHItcG11LnlhbWwKPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNTg2YjRhYjQwMDkKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVy
Zi9hbWwtZGRyLXBtdS55YW1sCj4gRmlsZW5hbWU6IGFtbCxnMTItZGRyLXBtdS55YW1sCkkgd2ls
bCBtYWtlIHRoZSBjaGFuZ2UuCj4KPj4gQEAgLTAsMCArMSw1MSBAQAo+PiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAx
LjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9wZXJmL2Ft
bC1kZHItcG11LnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEFtbG9naWMgRzEyIEREUiBwZXJmb3Jt
YW5jZSBtb25pdG9yCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIEppdWNoZW5nIFh1IDxq
aXVjaGVuZy54dUBhbWxvZ2ljLmNvbT4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0
aWJsZToKPj4gKyAgICBvbmVPZjoKPj4gKyAgICAgIC0gZW51bToKPj4gKyAgICAgICAgICAtIGFt
bCxnMTItZGRyLXBtdQo+PiArICAgICAgLSBpdGVtczoKPj4gKyAgICAgICAgICAtIGVudW06Cj4+
ICsgICAgICAgICAgICAgIC0gYW1sLGcxMi1kZHItcG11Cj4+ICsgICAgICAgICAgLSBjb25zdDog
YW1sLGcxMi1kZHItcG11Cj4gVGhpcyBkb2VzIG5vdCBtYWtlIGFueSBzZW5zZS4gV2h5IGRvIHlv
dSB1c2UgdHdvIGNvbXBhdGlibGVzCj4gImFtbCxnMTItZGRyLXBtdSIsICJhbWwsZzEyLWRkci1w
bXUiIGFmdGVyIGVhY2ggb3RoZXI/ClNvcnJ5LCBJIHRoaW5rIEkgaGF2ZSBhIHdyb25nIHVuZGVy
c3RhbmRpbmcuIEkgd2lsbCBtYWtlIHRoZSBjaGFuZ2UuCj4KPj4gKwo+PiArICByZWc6Cj4+ICsg
ICAgbWF4SXRlbXM6IDIKPiBZb3UgbmVlZCB0byBkZXNjcmliZSB0aGUgaXRlbXMuCkkgd2lsbCBt
YWtlIHRoZSBjaGFuZ2UuCj4KPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1z
OiAxCj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSBtb2RlbAo+
PiArICAtIGRtY19ucgo+PiArICAtIGNoYW5uX25yCj4gSG93IHRoZXNlIGVuZGVkIHVwIGhlcmU/
Cj4gTm8gdW5kZXJzY29yZXMuCkkgd2lsbCBtYWtlIHRoZSBjaGFuZ2UuCj4KPj4gKyAgLSByZWcK
Pj4gKyAgLSBpbnRlcnJ1cHRzCj4+ICsgIC0gaW50ZXJydXB0LW5hbWVzCj4gQWxzbyBzb21ldGhp
bmcgbmV3LiBOby4KSSB3aWxsIG1ha2UgdGhlIGNoYW5nZS4KPgo+PiArCj4+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgICAg
ICAgIGRkcl9wbXU6IGRkcl9wbXUgewo+IFdyb25nIGluZGVudGF0aW9uLiA0IHNwYWNlcyBmb3Ig
RFRTIGV4YW1wbGUuCj4KPiBHZW5lcmljIG5vZGUgbmFtZSwgc28gInBtdSIsIG5vIHVuZGVyc2Nv
cmVzIGluIG5vZGUgbmFtZXMuCk9rYXksIEkgd2lsbCBtYWtlIHRoZSBjaGFuZ2UuCj4KPj4gKyAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxnMTItZGRyLXBtdSI7Cj4+ICsg
ICAgICAgICAgICAgICAgICBtb2RlbCA9ICJnMTJhIjsKPj4gKyAgICAgICAgICAgICAgICAgIGRt
Y19uciA9IDwxPjsKPj4gKyAgICAgICAgICAgICAgICAgIGNoYW5uX25yID0gPDQ+Owo+IFRoaXMg
ZG9lcyBub3QgcGFzcyB0aGUgdGVzdC4gUGxlYXNlIGRvIG5vdCBzZW5kIHVudGVzdGVkIGJpbmRp
bmdzLgoKU29ycnkswqAgZHVlIHRvIHNvbWUgcHJvYmxlbXMsIEkgZ290IHdyb25nIHBhdGNoIHNl
bnQuIEkgd2lsbCBtYWtlIHRoZSAKY2hhbmdlLgoKClRoYW5rcyAmIEJlc3QgUmVnYXJkcywKCkpp
dWNoZW5nCgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
