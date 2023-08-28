Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB200C71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkLuvLS/bZBI9LAmkQCgT/oVA20z4FgVygTr+S9iTqs=; b=HJK3rI/7AGaQQX
	+KbdXO48FGItDqdFhj/WjVrSShPwcAw7K4RVjDJnGmLmPpPrJUjY5DcCVyivQbeE5HASep9spfPtj
	pNgOUW6ksvFpI9I9eywuYx+OCzraMVZ19iqy91DHvz1iBHXLSntkj3Mjb98RUTxgJN37MdLBzgfOH
	MkwlpauhTTHZZDM58FoWarjPQQntCvUGpp2ZsCD9pY+teI5fNVraBxqqx8xPQcZ9ItxfrY8BfgBZ6
	AhqbI9f37QS1f6FC2+vMW5jz3J4GsoMLSJm/QDrtBrM3zAG7slw2RVXLmJy0DaMQEW+oGW9HZLpI6
	oTOpPvQYukCozatYURXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXTu-0098Ap-0M;
	Mon, 28 Aug 2023 08:20:18 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXTr-00989S-0S;
	Mon, 28 Aug 2023 08:20:17 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 77CCE100007;
	Mon, 28 Aug 2023 11:20:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 77CCE100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1693210811;
	bh=g1xOXZyE1LQxHzZ90C3yXoDtHH1l4bGH7bMSOEEE7I8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Ei5DvdFJjuKn5GrMQhjuBgTt7CgZSyIUWWgoXnxuw8n+l5nY+AJC7Xu6YCOxfMN1p
	 /Mn7vq3yh8CxH2wPQmgXE9k4Pmct4GW7MouzhcAHK0Hd9YpG42eRjN0eQyezUpBLBV
	 6YWShzcxhCkSIeH5LR7MePn1/q8z4efYepRn9H01D/EvPHoq1hHehPArwp7R/wcD7S
	 QSufhYRslJcqD+RG7T5W6EbHJ/jLXc4PSVXJYMfBg6GpBXDlu5WevsdIe9D5IdWioz
	 kFl6WTZXMXNsDcEGpeR24S/TSvr+hxPUwsG08lB59YfhHlXTU81dnJ6S0+NQbM9XtL
	 GhFC0KoZXBpNw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 28 Aug 2023 11:20:09 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 28 Aug
 2023 11:20:04 +0300
