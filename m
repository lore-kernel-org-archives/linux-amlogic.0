Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70332EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxxLYggFzmNP2JOi6TMdgWG+LDuiB+9dFIdinZR6Jqo=; b=K7GAJzWLzSaNqg
	WlT0FfNjq4+r0XYZLYTEOBqrCEwf7FjitTwT8uqWSpfKrB90N69EbLmg0PNVPgGjxvhCPaJRfyFV8
	lBVdi5rWch0/7x2X6qIqO/0ynqaIz090mlfjnZFzzy59/f9r0GzhbU4nD/yS6w9JRIZ6a3kxOLIbs
	NhbM0w+eCmwWLMFpav4fkJu/4HptdlbudcosX91TDLRLVIU7M6CGRbSpVPJkhKnPEFotRDH2MoMlS
	yvB+sm5Opru95l0pTHwZD1FRToQMSTjpMSAzpVpYAKx3xxuNeVGU7tGvbtLP+45e69Czkj4YzlgNc
	UOGBgCsbirj+eFfFWKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWWP-00FtnU-1P;
	Wed, 28 Jun 2023 14:51:53 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWWM-00Ftmg-00;
	Wed, 28 Jun 2023 14:51:51 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BA890120019;
	Wed, 28 Jun 2023 17:51:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BA890120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687963871;
	bh=ijsYqbMrBgDeL0im1rxl0SGUF7eOfc45yINo+UI8MC4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Oe+k4MbnYaiC6F6uZRqqnKz+SRkhwtkRZ3YJ/ekh/TdOjH2aH3gBkDFjr1gETBnGC
	 fCP14LYp/96JhA6mgW2C3tbIQfEmtOgfa5a3azAY6seTm/rG8Asro4GxFlax56ZZnk
	 YM/aLipf/rrquca2rutqkoZrK3dys3RcUu8/9bCnXaOS9naoAIEEjY6SnwzsyBZAG+
	 VTZlh3nhsq4yEKTrCRd4gW/q6O9VMSdBnZpzRbdY7vnP0ZXePcK0NoPvNUGDGn+JSg
	 OkJ4LMJQEOm0l4RDlrE/0I/3JVL1RRhfqi2qE2Hb20LPitRPzGtjkK4JbUDuCk65Xk
	 RHrHyYNtEPnew==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 17:51:10 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 28 Jun
 2023 17:50:12 +0300
Date: Wed, 28 Jun 2023 17:51:10 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<jbrunet@baylibre.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<khilman@baylibre.com>, <conor+dt@kernel.org>, <kernel@sberdevices.ru>,
	<sdfw_system_team@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Oleg Lyovin <ovlevin@sberdevices.ru>
Subject: Re: [PATCH v1 5/6] arm64: dts: meson: a1: introduce UART_AO mux
 definitions
Message-ID: <20230628145110.a7igezu7ts2aymkd@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-6-ddrokosov@sberdevices.ru>
 <CAFBinCD-5RD_iszZZRg58XqTHDEHnipJkf2aAex8MdUyh=bVCw@mail.gmail.com>
 <c41d2d9f-7ddd-160d-d455-ba4fece7ff93@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c41d2d9f-7ddd-160d-d455-ba4fece7ff93@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 08:00:00 #21591748
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_075150_409535_A49AABDE 
X-CRM114-Status: GOOD (  36.27  )
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

