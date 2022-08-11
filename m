Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124EEC19F2A
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Aug 2022 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfMwXbrbmY28ZlfbKo3WrQtyVbLytv4/H3O7EUFMLVk=; b=ClT/hjxRWRhUKE
	YZuH1PMUQnLi00+aRdIaRFUp5AbNxASYMvHw+TI5kx79l029lPz6wJ16JZscUo1NOHKCPYVEGKZET
	0EzyHRbhspbX3L1lndX+Lpz/O3miit14k2DqSrVgCZR4s0BmuE6rke3Ntd5OM1gEu/R8UZ2clW26H
	xaf9rqZzFF9M0wOlBL4b5QK981WbEqnNGlQjAFr0i5mqxcRMJ3FzYZv9AHQ7PgWTAhbnozPDxTmcs
	sNwBV262l6jD6q/trctZOI64WqDqH5IrhTLOzNKnhsWLtos4otSPgiJUN5yM78v+WjCQy+fg41YcY
	u2Js/7BNkaVsZXCg+pLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM8n4-00D1d1-Md; Thu, 11 Aug 2022 14:04:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM8n1-00D1ZZ-GG
	for linux-amlogic@lists.infradead.org; Thu, 11 Aug 2022 14:04:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id p12-20020a7bcc8c000000b003a5360f218fso2764085wma.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Aug 2022 07:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=dpQfYCCq/+drn5iVB9ooRHyxDLZEMRfg+qD3Ah/XRwI=;
        b=LBukdHOxshC0eaPZwrYKpBhE3oNPQ77xKDjHTNorwbx/w5cFBhWAnv2mo6uTvrRyNT
         iOvaTwAMQjpD9IWFXFd2uz9Er8W3n+A9izVgLOdj4RHOyhT3b12zaHkyC6p7ReSMqdYx
         R3fGzrbg5CLcJBBfmABnkcRWIy0/pI1JQiRr0DmJlD6terq7tTjA7RuCkoVKb8D3Tt6f
         VQWQo7P5pn1n6RLW9IisY2nYEdCapwjnrGsLfxZZGnH4UXTEkBoMM+aqpSq9uEhjuA79
         u/psj55al7DaMkCVvS2zBngOIjNfWkzFfljxO50DRE+jgVOkA7yamf/MpqYF/cbXLyTW
         rUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dpQfYCCq/+drn5iVB9ooRHyxDLZEMRfg+qD3Ah/XRwI=;
        b=tz0bKgJ0Aru6zY5KiOi0Occ1LoGiVoescgPKaeKjyHkVQhhyhqxV52epJBjWIFHipR
         8NIMucTHeMCGdT4ZpGq2GbUFkSqJzoZQqnOjziS9US6vWDuS8qn6bYnPxA4nJo39AqQN
         8QFm22XNkqU0Byg6l1VvDC/J8Ct992Fjou9/aFYFokZPN3nD+XCfdkys+++j2PnwmBgU
         PizoGcy6bPMzlQ0CDonw+56Jd5ptc2SAdFbqD1/nQyz8bxgcqYI7c1kMbzgLdWoLUTCx
         b1ovH1UQXWULs7ydiwG8PD0Qf0dR2ujRlIDfbgM4Rh5Am8eVoJN9doOSToUZj+hXaIVT
         IHiQ==
X-Gm-Message-State: ACgBeo0cDjQk6mXATiX2Yj7B1HOPd/puibWKTjXLPSSE9xh8+5lfNKIa
	JzpSWhqZj5DYXJ4qeESDKfGazA==
X-Google-Smtp-Source: AA6agR5/Q13zQywSqGjb6atTMN6zwLk7aEPRPv2fr1R6J2efULxfFSt02cN0hmFriJS62o4D6adq1Q==
X-Received: by 2002:a05:600c:3b02:b0:3a5:2460:f059 with SMTP id m2-20020a05600c3b0200b003a52460f059mr5879198wms.129.1660226635702;
        Thu, 11 Aug 2022 07:03:55 -0700 (PDT)
Received: from [10.1.3.77] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4b8c000000b002206203ed3dsm18938330wrt.29.2022.08.11.07.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 07:03:55 -0700 (PDT)
Message-ID: <51d8767e-f73c-6045-871f-88b4df098cb2@baylibre.com>
Date: Thu, 11 Aug 2022 16:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] watchdog: meson: keep running if already active
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20220801092150.4449-1-pboos@baylibre.com>
 <7ab495dd-4b3e-46e8-6db0-1dd20860043f@roeck-us.net>
