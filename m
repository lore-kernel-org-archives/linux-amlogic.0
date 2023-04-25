Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC04C77B61
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Apr 2023 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrMwoJoHcbbjIUvM5YMJRceYDJaA0Iwq0bIfgqF1LOo=; b=M3Xntj3Ae+CPoC
	wpEIT38RyqB/aML0Rw0a3vnp/7WhKcIgVJMPFnjBdEUegMPTN8uphW/Kd77KO4a7SwDVsd9UIcMpQ
	C2klhFkzY2rb3FxM0rb4B2VF8gldkb4SX8gmFyPEEdHx4vFROyOyuf/md8uHhn4EhxY4ZgQ5xnb8r
	aThWvMCNusUeN3f4oTLVMz5g3sUgGJ1QPd3Z2enZY0Ma0AE1KeR47/VCiktkD6NQ5TGV4F8mwqKwy
	lbSBfSkfsaqBZSK8SPMZPqny/ZzZo2oMS1JwraqaAK8XoDqObv+q6SsEnrBRlD5Wih9YvsclDiGTU
	hDPgok0QsxQ2K+r29+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHr8-0015WT-1m;
	Tue, 25 Apr 2023 12:33:14 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHr4-0015S0-1e;
	Tue, 25 Apr 2023 12:33:12 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 71A9B5FD05;
	Tue, 25 Apr 2023 15:33:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682425986;
	bh=M8TJz6TMqm7slfXEipNmibDQJ7voQTFLqHG+/oEd4jc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=s9kUrL+T6Zn4L1hYQXkZPtfb5nCqgVi5eojV/l3rBAA12rYmOn7TiAAuw1FcVm04X
	 H0udYw/FFlfCPMMChyes0CubfCt/lquS07lpaAO9rjRauSmIgn0nSBQnsaadh30nYi
	 d22INMAJPcrjAgRZK48IszAfv2bSJgdCERitydKeKlKnN4NxbvDc/ibCi7VQR17GJ0
	 jFXNTwEGfeqc5br/Rc79cofD/kRRUJx5qV7u47XJtN6AQK2TqQFctg75/MC5UrgVpY
	 ghuzBSxS37f8+Kwhy20kTi/BYga3kabJPsBmkwBX1HEpjncwlaI2nLmSD9wfa2jX6h
	 cuW6PQoyVBt9g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 25 Apr 2023 15:33:05 +0300 (MSK)
Date: Tue, 25 Apr 2023 15:33:04 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v13 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Message-ID: <20230425123304.xjmrkraybp2siwdw@CAB-WSD-L081021>
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-5-ddrokosov@sberdevices.ru>
 <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/25 07:55:00 #21159618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_053310_906822_A3E5CC84 
X-CRM114-Status: GOOD (  30.59  )
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

