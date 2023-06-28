Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BCEEB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9o7BlLIkA4htW/t7zRUSV/XBWTr4vXW53UPmDEXqQ7Q=; b=AWPldSI8bFk3E2
	CtsaMF6GU4+HpKwaif0Qo0YgrClHTy5Rleq+zQWeu6/ok2e1lx6rMEp9jexawMUsoKTS+sI0BXCh9
	spoz2fdrti8O8Y1hByJ0Ixobl5sw5E7JKDRgChsEqS2KxZ3vOMAGqPqNpQX1OEQ8sRiu0XcxiggCe
	LADzjwJQ8+jKtkaKd7dB5stovvlS57MuCmYAbwfLq6Kwncco3VFGC/w4ORlqluE5J/ucLu2INw8QO
	cvHt+jExFMeGXI6i1aEIrStYhLVQv9ofzZ72qvHJDXGBjYotrailvGMoUC4yGkYtorTzsYMsdCZge
	v0xYBkJhZsxnCkO7sqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWUs-00FtcQ-07;
	Wed, 28 Jun 2023 14:50:18 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWUp-00Ftb7-0C;
	Wed, 28 Jun 2023 14:50:16 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 24DCA120003;
	Wed, 28 Jun 2023 17:49:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 24DCA120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687963776;
	bh=ITqZMbjUWmbRB4x96Vne7PtoeN8QuM2q0MmJhQ/nKpI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=oV2LGSLukBS6FXn4Jmetv8SIvz2qDSYr0Q2RjFXY/A19VryG+jlxdkMWEgN2vKlPd
	 JHgWHOnPPD8VGQLm554l10oy6gtmutSvkcXJADvRCFUOJazFW1etrWYXQ+G+39J1sV
	 TqKBYRRL1hx2r5iPUcNboflsWlLFRvDBFU1vTAU7Hi+hJpbqeyKd8VUkMCU3N0L3F7
	 CHBpY01TfRreGb/8FSvxPbjqtjZk9GfaBeqgvf1HepRnQEUzYMbfDQsuPQd5p4K+U9
	 7tvXebM5RDfQKs9+NLXJe2neZOhvK+DLLaOEItjqbX3acwaT0p8rJZyM8ZXUSZKM7K
	 fvTpo1qa8z5dw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 17:49:35 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 28 Jun
 2023 17:48:37 +0300
Date: Wed, 28 Jun 2023 17:49:34 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<conor+dt@kernel.org>, <kernel@sberdevices.ru>,
	<sdfw_system_team@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Oleg Lyovin <ovlevin@sberdevices.ru>
Subject: Re: [PATCH v1 5/6] arm64: dts: meson: a1: introduce UART_AO mux
 definitions
Message-ID: <20230628144934.sbtvdktg6boo5opj@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-6-ddrokosov@sberdevices.ru>
 <CAFBinCD-5RD_iszZZRg58XqTHDEHnipJkf2aAex8MdUyh=bVCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCD-5RD_iszZZRg58XqTHDEHnipJkf2aAex8MdUyh=bVCw@mail.gmail.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 08:00:00 #21591748
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_075015_498772_3A867807 
X-CRM114-Status: GOOD (  31.90  )
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