TmVpbCwgTWFydGluLAoKT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMDM6MzQ6MzhQTSArMDIwMCwg
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBIaSwKPiAKPiBPbiAyNS8wNi8yMDIz
IDIzOjA3LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gNywgMjAy
MyBhdCAxMDoxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+
IHdyb3RlOgo+ID4gPiAKPiA+ID4gRnJvbTogT2xlZyBMeW92aW4gPG92bGV2aW5Ac2JlcmRldmlj
ZXMucnU+Cj4gPiA+IAo+ID4gPiBUaGUgQW1sb2dpYyBBMSBoYXMgYSBVQVJUX0FPIHBvcnQsIHdo
aWNoIGNhbiBiZSB1c2VkLCBmb3IgZXhhbXBsZSwgZm9yCj4gPiA+IEJUIEhDSSBINCBjb25uZWN0
aW9uLgo+ID4gPiAKPiA+ID4gVGhpcyBwYXRjaCBhZGRzIG11eCBkZWZpbml0aW9ucyBmb3IgaXQu
Cj4gPiBJbiB0aGUgcGFzdCB3ZSd2ZSBvbmx5IHRha2VuIHRoZSBwaW5jdHJsIGRlZmluaXRpb25z
IGlmIHdlIGhhdmUgYQo+ID4gYm9hcmQgdGhhdCB1c2VzIHRoZW0uCj4gPiBOZWlsLCBkbyB3ZSBz
dGlsbCBoYXZlIHRoZSBzYW1lIHBvbGljeSBpbiBwbGFjZT8gSWYgc28gdGhpcyBwYXRjaAo+ID4g
c2hvdWxkIGJlIHNlbnQgd2l0aCB0aGUgc2VyaWVzIHRoYXQgYWRkcyBzdXBwb3J0IGZvciB5b3Vy
IEExIGJvYXJkLgo+IAo+IFllcyBhbmQgbm8sIGlmIHRoZSB3b3JrIGlzIGRvbmUgSSdsbCB0YWtl
IGl0LCBidXQgeWVhaCBzaW5jZSB1cHN0cmVhbSBsaW51eAo+IGhhdGVzIGRlYWQgY29kZSwgbGV0
J3Mgb25seSBkZWZpbmUgd2hhdCdzIG5lY2Vzc2FyeS4KPiAKCkknbGwgcHJlcGFyZSB0aGUgcGF0
Y2hlcyBmb3IgYWQ0MDEgcmVmZXJlbmNlIGJvYXJkLCBhbmQgc2hhcmUgdGhlIGluIHRoZQpuZXh0
IHBhdGNoIHNlcmllcyB2ZXJzaW9uLgoKPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBPbGVnIEx5
b3ZpbiA8b3ZsZXZpbkBzYmVyZGV2aWNlcy5ydT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IFJva29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KPiA+ID4gLS0tCj4gPiA+ICAgYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgfCAxNiArKysrKysrKysrKysr
KysrCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpCj4gPiA+IGluZGV4IDBl
ZmQ5MjJjYTdlMS4uM2ViNmFhOWMwMGUwIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+ID4gPiBAQCAtMTE4LDYgKzExOCwyMiBAQCBncGlv
OiBiYW5rQDQwMCB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ3Bpby1yYW5nZXMgPSA8JnBlcmlwaHNfcGluY3RybCAwIDAgNjI+Owo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gPiAKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1YXJ0X2FfcGluczogdWFydF9hIHsKPiA+IE9ubHkgb3VyIG5ld2Vy
IC5kdHNpIChlLmcuIG1lc29uLWcxMi1jb21tb24uZHRzaSkgYXJlIGZvbGxvd2luZyB0aGUKPiA+
IHBhdHRlcm4gd2hlcmUgbm9kZSBuYW1lcyBzaG91bGQgdXNlIGRhc2hlcyBpbnN0ZWFkIG9mIHVu
ZGVyc2NvcmVzLgo+ID4gU28gcGxlYXNlIHVzZTogdWFydF9hX3BpbnM6IHVhcnQtYSB7IC4uLgo+
IAo+IFRoZSBuZXcgc2NoZW1lIHdoaWNoIHNob3VsZCBiZSB1c2Ugc2hvdWxkIGJlOgo+IAo+IHVh
cnRfYV9waW5zOiB1YXJ0LWEtcGlucy1zdGF0ZSB7Cj4gCj4gYnV0IGl0IHdhc24ndCBlbmZvcmNl
ZCBpbiB0aGUgcGluY3RybCB5YW1sIHB1c2hlZCBieSBoZWluZXIsIGJ1dCBmb3Igc3VyZQo+IG5v
IHVuZGVyc2NvcmVzIGluIHRoZSBub2RlIG5hbWUuCj4gCgpPa2F5LCBnb3QgaXQKCj4gPiAKPiA+
IFsuLi5dCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydF9hX2N0c19y
dHNfcGluczogdWFydF9hX2N0c19ydHMgewo+ID4gc2ltaWxhciB0byB0aGUgY29tbWVudCBmcm9t
IGFib3ZlOgo+ID4gdWFydF9hX2N0c19ydHNfcGluczogdWFydC1hLWN0cy1ydHMgeyAuLi4KPiA+
IAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXV4IHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3JvdXBz
ID0gInVhcnRfYV9jdHMiLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAidWFydF9hX3J0cyI7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gInVhcnRfYSI7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJpYXMt
cHVsbC1kb3duOwo+ID4gT3V0IG9mIGN1cmlvc2l0eTogaXMgdGhpcyBwdWxsIGRvd24gbmVlZGVk
IG9uIGFsbCBib2FyZHMgb3IganVzdCBzcGVjaWZpYyBvbmVzPwo+ID4gSXQgc2VlbXMgbGlrZSBh
bGwgb3RoZXIgU29DcyB1c2UgYmlhcy1kaXNhYmxlIGZvciB0aGUgUlRTL0NUUyBwaW5zLgo+ID4g
Cj4gPiAKPiA+IEJlc3QgcmVnYXJkcywKPiA+IE1hcnRpbgo+IAoKLS0gClRoYW5rIHlvdSwKRG1p
dHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
