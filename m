Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DCCEB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oh9fNeUCk8jopsVqJwIl4oRNAeYbzu8owA2n2grNwHU=; b=y5BbnO5IFaIOBG
	1+KQUQxp/ToMSqTDwI6YcWMZn8AznVEG+Yv4XgAaieHOcZGXd3TAnkuhAFD/BCs0cQHKL3s4P3Lf5
	8rEzjBjHu9KnQfr8EXbhT4qBtRvY21o0BcmevlVq7l27KqDZfNM25PaWKYPCI8llA2J0CGhtGfMZz
	gq8g6rkeQNhdSGXIslZl7p9qGKvuly7ICJ0on+lgaJjr+q08ZwNZh6fUKgZQgiuddU9tSu4gXSyo2
	oHyQy7fWycb/qZEpeLf9V2PrgaI1os90kSDE/VCwpBzdRCJCr/foSrV1WfpuEvP+agUqez3WyaXW8
	z9HCB43TK4lLJGrCp+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW0j-00FrB2-1x;
	Wed, 28 Jun 2023 14:19:09 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW0f-00Fr5x-0a;
	Wed, 28 Jun 2023 14:19:08 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 57235100010;
	Wed, 28 Jun 2023 17:18:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 57235100010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687961920;
	bh=Svbfgf0j0KalI3BkPbMkKrb1SmgOXFuqi609v02vEJo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=YmokS3sh6Ig+a8MRqX0d7lPrHlCbjVkd3bk6UbfFYyxorfvqGLazMnPB9GOTCI1/A
	 TGMgo7N8FdDrix2YNOh7Vu7FegtMSE3q96KHviLB5kpO0JqcGZvCHJRKogeCcxnAa5
	 bmzVxjACdOyl8I81ff9Rtia4TjQXW9S/vd7mhFwZfKnGn3hdS600ahvhCp6Mst+WuB
	 P3MEBtazWT0mlXqGnZlEdNTXmukt5J1bCXis6oBgQTTM1Xnc9AVPuQ5DsqqHDWeOjg
	 uJymijvh1v39yzQAEIWFS1HA20EE+W6uxvF67BR7YnECXZLZ3TXjSyWjLFdRofpmtl
	 jVyPIa9xr0+xg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 17:18:40 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 28 Jun
 2023 17:17:42 +0300
Date: Wed, 28 Jun 2023 17:18:39 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<conor+dt@kernel.org>, <kernel@sberdevices.ru>,
	<sdfw_system_team@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 1/6] arm64: dts: meson: a1: introduce PLL and
 Peripherals clk controllers
Message-ID: <20230628141839.ea7qzotr5un6f2ij@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-2-ddrokosov@sberdevices.ru>
 <CAFBinCAO14zcgY66UyJO9UxuCWf1N-Lsx=iYNTJL=cwXoJv__Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAO14zcgY66UyJO9UxuCWf1N-Lsx=iYNTJL=cwXoJv__Q@mail.gmail.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 08:00:00 #21591748
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_071906_732543_652DF816 
X-CRM114-Status: GOOD (  25.06  )
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

SGVsbG8gTWFydGluLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQoKT24gU3VuLCBKdW4gMjUs
IDIwMjMgYXQgMTE6MDA6MDZQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBP
biBXZWQsIEp1biA3LCAyMDIzIGF0IDEwOjE24oCvUE0gRG1pdHJ5IFJva29zb3YgPGRkcm9rb3Nv
dkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRzIGNsa2MgYW5k
IGNsa2NfcGxsIGR0cyBub2RlcyB0byBBMSBTb0MgbWFpbiBkdHNpLgo+ID4gVGhlIGZpcnN0IG9u
ZSBjbGsgY29udHJvbGxlciBpcyByZXNwb25zaWJsZSBmb3IgYWxsIFNvQyBwZXJpcGhlcmFscwo+
ID4gY2xvY2tzIGV4Y2x1ZGluZyBhdWRpbyBjbG9ja3MuIFRoZSBzZWNvbmQgb25lIGNsayBjb250
cm9sbGVyIGlzIHVzZWQgYnkKPiA+IEExIFNvQyBQTExzLiBBY3R1YWxseSwgdGhlcmUgYXJlIHR3
byBkaWZmZXJlbnQgQVBCIGhlYWRzLCBzbyB3ZSBoYXZlIHR3bwo+ID4gZGlmZmVyZW50IGRyaXZl
cnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVy
ZGV2aWNlcy5ydT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1hMS5kdHNpIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1hMS5kdHNpCj4gPiBpbmRleCBlZWQ5NmYyNjI4NDQuLmEyNDIyODgwOGM5YyAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpCj4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+ID4gQEAgLTYs
NiArNiw4IEBACj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L2lycS5oPgo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9h
cm0tZ2ljLmg+Cj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vbWVzb24tYTEtZ3Bpby5o
Pgo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGExLXBsbC1jbGtjLmg+
Cj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTEtcGVyaXBoZXJhbHMt
Y2xrYy5oPgo+ID4KPiA+ICAvIHsKPiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGEx
IjsKPiA+IEBAIC0xMjYsNiArMTI4LDMwIEBAIHVhcnRfQU9fQjogc2VyaWFsQDIwMDAgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBjbGtjX3BlcmlwaHM6IGNsb2NrLWNvbnRyb2xsZXJAODAwIHsKPiBwbGVhc2Uga2VlcCB0aGUg
ZW50cmllcyBzb3J0ZWQgLSBzbyAmY2xrY19wZXJpcGhzIHNob3VsZCBjb21lIGFmdGVyCj4gJnBl
cmlwaHNfcGluY3RybAo+IAoKU3VyZQoKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGExLXBlcmlwaGVyYWxzLWNsa2MiOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDgwMCAwIDB4MTA0PjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2NfcGxsIENMS0lEX0ZD
TEtfRElWMj4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y2xrY19wbGwgQ0xLSURfRkNMS19ESVYzPiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJVjU+LAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa2NfcGxsIENMS0lEX0ZDTEtfRElW
Nz4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xrY19w
bGwgQ0xLSURfSElGSV9QTEw+LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8Jnh0YWw+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9j
ay1uYW1lcyA9ICJmY2xrX2RpdjIiLCAiZmNsa19kaXYzIiwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmNsa19kaXY1IiwgImZjbGtfZGl2NyIsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImhpZmlfcGxs
IiwgInh0YWwiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsKPiBbLi4uXQo+IAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpb19pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlckAw
NDQwIHsKPiBub3RlIHRvIHNlbGY6IGF0IHNvbWUgcG9pbnQgd2UnbGwgaGF2ZSB0byByZS1vcmRl
ciAmZ3Bpb19pbnRjLCBidXQKPiB0aGF0J3Mgb3V0IG9mIHNjb3BlIGZvciB0aGlzIHBhdGNoCgpJ
IGhhdmUgbm90aWNlZCB0aGF0IHRoZSAnbWVzb24tYTEuZHRzaScgZmlsZSBjb250YWlucyB1bnNv
cnRlZCBpdGVtcy4gQXMKcGFydCBvZiB0aGUgY3VycmVudCBwYXRjaCBzZXJpZXMsIEkgY2FuIHJl
LW9yZGVyIHRoZW0gdG8gaW1wcm92ZSB0aGUgZHQKc3RydWN0dXJlLgoKLS0gClRoYW5rIHlvdSwK
RG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
