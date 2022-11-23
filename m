Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81959C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mReXKzEkK5p0QAnciiEK1zTWSQBN2+f21SuzjROlGOw=; b=YB2IwwNZAn2TTD
	+746QCQVB9OHmCXwUQPjncx7XOXUVUPFKAnKiSQARjHloM/c9h6BTIE0Fc6mwKcML27eXCUUCY6+w
	aI6Ed2qrO0u52OAea+PqE2AbFH9dUek1LWGDk4vsAdUnCLZl5x151I/3uqEjMVp2V5FKRqI76uHEs
	ljcOaY7QqVPUXb6FeGpk+r5QKYOI8/bAtNIthI9nVc7MipCEubjc1sk26Ey5PdrYPSZ5CRFjEHlup
	hg26RecAKZEqqHDdzCVEhpBkdTPfK2CMTLD8AcCV6W0HcBHQhz7Jx8LV9xveXYKXAFjBcXJTZe680
	ZS0SNfAoKl0MuEVBz4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpxc-00HJ3T-42; Wed, 23 Nov 2022 13:38:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpxQ-00HIxy-Az; Wed, 23 Nov 2022 13:38:33 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 21:38:29 +0800
Message-ID: <8091c596-7700-8603-e8e9-9bad4603fa14@amlogic.com>
Date: Wed, 23 Nov 2022 21:38:28 +0800
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
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <9961d579-9463-c585-34a6-a3abcd4b3e52@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_053832_395830_EEEDD08F 
X-CRM114-Status: UNSURE (   8.16  )
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

SGkgTmVpbCwKCVRoYW5rcyBmb3IgeW91ciByZXBseSBhbmQgZXhwbGFuYXRpb24uCgpPbiAyMDIy
LzExLzIzIDIxOjI3LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0K
PiAKPiBPbiAyMy8xMS8yMDIyIDExOjEwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBP
biAyMy8xMS8yMDIyIDAzOjEzLCBZdSBUdSB3cm90ZToKPj4+IEFkZGVkIGluZm9ybWF0aW9uIGFi
b3V0IHRoZSBTNCBTT0MgUGVyaXBoZXJhbCBDbG9jayBjb250cm9sbGVyIGluIERULgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gwqAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgfCAyNiArKysrKysrKysr
KysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0
c2kgCj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+PiBp
bmRleCBiZDljMmVmODMzMTQuLmU3ZmFiNmU0MDBiZSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4+PiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+Pj4gQEAgLTYsNiArNiw4IEBACj4+PiDCoCAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4+PiDCoCAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+Pj4g
wqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+Pj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmg+Cj4+PiArI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGVyaXBoZXJhbHMtY2xrYy5oPgo+Pj4gwqAgLyB7Cj4+
PiDCoMKgwqDCoMKgIGNwdXMgewo+Pj4gQEAgLTEwMCw2ICsxMDIsMzAgQEAgY2xrY19wbGw6IGNs
b2NrLWNvbnRyb2xsZXJAODAwMCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICNjbG9jay1jZWxscyA9IDwxPjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtjX3BlcmlwaHM6IGNsb2NrLWNvbnRyb2xs
ZXIgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFt
bG9naWMsczQtcGVyaXBoZXJhbHMtY2xrYyI7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlZyA9IDwweDAgMHgwIDB4MCAweDQ5Yz47Cj4+Cj4+IFRoaXMgaXMgYnJva2VuLi4u
IGRpZCB5b3UgY2hlY2sgZm9yIHdhcm5pbmdzPwo+IAo+IFRoaXMgaXMgYWN0dWFsbHkgZmluZSwg
dGhlIHBhcmVudCBub2RlIGhhcyBhIHJhbmdlcyBwcm9wZXJ0eToKPiBodHRwczovL2dpdGh1Yi5j
b20vdG9ydmFsZHMvbGludXgvYmxvYi9lYjcwODE0MDlmOTRhOWE4NjA4NTkzZDBmYjYzYTFhYTNk
NmY5NWQ4L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpI0w5MyAKPiAK
PiAKPiBOZWlsCj4gCj4+Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+Cj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMKPiAKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
