Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FFCC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vn1GzWHE+JB/dbkI6C2Dqo4lkLqXBBdlvxiZDX8eP1U=; b=f+dTXgnIieeuKb
	BFkNk5UGdNMgHZghRcKBJm5A/DI+Teeey5eV+E+bi2LrdIllxhM8Zv8D2TCAVmci4kiELtdxIJTKj
	MOdeb6ML2GmUKZwmAGuE+ywYavI8BUnxNpHF4gVhLoskwMR+ctwJpqVmsoD0BJJ8bkGi+z+dDeAw7
	kkwpoNFaDDRNBIeAW/MYUjgNr8KkHAWvDcBryRTIekw9DZwvDAVaem3XpbXcER/vwMLX601bh3ORc
	VcG2DouxDCFED7VJDelhmGIRg8EPoqCCJToKNPvzQ7oMLtPldEWVvdUKSKxhdIDKF/CKE0QHdAowo
	oYSyWPewQcHnYsfliQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s32Je-00000000k3f-1gvS;
	Fri, 03 May 2024 23:27:46 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s32JZ-00000000k2x-3ocm;
	Fri, 03 May 2024 23:27:45 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 89D0B12000D;
	Sat,  4 May 2024 02:27:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 89D0B12000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714778853;
	bh=aqLgLmOfjg9tWRTqIW89TpjQRFOLV36kFW4nNXsy8JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=fl4HV5pCdGAVnzJc5bj322ihGtRGNMSbHUxQG4SJHrf0wMTZJo44yM1pMIDcp/xqo
	 pyHvyJLhuQ9rQtJZoOKnQQvW98ytoqEmwfYUcM6bp+yGWmEKLXOWNbIHpYM2Galgun
	 PLn+eZ1hipBGE69WeC8zIdQrAaJUg18lfpyMUdtT7gsUvi0NaxfADO+lCr/AV29qHY
	 W9LqFdPs4vi2QEXqme3macsDnW8EdJ16nu8t4Vv/CNwMYRE63MUjHGtYma++ZJvN40
	 yoksLU9AvnEAcBozU9sxyJ0KKFpcst51JEt+nbL0xqR0qmVsBIv/D0AyW0erXUFcKa
	 6/sHc3og6GF3g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat,  4 May 2024 02:27:33 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 4 May 2024 02:27:33 +0300