Date: Mon, 28 Aug 2023 11:20:09 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Lucas Tanure <tanure@linux.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Message-ID: <20230828082009.kehgwi4fxtj3bfze@CAB-WSD-L081021>
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
 <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
 <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179460 [Aug 28 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;lists.infradead.org:7.1.1;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/08/28 07:01:00
X-KSMG-LinksScanning: Clean, bases: 2023/08/28 07:01:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/28 07:05:00 #21755218
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_012015_525449_23514672 
X-CRM114-Status: GOOD (  40.76  )
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

T24gU3VuLCBBdWcgMjcsIDIwMjMgYXQgMTE6MzE6MzVBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdy
b3RlOgo+IE9uIDI3LTA4LTIwMjMgMTE6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4gSGkg
THVjYXMsCj4gPiAKPiA+IExlIDI3LzA4LzIwMjMgw6AgMTI6MDQsIEx1Y2FzIFRhbnVyZSBhIMOp
Y3JpdMKgOgo+ID4gPiBPbiAyNy0wOC0yMDIzIDEwOjQ4LCBOZWlsIEFybXN0cm9uZyB3cm90ZToK
PiA+ID4gPiBIaSBMdWNhcywKPiA+ID4gPiAKPiA+ID4gPiBMZSAyNy8wOC8yMDIzIMOgIDEwOjI5
LCBMdWNhcyBUYW51cmUgYSDDqWNyaXTCoDoKPiA+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQg
NmE0MTk3Zjk3NjMzMjUwNDNhYmY3NjkwYTIxMTI0YTlmYWNiZjUyZS4KPiA+ID4gPiA+IE5ldyBT
b0Mgd2lsbCB1c2UgdHR5UzAgaW5zdGVhZCBvZiB0dHlBTUwsIHNvIFQ3IFNvQyBkb2Vzbid0Cj4g
PiA+ID4gPiBuZWVkIGEgT0ZfRUFSTFlDT05fREVDTEFSRS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiBTaW5jZSBWMToKPiA+ID4gPiA+IC0gYWRkIFNpZ25lZC1vZmYtYnk6Cj4g
PiA+ID4gPiAKPiA+ID4gPiA+IMKgIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAy
IC0tCj4gPiA+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMK
PiA+ID4gPiA+IGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gPiA+ID4gaW5k
ZXggYzRmNjFkODJmYjcyNy4uNzkwZDkxMGRhZmE1ZCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiA+ID4gPiA+IEBAIC02NDgsOCArNjQ4LDYgQEAgbWVzb25f
c2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3RydWN0Cj4gPiA+ID4gPiBlYXJseWNvbl9kZXZp
Y2UgKmRldmljZSwgY29uc3QgY2hhciAqb3B0Cj4gPiA+ID4gPiDCoCBPRl9FQVJMWUNPTl9ERUNM
QVJFKG1lc29uLCAiYW1sb2dpYyxtZXNvbi1hby11YXJ0IiwKPiA+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG1lc29uX3NlcmlhbF9lYXJseV9jb25zb2xlX3NldHVwKTsKPiA+ID4g
PiA+IC1PRl9FQVJMWUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dpYyx0Ny11YXJ0IiwKPiA+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX3NlcmlhbF9lYXJseV9jb25zb2xlX3Nl
dHVwKTsKPiA+ID4gPiA+IMKgICNkZWZpbmUgTUVTT05fU0VSSUFMX0NPTlNPTEVfUFRSKF9kZXZu
YW1lKQo+ID4gPiA+ID4gKCZtZXNvbl9zZXJpYWxfY29uc29sZV8jI19kZXZuYW1lKQo+ID4gPiA+
ID4gwqAgI2Vsc2UKPiA+ID4gPiAKPiA+ID4gPiBIb3cgZG8geW91IHVzZSBlYXJseWNvbiB3aXRo
IHRoaXMgcmVtb3ZlZCA/Cj4gPiA+ID4gCj4gPiA+ID4gTmVpbAo+ID4gPiBUaGlzIGlzIG15IGtl
cm5lbCBjbWRsaW5lOgo+ID4gPiBjb25zb2xlPXR0eVMwLDkyMTYwMCBub19jb25zb2xlX3N1c3Bl
bmQgZWFybHljb249dHR5UzAsMHhmZTA3ODAwMAo+ID4gPiAKPiA+ID4gQW5kIEkgY2FuIHNlZSBt
eSBsb2c6Cj4gPiA+IGJvb3QgNjRiaXQga2VybmVsCj4gPiA+IFvCoMKgwqAgMC4wMDAwMDBdIEJv
b3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA5Ml0KPiA+
ID4gW8KgwqDCoCAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjUuMC1yYzctbmV4dC0yMDIzMDgy
NSsKPiA+ID4gKHRhbnVyZWFsQHJ5emVuKSAoYWFyY2g2NC1ub25lLWxpbnV4LWdudS1nY2MgKEdO
VSBUb29sY2hhaW4gZm9yIHRoZQo+ID4gPiBBLXByb2ZpbGUgQXJjaGl0ZWN0dXJlIDEwLjMtMjAy
MS4wNyAoYXJtLTEwLjI5KSkgMTAuMy4xIDIwMjEwNjIxLAo+ID4gPiBHTlUgbGQgKEdOVSBUb29s
Y2hhaW4gZm8zCj4gPiA+IFvCoMKgwqAgMC4wMDAwMDBdIEtBU0xSIGRpc2FibGVkIGR1ZSB0byBs
YWNrIG9mIHNlZWQKPiA+ID4gW8KgwqDCoCAwLjAwMDAwMF0gTWFjaGluZSBtb2RlbDogS2hhZGFz
IHZpbTQKPiA+ID4gW8KgwqDCoCAwLjAwMDAwMF0gT0Y6IHJlc2VydmVkIG1lbToKPiA+ID4gMHgw
MDAwMDAwMDA1MDAwMDAwLi4weDAwMDAwMDAwMDUyZmZmZmYgKDMwNzIgS2lCKSBub21hcCBub24t
cmV1c2FibGUKPiA+ID4gc2VjbW9uQDUwMDAwMDAKPiA+ID4gW8KgwqDCoCAwLjAwMDAwMF0gT0Y6
IHJlc2VydmVkIG1lbToKPiA+ID4gMHgwMDAwMDAwMDA1MzAwMDAwLi4weDAwMDAwMDAwMDcyZmZm
ZmYgKDMyNzY4IEtpQikgbm9tYXAKPiA+ID4gbm9uLXJldXNhYmxlIHNlY21vbkA1MzAwMDAwCj4g
PiA+IC4uLgo+ID4gPiBbwqDCoMKgIDAuMDc5MzY4XSBpbyBzY2hlZHVsZXIgbXEtZGVhZGxpbmUg
cmVnaXN0ZXJlZAo+ID4gPiBbwqDCoMKgIDAuMDc5Mzc0XSBpbyBzY2hlZHVsZXIga3liZXIgcmVn
aXN0ZXJlZAo+ID4gPiBbwqDCoMKgIDAuMDc5NTQ5XSBpbyBzY2hlZHVsZXIgYmZxIHJlZ2lzdGVy
ZWQKPiA+ID4gW8KgwqDCoCAwLjA4MzM3M10gZmUwNzgwMDAuc2VyaWFsOiB0dHlTMCBhdCBNTUlP
IDB4ZmUwNzgwMDAgKGlycSA9IDE0LAo+ID4gPiBiYXNlX2JhdWQgPSAxNTAwMDAwKSBpcyBhIG1l
c29uX3VhcnQKPiA+ID4gW8KgwqDCoCAwLjA4MzQwM10gcHJpbnRrOiBjb25zb2xlIFt0dHlTMF0g
ZW5hYmxlZAo+ID4gPiAKPiA+ID4gQXMgdGhlIGxvZyBpcyBPSywgYW5kIFQ3IGZvciBub3cgaXMg
YmluZGluZyBhZ2FpbnN0IFM0IGNvZGUgd2UKPiA+ID4gc2hvdWxkIGRyb3AgdGhpcyBwYXRjaCBh
bmQgYWRkIGEgUzQgb25lIGlmIG5lZWRlZC4KPiA+ID4gCj4gPiA+IEJ1dCBqdXN0IGhhdmluZyB0
aGlzIGxvZyBpcyBub3QgZW5vdWdoIGZvciB0ZXN0aW5nIGVhcmx5Y29uPwo+ID4gPiBJIGFtIGFz
c3VtaW5nIHRoYXQgYnkganVzdCBoYXZpbmcgdGhlIGxvZyBzaW5jZSAwLjAwMDAgaXMgYSBnb29k
Cj4gPiA+IHNpZ24gdGhhdCBlYXJseWNvbiBpcyB3b3JraW5nLgo+ID4gPiBDb3VsZCB5b3UgZ2l2
ZSBmdXJ0aGVyIGd1aWRhbmNlPwo+ID4gCj4gPiBGaXJzdCB0aGUga2VybmVsIGFyZ3VtZW50IGlz
IHNpbXBseSAiZWFybHljb24iIHdpdGggbm8gb3RoZXIgb3B0aW9ucywKPiA+IHRoZSBlYXJseWNv
biBjb2RlIHdpbGwgZmV0Y2ggdGhlIGZpcnN0IHVhcnQgdXNpbmcgdGhlIERUCj4gPiAvY2hvc2Vu
L3N0ZG91dC1wYXRoIHByb3BlcnR5Lgo+ID4gCj4gPiBUaGVuIHlvdSBzaG91bGQgc2VlIHNvbWV0
aGluZyBsaWtlIHJpZ2h0IGFmdGVyICJNYWNoaW5lIG1vZGVsIjoKPiA+IFvCoMKgwqAgMC4wMDAw
MDBdIGVhcmx5Y29uOiBtZXNvbjAgYXQgTU1JTyAweDAwMDAwMDAwZmY4MDMwMDAgKG9wdGlvbnMK
PiA+ICcxMTUyMDBuOCcpCj4gPiAKPiA+IFRoZSBib290IGxvZyB5b3Ugc2hhcmUgZG9lc24ndCB1
c2UgZWFybHljb24sIGl0IHdhaXRzIHVudGlsIGFsbAo+ID4gZGVwZWRlbmN5IG9mIHRoZSBVQVJU
Cj4gPiBoYXMgYmVlbiBwcm9iZWQgYmVmb3JlIHByb2JpbmcgdGhlIFVBUlQgZHJpdmVyIGFuZCBw
cmludHMgdGhlIHdob2xlIGJvb3QKPiA+IGxvZy4KPiA+IAo+ID4gRWFybHljb24gaXMgYSBtZWNo
YW5pc20gdG8gdXNlIHRoZSBVQVJUIEhXIGFzIGNvbmZpZ3VyZWQgYnkgdGhlCj4gPiBib290bG9h
ZGVyIGluCj4gPiBhIG1pbmltYWwgd2F5IHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgaW4gb3JkZXIg
dG8gZGV0ZWN0IHZlcnkgZWFybHkgbG9ja3Vwcy4KPiA+IAo+ID4gS2VlcGluZyBPRl9FQVJMWUNP
Tl9ERUNMQVJFIGZvciB0NyB3b3VsZCBlbmFibGUgdGhpcy4KPiA+IAo+ID4gTmVpbAo+ID4gCj4g
PiA+IAo+ID4gPiBMdWNhcyBUYW51cmUKPiA+ID4gCj4gPiAKPiBCdXQgdGhlbiB3ZSB3b3VsZCBu
ZWVkIHRvIGFkZCBFYXJseWNvbiBmb3IgUzQgdG9vLgo+IEhvdyBjYW4gd2UgYWRkIG9uZSBFYXJs
eWNvbiBmb3IgYWxsIGZ1dHVyZSBTb0NzLCBsaWtlIFM0IGFuZCBUNz8KPiAKClBlciBteSB1bmRl
cnN0YW5kaW5nLCB5b3UganVzdCBuZWVkIHRvIGRlY2xhcmUgVUFSVCBkdHMgbm9kZSB3aXRoIHRo
ZQpmb2xsb3dpbmcgY29tcGF0aWJsZSBzdHJpbmc6ICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiLiBJ
dCB3aWxsIGVuYWJsZWQKZWFybHljb24uIFRoZXJlIGlzIG5vIG5lY2Nlc3NhcnkgdG8gZGVjbGFy
ZSBzZXBhcmF0ZQpPRl9FQVJMWUNPTl9ERUNMQVJFKCkuIEl0J3Mgd29ya2luZyBva2F5IGZvciBB
MSBkdHM6CgptZXNvbi1hMS5kdHNpIHVhcnQgZGVjbGFyYXRpb246Cgl1YXJ0X0FPX0I6IHNlcmlh
bEAyMDAwIHsKCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYTEtdWFydCIsCgkJCSAgICAg
ImFtbG9naWMsbWVzb24tYW8tdWFydCI7CgkJcmVnID0gPDB4MCAweDIwMDAgMHgwIDB4MTg+OwoJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSAyNiBJUlFfVFlQRV9FREdFX1JJU0lORz47CgkJY2xvY2tz
ID0gPCZ4dGFsPiwgPCZ4dGFsPiwgPCZ4dGFsPjsKCQljbG9jay1uYW1lcyA9ICJ4dGFsIiwgInBj
bGsiLCAiYmF1ZCI7CgkJc3RhdHVzID0gImRpc2FibGVkIjsKCX07CgplYXJseWNvbiBkZWNsYXJh
dGlvbiBmcm9tIGR0czoKCWFsaWFzZXMgewoJCXNlcmlhbDAgPSAmdWFydF9BT19COwoJfTsKCglj
aG9zZW4gewoJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwoJfTsKCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoK
LS0gClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
