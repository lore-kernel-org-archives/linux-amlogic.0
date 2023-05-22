Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04FBC77B75
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 May 2023 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1sOhqwZaqAe4xwQ3rTaxgD9JQq0ko1MJ6SNxDUzSrg=; b=Piry69oKXH0P/3
	K3Tv5O8JfkmOz6xCDX9loSi37/mQCcp3/fZOhjFhJnOsjAumoFeqRpX68Y4rlxYRl/Rf74mmyDAiu
	5FnRdxdwie4ThFCGRvpSPtG1lKraZxJWD+5RHWmZB7fupahG4nJomqlP42amrF8MaYKr5PoW1MtNg
	qmNfhr52FLsLP4bElDkZj8BwPMiJ+YKGuoma0fh4YLMjBfOBz/j0fAWcMEqIrLW84Ovh1sBaWNYDO
	KhzS0ilyPPm1jk6hSCBB+FgWkOr1ho9qw6UiywGuXEiwpqkAjpwRqefJXK64mE2SV+SlHKEdQiztH
	sf0V+D/dwtBO+aHG57AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11ZR-005qLx-0Z;
	Mon, 22 May 2023 09:11:13 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11ZN-005qLA-2k;
	Mon, 22 May 2023 09:11:11 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 79B275FD20;
	Mon, 22 May 2023 12:11:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684746667;
	bh=zVtsb8/IpfOflzKneBoHCNZkPgVYeTAynqHCimRg6Zs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Qqpl2fGstOPR5yP2D7xIJPharKg10EKjauqRJshSylHQizy3pY7spZivq10NC84oR
	 /mYd2zuaJnEwVbQvMlNSNIYIgscFinAFReG2FuO8C9k/qP1N0ZkM1PyarwX0q1gfYq
	 32UnFZMbMlT9H70jf/dTYgD0UBthuah1Y5mBi85rszMe1QjPmhkMkWQsY8jvWflC1Y
	 OH8FFtibZoS88IMdNPprSXJqW/BfOD/lJhb9k8eh9mA7kfN68Ambc4qq85VOjhHfOC
	 iRToOkuZUsc0Mfs21cS+dG6v3H4IMVKA2C/RyzKOey2e+IKbUk3VoFq84qzfRxNV0j
	 DQ3792PjlvvEw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 22 May 2023 12:11:06 +0300 (MSK)
Date: Mon, 22 May 2023 12:11:06 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jonathan Cameron <jic23@kernel.org>
CC: "=?utf-8?B?0KHRgtCw0YDQuiDQk9C10L7RgNCz0LjQuSDQndC40LrQvtC70LDQtdCy0Lg=?=
 =?utf-8?B?0Yc=?=" <GNStark@sberdevices.ru>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, "lars@metafoo.de" <lars@metafoo.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
Message-ID: <20230522091106.rgqirwd3vupgpl6o@CAB-WSD-L081021>
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
 <f0966e95-43c7-e6f6-8aeb-05f27691cec3@sberdevices.ru>
 <20230520164618.08f26fd9@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520164618.08f26fd9@jic23-huawei>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/22 04:49:00 #21364689
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_021110_235561_AFB0EB16 
X-CRM114-Status: GOOD (  20.87  )
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