Message-ID: <80e41cb1-6ad9-436c-b5b0-2045e6a379b7@salutedevices.com>
Date: Sat, 4 May 2024 02:27:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
To: Junyi Zhao <junyi.zhao@amlogic.com>, <kelvin.zhang@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
 <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
 <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
 <d990d835-e4bb-4248-b17e-da8907cf16e7@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <d990d835-e4bb-4248-b17e-da8907cf16e7@amlogic.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185054 [May 03 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/03 16:56:00 #25080849
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_162743_120972_91DAB706 
X-CRM114-Status: GOOD (  21.64  )
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

SGVsbG8gSnVueWksIEtlbHZpbgoKSSdtIHNvcnJ5IGZvciB0aGUgcGluZy4gRG8geW91IGhhdmUg
cGxhbnMgdG8gZmluaXNoIHRoZXNlIHBhdGNoZXM/CgpIZXJlIGlzIHNhbXBsZSBjb2RlIGhvdyBk
ZXZtIGNvdWxkIGJlIHVzZWQgdG8gbWFuYWdlIGNsayBvYmplY3RzIGNyZWF0ZWQKYnkgb2ZfY2xr
X2dldDoKCnN0cnVjdCBjbGtfc2V0X2RldnJlcyB7CglzdHJ1Y3QgY2xrICpjbGtzW01FU09OX05V
TV9QV01TXTsKfTsKCnN0YXRpYyB2b2lkIGRldm1fY2xrX3NldF9yZWxlYXNlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdm9pZCAqcmVzKQp7CglzdHJ1Y3QgY2xrX3NldF9kZXZyZXMgKmRldnJlcyA9IHJl
czsKCWludCBudW1fY2xrcyA9IE1FU09OX05VTV9QV01TOwoKCXdoaWxlICgtLW51bV9jbGtzID49
IDApCgkJY2xrX3B1dChkZXZyZXMtPmNsa3NbbnVtX2Nsa3NdKTsKfQoKc3RhdGljIGludCBtZXNv
bl9wd21faW5pdF9jaGFubmVsc19zNChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCnsKCXN0cnVjdCBk
ZXZpY2UgKmRldiA9IHB3bWNoaXBfcGFyZW50KGNoaXApOwoJc3RydWN0IG1lc29uX3B3bSAqbWVz
b24gPSB0b19tZXNvbl9wd20oY2hpcCk7CglzdHJ1Y3QgY2xrX3NldF9kZXZyZXMgKmRldnJlczsK
CXVuc2lnbmVkIGludCBpOwoJaW50IHJlczsKCglkZXZyZXMgPSBkZXZyZXNfYWxsb2MoZGV2bV9j
bGtfc2V0X3JlbGVhc2UsCgkJCSAgICAgIHNpemVvZigqZGV2cmVzKSwgR0ZQX0tFUk5FTCk7Cglp
ZiAoIWRldnJlcykKCQlyZXR1cm4gLUVOT01FTTsKCglkZXZyZXNfYWRkKGRldiwgZGV2cmVzKTsK
Cglmb3IgKGkgPSAwOyBpIDwgTUVTT05fTlVNX1BXTVM7IGkrKykgewoJCWRldnJlcy0+Y2xrc1tp
XSA9IG9mX2Nsa19nZXQoZGV2LT5vZl9ub2RlLCBpKTsKCQlpZiAoSVNfRVJSKGRldnJlcy0+Y2xr
c1tpXSkpIHsKCQkJcmVzID0gUFRSX0VSUihkZXZyZXMtPmNsa3NbaV0pOwoJCQlkZXZfZXJyX3By
b2JlKGRldiwgcmVzLCAiRmFpbGVkIHRvIGdldCBjbGtcbiIpOwoJCQlyZXR1cm4gcmVzOwoJCX0K
CQltZXNvbi0+Y2hhbm5lbHNbaV0uY2xrID0gZGV2cmVzLT5jbGtzW2ldOwoJfQoJcmV0dXJuIDA7
Cn0KCk9uIDQvMjQvMjQgMTQ6NDQsIEp1bnlpIFpoYW8gd3JvdGU6Cj4gCj4gCj4gT24gMjAyNC80
LzI0IDE4OjMyLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4K
Pj4gT24gV2VkIDI0IEFwciAyMDI0IGF0IDE4OjI4LCBLZWx2aW4gWmhhbmcgdmlhIEI0IFJlbGF5
IAo+PiA8ZGV2bnVsbCtrZWx2aW4uemhhbmcuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Cj4+PiBGcm9tOiBKdW55aSBaaGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+Pj4KPj4+
IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBBbWxvZ2ljIFM0IFBXTS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdW55aSBaaGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+Pj4gU2lnbmVk
LW9mZi1ieTogS2VsdmluIFpoYW5nIDxrZWx2aW4uemhhbmdAYW1sb2dpYy5jb20+Cj4+PiAtLS0K
Pj4+IMKgIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3
bS9wd20tbWVzb24uYwo+Pj4gaW5kZXggZWE5NmM1OTczNDg4Li42YWJjODIzNzQ1ZTQgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+Pj4gKysrIGIvZHJpdmVycy9wd20v
cHdtLW1lc29uLmMKPj4+IEBAIC00NjIsNiArNDYyLDM1IEBAIHN0YXRpYyBpbnQgCj4+PiBtZXNv
bl9wd21faW5pdF9jaGFubmVsc19tZXNvbjhiX3YyKHN0cnVjdCBwd21fY2hpcCAqY2hpcCkKPj4+
IMKgwqDCoMKgwqDCoCByZXR1cm4gbWVzb25fcHdtX2luaXRfY2xvY2tzX21lc29uOGIoY2hpcCwg
bXV4X3BhcmVudF9kYXRhKTsKPj4+IMKgIH0KPj4+Cj4+PiArc3RhdGljIGludCBtZXNvbl9wd21f
aW5pdF9jaGFubmVsc19tZXNvbl9zNChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4+PiArewo+Pj4g
K8KgwqDCoMKgIGludCBpLCByZXQ7Cj4+PiArwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0g
cHdtY2hpcF9wYXJlbnQoY2hpcCk7Cj4+PiArwqDCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpu
cCA9IGRldi0+b2Zfbm9kZTsKPj4+ICvCoMKgwqDCoCBzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiA9
IHRvX21lc29uX3B3bShjaGlwKTsKPj4+ICvCoMKgwqDCoCBzdHJ1Y3QgbWVzb25fcHdtX2NoYW5u
ZWwgKmNoYW5uZWw7Cj4+PiArCj4+PiArwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IE1FU09OX05V
TV9QV01TOyBpKyspIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hhbm5lbCA9ICZt
ZXNvbi0+Y2hhbm5lbHNbaV07Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoYW5uZWwt
PmNsayA9IG9mX2Nsa19nZXQobnAsIGkpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoSVNfRVJSKGNoYW5uZWwtPmNsaykpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIoY2hhbm5lbC0+Y2xrKTsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJGYWlsZWQgdG8gZ2V0IGNsa1xuIik7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
Pj4gK8KgwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqDCoCByZXR1cm4gMDsKPj4+ICsKPj4+ICtl
cnI6Cj4+PiArwqDCoMKgwqAgd2hpbGUgKC0taSA+PSAwKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNoYW5uZWwgPSAmbWVzb24tPmNoYW5uZWxzW2ldOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjbGtfcHV0KGNoYW5uZWwtPmNsayk7Cj4+Cj4+IEZpbmUgb24gZXJyb3Ig
YnV0IGxlYWtzIG9uIG1vZHVsZSB1bmxvYWQuCj4+Cj4+IFNhbWUgYXMgR2VvcmdlLAo+Pgo+PiBB
ZGQgdGhlIGRldm0gdmFyaWFudCBvZiBvZl9jbGtfZ2V0KCkgaWYgeW91IG11c3QuCj4+IFVzZSBk
ZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBvdGhlcndpc2UKPiBIaSBqZXJvbe+8jGJ1dCB3ZSBo
YXZlIGRpc2N1c3NlZCBiZWZvcmUuZGV2bSB2YXJpYW50IHN1Y2ggYXMgZm9sbG93c++8mgo+IGRl
dm1fY2xrX2dldF9lbmFibGUoc3RydWN0IGRldmljZSAqIGRldiwgY2hhciAqIGlkKQo+IHN0cnVj
dCBjbGsgKmRldm1fY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQo+
IHN0cnVjdCBjbGsgKmRldm1fY2xrX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IGNoYXIgKmlkKQo+IAo+IGFmdGVyIGkgY2hlY2sgYXBpIHBhcm0gLHRoZXNlIGFwaSdzIDJy
ZCBwYXJtICJpZCIgaXMgc3RyaW5nIG5vdCBpbmRleC4KPiBiZWNhdXNlIGR0IGJpbmRpbmcgaGF2
ZSBubyBuYW1lIHByb3BlcnR5LiBjb3VsZCB3ZSB1c2UgZGV2be+8nwo+Pgo+PiBDb3VsZCBwbGVh
c2Ugc3luY2hyb25pemUgdGhpcyBzZXJpZXMgd2l0aCBHZW9yZ2UgYW5kIGRlYWwgd2l0aCBhbGwg
dGhlCj4+IHN1cHBvcnRlZCBTb0NzID8gYTEsIHM0LCB0NywgYzMgLi4uCj4+Cj4+PiArwqDCoMKg
wqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiArfQo+Pj4gKwo+Pj4gwqAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9wd21fZGF0YSBwd21fbWVzb244Yl9kYXRhID0gewo+
Pj4gwqDCoMKgwqDCoMKgIC5wYXJlbnRfbmFtZXMgPSB7ICJ4dGFsIiwgTlVMTCwgImZjbGtfZGl2
NCIsICJmY2xrX2RpdjMiIH0sCj4+PiDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX2luaXQgPSBtZXNv
bl9wd21faW5pdF9jaGFubmVsc19tZXNvbjhiX2xlZ2FjeSwKPj4+IEBAIC01MDAsNiArNTI5LDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2RhdGEgCj4+PiBwd21fbWVzb244X3Yy
X2RhdGEgPSB7Cj4+PiDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX2luaXQgPSBtZXNvbl9wd21faW5p
dF9jaGFubmVsc19tZXNvbjhiX3YyLAo+Pj4gwqAgfTsKPj4+Cj4+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBtZXNvbl9wd21fZGF0YSBwd21fbWVzb25fczRfZGF0YSA9IHsKPj4+ICvCoMKgwqDCoCAu
Y2hhbm5lbHNfaW5pdCA9IG1lc29uX3B3bV9pbml0X2NoYW5uZWxzX21lc29uX3M0LAo+Pj4gK307
Cj4+PiArCj4+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZXNvbl9wd21f
bWF0Y2hlc1tdID0gewo+Pj4gwqDCoMKgwqDCoMKgIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbjgtcHdtLXYyIiwKPj4+IEBAIC01
MzgsNiArNTcxLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIAo+Pj4gbWVz
b25fcHdtX21hdGNoZXNbXSA9IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNv
bXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1nMTJhLWFvLXB3bS1jZCIsCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5kYXRhID0gJnB3bV9nMTJhX2FvX2NkX2RhdGEKPj4+IMKgwqDC
oMKgwqDCoCB9LAo+Pj4gK8KgwqDCoMKgIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zNC1wd20iLAo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuZGF0YSA9ICZwd21fbWVzb25fczRfZGF0YQo+Pj4gK8KgwqDCoMKgIH0sCj4+
PiDCoMKgwqDCoMKgwqAge30sCj4+PiDCoCB9Owo+Pj4gwqAgTU9EVUxFX0RFVklDRV9UQUJMRShv
ZiwgbWVzb25fcHdtX21hdGNoZXMpOwo+Pgo+Pgo+PiAtLSAKPj4gSmVyb21lCgotLSAKQmVzdCBy
ZWdhcmRzCkdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