TWFydGluLAoKT24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTE6MDc6NTFQTSArMDIwMCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDEwOjE24oCvUE0g
RG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gPgo+ID4g
RnJvbTogT2xlZyBMeW92aW4gPG92bGV2aW5Ac2JlcmRldmljZXMucnU+Cj4gPgo+ID4gVGhlIEFt
bG9naWMgQTEgaGFzIGEgVUFSVF9BTyBwb3J0LCB3aGljaCBjYW4gYmUgdXNlZCwgZm9yIGV4YW1w
bGUsIGZvcgo+ID4gQlQgSENJIEg0IGNvbm5lY3Rpb24uCj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRz
IG11eCBkZWZpbml0aW9ucyBmb3IgaXQuCj4gSW4gdGhlIHBhc3Qgd2UndmUgb25seSB0YWtlbiB0
aGUgcGluY3RybCBkZWZpbml0aW9ucyBpZiB3ZSBoYXZlIGEKPiBib2FyZCB0aGF0IHVzZXMgdGhl
bS4KPiBOZWlsLCBkbyB3ZSBzdGlsbCBoYXZlIHRoZSBzYW1lIHBvbGljeSBpbiBwbGFjZT8gSWYg
c28gdGhpcyBwYXRjaAo+IHNob3VsZCBiZSBzZW50IHdpdGggdGhlIHNlcmllcyB0aGF0IGFkZHMg
c3VwcG9ydCBmb3IgeW91ciBBMSBib2FyZC4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE9sZWcgTHlv
dmluIDxvdmxldmluQHNiZXJkZXZpY2VzLnJ1Pgo+ID4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFJv
a29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpIHwgMTYgKysrKysrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kKPiA+IGluZGV4IDBlZmQ5MjJjYTdlMS4uM2ViNmFh
OWMwMGUwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWExLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5k
dHNpCj4gPiBAQCAtMTE4LDYgKzExOCwyMiBAQCBncGlvOiBiYW5rQDQwMCB7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBlcmlwaHNf
cGluY3RybCAwIDAgNjI+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+
ID4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydF9hX3BpbnM6IHVhcnRf
YSB7Cj4gT25seSBvdXIgbmV3ZXIgLmR0c2kgKGUuZy4gbWVzb24tZzEyLWNvbW1vbi5kdHNpKSBh
cmUgZm9sbG93aW5nIHRoZQo+IHBhdHRlcm4gd2hlcmUgbm9kZSBuYW1lcyBzaG91bGQgdXNlIGRh
c2hlcyBpbnN0ZWFkIG9mIHVuZGVyc2NvcmVzLgo+IFNvIHBsZWFzZSB1c2U6IHVhcnRfYV9waW5z
OiB1YXJ0LWEgeyAuLi4KPiAKCk9rYXksIG5vIHByb2JsZW0uIEknbGwgcmVuYW1lIHRoZSBub2Rl
cyBpbiB0aGUgbmV4dCBwYXRjaCBzZXJpZXMKdmVyc2lvbi4KCj4gWy4uLl0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWFydF9hX2N0c19ydHNfcGluczogdWFydF9hX2N0c19y
dHMgewo+IHNpbWlsYXIgdG8gdGhlIGNvbW1lbnQgZnJvbSBhYm92ZToKPiB1YXJ0X2FfY3RzX3J0
c19waW5zOiB1YXJ0LWEtY3RzLXJ0cyB7IC4uLgo+IAoKT2sKCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbXV4IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdyb3VwcyA9ICJ1YXJ0X2FfY3RzIiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ1YXJ0
X2FfcnRzIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZ1bmN0aW9uID0gInVhcnRfYSI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBiaWFzLXB1bGwtZG93bjsKPiBPdXQgb2YgY3VyaW9zaXR5OiBp
cyB0aGlzIHB1bGwgZG93biBuZWVkZWQgb24gYWxsIGJvYXJkcyBvciBqdXN0IHNwZWNpZmljIG9u
ZXM/Cj4gSXQgc2VlbXMgbGlrZSBhbGwgb3RoZXIgU29DcyB1c2UgYmlhcy1kaXNhYmxlIGZvciB0
aGUgUlRTL0NUUyBwaW5zLgo+IAoKVGhhdCdzIGEgZ29vZCBxdWVzdGlvbi4gVGhlIEFtbG9naWMg
Y3VzdG9tIGtlcm5lbCBEVFNJIGRlY2xhcmVzCmJpYXMtcHVsbC1kb3duIGZvciBDVFMvUlRTIHBp
bnMgaW4gVUFSVF9BLiBUaGVyZSBpcyBubyBpbmZvcm1hdGlvbiBhYm91dAp0aGlzIGluIHRoZSBB
MSBkYXRhc2hlZXQuIEhvd2V2ZXIsIGZyb20gbXkgdW5kZXJzdGFuZGluZywgaXQgaXMgcmVsYXRl
ZAp0byB0aGUgdXNhZ2Ugb2YgdGhlIFVBUlRfQS4gVHlwaWNhbGx5LCB0aGUgVUFSVF9BIGVuZHBv
aW50IG9uIEExIGJvYXJkcwppcyB1c2VkIGZvciBCVCBjb25uZWN0aW9ucywgd2hpY2ggaXMgd2h5
IEFtbG9naWMgYXBwbGllcyBiaWFzLXB1bGwtZG93bgppbiB0aGUgY29tbW9uIERUU0kuIElmIG15
IGFzc3VtcHRpb24gaXMgY29ycmVjdCwgaXQgd291bGQgYmUgYmV0dGVyIHRvCm1vdmUgdGhlIGJp
YXMtcHVsbC1kb3duIG5vZGUgcGFyYW1ldGVyIHRvIHRoZSBjdXN0b20gYm9hcmQgRFRTLiBJIHdp
bGwKaW52ZXN0aWdhdGUgdGhpcyBmdXJ0aGVyIGFuZCByZXdvcmsgaXQgaW4gdGhlIG5leHQgdmVy
c2lvbiBpZiBuZWNlc3NhcnkuCgotLSAKVGhhbmsgeW91LApEbWl0cnkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
