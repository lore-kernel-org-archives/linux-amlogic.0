Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EEBEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqiMRJWHVeMsbE1l6Cj0RTD63Gq+R0QZXIb+q2X+NEk=; b=1a/9p0hxlrwva9
	FZmHTpph+1Ee2Sw3LM4wg6e5otgtdDY2bvZnt4rbwjhvAnNBLmwMQKd9xTNtLoz/Hb6aMXQ5gFwmr
	U/Gug4Y/z016JZWPNzgOjR4pepv4EI06fOUPiAj1BCCfCy6sfomedPZUXLm1GlydhzsENQLuOCCFO
	78RlKVc8yYoD9oYhdctZyOlodwwxKzn3WacAeQNmX0bkJieDLU3QXM/OyBa/i+RNM//a68eoUFxz5
	UBO209dy7gXldiYZtoyaDv9LTxxCB8nVkd7rKmxyFeRQ85cOTykLXeHml0N7VGglFa4TBH+qsmuOo
	P/hb9vp4jYFjhzv1r65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGb9m-00CXl9-2P;
	Tue, 04 Jul 2023 08:13:06 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGb9i-00CXkH-28;
	Tue, 04 Jul 2023 08:13:05 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 15CB010005F;
	Tue,  4 Jul 2023 11:12:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 15CB010005F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688458379;
	bh=7XFAwnT1ePpnDt0UOX9dZuZNHFe22x5+doAt9FfJ6NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=lawcqspTELUqfIg51s4v19RXsSKoj50AK06pYiWvdgIuaCn3udFR5Bn+vzge3ppVe
	 rJs313fdtqiV421M2znBnqrMt+EAp3OoGRJBXViKftcdjFZ+oIspVwq5XjA24TqtmD
	 z8G7RbdHwTJkD6l1yW886qWCIl34Zr3B4bkuUTFKpaL/avZ/69cugvI1ylLR4gDwmt
	 qgclgq/KCvd3IIn4BuyTTkqLjGu7YdWzRsuOed+/t+CPsvlWt5PlUI9JBkVqgz8k72
	 yWpY1MKlK0a21tisMcyqOhiQ6YQPPTC2Vdy+XAjYps616svcjH42UKa80xHox7x0y9
	 W2qAUXN3W3kPQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 11:12:58 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 11:12:50 +0300
Message-ID: <93dbcbb6-ee17-270c-328d-677e1e3338b3@sberdevices.ru>
Date: Tue, 4 Jul 2023 11:08:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/5] meson saradc: support reading from channel 7 mux
 inputs
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
 <20230627224017.1724097-6-gnstark@sberdevices.ru>
 <20230702172116.00006f33@Huawei.com>
 <CAFBinCCLt-o_QX0izmtzs8MA=ETMAhEib3KDr-6Z66n__GVkyA@mail.gmail.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <CAFBinCCLt-o_QX0izmtzs8MA=ETMAhEib3KDr-6Z66n__GVkyA@mail.gmail.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178412 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_011303_397906_C7FE1DC4 
X-CRM114-Status: GOOD (  18.40  )
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

SGVsbG8gTWFydGluLCBKb25hdGhhbgoKT24gNy8zLzIzIDIyOjM5LCBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIHdyb3RlOgo+IEhpIEpvbmF0aGFuLAo+IAo+IE9uIFN1biwgSnVsIDIsIDIwMjMgYXQgMTE6
MjHigK9BTSBKb25hdGhhbiBDYW1lcm9uCj4gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4g
d3JvdGU6Cj4gWy4uLl0KPj4+IEBAIC0yMzUsNiArMjQ5LDI3IEBAIGVudW0gbWVzb25fc2FyX2Fk
Y19jaGFubmVsX2luZGV4IHsKPj4+ICAgICAgICBOVU1fQ0hBTl83LAo+Pj4gICAgICAgIE5VTV9D
SEFOX1RFTVAsCj4+PiAgICAgICAgTlVNX0NIQU5fU09GVF9USU1FU1RBTVAsCj4+Cj4+IFNpbGx5
IHF1ZXN0aW9uLi4uIFdoeSBkb2VzIHRoaXMgZGV2aWNlIGhhdmUgdGltZXN0YW1wIGNoYW5uZWxz
Pwo+PiBJdCBoYXMgbm8gYnVmZmVyIHN1cHBvcnQgc28gdGhleSBkb24ndCAnZG8gYW55dGhpbmcn
Lgo+PiBJZiBpdCBoYWQgdGhlbiBwdXR0aW5nIG90aGVyIGNoYW5uZWxzIGFmdGVyIHRoYXQgbWln
aHQgaGF2ZSBicm9rZW4KPj4gdGhpbmdzIGlmIG5vdCBkb25lIHZlcnkgY2FyZWZ1bGx5IChoZW5j
ZSBJIHdlbnQgbG9va2luZykKPiBUaGlzIHF1ZXN0aW9uIGlzIHByb2JhYmx5IGZvciBtZSAobm90
IEdlb3JnZSkuCj4gVGhlIGFuc3dlciBpcyBzaW1wbGU6IHdoZW4gSSB3cm90ZSB0aGUgTWVzb24g
U0FSIEFEQyBkcml2ZXIgSSBsb29rZWQKPiBhdCB2YXJpb3VzIG90aGVyIGRyaXZlcnMgKGJ1dCBj
YW4ndCByZWNhbGwgd2hpY2ggb25lcyBleGFjdGx5KS4gT25lIG9mCj4gdGhlbSBwcm9iYWJseSB1
c2VkIGEgc29mdCB0aW1lc3RhbXAgY2hhbm5lbCBzbyBJIGFsc28gYWRkZWQgdGhhdCB0bwo+IG1l
c29uX3NhcmFkYy4gU2luY2UgIml0IGRpZG4ndCBicmVhayBhbnl0aGluZyIgSSB0aG91Z2h0IGl0
IHdvdWxkIGJlCj4gZmluZS4KPiAKPiBOZXdlciBTQVIgQURDIElQIGJsb2NrcyBoYXZlIGJ1ZmZl
ciBzdXBwb3J0LCBidXQgdGhhdCdzIG5vdAo+IGltcGxlbWVudGVkIGluIHRoZSBkcml2ZXIgKHll
dCkuCj4gU28gaWYgSSB1bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHkgd2UgY2FuIGRyb3AgdGhlIHNv
ZnQgdGltZXN0YW1wCj4gY2hhbm5lbCAod2l0aCBhIGRlZGljYXRlZCBwYXRjaCBpbiB0aGlzIHNl
cmllcyk/CgpPbmUgc2hvcnQgY29tbWVudDogbmV3bHktYWRkZWQgY2hhbm5lbHMgcHJvYmFibHkg
d29uJ3Qgc3VwcG9ydCBidWZmZXJpbmcgCmJlY2F1c2UgcGh5c2ljYWxseSB0aGV5IGFsbCBhcmUg
cmVhZCB0aHJ1IGNoYW5uZWw3LiBXZSdsbCBiZSBhYmxlIHRvIGFkZCAKYnVmZmVyaW5nIG9ubHkg
dG8gYmFzZSBvbGQgY2hhbm5lbHMgYW5kIHRoZXkgYXJlIHN0aWxsIGRlZmluZWQgYmVmb3JlCkNI
QU5fU09GVF9USU1FU1RBTVAgaW4gY2hhbm5lbCBhcnJheSAoaWYgdGhpcyBpcyB5b3UncmUgd2Fy
eSBhYm91dCkuCgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCi0tIApCZXN0IHJlZ2Fy
ZHMKR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
