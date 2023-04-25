Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619E0C77B61
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Apr 2023 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoGvepSCzcgR38/IxlFR+uaj2oz2B9hM4csJcyexC0k=; b=c1gniP11XMvPAs
	JDlUjsko8+Q6hFcqY8i9zaf+GWZc0qoNWd3N7oTLjgAXlPJab3BdHglIUEzkOGOz3ZCbZa+0xvBhK
	fx6z8PN8LQar+nP3nHteuHKP5ruIx4NMdsusyuCzCbT+Yc0Tb0HKyPoqiN4s/u1ESwkE2td2g3vgZ
	HsGyGCI/KImAt8AEZ5kpfppBH+mo6mcsnpdsqqNYBYS1UIH1WD2zCWaH9V/ZtIh6WH5bPPr/nl49s
	dMAyXGQQdl7PJe0ozRXktpy3jwdhvwfkecZwSH9rP3pjJu/QnOAYdETvvRwL5BQsO8uVtLbRW5J0e
	Yt9elElXbD75tDOB5v+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHQ2-00120O-2Q;
	Tue, 25 Apr 2023 12:05:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHPy-0011zO-2m;
	Tue, 25 Apr 2023 12:05:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 889195FD05;
	Tue, 25 Apr 2023 15:05:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682424306;
	bh=/7k2hmgzdS0RWThtX1QVPv33A+h1jqDTdyLWRVz4PtQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=rUHWN1H28wH6iCXoGWFuo0Owuh5UxXgiiUvT9oyGwOMOEYDF9gByjamwqDuIWOuXt
	 PFRpBZGx1+BZ2xn4eMdt0SqXge2rJxNeT0x9tXzGu0XVPV0Hdp2hBsvPqDbNOc4xhL
	 HAQWve0wxkYfvK9MJl6HSqSWQHGuNFMNXHXZqHP3gaumSc62gXiduIh8LvEJsbPIux
	 m4y9fIin/257IMbKn4Hvu5dMU2kd4c71/ejzWTYrHGyBZ4JAtFsfuIR60QKya+AOW9
	 aqnwRYUBFFa92VWgdYHCYhAhxIlI8GFovBlj1F0QArwb+0dIYT9P+H9t15CZr06HK3
	 J1XB8AUGCaTGQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 25 Apr 2023 15:05:05 +0300 (MSK)
Date: Tue, 25 Apr 2023 15:05:05 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v13 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
Message-ID: <20230425120505.xrgrjrxcxennrzct@CAB-WSD-L081021>
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-7-ddrokosov@sberdevices.ru>
 <CAFBinCBGWOB2XLb6su=R3W684rKdK3pOgPFsCGx+Oyo_pgdeBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCBGWOB2XLb6su=R3W684rKdK3pOgPFsCGx+Oyo_pgdeBg@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/25 07:55:00 #21159618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_050511_417795_E4FB15EE 
X-CRM114-Status: GOOD (  16.81  )
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

T24gU3VuLCBBcHIgMjMsIDIwMjMgYXQgMTE6MzA6MzhQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBXZWQsIEFwciA1LCAyMDIzIGF0IDk6NTnigK9QTSBEbWl0cnkgUm9r
b3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiBbLi4uXQo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGExX3BlcmlwaHNfY2xrY19tYXRjaF90YWJsZVtd
ID0gewo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImFtbG9naWMsYTEtY2xrYyIsIH0sCj4g
PiArICAgICAgIHt9LAo+IG5pdC1waWNrOiBwbGVhc2UgcmVtb3ZlIHRoZSBjb21tYSBhZnRlciB0
aGUgc2VudGluZWwKPiAKClRoYW5rIHlvdSBmb3IgYnJpbmdpbmcgdXAgdGhhdCBwb2ludCEgVGhl
cmUncyBubyBwcm9ibGVtIHdpdGggcmVtb3ZpbmcKaXQgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0
aGUgcHJvZHVjdC4gSSdsbCBwcmVwYXJlIGl0LgoKPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9m
LCBhMV9wZXJpcGhzX2Nsa2NfbWF0Y2hfdGFibGUpOwo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIGExX3BlcmlwaHNfY2xrY19kcml2ZXIgPSB7Cj4gPiArICAgICAgIC5w
cm9iZSA9IG1lc29uX2ExX3BlcmlwaHNfcHJvYmUsCj4gPiArICAgICAgIC5kcml2ZXIgPSB7Cj4g
PiArICAgICAgICAgICAgICAgLm5hbWUgPSAiYTEtY2xrYyIsCj4gPiArICAgICAgICAgICAgICAg
Lm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGExX3BlcmlwaHNfY2xrY19tYXRjaF90YWJs
ZSksCj4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGRyb3Agb2ZfbWF0Y2hfcHRyKCkgaGVyZSBhcyBu
byBvdGhlciBtZXNvbiBjbG9jawo+IGRyaXZlciB1c2VzIGl0Lgo+IEFsc28gdGhlcmUncyBjb21t
aXRzIGxpa2UgMDBjYjc1NGFjNjIyICgiY2xrOiBpbXg4bXE6IGRyb3AKPiBvZl9tYXRjaF9wdHIg
ZnJvbSBvZl9kZXZpY2VfaWQgdGFibGUiKSB3aGljaCBleHBsaWNpdGx5IHJlbW92ZSBpdCBmcm9t
Cj4gb3RoZXIgZHJpdmVycy4KCkV4YWN0bHksIGFsbCBNZXNvbiBjbG9jayBkcml2ZXJzIGRlcGVu
ZCBvbiB0aGUgQVJNNjQgY29uZmlnLCB3aGljaCBpbgp0dXJuIHNlbGVjdHMgQ09ORklHX09GIGJ5
IGRlZmF1bHQuIFNvIG9mX21hdGNoX3B0ciBjYW4gYmUgZHJvcHBlZC4KCj4gCj4gQXBhcnQgZm9y
bSB0aGVzZSB0d28gdGhpcyBwYXRjaCBsb29rcyBncmVhdCB0byBtZS4KPiAKCi0tIApUaGFuayB5
b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
