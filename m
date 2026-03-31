Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E1CFF60D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2026 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfj7twlPCQz99nykhLty17mR4u2paGLWltaN09xwQP4=; b=bNlTkOSL2LUebS
	8v6LdLg7vBDmVfxm2mPa+tbtBgnwZRTFv4k+XuCP2I+Zp6pWHb6FXZz1Ype3JznYLo6rH4cOOv38I
	Us0UC3qENsK8PWTnyfaQQH97PI04nbtwCGuQCyVaTdXBhCm0OYcc0yKK+OusIHe3b0QqhYb5mFjjE
	l9HZCYuaxKzxEBt3CgOjoPL9mf1St3LvN4EMtka712qhlKeS7eukaGgaXOxK3FVnz96jmOwkfRgGP
	q1OHpRcsyMu4E9yl1TLV4QHgOEsl3JnHTivhOJJQe3XqEz1dhuMmSPk/ehq2kILsRsn0e3TeIAr6d
	FA2xftTMTt8gv5zHHszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tc6-0000000CVHy-1d9q;
	Tue, 31 Mar 2026 07:34:14 +0000
Received: from mx5.sberdevices.ru ([95.181.183.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tc3-0000000CVH4-01Ji;
	Tue, 31 Mar 2026 07:34:13 +0000
Received: from p-antispam-ksmg-gc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx5.sberdevices.ru (Postfix) with ESMTP id 2EBE9240009;
	Tue, 31 Mar 2026 10:33:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx5.sberdevices.ru 2EBE9240009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1774942439;
	bh=pqy2ZQ2K4gQV5vy8fXRZ04Ksn+hbGqCwiDElTb+KLWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Vqbye4/gxEkN5y6SkrGeFFYraxQHst5BP5gymx/wE6420SwJHr3YNYA2U1nz+y/kG
	 LNbOv6RIwAvd0hJg/1DnZbvjH1qVZlhvtykhSQMmbXgDtSUwr6SzTgJbK8VuIBluia
	 ly3rPuZJW/xaBVtrLBWmsR6qCcI/pZ63sWIO5jXhNrBcfbiIa1tC+7cPv/RnqqnZXc
	 3F6qwy7WlwbvEAXsDQuKdL4bwwFG/1gXYyofGINJ6uknXgzTSEromqeImnrk7QXmrE
	 8zfZzParopCAq48OKIv7NCK5AikhalzdwH1IkT4OJa1FRsU9WfigWgQxqSd3Z83B/w
	 mH3hVWsaC4+Gw==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (not verified))
	by mx5.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 31 Mar 2026 10:33:58 +0300 (MSK)
Message-ID: <4a9c726a-d580-4b0b-9530-228b58389c80@salutedevices.com>
Date: Tue, 31 Mar 2026 10:33:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error]Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Junyi Zhao <junyi.zhao@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
 <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected, bases: 2026/03/31 06:48:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 95 0.3.95 0e4b6d4f1992c354ebd6a5cc3c5624a3b0aa8cbc, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lists.infradead.org:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 201803 [Mar 31 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/03/30 22:26:00 #28356219
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected, bases: 2026/03/31 06:48:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_003411_562939_3D9B4028 
X-CRM114-Status: GOOD (  20.31  )
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

SGVsbG8gTWFydGluLCBYaWFud2VpCgoKT24gMy8zMS8yNiAxMDoxMCwgWGlhbndlaSBaaGFvIHdy
b3RlOgo+IEhpIE1hcnRpbiwKPiAgwqDCoMKgIEkgY29uZmlybWVkIHdpdGggSnVueWkgWmhhbyB0
aGF0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGNvdW50cyAKPiBmcm9tIHplcm8sIHNvIHRo
aXMgc3VibWlzc2lvbiBpcyBjb3JyZWN0Lgo+IFdlIGFncmVlIHRoaXMgc2hvdWxkIGJlIGZpeGVk
IGFuZCB3aWxsIGFkZHJlc3MgaXQgaW4gYSBmb2xsb3ctdXAgcGF0Y2guCj4gVGhhbmtzIGZvciBw
b2ludGluZyBpdCBvdXQuCj4gCj4gT24gMjAyNi8zLzMxIDA1OjU0LCBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIHdyb3RlOgo+PiBIaSBYaWFud2VpIFpoYW8sCj4+Cj4+IHRoYW5rcyBmb3IgeW91ciBjb250
cmlidXRpb24hCj4+Cj4+IE9uIFRodSwgTWFyIDI2LCAyMDI2IGF0IDc6MzXigK9BTSBYaWFud2Vp
IFpoYW8gdmlhIEI0IFJlbGF5Cj4+IDxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBr
ZXJuZWwub3JnPsKgIHdyb3RlOgo+Pj4gQWRkIGJpbmRpbmdzIGFuZCBkcml2ZXIgc3VwcG9ydCBB
bWxvZ2ljIFM3L1M3RC9TNiBTb0NzLgo+PiBUaGVyZSBpcyBhbiBvbGQgcmVwb3J0IHRoYXQgZ290
IGxvc3QsIHN0YXRpbmcgdGhhdCB0aGUgY3VycmVudAoKWGlhbndlaSBaaGFvIHRoYW5rcyBmb3Ig
dGhlIGNvbmZpcm1hdGlvbi4KSSBhbSB0aGUgYXV0aG9yIG9mIHRoZSBvbGQgcmVwb3J0IGFuZCB0
aGUgY29ycmVzcG9uZGluZyBwYXRjaCBhbmQgaXQncyAKbm90IGxvc3QuIFNvIGlmIHRoZSBwYXRj
aCBpcyBjb3JyZWN0IEknbGwgYmUgZ2xhZCB0byBhZGQgcmVsZXZhbnQgCnRlc3RlZC1ieSB0YWdz
LgoKPj4gcHdtLW1lc29uIGRyaXZlciBoYXMgYW4gb2ZmLWJ5LW9uZSBlcnJvciB3aXRoIHRoZSBo
aSBhbmQgbG8gZmllbGRzOgo+PiBbMF0KPj4gU2luY2UgeW91IGFyZSB3b3JraW5nIG9uIGJyaW5n
aW5nIHVwIGEgbmV3IHBsYXRmb3JtOiBpcyB0aGlzIHNvbWV0aGluZwo+PiB5b3UgY2FuIHZlcmlm
eSBpbiB5b3VyIGxhYj8KPj4gVG8gYmUgY2xlYXI6IEknbSBub3QgZXhwZWN0aW5nIHlvdSB0byB3
b3JrIG9uIHRoaXMgYWQtaG9jIG9yIGJyaW5nIGEKPj4gcGF0Y2ggaW50byB0aGlzIHNlcmllcy4g
SG93ZXZlciwgaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIHZlcmlmeQo+PiBpZiB0aGUg
ZmluZGluZ3MgZnJvbSBbMF0gYXJlIGNvcnJlY3QgYW5kIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBp
bgo+PiBmdXR1cmUuCj4+Cj4+IFRoYW5rIHlvdSBhbmQgYmVzdCByZWdhcmRzCj4+IE1hcnRpbgo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMKCi0tIApCZXN0IHJlZ2FyZHMKR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
