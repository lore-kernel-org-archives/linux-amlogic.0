Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE1C04FF6
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0NAF+hlUqt6pooNrWAzzXGlqQGgeyb6H7Din590Jl8=; b=h55e00IHOvxCgg
	w/av9bZl145F11DDDO7r3b8dU68JSvNRI5o4NJH0MG83U30Q4DMwnB480wgESzEnOvkRDTQtXMrip
	iBGKtxasmo12LcCjI37GYLgfwrdGo49Z5KRHZ7CXgLfTRnGHCzWEfgE7xw0rrjrfdORh+4J0xoAGQ
	owmqAqQ2Xra2dQiVHNRBH/muK9TpztRyIQ6o0QkhmIiPsOCXzWS64B6aAVz69A7nHMvgymV+7u0In
	KJYH4eNRI2gFXkZ6ta3WzyBjAPFTa4pe0pKSafmwNI9yYg8vH3eX8/DhCjnhUzI1ILs/Ie37Knn8s
	uPiBMRviQN1nHWdUPVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCIQ-0000000G4zN-1doM;
	Fri, 12 Apr 2024 08:30:06 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCIL-0000000G4wn-1W72
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 08:30:03 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6D660120057;
	Fri, 12 Apr 2024 11:29:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6D660120057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712910598;
	bh=KkfixobzzUFH/w6sv2wN1/GNm+sz+aoWpuk7u8Lc5PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=i3WAUav3rZNm0jkz/QgPAN/+xrYedE5Mq70+lpf3LFkZig4ITtkQOIy+Skz45JbPU
	 B0SOjba+3OMXd4EFUkacpbGexzMdRsjRGvovXSQz+TfFwtDQXVTDYpcmMSCW0JDjR0
	 CLmyuwdZKuHBX8tgknF8GyWuWYcKrrfgB4D1XJ+uq3AdlMhgGatjOu44bBSTFnce4r
	 NY5JD14T31li3pUidfNL8g8e+PGhqg13zibe6BgeWWvSNGyuJ25Q8ewEddRHeJsoqZ
	 bUygN/5tgB3IrjNWMPkSBXkNfHc5wcEs51AqIOol8kK8yIwPWKbFSZeigAl3Ci3IjT
	 fzO59KuBEomSA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 12 Apr 2024 11:29:58 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 12 Apr 2024 11:29:57 +0300
Message-ID: <f48ec4b6-d266-4108-bea8-baa741f2925f@salutedevices.com>
Date: Fri, 12 Apr 2024 11:29:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] pwm: meson: dt-bindings fixup
To: Jerome Brunet <jbrunet@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-pwm@vger.kernel.org>, JunYi Zhao <junyi.zhao@amlogic.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <b6jyherdfnehu3xrg6ulkxlcfknfej6ali2om27d7rjmwncwxz@3wrtx6sv4xm7>
 <1jsf18skat.fsf@starbuckisacylon.baylibre.com>
 <1ja5lzovj1.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <1ja5lzovj1.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184683 [Apr 12 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 16 0.3.16 6e64c33514fcbd07e515710c86ba61de7f56194e, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/12 02:59:00 #24750120
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_013001_780393_98D94F64 
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

SGVsbG8gSmVyb21lLCBVd2UKCk9uIDQvMTIvMjQgMTE6MDQsIEplcm9tZSBCcnVuZXQgd3JvdGU6
Cj4gCj4gT24gU2F0IDAyIE1hciAyMDI0IGF0IDE2OjUwLCBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gCj4+IE9uIFNhdCAwMiBNYXIgMjAyNCBhdCAxMTowNCwg
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6
Cj4+Cj4+PiBbW1BHUCBTaWduZWQgUGFydDpVbmRlY2lkZWRdXQo+Pj4gSGVsbG8gSmVyb21lLAo+
Pj4KPj4+IE9uIFdlZCwgRmViIDIxLCAyMDI0IGF0IDA0OjExOjQ2UE0gKzAxMDAsIEplcm9tZSBC
cnVuZXQgd3JvdGU6Cj4+Pj4gSmVyb21lIEJydW5ldCAoNSk6Cj4+Pj4gICAgZHQtYmluZGluZ3M6
IHB3bTogYW1sb2dpYzogZml4IHM0IGJpbmRpbmdzCj4+Pj4gICAgZHQtYmluZGluZ3M6IHB3bTog
YW1sb2dpYzogQWRkIGEgbmV3IGJpbmRpbmcgZm9yIG1lc29uOCBwd20gdHlwZXMKPj4+PiAgICBw
d206IG1lc29uOiBnZW5lcmFsaXplIDQgaW5wdXRzIGNsb2NrIG9uIG1lc29uOCBwd20gdHlwZQo+
Pj4+ICAgIHB3bTogbWVzb246IGRvbid0IGNhcnJ5IGludGVybmFsIGNsb2NrIGVsZW1lbnRzIGFy
b3VuZAo+Pj4+ICAgIHB3bTogbWVzb246IGFkZCBnZW5lcmljIGNvbXBhdGlibGUgZm9yIG1lc29u
OCB0byBzbTEKPj4+Cj4+PiBJIGFwcGxpZWQgcGF0Y2hlcyAjMSB0byAjMy4gVGhpcyBkb2Vzbid0
IG1lYW4gIzQgYW5kICM1IGFyZSBiYWQsIGp1c3QKPj4+IHRoYXQgSSBuZWVkIHNvbWUgbW9yZSB0
aW1lIGZvciByZXZpZXcuCj4+Cj4+IE5vIHdvcnJpZXMuIFRoZSBjaGFuZ2UgaW4gdGhvc2UsIGVz
cGVjaWFsbHkgIzUsIGFyZSBwcmV0dHkgc2ltcGxlIGJ1dAo+PiB0aGUgZGlmZiBhcmUgaW5kZWVk
IGhhcmQgdG8gcmVhZCA6Lwo+IAo+IEhlbGxvIFV3ZSwKPiAKPiBJbnRyb2R1Y2luZyB0aGUgczQg
c3VwcG9ydCBkZXBlbmRzIG9uIHRoaXMgc2VyaWVzLgo+IElzIHRoZXJlIGFueSBuZXdzID8KCkFj
dHVhbGx5IHdlJ3JlIHdhaXRpbmcgZm9yIHRoZSBvcHBvcnR1bml0eSB0byBpbnRyb2R1Y2UgYTEg
c3VwcG9ydCB0b28uCgo+IAo+IFRoYW5rcwo+IFJlZ2FyZHMKPiAKPj4KPj4+Cj4+PiBCZXN0IHJl
Z2FyZHMKPj4+IFV3ZQo+IAo+IAoKLS0gCkJlc3QgcmVnYXJkcwpHZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
