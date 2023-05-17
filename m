Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43810C7EE23
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 May 2023 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmHW9oaOSJahjKoaBGanQO0fkRbzAvaBP0mta+fYFlU=; b=wr0KzIiLTnNreN
	cBTyjtEMhKLphhp0Mbodpq4KgSv6kOFwvpHtaoBPJRiB6Gm2FsnziMaxN4Bja7Vf5mBIr+VaHlW/p
	lHM3UAe3h6RzSsQEf81QVPgrQxNz4PTuKU2dnpZcrCXZ4bda9iFg78Vxru9e4v2dglsGY/OTTKeF4
	lFn0vW/oagUF1LGlP9XoVrbFUSQ8G8VBS6d249Z6h487byoBrcAA0dtXZ2PuI5jhIQILHSwgFuE9p
	EXkc/lNHYqjU3jOvs0Xs0CSwcWOdk53fBoI6G+bXpChtBubegL3mPnhH3+0ZEniJ0PAw754BnQkXM
	nlOaw/oIHfWfNLW3BG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDLQ-0092F3-2a;
	Wed, 17 May 2023 09:21:16 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDLK-0092BP-32;
	Wed, 17 May 2023 09:21:14 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1B9505FD3C;
	Wed, 17 May 2023 12:21:04 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684315264;
	bh=RNtSPTsChdoOmWN48xhocv0ib4nuoqO6MTiNN7FBB/o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Nc5YRgA71yBkDgwb1swll2Bqo0LbVF1YzbomjtfeSHSCx4FPphmDfhiMOPZy8FyS5
	 KbXkICXgMmqghO865VFmrue4gotkqjXYyChVU6pc20cv/lh2wt2EmRFj7jsmR0KlJ1
	 1VyipSLSHIHzJaQCnUt7PjfSV1Bwr6fO60OlfNDtAuJduFUQbLbjoLOPNtYSOjICyb
	 6wYFFpBVRhFQ9WQ+UiRC1oW2cXFjWe5AIOmzG5GYiYqfD/ZJkqqzP1irY9ovJS6qob
	 EQLdfDOfp3fRptD0GNcABuCM5eHXoeB3Extck6o4MNPgkGOOHXKt2+DuSEs0PLuUxB
	 wc4jH6mOWuOiQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 17 May 2023 12:21:01 +0300 (MSK)
Date: Wed, 17 May 2023 12:21:00 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: George Stark <gnstark@sberdevices.ru>, <jic23@kernel.org>,
	<lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <andy.shevchenko@gmail.com>, <nuno.sa@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
Message-ID: <20230517092100.wgnfuzdhgotlvv22@CAB-WSD-L081021>
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/17 06:42:00 #21327754
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_022111_516632_37BC3E98 
X-CRM114-Status: GOOD (  17.65  )
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

SGVsbG8gTWFydGluLAoKT24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgMDk6MDg6MjZQTSArMDIwMCwg
TWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBHZW9yZ2UsCj4gCj4gdGhhbmsgeW91IGZv
ciB0aGlzIHBhdGNoIQo+IAo+IE9uIE1vbiwgTWF5IDE1LCAyMDIzIGF0IDExOjA24oCvUE0gR2Vv
cmdlIFN0YXJrIDxnbnN0YXJrQHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBH
ZW9yZ2UgU3RhcmsgPEdOU3RhcmtAc2JlcmRldmljZXMucnU+Cj4gPgo+ID4gQWNjb3JkaW5nIHRv
IGRhdGFzaGVldHMgb2Ygc3VwcG9ydGVkIG1lc29uIFNPQ3MKPiA+IGxlbmd0aCBvZiBBRENfQ0xL
X0RJViBmaWVsZCBpcyA2IGJpdHMgbG9uZwo+IEkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IHRoaXMg
c2VudGVuY2Ugd2hpY2ggZG9lc24ndCBhZmZlY3QgdGhpcyBwYXRjaAo+IC0gaXQncyBvbmx5IGFi
b3V0IG1hbmFnaW5nIGV4cGVjdGF0aW9uczoKPiBXaGljaCBTb0MgYXJlIHlvdSByZWZlcnJpbmcg
dG8/Cj4gVGhpcyBkaXZpZGVyIGlzIG9ubHkgcmVsZXZhbnQgb24gb2xkZXIgU29DcyB0aGF0IHBy
ZWRhdGUgR1hCQiAoUzkwNSkuCj4gVG8gbXkga25vd2xlZGdlIGFsbCBTb0NzIGZyb20gR1hCQiBv
bndhcmRzIHBsYWNlIHRoZSBkaXZpZGVyIGluIHRoZQo+IG1haW4gb3IgQU8gY2xvY2sgY29udHJv
bGxlciwgc28gdGhpcyBiaXRtYXNrIGlzIGlycmVsZXZhbnQgdGhlcmUuCj4gCgpXZSBhcmUgY3Vy
cmVudGx5IHdvcmtpbmcgd2l0aCB0aGUgQTEgU29DIGZhbWlseSwgc3BlY2lmaWNhbGx5IHRoZSBB
MTEzTAp2YXJpYW50LiBBY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldCBmb3IgdGhlIEExMTNMLCB0
aGUgQURDX0NMS19ESVYgY2FuCmJlIGZvdW5kIGluIHRoZSBTQVJfQURDX1JFRzMgcmVnaXN0ZXIg
YXMgYSA2LWJpdCB2YWx1ZSBsb2NhdGVkIHdpdGhpbgpiaXRzIDE1IHRocm91Z2ggMTAuCgo+ID4g
Rml4ZXM6IDNhZGJmMzQyNzMzMCAoImlpbzogYWRjOiBhZGQgYSBkcml2ZXIgZm9yIHRoZSBTQVIg
QURDIGZvdW5kIGluIEFtbG9naWMgTWVzb24gU29DcyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW9y
Z2UgU3RhcmsgPEdOU3RhcmtAc2JlcmRldmljZXMucnU+Cj4gU2luY2UgbXkgcXVlc3Rpb24gYWJv
dmUgZG9lc24ndCBhZmZlY3QgdGhpcyBwYXRjaDoKPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1l
bnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCi0tIApUaGFuayB5
b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