From: Philippe Boos <pboos@baylibre.com>
In-Reply-To: <7ab495dd-4b3e-46e8-6db0-1dd20860043f@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_070359_548231_04DBBD54 
X-CRM114-Status: GOOD (  21.51  )
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

T24gOC84LzIyIDEzOjU4LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDgvMS8yMiAwMjoyMSwg
UGhpbGlwcGUgQm9vcyB3cm90ZToKPj4gSWYgdGhlIHdhdGNoZG9nIGlzIGFscmVhZHkgcnVubmlu
ZyAoZS5nLjogc3RhcnRlZCBieSBib290bG9hZGVyKSB0aGVuCj4+IHRoZSBrZXJuZWwgZHJpdmVy
IHNob3VsZCBrZWVwIHRoZSB3YXRjaGRvZyBhY3RpdmUgYnV0IHRoZSBhbWxvZ2ljIGRyaXZlcgo+
PiB0dXJucyBpdCBvZmYuCj4+Cj4+IExldCB0aGUgZHJpdmVyIGZpeCB0aGUgY2xvY2sgcmF0ZSBp
ZiBhbHJlYWR5IGFjdGl2ZSBiZWNhdXNlIHdlIGRvIG5vdAo+PiBrbm93IHRoZSBwcmV2aW91cyB0
aW1lYmFzZSB2YWx1ZS4gVG8gYXZvaWQgdW5pbnRlbnRpb25hbCByZXNldHRpbmcgd2UKPj4gdGVt
cG9yYXJpbHkgc2V0IGl0IHRvIGl0cyBtYXhpbXVtIHZhbHVlLgo+Pgo+PiBUaGVuIGtlZXAgdGhl
IGVuYWJsZSBiaXQgaWYgaXMgd2FzIHByZXZpb3VzbHkgYWN0aXZlLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBCb29zIDxwYm9vc0BiYXlsaWJyZS5jb20+Cj4gCj4gV2hhdCBjaGFuZ2Vk
IHNpbmNlIHYxID8KSW4gdjEsIHdlIHJlYWQgd2F0Y2hkb2cncyBlbmFibGUgYml0IGJlZm9yZSB3
cml0aW5nIGl0cyBjb25maWcgcmVnaXN0ZXIsCnRoZW4gd2Ugd3JpdGUgdGhlIHJlZ2lzdGVyLCB0
aGlzIHdpbGwgYWx3YXlzIHN0b3AgdGhlIHdhdGNoZG9nLiBJZiBpdAp3YXMgcHJldmlvdXNseSBh
Y3RpdmUgd2UgcmVzdGFydCBpdC4gU28sIGluIHYxLCBpZiB0aGUga2VybmVsIGNyYXNoZXMKanVz
dCBiZWZvcmUgdGhlIHdhdGNoZG9nIHJlc3RhcnRzIGl0IHdpbGwgYmUgc3R1Y2sgZm9yZXZlci4K
CkluIHYyLCB3ZSByZWFkIHdhdGNoZG9nJ3MgZW5hYmxlIGJpdCBiZWZvcmUgd3JpdGluZyBpdHMg
Y29uZmlnIHJlZ2lzdGVyLAppZiBpdCBpcyBhbHJlYWR5IGFjdGl2ZSB3ZSBrZWVwIHRoZSBlbmFi
bGUgYml0IHdoZW4gd3JpdGluZyB0aGUKcmVnaXN0ZXIuCgpSZWdhcmRzLAoKUGhpbGlwcGUgQm9v
cwo+IAo+IEd1ZW50ZXIKPiAKPj4gLS0tCj4+IMKgIGRyaXZlcnMvd2F0Y2hkb2cvbWVzb25fZ3hi
Yl93ZHQuYyB8IDI0ICsrKysrKysrKysrKysrKysrKystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvd2F0Y2hkb2cvbWVzb25fZ3hiYl93ZHQuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvbWVzb25f
Z3hiYl93ZHQuYwo+PiBpbmRleCA1YTljYTEwZmJjZmEuLjhiZThmZDllNTYzNyAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy93YXRjaGRvZy9tZXNvbl9neGJiX3dkdC5jCj4+ICsrKyBiL2RyaXZlcnMv
d2F0Y2hkb2cvbWVzb25fZ3hiYl93ZHQuYwo+PiBAQCAtMTQ2LDYgKzE0Niw3IEBAIHN0YXRpYyBp
bnQgbWVzb25fZ3hiYl93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBtZXNvbl9neGJiX3dkdCAqZGF0YTsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiAr
wqDCoMKgIHUzMiBjdHJsX3JlZzsKPj4gwqAgwqDCoMKgwqDCoCBkYXRhID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4+IMKgwqDCoMKgwqAgaWYgKCFkYXRh
KQo+PiBAQCAtMTc3LDEzICsxNzgsMjYgQEAgc3RhdGljIGludCBtZXNvbl9neGJiX3dkdF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiDCoMKgwqDCoMKgIGRhdGEtPndkdF9k
ZXYudGltZW91dCA9IERFRkFVTFRfVElNRU9VVDsKPj4gwqDCoMKgwqDCoCB3YXRjaGRvZ19zZXRf
ZHJ2ZGF0YSgmZGF0YS0+d2R0X2RldiwgZGF0YSk7Cj4+IMKgICvCoMKgwqAgY3RybF9yZWcgPSBy
ZWFkbChkYXRhLT5yZWdfYmFzZSArIEdYQkJfV0RUX0NUUkxfUkVHKSAmCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgR1hCQl9XRFRfQ1RSTF9FTjsKPj4gKwo+PiArwqDCoMKgIGlm
IChjdHJsX3JlZykgewo+PiArwqDCoMKgwqDCoMKgwqAgLyogV2F0Y2hkb2cgaXMgcnVubmluZyAt
IGtlZXAgaXQgcnVubmluZyBidXQgZXh0ZW5kIHRpbWVvdXQKPj4gK8KgwqDCoMKgwqDCoMKgwqAg
KiB0byB0aGUgbWF4aW11bSB3aGlsZSBzZXR0aW5nIHRoZSB0aW1lYmFzZQo+PiArwqDCoMKgwqDC
oMKgwqDCoCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgc2V0X2JpdChXRE9HX0hXX1JVTk5JTkcsICZk
YXRhLT53ZHRfZGV2LnN0YXR1cyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBtZXNvbl9neGJiX3dkdF9z
ZXRfdGltZW91dCgmZGF0YS0+d2R0X2RldiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBHWEJCX1dEVF9UQ05UX1NFVFVQX01BU0sgLyAxMDAwKTsKPj4gK8KgwqDCoCB9Cj4+ICsK
Pj4gwqDCoMKgwqDCoCAvKiBTZXR1cCB3aXRoIDFtcyB0aW1lYmFzZSAqLwo+PiAtwqDCoMKgIHdy
aXRlbCgoKGNsa19nZXRfcmF0ZShkYXRhLT5jbGspIC8gMTAwMCkgJiBHWEJCX1dEVF9DVFJMX0RJ
Vl9NQVNLKSB8Cj4+IC3CoMKgwqDCoMKgwqDCoCBHWEJCX1dEVF9DVFJMX0VFX1JFU0VUIHwKPj4g
LcKgwqDCoMKgwqDCoMKgIEdYQkJfV0RUX0NUUkxfQ0xLX0VOIHwKPj4gLcKgwqDCoMKgwqDCoMKg
IEdYQkJfV0RUX0NUUkxfQ0xLRElWX0VOLAo+PiAtwqDCoMKgwqDCoMKgwqAgZGF0YS0+cmVnX2Jh
c2UgKyBHWEJCX1dEVF9DVFJMX1JFRyk7Cj4+ICvCoMKgwqAgY3RybF9yZWcgfD0gKChjbGtfZ2V0
X3JhdGUoZGF0YS0+Y2xrKSAvIDEwMDApICYKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR1hC
Ql9XRFRfQ1RSTF9ESVZfTUFTSykgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHWEJCX1dE
VF9DVFJMX0VFX1JFU0VUIHwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR1hCQl9XRFRfQ1RS
TF9DTEtfRU4gfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHWEJCX1dEVF9DVFJMX0NMS0RJ
Vl9FTjsKPj4gwqAgK8KgwqDCoCB3cml0ZWwoY3RybF9yZWcsIGRhdGEtPnJlZ19iYXNlICsgR1hC
Ql9XRFRfQ1RSTF9SRUcpOwo+PiDCoMKgwqDCoMKgIG1lc29uX2d4YmJfd2R0X3NldF90aW1lb3V0
KCZkYXRhLT53ZHRfZGV2LCBkYXRhLT53ZHRfZGV2LnRpbWVvdXQpOwo+PiDCoCDCoMKgwqDCoMKg
IHdhdGNoZG9nX3N0b3Bfb25fcmVib290KCZkYXRhLT53ZHRfZGV2KTsKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