SGVsbG8gTWFydGluLAoKT24gU3VuLCBBcHIgMjMsIDIwMjMgYXQgMTE6MTI6MjdQTSArMDIwMCwg
TWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIZWxsbyBEbWl0cnksCj4gCj4gY3VycmVudGx5
IEplcm9tZSBpcyBidXN5IHNvIEkgYW0gdHJ5aW5nIHRvIGNvbnRpbnVlIHdoZXJlIGhlIGxlZnQg
b2ZmLgo+IEkgaGF2ZSBmb2xsb3dlZCB0aGUgcHJldmlvdXMgaXRlcmF0aW9ucyBhIGJpdCBidXQg
bWF5IGhhdmUgbWlzc2VkIHNvbWUKPiBkZXRhaWxzLiBTbyBhcG9sb2dpZXMgaWYgSSdtIHJlcGVh
dGluZyBzb21lIHF1ZXN0aW9ucyB0aGF0IEplcm9tZQo+IHByZXZpb3VzbHkgYXNrZWQuCj4gCgpU
aGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGVmZm9ydCEgUGxlYXNlIGZlZWwgZnJlZSB0byBh
c2sgYW55CnF1ZXN0aW9ucyB5b3UgbWF5IGhhdmUsIHdpdGhvdXQgYW55IGhlc2l0YXRpb24uCgo+
IE9uIFdlZCwgQXByIDUsIDIwMjMgYXQgOTo1OeKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+IFsuLi5dCj4gPiArY29uZmlnIENPTU1PTl9DTEtf
QTFfUExMCj4gPiArICAgICAgIHRyaXN0YXRlICJNZXNvbiBBMSBTb0MgUExMIGNvbnRyb2xsZXIg
c3VwcG9ydCIKPiBTaG91bGQgdGhpcyBiZSAiQW1sb2dpYyBBMSBTb0MgUExMIGNvbnRyb2xsZXIg
c3VwcG9ydCI/Cj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSAibWVzb24iIG5hbWUgd2Fz
IGRyb3BwZWQgZm9yIHRoaXMKPiBnZW5lcmF0aW9uIG9mIFNvQ3MuCj4gCj4gWy4uLl0KClllcCwg
dGhhdCdzIGdvb2QgcG9pbnQuIFdpbGwgY2hhbmdlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGExX3BsbF9jbGtjX21hdGNoX3Rh
YmxlW10gPSB7Cj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxhMS1wbGwtY2xr
YyIsIH0sCj4gPiArICAgICAgIHt9LAo+IG5pdC1waWNrOiBwbGVhc2UgZHJvcCB0aGUgY29tbWEg
YWZ0ZXIge30KPiBUaGlzIGVtcHR5IGVudHJ5IGlzIGEgc2VudGluZWwsIG5vIG90aGVyIGVudHJp
ZXMgYXJlIHN1cHBvc2VkIHRvIGNvbWUKPiBhZnRlciB0aGlzIC0gc28gYSB0cmFpbGluZyBjb21t
YSBpcyBub3QgbmVjZXNzYXJ5Lgo+IAo+IFsuLi5dCgpPSwoKPiA+ICsvKiBQTEwgcmVnaXN0ZXIg
b2Zmc2V0ICovCj4gPiArI2RlZmluZSBBTkFDVFJMX0ZJWFBMTF9DVFJMMCAgIDB4MAo+ID4gKyNk
ZWZpbmUgQU5BQ1RSTF9GSVhQTExfQ1RSTDEgICAweDQKPiA+ICsjZGVmaW5lIEFOQUNUUkxfRklY
UExMX1NUUyAgICAgMHgxNAo+ID4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX0NUUkwwICAweGMw
Cj4gPiArI2RlZmluZSBBTkFDVFJMX0hJRklQTExfQ1RSTDEgIDB4YzQKPiA+ICsjZGVmaW5lIEFO
QUNUUkxfSElGSVBMTF9DVFJMMiAgMHhjOAo+ID4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX0NU
UkwzICAweGNjCj4gPiArI2RlZmluZSBBTkFDVFJMX0hJRklQTExfQ1RSTDQgIDB4ZDAKPiA+ICsj
ZGVmaW5lIEFOQUNUUkxfSElGSVBMTF9TVFMgICAgMHhkNAo+IEhlcmUgSSBoYXZlIGEgcXVlc3Rp
b24gdGhhdCB3aWxsIHBvdGVudGlhbGx5IGFmZmVjdCBwYXRjaCAzLzYKPiAoImR0LWJpbmRpbmdz
OiBjbG9jazogbWVzb246IGFkZCBBMSBQTEwgY2xvY2sgY29udHJvbGxlciBiaW5kaW5ncyIpLgo+
IEluIHRoZSBjb3Zlci1sZXR0ZXIgeW91IG1lbnRpb25lZCB0aGF0IHF1aXRlIGEgZmV3IGNsb2Nr
cyBoYXZlIGJlZW4gb21pdHRlZC4KPiBBbnkgZHQtYmluZGluZ3MgdGhhdCB3ZSBjcmVhdGUgbmVl
ZCB0byBiZSBzdGFibGUgZ29pbmcgZm9yd2FyZC4gVGhhdAo+IG1lYW5zOiB0aGUgZHQtYmluZGlu
Z3Mgd2lsbCBhbHdheXMgbmVlZCB0byBkZXNjcmliZSB3aGF0IHRoZSBoYXJkd2FyZQo+IGlzIGNh
cGFibGUgb2YsIG5vdCB3aGF0IHRoZSBkcml2ZXIgaW1wbGVtZW50cy4KPiBTbyBteSBxdWVzdGlv
biBpczogZG8gd2UgaGF2ZSBhbGwgbmVlZGVkIGlucHV0cyBkZXNjcmliZWQgaW4gdGhlCj4gZHQt
YmluZGluZ3MgKGV2ZW4gdGhvdWdoIHdlJ3JlIG9taXR0aW5nIHF1aXRlIGEgZmV3IHJlZ2lzdGVy
cyBoZXJlCj4gdGhhdCB3aWxsIG9ubHkgYmUgYWRkZWQvdXNlZCBpbiB0aGUgZnV0dXJlKT8KPiBP
bGRlciBTb0NzIHJlcXVpcmUgKHRlbXBvcmFyaWx5KSB1c2luZyB0aGUgWFRBTCBjbG9jayBmb3Ig
Q1BVIGNsb2NrCj4gdHJlZSBjaGFuZ2VzLiBUbyBtYWtlIGEgbG9uZyBzdG9yeSBzaG9ydDogSSdt
IHdvbmRlcmluZyBpZiAtIGF0IGxlYXN0Cj4gLSB0aGUgWFRBTCBjbG9jayBpbnB1dCBpcyBtaXNz
aW5nLgoKVGhlIEFtbG9naWMgQTEgY2xvY2sgZW5naW5lIGNvbXByaXNlcyBmb3VyIGNsb2NrIGNv
bnRyb2xsZXJzIGZvcgpwZXJpcGhlcmFscywgUExMLCBDUFUsIGFuZCBhdWRpby4gV2hpbGUgdGhl
IGZpcnN0IHR3byBoYXZlIGJlZW4KaW50cm9kdWNlZCBpbiB0aGUgY3VycmVudCBwYXRjaCBzZXJp
ZXMsIHRoZSBsYXN0IHR3byB3aWxsIGJlIHNlbnQgaW4gdGhlCm5leHQgaXRlcmF0aW9uLgpQcmVz
ZW50bHksIHRoZSBQTEwgY29udHJvbGxlciBkcml2ZXIgaW5jbHVkZXMgYWxsIHRoZSByZXF1aXJl
ZCBiaW5kaW5ncywKYW5kIHRoZSBwZXJpcGhlcmFscyBjb250cm9sbGVyIGRyaXZlciBoYXMgYWxs
IGJpbmRpbmdzIGV4Y2VwdCBmb3IgdGhlCkNQVS1yZWxhdGVkIGNsb2NrLgpIb3dldmVyLCBJIGRv
IG5vdCBiZWxpZXZlIHRoaXMgdG8gYmUgYSBzaWduaWZpY2FudCBpc3N1ZS4gVGhlIGNsb2NrIERU
CmJpbmRpbmdzIGFyZSBvcmdhbml6ZWQgdG8gc2ltcGxpZnkgdGhlIHByb2Nlc3Mgb2YgaW50cm9k
dWNpbmcgbmV3IGJpbmRpbmdzLAp3aGV0aGVyIHB1YmxpYyBvciBwcml2YXRlLiBGb3IgaW5zdGFu
Y2UsIHdlIG1heSBhZGQgbmV3IGJpbmRpbmdzIHRvCmluY2x1ZGUvZHQtYmluZGluZ3MgYXQgdGhl
IGVuZCBvZiB0aGUgbGlzdCBhbmQgaW5jcmVhc2UgdGhlIG92ZXJhbGwgbnVtYmVyLAp3aXRob3V0
IGRpc3J1cHRpbmcgdGhlIERUIGJpbmRpbmdzIEFCSSAodGhlIG9sZCBudW1iZXJzIHdpbGwgcmVt
YWluCnVuY2hhbmdlZCkuCgo+IAo+IFBTOiBJIGRvbid0IGhhdmUgYW4gQTEgZGF0YXNoZWV0IG5v
ciBhIHZlbmRvciBrZXJuZWwgc291cmNlIChhbmQgZXZlbgo+IGxlc3MgYSBib2FyZCBmb3IgdGVz
dGluZykuIFNvIEkgY2FuJ3QgdmVyaWZ5IGFueSBvZiB0aGlzIG15c2VsZiBhbmQKPiBJJ20gYXNr
aW5nIHF1ZXN0aW9ucyBpbnN0ZWFkLgo+IAoKLS0gClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
