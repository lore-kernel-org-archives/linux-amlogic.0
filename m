Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E933C83F12
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0M2C6GwdhVwduPofuazqGNzVO1OFlt7L3ax66tR6Ns=; b=AB+bJ/ybnU59v+
	Yaydygs6MCuSeZ8Bgi8588uMmWYyvSsrL1TrsDH1bPSTH1YKXvCZw9zEujnIDPzlRZgw1PRHDAbgQ
	DrJU3sPY1JsJEyAhCKVe2ElL780+aJnreTb8fDc9qpzHABMQ2WwKNrRaXxedv4862IUaXzowss1Md
	2YeHki4+ZKG3acEl5oEodiaSW9A+OFapVaMPnElhOUVSXEJq3xMECRJEHzaztOx9SP9QESwCLIGFk
	9aiS+DBBtXlK6rIEwtf98vwPcXKhPQzy62/VLFEEMDn0gd9dQEYdT6BKtme8xQXac26wV9c+mKBFX
	Ieoa6j/XoA3bFD6exCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXtS-009AC1-0B;
	Mon, 28 Aug 2023 08:46:42 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXtO-009AAw-2q;
	Mon, 28 Aug 2023 08:46:41 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8C8DC12000C;
	Mon, 28 Aug 2023 11:46:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8C8DC12000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1693212393;
	bh=r29eLjpXepEW7Se4+IjbUfK2/e/7n/R60QgQfX9lTUg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=MWGb1qDTO/M25JCgTyjb4N9IOVohGIqrSNKxYAKynLM0y+MwvCyr9q1VVkin+CNlX
	 CB2Jvqvd7qcityoKW+Avd9bHqx74KfJMwNvsBiTxd6VrvH6Lx6G2IS/DPPGaoDXcwm
	 nsnc2yd3RZeZUWYstnx+CqmncMRub1FSdA+bIGmEFXmg5mjwOxyBt5NJWSm4DBsPYs
	 DcisGdZt/zQzcIAJpOHVkWrpI8c3yy6JGLQhF4rk5JvvYTpv9Cg336+H6bSH+DucWk
	 cd/Mp8uor33qzokpTSAiMFB7NzzXC080WnTLuujtROhpP/O+s10MoV8rheW0Cr0biy
	 +a3tGLL2wSu7A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 28 Aug 2023 11:46:32 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 28 Aug
 2023 11:46:27 +0300
Date: Mon, 28 Aug 2023 11:46:32 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Lucas Tanure <tanure@linux.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7
 SoC"
