Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5187CEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPt8pxixPiF9HyGF92tukgvXbujEZbhhQMdapfQY31o=; b=QJeEK+oB3AZva7
	5HJGV/+JPtgVdCNgkbrbzpU0vaeCPHkV4Wd9TSVHtTrUx14g2W0VoS3MV7NRHbLZ2yz/x3ufF4a6+
	NF9Oyei4shHXtNdLYh3PyxTuw8iQI1lZN0tXbK+uzY32vHbPum7Faw4992mfZgElJbVr079j5QJf6
	Weysc9C2VyL6C1RLixPrjzJ5FoM7wucfjFysM7AwhCAsuSBCN09+lae3UWQrxmgAF7UDTmat8oWmn
	6a7zOhUXMBoST15iY+Ve83ob7vmN+ms7+a78RZuW9ebxJ5xgpwo58Eua6cpM+R3BwE733rMZ2vKYj
	c5P/q4f5pITtCdDpJdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW5J-00Frt7-2n;
	Wed, 28 Jun 2023 14:23:53 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW5G-00Frsb-0W;
	Wed, 28 Jun 2023 14:23:51 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7F15112001B;
	Wed, 28 Jun 2023 17:23:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7F15112001B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687962186;
	bh=Tv9CtTxw2JKJilL1q5p5p8VeT0w+UW8IFg0I9fdWF8M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=LVWbl87nYqaExJtjTCAaPNVQyp5eo3g1SzIU6ihFZn0+cWiEWSFm/SfiB79VCv0kB
	 58HxGcNPjq6KC7ElUcj2wEzrIU2Xw+TtlK47TsDafoKlWvq4A/YLiWUDV56QSrQvjx
	 MgwEddYDQO6K+Qu/crzXR+ZeZuzje2KCguxuSRYkSJilQLljUboOSraUnYrPirOagi
	 JGZ8Eebw0sXD8ONc+2YCVslgzm9Y769MZD2s1lCqRkrPqWAadEB/x1M2JjVSTuLRLt
	 cyCozAbGUPj24Y895BwyAsRa0GlsPg3t/goT3ehTj7AmzplMobvub5tK2JTxZMxsfH
	 +G0Iwxs8H0Baw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 17:23:05 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 28 Jun
 2023 17:22:07 +0300
Date: Wed, 28 Jun 2023 17:23:05 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<conor+dt@kernel.org>, <kernel@sberdevices.ru>,
	<sdfw_system_team@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>
Subject: Re: [PATCH v1 4/6] arm64: dts: meson: a1: introduce SPI Flash
 Controller
Message-ID: <20230628142305.74fkh6ektxhww3v7@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-5-ddrokosov@sberdevices.ru>
 <CAFBinCAGLerkDrz98WbpyVAV3jukkPXqDGSV0vOWY0jNiKaJvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAGLerkDrz98WbpyVAV3jukkPXqDGSV0vOWY0jNiKaJvQ@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178314 [Jun 28 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 08:00:00 #21591748
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_072350_622436_CF6DEB3E 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTE6MDM6MjFQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDEwOjE24oCvUE0gRG1pdHJ5IFJv
a29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogTWFy
dGluIEt1cmJhbm92IDxtbWt1cmJhbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4KPiA+IFRoaXMgY29u
dHJvbGxlciBjYW4gYmUgdXNlZCBmb3Igc3BpbmFuZCBmbGFzaCBjb25uZWN0aW9uLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLdXJiYW5vdiA8bW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5y
dT4KPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmlj
ZXMucnU+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEu
ZHRzaSB8IDEwICsrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
YTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpCj4gPiBp
bmRleCA2M2ZhY2NmYzExMzQuLjBlZmQ5MjJjYTdlMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpCj4gPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+ID4gQEAgLTE5OSw2ICsxOTksMTYgQEAgZ2lj
OiBpbnRlcnJ1cHQtY29udHJvbGxlckBmZjkwMTAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwwPjsKPiA+ICAgICAgICAgICAgICAgICB9Owo+ID4KPiA+
ICsgICAgICAgICAgICAgICBzcGlmYzogc3BpQGZkMDAwNDAwIHsKPiBwbGVhc2UgYWxzbyBzb3J0
IHRoaXMgbnVtZXJpY2FsbHksIHNvIGl0IHNob3VsZCBhcHBlYXIgYmVmb3JlICZhcGIKClN1cmUs
IG5vdCBhIHByb2JsZW0uIElmIHRoaW5ncyBoYXZlIGJhc2UgYWRkcmVzc2VzLCBhbGwgb2YgdGhl
bSBvdWdodCB0bwpiZSBzb3J0ZWQgbnVtZXJpY2FsbHkuCgotLSAKVGhhbmsgeW91LApEbWl0cnkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
