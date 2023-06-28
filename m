Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCEAEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZcYUailLHhJuHlY3v853LNxtSCrqHO10NJvulDMkTE=; b=m7YC2Nc83WM+b8
	fc4bjbwkhtzI0KmcjEAUuw50H2RJgOTjsn4aopvJo+UH/2rrOskLbVFo/eSrDH2bww6nOEnVh+0NH
	YPRoAsxSNoLs/T65PRsep1Q1cR/GZq31jJnNR5IS3acAvmsZj6m7wDHZW3J9RQ4dEleomM40/2YfE
	YNRIVizi0pE5jWTx1aFdU0ivJ1pAWoMYr8DL/73Jg6FnqVGNrrejlg8s34qGWTxHvazgKenftr0RS
	22fXvqADu+0gboUJN3BnysAZrJcZl2tnBviAGHaUn6hDZy50Ro6rJmNdyTPXtcN/dHN9SBg5yrPiO
	83Gd80/Sfc72tXkDC5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW9y-00FsCf-2N;
	Wed, 28 Jun 2023 14:28:42 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW9v-00FsCB-12;
	Wed, 28 Jun 2023 14:28:41 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8EB3A12001A;
	Wed, 28 Jun 2023 17:28:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8EB3A12001A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687962481;
	bh=vHb1I+eeL4dIRqb6WnplQbJGzMM2hmPjqcCXHrotSL0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=X/CQhSzZLbvh8bKAIbnoL0Jfp+x2KCoQ1aGYHm6EcuwgBQgBOJgX5U6fUGKqwQsq3
	 ZdXzx0oQFniBSGdBLEThM74VD0xytBszrSIDOgSrsiK8v4dmV+9BbFyb3WEKUY3Iw9
	 ykeTLXI+SZdg0k6+ZTh6430l0UIueDHTC+NvD7wK7cyuwBoeu/k3TkTG/UjwZz8kqO
	 OknfRu/c1GnEdvDc9Dmlk818TCkTFEHsaYesHTvGVtHRPwbVkYEy86/QDhpTJP0rmg
	 bTJfia6aNn+gGweP5zhdf2+q5Gs/bjKfqR9b20sTy7+JYr2kA+IxluDpIMT4zY0n+U
	 gJhHacMQXJuvw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 17:28:00 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 28 Jun
 2023 17:27:02 +0300
Date: Wed, 28 Jun 2023 17:28:00 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<jbrunet@baylibre.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<khilman@baylibre.com>, <conor+dt@kernel.org>, <kernel@sberdevices.ru>,
	<sdfw_system_team@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jan Dakinevich
	<yvdakinevich@sberdevices.ru>
Subject: Re: [PATCH v1 6/6] arm64: dts: meson: a1: add eMMC controller and
 its pins
Message-ID: <20230628142800.thhexjvk7ekhdb3m@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-7-ddrokosov@sberdevices.ru>
 <CAFBinCC_g6FhzR=PNDsYwT4OZb4uAXAWYGKSe7vSX7_pWM8pNA@mail.gmail.com>
 <41e6d93a-8899-e792-0859-d26360ef5dab@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41e6d93a-8899-e792-0859-d26360ef5dab@linaro.org>
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
X-CRM114-CacheID: sfid-20230628_072840_194939_0D892C3D 
X-CRM114-Status: GOOD (  23.12  )
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

SGVsbG8gTmVpbCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldyEKCk9uIE1vbiwgSnVuIDI2LCAy
MDIzIGF0IDAzOjM2OjIzUE0gKzAyMDAsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6
Cj4gSGksCj4gCj4gT24gMjUvMDYvMjAyMyAyMzoxMSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiA+IE9uIFdlZCwgSnVuIDcsIDIwMjMgYXQgMTA6MTbigK9QTSBEbWl0cnkgUm9rb3NvdiA8
ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiA+ID4gCj4gPiA+IEZyb206IEphbiBE
YWtpbmV2aWNoIDx5dmRha2luZXZpY2hAc2JlcmRldmljZXMucnU+Cj4gPiA+IAo+ID4gPiBUaGUg
ZGVmaW5pdGlvbiBpcyBpbnNwaXJlZCBieSBhIHNpbWlsYXIgb25lIGZvciBBWEcgU29DIGZhbWls
eS4KPiA+ID4gJ3NkaW9fcGlucycgYW5kICdzZGlvX2Nsa19nYXRlX3BpbnMnIHBpbmN0cmxzIGFy
ZSBzdXBwb3NlZCB0byBiZSB1c2VkIGFzCj4gPiA+ICJkZWZhdWx0IiBhbmQgImNsay1nYXRlIiBp
biBib2FyZC1zcGVjaWZpYyBkZXZpY2UgdHJlZXMuCj4gPiBMZXQncyB3YWl0IGZvciBOZWlsJ3Mg
cmVzcG9uc2Ugb24gdGhlIG90aGVyIHBhdGNoIGZvciB0aGUgcXVlc3Rpb24KPiA+IGFib3V0IHBp
biBtdXggc2V0dGluZ3MKPiA+IAo+ID4gPiAnbWVzb24tZ3gnIGRyaXZlciBkdXJpbmcgaW5pdGlh
bGl6YXRpb24gc2V0cyBjbG9jayB0byBzYWZlIGxvdy1mcmVxdWVuY3kKPiA+ID4gdmFsdWUgKDQw
MGtIeikuIEhvd2V2ZXIsIGJvdGggc291cmNlIGNsb2NrcyAoImNsa2luMCIgYW5kICJjbGtpbjEi
KSBhcmUKPiA+ID4gaGlnaC1mcmVxdWVuY3kgYnkgZGVmYXVsdCwgYW5kIHVzaW5nIG9mIGVNTUMn
cyBpbnRlcm5hbCBkaXZpZGVyIGlzIG5vdAo+ID4gPiBlbm91Z2ggdG8gYWNoaWV2ZSBzbyBsb3cg
dmFsdWVzLiBUbyBwcm92aWRlIGxvdy1mcmVxdWVuY3kgc291cmNlLAo+ID4gPiByZXBhcmVudCAi
c2RfZW1tY19zZWwyIiBjbG9jayB1c2luZyAnYXNzaWduZWQtY2xvY2tzJyBwcm9wZXJ0eS4KPiA+
IEV2ZW4gaWYgdGhlIHBpbmN0cmwgcGFydCBzaG91bGQgYmUgcG9zdHBvbmVkIHRoZW4gSSB0aGlu
ayBpdCdzIHdvcnRoCj4gPiBhZGRpbmcgJnNkX2VtbWMKPiAKPiBZZWFoIGl0J3Mgd2VpcmQgdG8g
YWRkIEhXIGRlZmluaXRpb24gYW5kIHRvIG5vdCBlbmFibGUgdGhlbSwKPiBzbyBwbGVhc2UgZW5h
YmxlIHRoZW0gaW4gdGhlIGJvYXJkIGlmIHlvdSBhZGQgdGhlbSBpbiB0aGUgRFRTSS4KClVuZm9y
dHVuYXRlbHksIEknbSB1bmFibGUgdG8gcHJvdmlkZSBvdXIgaW50ZXJuYWwgYm9hcmQgRFRTLiBI
b3dldmVyLCBJCmhhdmUgYW4gQUQ0MDEgcmVmZXJlbmNlIGJvYXJkIG9uIGhhbmQsIHNvIGl0J3Mg
cG9zc2libGUgdG8gdGVzdApldmVyeXRoaW5nIHRoZXJlLiBJJ2xsIGluY2x1ZGUgdGhlc2UgY2hh
bmdlcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKLS0gClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