Message-ID: <20230828084632.sp73jppcrfvc7nv3@CAB-WSD-L081021>
References: <20230827082944.5100-1-tanure@linux.com>
 <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com>
 <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
 <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com>
 <20230828082009.kehgwi4fxtj3bfze@CAB-WSD-L081021>
 <e070f432-28bd-465f-ad66-53add8b61907@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e070f432-28bd-465f-ad66-53add8b61907@linaro.org>
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
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;lists.infradead.org:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/08/28 07:01:00
X-KSMG-LinksScanning: Clean, bases: 2023/08/28 07:01:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/28 07:05:00 #21755218
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_014639_273722_B018413D 
X-CRM114-Status: GOOD (  49.96  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMTA6MjM6NDVBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gT24gMjgvMDgvMjAyMyAxMDoyMCwgRG1pdHJ5IFJva29zb3Ygd3Jv
dGU6Cj4gPiBPbiBTdW4sIEF1ZyAyNywgMjAyMyBhdCAxMTozMTozNUFNICswMTAwLCBMdWNhcyBU
YW51cmUgd3JvdGU6Cj4gPiA+IE9uIDI3LTA4LTIwMjMgMTE6MjMsIE5laWwgQXJtc3Ryb25nIHdy
b3RlOgo+ID4gPiA+IEhpIEx1Y2FzLAo+ID4gPiA+IAo+ID4gPiA+IExlIDI3LzA4LzIwMjMgw6Ag
MTI6MDQsIEx1Y2FzIFRhbnVyZSBhIMOpY3JpdMKgOgo+ID4gPiA+ID4gT24gMjctMDgtMjAyMyAx
MDo0OCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPiA+ID4gPiA+IEhpIEx1Y2FzLAo+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gTGUgMjcvMDgvMjAyMyDDoCAxMDoyOSwgTHVjYXMgVGFudXJlIGEg
w6ljcml0wqA6Cj4gPiA+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA2YTQxOTdmOTc2MzMy
NTA0M2FiZjc2OTBhMjExMjRhOWZhY2JmNTJlLgo+ID4gPiA+ID4gPiA+IE5ldyBTb0Mgd2lsbCB1
c2UgdHR5UzAgaW5zdGVhZCBvZiB0dHlBTUwsIHNvIFQ3IFNvQyBkb2Vzbid0Cj4gPiA+ID4gPiA+
ID4gbmVlZCBhIE9GX0VBUkxZQ09OX0RFQ0xBUkUuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+ID4gPiA+
ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+IFNpbmNlIFYxOgo+ID4gPiA+ID4gPiA+IC0gYWRkIFNp
Z25lZC1vZmYtYnk6Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gIMKgIGRyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAyIC0tCj4gPiA+ID4gPiA+ID4gIMKgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gPiA+ID4gPiA+ID4gYi9kcml2
ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gPiA+ID4gPiA+ID4gaW5kZXggYzRmNjFkODJm
YjcyNy4uNzkwZDkxMGRhZmE1ZCAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3R0
eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy90dHkvc2Vy
aWFsL21lc29uX3VhcnQuYwo+ID4gPiA+ID4gPiA+IEBAIC02NDgsOCArNjQ4LDYgQEAgbWVzb25f
c2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXAoc3RydWN0Cj4gPiA+ID4gPiA+ID4gZWFybHljb25f
ZGV2aWNlICpkZXZpY2UsIGNvbnN0IGNoYXIgKm9wdAo+ID4gPiA+ID4gPiA+ICDCoCBPRl9FQVJM
WUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dpYyxtZXNvbi1hby11YXJ0IiwKPiA+ID4gPiA+ID4g
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVf
c2V0dXApOwo+ID4gPiA+ID4gPiA+IC1PRl9FQVJMWUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dp
Yyx0Ny11YXJ0IiwKPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXNvbl9z
ZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cCk7Cj4gPiA+ID4gPiA+ID4gIMKgICNkZWZpbmUgTUVT
T05fU0VSSUFMX0NPTlNPTEVfUFRSKF9kZXZuYW1lKQo+ID4gPiA+ID4gPiA+ICgmbWVzb25fc2Vy
aWFsX2NvbnNvbGVfIyNfZGV2bmFtZSkKPiA+ID4gPiA+ID4gPiAgwqAgI2Vsc2UKPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IEhvdyBkbyB5b3UgdXNlIGVhcmx5Y29uIHdpdGggdGhpcyByZW1vdmVk
ID8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE5laWwKPiA+ID4gPiA+IFRoaXMgaXMgbXkga2Vy
bmVsIGNtZGxpbmU6Cj4gPiA+ID4gPiBjb25zb2xlPXR0eVMwLDkyMTYwMCBub19jb25zb2xlX3N1
c3BlbmQgZWFybHljb249dHR5UzAsMHhmZTA3ODAwMAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBbmQg
SSBjYW4gc2VlIG15IGxvZzoKPiA+ID4gPiA+IGJvb3QgNjRiaXQga2VybmVsCj4gPiA+ID4gPiBb
wqDCoMKgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAweDAwMDAwMDAw
MDAgWzB4NDEwZmQwOTJdCj4gPiA+ID4gPiBbwqDCoMKgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9u
IDYuNS4wLXJjNy1uZXh0LTIwMjMwODI1Kwo+ID4gPiA+ID4gKHRhbnVyZWFsQHJ5emVuKSAoYWFy
Y2g2NC1ub25lLWxpbnV4LWdudS1nY2MgKEdOVSBUb29sY2hhaW4gZm9yIHRoZQo+ID4gPiA+ID4g
QS1wcm9maWxlIEFyY2hpdGVjdHVyZSAxMC4zLTIwMjEuMDcgKGFybS0xMC4yOSkpIDEwLjMuMSAy
MDIxMDYyMSwKPiA+ID4gPiA+IEdOVSBsZCAoR05VIFRvb2xjaGFpbiBmbzMKPiA+ID4gPiA+IFvC
oMKgwqAgMC4wMDAwMDBdIEtBU0xSIGRpc2FibGVkIGR1ZSB0byBsYWNrIG9mIHNlZWQKPiA+ID4g
PiA+IFvCoMKgwqAgMC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IEtoYWRhcyB2aW00Cj4gPiA+ID4g
PiBbwqDCoMKgIDAuMDAwMDAwXSBPRjogcmVzZXJ2ZWQgbWVtOgo+ID4gPiA+ID4gMHgwMDAwMDAw
MDA1MDAwMDAwLi4weDAwMDAwMDAwMDUyZmZmZmYgKDMwNzIgS2lCKSBub21hcCBub24tcmV1c2Fi
bGUKPiA+ID4gPiA+IHNlY21vbkA1MDAwMDAwCj4gPiA+ID4gPiBbwqDCoMKgIDAuMDAwMDAwXSBP
RjogcmVzZXJ2ZWQgbWVtOgo+ID4gPiA+ID4gMHgwMDAwMDAwMDA1MzAwMDAwLi4weDAwMDAwMDAw
MDcyZmZmZmYgKDMyNzY4IEtpQikgbm9tYXAKPiA+ID4gPiA+IG5vbi1yZXVzYWJsZSBzZWNtb25A
NTMwMDAwMAo+ID4gPiA+ID4gLi4uCj4gPiA+ID4gPiBbwqDCoMKgIDAuMDc5MzY4XSBpbyBzY2hl
ZHVsZXIgbXEtZGVhZGxpbmUgcmVnaXN0ZXJlZAo+ID4gPiA+ID4gW8KgwqDCoCAwLjA3OTM3NF0g
aW8gc2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVyZWQKPiA+ID4gPiA+IFvCoMKgwqAgMC4wNzk1NDld
IGlvIHNjaGVkdWxlciBiZnEgcmVnaXN0ZXJlZAo+ID4gPiA+ID4gW8KgwqDCoCAwLjA4MzM3M10g
ZmUwNzgwMDAuc2VyaWFsOiB0dHlTMCBhdCBNTUlPIDB4ZmUwNzgwMDAgKGlycSA9IDE0LAo+ID4g
PiA+ID4gYmFzZV9iYXVkID0gMTUwMDAwMCkgaXMgYSBtZXNvbl91YXJ0Cj4gPiA+ID4gPiBbwqDC
oMKgIDAuMDgzNDAzXSBwcmludGs6IGNvbnNvbGUgW3R0eVMwXSBlbmFibGVkCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IEFzIHRoZSBsb2cgaXMgT0ssIGFuZCBUNyBmb3Igbm93IGlzIGJpbmRpbmcgYWdh
aW5zdCBTNCBjb2RlIHdlCj4gPiA+ID4gPiBzaG91bGQgZHJvcCB0aGlzIHBhdGNoIGFuZCBhZGQg
YSBTNCBvbmUgaWYgbmVlZGVkLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBCdXQganVzdCBoYXZpbmcg
dGhpcyBsb2cgaXMgbm90IGVub3VnaCBmb3IgdGVzdGluZyBlYXJseWNvbj8KPiA+ID4gPiA+IEkg
YW0gYXNzdW1pbmcgdGhhdCBieSBqdXN0IGhhdmluZyB0aGUgbG9nIHNpbmNlIDAuMDAwMCBpcyBh
IGdvb2QKPiA+ID4gPiA+IHNpZ24gdGhhdCBlYXJseWNvbiBpcyB3b3JraW5nLgo+ID4gPiA+ID4g
Q291bGQgeW91IGdpdmUgZnVydGhlciBndWlkYW5jZT8KPiA+ID4gPiAKPiA+ID4gPiBGaXJzdCB0
aGUga2VybmVsIGFyZ3VtZW50IGlzIHNpbXBseSAiZWFybHljb24iIHdpdGggbm8gb3RoZXIgb3B0
aW9ucywKPiA+ID4gPiB0aGUgZWFybHljb24gY29kZSB3aWxsIGZldGNoIHRoZSBmaXJzdCB1YXJ0
IHVzaW5nIHRoZSBEVAo+ID4gPiA+IC9jaG9zZW4vc3Rkb3V0LXBhdGggcHJvcGVydHkuCj4gPiA+
ID4gCj4gPiA+ID4gVGhlbiB5b3Ugc2hvdWxkIHNlZSBzb21ldGhpbmcgbGlrZSByaWdodCBhZnRl
ciAiTWFjaGluZSBtb2RlbCI6Cj4gPiA+ID4gW8KgwqDCoCAwLjAwMDAwMF0gZWFybHljb246IG1l
c29uMCBhdCBNTUlPIDB4MDAwMDAwMDBmZjgwMzAwMCAob3B0aW9ucwo+ID4gPiA+ICcxMTUyMDBu
OCcpCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGJvb3QgbG9nIHlvdSBzaGFyZSBkb2Vzbid0IHVzZSBl
YXJseWNvbiwgaXQgd2FpdHMgdW50aWwgYWxsCj4gPiA+ID4gZGVwZWRlbmN5IG9mIHRoZSBVQVJU
Cj4gPiA+ID4gaGFzIGJlZW4gcHJvYmVkIGJlZm9yZSBwcm9iaW5nIHRoZSBVQVJUIGRyaXZlciBh
bmQgcHJpbnRzIHRoZSB3aG9sZSBib290Cj4gPiA+ID4gbG9nLgo+ID4gPiA+IAo+ID4gPiA+IEVh
cmx5Y29uIGlzIGEgbWVjaGFuaXNtIHRvIHVzZSB0aGUgVUFSVCBIVyBhcyBjb25maWd1cmVkIGJ5
IHRoZQo+ID4gPiA+IGJvb3Rsb2FkZXIgaW4KPiA+ID4gPiBhIG1pbmltYWwgd2F5IHZlcnkgZWFy
bHkgaW4gdGhlIGJvb3QgaW4gb3JkZXIgdG8gZGV0ZWN0IHZlcnkgZWFybHkgbG9ja3Vwcy4KPiA+
ID4gPiAKPiA+ID4gPiBLZWVwaW5nIE9GX0VBUkxZQ09OX0RFQ0xBUkUgZm9yIHQ3IHdvdWxkIGVu
YWJsZSB0aGlzLgo+ID4gPiA+IAo+ID4gPiA+IE5laWwKPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gTHVjYXMgVGFudXJlCj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gQnV0IHRoZW4gd2Ug
d291bGQgbmVlZCB0byBhZGQgRWFybHljb24gZm9yIFM0IHRvby4KPiA+ID4gSG93IGNhbiB3ZSBh
ZGQgb25lIEVhcmx5Y29uIGZvciBhbGwgZnV0dXJlIFNvQ3MsIGxpa2UgUzQgYW5kIFQ3Pwo+ID4g
PiAKPiA+IAo+ID4gUGVyIG15IHVuZGVyc3RhbmRpbmcsIHlvdSBqdXN0IG5lZWQgdG8gZGVjbGFy
ZSBVQVJUIGR0cyBub2RlIHdpdGggdGhlCj4gPiBmb2xsb3dpbmcgY29tcGF0aWJsZSBzdHJpbmc6
ICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiLiBJdCB3aWxsIGVuYWJsZWQKPiA+IGVhcmx5Y29uLiBU
aGVyZSBpcyBubyBuZWNjZXNzYXJ5IHRvIGRlY2xhcmUgc2VwYXJhdGUKPiA+IE9GX0VBUkxZQ09O
X0RFQ0xBUkUoKS4gSXQncyB3b3JraW5nIG9rYXkgZm9yIEExIGR0czoKPiAKPiBUaGlzIHdvcmtz
IG9uIEExIGJlY2F1c2UgdWFydF9BT19CIGlzIGFuIEFsd2F5cy1PbiBVQVJULCBhbmQgdXNpbmcg
YW1sb2dpYyxtZXNvbi1hby11YXJ0Cj4gaXMgY29ycmVudC4KPiBCdXQgZm9yIFM0ICYgVDcsIEFt
bG9naWMgZHJvcHBlZCB0aGUgQWx3YXlzLU9uIHBvd2VyIGRvbWFpbiwgc28gdGhlcmUncyBubyBt
b3JlIEFPIHVhcnRzLAo+IHNvIHVzaW5nIGFtbG9naWMsbWVzb24tYW8tdWFydCBvbiB0aG9zZSBp
cyBhYnVzaW5nIHRoZSBEVCB0byBlbmFibGUgYSBkcml2ZXIgZnVuY3Rpb25hbGl0eS4KPiAKPiBT
byB0aGUgc29sdXRpb24gaXMgdG8gYWRkIHRob3NlIE9GX0VBUkxZQ09OX0RFQ0xBUkUgYW5kIG9u
bHkgdXNlIHRoZSBjb3JyZWN0Cj4gL2Nob3Nlbi9zdGRvdXQtcGF0aCBwcm9wZXJ0eS4KCk9oLCBJ
IGRpZG4ndCBrbm93IGFib3V0IG1pc3NpbmcgQWx3YXlzLU9uIFVBUlQgQU8gcG93ZXIgZG9tYWlu
LiBJbiB0aGlzCnNpdHVhdGlvbiBJJ20gZnVsbHkgYWdyZWUgd2l0aCBzZXBhcmF0ZSBPRl9FQVJM
WUNPTl9ERUNMQVJFKCkuIFRoYW5rIHlvdQpmb3IgZXhwbGFuYXRpb24hCgo+ID4gCj4gPiBtZXNv
bi1hMS5kdHNpIHVhcnQgZGVjbGFyYXRpb246Cj4gPiAJdWFydF9BT19COiBzZXJpYWxAMjAwMCB7
Cj4gPiAJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1hMS11YXJ0IiwKPiA+IAkJCSAgICAg
ImFtbG9naWMsbWVzb24tYW8tdWFydCI7Cj4gPiAJCXJlZyA9IDwweDAgMHgyMDAwIDB4MCAweDE4
PjsKPiA+IAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI2IElSUV9UWVBFX0VER0VfUklTSU5HPjsK
PiA+IAkJY2xvY2tzID0gPCZ4dGFsPiwgPCZ4dGFsPiwgPCZ4dGFsPjsKPiA+IAkJY2xvY2stbmFt
ZXMgPSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwo+ID4gCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ID4gCX07Cj4gPiAKPiA+IGVhcmx5Y29uIGRlY2xhcmF0aW9uIGZyb20gZHRzOgo+ID4gCWFsaWFz
ZXMgewo+ID4gCQlzZXJpYWwwID0gJnVhcnRfQU9fQjsKPiA+IAl9Owo+ID4gCj4gPiAJY2hvc2Vu
IHsKPiA+IAkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7Cj4gPiAJfTsKPiA+IAo+
ID4gPiAKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+ID4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+ID4gCj4gCgotLSAKVGhhbmsgeW91LApEbWl0cnkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
