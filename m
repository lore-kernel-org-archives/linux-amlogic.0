Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB979C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOzHHaGIOZhQslFspfALITLFLS6APAx4nyyw0l+e+OQ=; b=SHM9BCqTX2Pvs3
	QlqznwyEzzrgmr+NjVnzRtLOBIn5dQWABXyFSzPfI9dW/SqhwzGJEPEH6VB2r5c5jzETvG26e+thw
	l+4fWc3PoFFvf1jiIJhwcnYzlhPTOR/iyRL3tgYIkhXcD5htXG6ZOkBOQv3iJd15b7NSPdP+mm9rt
	1G09a1kvRHDYrs0tb6CeNfw/8aypV2TmnbVgCEd5RckQFQBTyQx8GHM54bHH1uZzj1gZobtWuBvBm
	W58Cir3XSIrbuITG++BT6gz15k19Q68pNxwSLLPyaZfX2YVk6r1Ke7B2q0DlH0rZZl5L79RaLa6N9
	c4Nt0o6uZum5fBk25pew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqj3-0001kZ-UE; Wed, 23 Nov 2022 14:27:45 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqip-0001cm-1v; Wed, 23 Nov 2022 14:27:32 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 22:27:28 +0800
Message-ID: <3d657951-cbdf-07d6-4c73-7650381695a5@amlogic.com>
Date: Wed, 23 Nov 2022 22:27:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
 <7f3a34a0-a5b0-3a72-8e0e-00656bd77ff6@linaro.org>
 <2153a111-d5f0-94cf-9cfc-f8ce4b084a1c@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <2153a111-d5f0-94cf-9cfc-f8ce4b084a1c@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062731_115758_98965A94 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDIyLzExLzIzIDIyOjIxLCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIDIzLzExLzIwMjIgMTU6MTMsIEtyenlzenRvZiBL
b3psb3dza2kgd3JvdGU6Cj4+IE9uIDIzLzExLzIwMjIgMTQ6MjcsIE5laWwgQXJtc3Ryb25nIHdy
b3RlOgo+Pj4gT24gMjMvMTEvMjAyMiAxMToxMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
Pj4+PiBPbiAyMy8xMS8yMDIyIDAzOjEzLCBZdSBUdSB3cm90ZToKPj4+Pj4gQWRkZWQgaW5mb3Jt
YXRpb24gYWJvdXQgdGhlIFM0IFNPQyBQZXJpcGhlcmFsIENsb2NrIGNvbnRyb2xsZXIgaW4gRFQu
Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+
Pj4gLS0tCj4+Pj4+IMKgwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0
c2kgfCAyNiAKPj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysKPj4+Pj4gwqDCoCAxIGZpbGUg
Y2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgCj4+Pj4+IGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPj4+Pj4gaW5kZXggYmQ5YzJlZjgzMzE0Li5l
N2ZhYjZlNDAwYmUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1zNC5kdHNpCj4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1zNC5kdHNpCj4+Pj4+IEBAIC02LDYgKzYsOCBAQAo+Pj4+PiDCoMKgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPj4+Pj4gwqDCoCAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+Pj4+PiDCoMKg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPj4+Pj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLmg+Cj4+Pj4+IMKgwqAg
LyB7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBjcHVzIHsKPj4+Pj4gQEAgLTEwMCw2ICsxMDIsMzAgQEAg
Y2xrY19wbGw6IGNsb2NrLWNvbnRyb2xsZXJAODAwMCB7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MT47Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrY19w
ZXJpcGhzOiBjbG9jay1jb250cm9sbGVyIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsczQtcGVyaXBoZXJhbHMtY2xrYyI7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDAgMHgwIDB4NDlj
PjsKPj4+Pgo+Pj4+IFRoaXMgaXMgYnJva2VuLi4uIGRpZCB5b3UgY2hlY2sgZm9yIHdhcm5pbmdz
Pwo+Pj4KPj4+IFRoaXMgaXMgYWN0dWFsbHkgZmluZSwgdGhlIHBhcmVudCBub2RlIGhhcyBhIHJh
bmdlcyBwcm9wZXJ0eToKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9i
L2ViNzA4MTQwOWY5NGE5YTg2MDg1OTNkMGZiNjNhMWFhM2Q2Zjk1ZDgvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kjTDkzIAo+Pj4KPj4KPj4gVGhlIHBhcmVudCByYW5n
ZXMgZG8gbm90IGNoYW5nZSBoZXJlIGFueXRoaW5nLiBZb3UgY2Fubm90IGhhdmUgYSByZWcKPj4g
d2l0aG91dCB1bml0IGFkZHJlc3MgYW5kIHRoZSB0b29scyByZXBvcnQgaXQuIE5vIG5lZWQgdG8g
dXNlIHJldmlld2Vycwo+PiBmb3IgdGhpcy4uLgo+IAo+IE9oIEkgc2VlIG5vdywgSSBzaW1wbHkg
bG9va2VkIGF0IHRoZSByZWcgcHJvcGVydHksIG5vdCB0aGUgdW5pdCBhZGRyZXNzLgo+IAo+IFNv
cnJ5IGluZGVlZCBpdCdzIHdyb25nIGFuZCBEVEMgc2hvdWxkIGNvbXBsYWluLgo+IAo+IFl1LCB5
b3Ugc2hvdWxkIHByb2JhYmx5IHVwZGF0ZSB5b3VyIERUQyB2ZXJzaW9uLgoKT2theS4KCj4gCj4g
TmVpbAo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlzenRvZgo+Pgo+IAo+IC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