SGVsbG8gSm9uYXRoYW4sCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgcmV2aWV3IQoKT24g
U2F0LCBNYXkgMjAsIDIwMjMgYXQgMDQ6NDY6MThQTSArMDEwMCwgSm9uYXRoYW4gQ2FtZXJvbiB3
cm90ZToKPiBPbiBXZWQsIDE3IE1heSAyMDIzIDE2OjQ3OjU5ICswMDAwCj4g0KHRgtCw0YDQuiDQ
k9C10L7RgNCz0LjQuSDQndC40LrQvtC70LDQtdCy0LjRhyA8R05TdGFya0BzYmVyZGV2aWNlcy5y
dT4gd3JvdGU6Cj4gCj4gPiBPbiA1LzE2LzIzIDIyOjA4LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdy
b3RlOgo+ID4gPiBIaSBHZW9yZ2UsCj4gPiA+Cj4gPiA+IHRoYW5rIHlvdSBmb3IgdGhpcyBwYXRj
aCEKPiA+ID4KPiA+ID4gT24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgMTE6MDbigK9QTSBHZW9yZ2Ug
U3RhcmsgPGduc3RhcmtAc2JlcmRldmljZXMucnU+IHdyb3RlOiAgCj4gPiA+PiBGcm9tOiBHZW9y
Z2UgU3RhcmsgPEdOU3RhcmtAc2JlcmRldmljZXMucnU+Cj4gPiA+Pgo+ID4gPj4gQWNjb3JkaW5n
IHRvIGRhdGFzaGVldHMgb2Ygc3VwcG9ydGVkIG1lc29uIFNPQ3MKPiA+ID4+IGxlbmd0aCBvZiBB
RENfQ0xLX0RJViBmaWVsZCBpcyA2IGJpdHMgbG9uZyAgCj4gPiA+IEkgaGF2ZSBhIHF1ZXN0aW9u
IGFib3V0IHRoaXMgc2VudGVuY2Ugd2hpY2ggZG9lc24ndCBhZmZlY3QgdGhpcyBwYXRjaAo+ID4g
PiAtIGl0J3Mgb25seSBhYm91dCBtYW5hZ2luZyBleHBlY3RhdGlvbnM6Cj4gPiA+IFdoaWNoIFNv
QyBhcmUgeW91IHJlZmVycmluZyB0bz8KPiA+ID4gVGhpcyBkaXZpZGVyIGlzIG9ubHkgcmVsZXZh
bnQgb24gb2xkZXIgU29DcyB0aGF0IHByZWRhdGUgR1hCQiAoUzkwNSkuCj4gPiA+IFRvIG15IGtu
b3dsZWRnZSBhbGwgU29DcyBmcm9tIEdYQkIgb253YXJkcyBwbGFjZSB0aGUgZGl2aWRlciBpbiB0
aGUKPiA+ID4gbWFpbiBvciBBTyBjbG9jayBjb250cm9sbGVyLCBzbyB0aGlzIGJpdG1hc2sgaXMg
aXJyZWxldmFudCB0aGVyZS4gIAo+ID4gCj4gPiBIZWxsbyBNYXJ0aW4KPiA+IAo+ID4gSSd2ZSBj
aGVja2VkIGRhdGFzaGVldHMgb2YgYWxsIGNoaXBzIGxpc3RlZCBpbiBtZXNvbl9zYXJfYWRjX29m
X21hdGNoIGFycmF5IGluIG1lc29uX3NhcmFkYy5jIGFuZCBldmVyeXdoZXJlIHRoaXMgZmllbGQg
aXMgNiBiaXRzIGxvbmcuIEFjY29yZGluZyB0byBkcml2ZXIgY29kZSBhbmQgZXhpc3RpbmcgZHRz
IGZpbGVzIHRoaXMgcGF0Y2ggYWZmZWN0cyBhbGwgc3VwcG9ydGVkIGNoaXBzIGV4Y2VwdCBtZXNv
bjguCj4gCj4gT24gdGhhdCBub3RlLCBkbyB3ZSB3YW50IHRvIGFkZCBhbnkgY2xhcmlmeWluZyB0
ZXh0IG9uIHRoZSBzY29wZSB0byB0aGUKPiBjb21taXQgbWVzc2FnZT8KClRvIGJlZ2luIHdpdGgs
IHdlIHdpbGwgY29uZHVjdCBhbGwgZXhwZXJpbWVudHMgdGhhdCBNYXJ0aW4gbWVudGlvbmVkIGlu
CmFub3RoZXIgbWVzc2FnZSB3aXRoaW4gdGhpcyB0aHJlYWQuIE9uY2UgY29tcGxldGVkLCB3ZSB3
aWxsIHNoYXJlIHRoZQpyZXN1bHRzIGluIHRoaXMgY3VycmVudCB0aHJlYWQuIElmIHRoZSBjaGFu
Z2VzIGFyZSBzdGlsbCByZWxldmFudCwgd2UKd2lsbCBwcmVwYXJlIGEgbmV3IHBhdGNoIHNldCB3
aXRoIGEgZGV0YWlsZWQgY29tbWl0IG1lc3NhZ2UuCgpbLi4uXQoKLS0gClRoYW5rIHlvdSwKRG1p
dHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
