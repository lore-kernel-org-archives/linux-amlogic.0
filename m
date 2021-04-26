Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0A7C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:03:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2302B613BD
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2302B613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GMJv4AjIf8lInqY3d2h8lCcXWhZvinuc6rO862E01UA=; b=hMWgb/wsZQ7vA8UXbW+BS8E2c
	ejZdnEiLzxwdLJuYFbarptL+Yr4OFiuliOlThXKsxr5g3SUPUeqqGNfzDfijU7H59mYqUEfqkr0WG
	kZvmEi3wvegaL9umnmzJf9p6WLblJLE6e40LSepDxqnYuxgCL73v0RQJp8lmLr1dK2mCgomAeayOY
	0GMeoWFoEuL0U3t/Qtf2uAhPuJ8q/zY7pluV7APhXE06p7aLIdk+KyeMQ/1YwUBDCVnC6BhjuGmdL
	djI9G49oCQZ7dzn4OyYUHn0BoyK9wtwxQE5z4NuJYqFL3QPR7wmRl9AIbOwXD1mnguDW5pOY57y5T
	2LdkM8MZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5aF-008Ej9-Ow; Mon, 26 Apr 2021 18:03:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5a9-008Eh0-LZ
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 18:03:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id c4so17925259wrt.8
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ap7foC08TGgVbUYlABZMRTD/Na3Q9etmWdLbT8fGS9o=;
 b=B439BSHtoh8o8Uixzfxurpafo89gSTyjf/bKIYEEfSrKRmennaBUPt/J7WZXLjmFCV
 NGkF50LAqJwyTX97VWjb4pG5U1qDk7ST7qB0pPJCRMUrZ4vfqaCPcw2VtyUm2aqbsLg3
 5IHjd82w0FlEMJQPpRzdx5X8VoiHBdeh8kmYALbLJykikDSCnnNptUybcCFaZ1wWqnPW
 a+nwRNLnpDx3wCTuTLn9aAx6i91mM72IYciVXIVO+qGYD2CmoK8yVHPrqO1PuPtVzaok
 S/nd6kNlYHFEMhGuCSyBSa683Ct2bCa+mTt1+Js2ZlcXHvKTWIZADITjBaJcIYLf00lX
 yUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ap7foC08TGgVbUYlABZMRTD/Na3Q9etmWdLbT8fGS9o=;
 b=XfRcCd2UT08Fc7xsbn0i2m4Vgl4/MuVidDkou0mbtJq/X53pQX/CUZ1jQLJLMlUTv+
 BbN5LsYYpOelzmOEaly0ocAoevMlAGnhMTRnD8T1r2QEFFX04g3Rc8Qy4NVApQzVXiZG
 1N5I6tVmlLdMS5l72jv8CbYyjuGvdMK3E3Y1lhj4iGJVi4kAXLH0hojmcpeDVZsjhhPw
 OIvy0+FXUYa1H7kc2pBFdR5LnTTqN2N8i+QpOA5W9Qojbnbvx3bK48XTE2azXJiv+yxV
 1QSG9Po8cVffI/FXEBeVCMMTdpc7vb0jGTSGXTcxZ/qYjsvlRST9g46CaNIduNDpep8x
 DSkw==
X-Gm-Message-State: AOAM530s/Ay6KH/pMI/jrGKHXP8GQE58Ber3M5JP4uusPvezhUt3TFJq
 d/jrPRr8UVlLJ3ho14nqca7x4gNShQaKXiI7
X-Google-Smtp-Source: ABdhPJyaqasNAbEvss8qkqppnFr/e9WF99RFNHSTPG9jzGc7CZhVcQ50Kzqpe/BzqYGNKvKw4xcw4Q==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr5239114wrq.40.1619460100625;
 Mon, 26 Apr 2021 11:01:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id n3sm18655075wmi.7.2021.04.26.11.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 11:01:39 -0700 (PDT)
Subject: Re: [PATCH] fix green/pink color distortion from HDR set during
 vendor Uboot
From: Neil Armstrong <narmstrong@baylibre.com>
To: Mathias Steiger <mathias.steiger@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <50fb92c7-28f2-f3c8-7986-425cdac77c78@gmail.com>
 <e546b4b8-5380-3c57-4c9c-8dcbe674a3e1@baylibre.com>
 <f7ce8dc7-9066-be14-b351-2443d7630622@baylibre.com>
Organization: Baylibre
Message-ID: <59dfd7e6-fc91-3d61-04c4-94e078a3188c@baylibre.com>
Date: Mon, 26 Apr 2021 20:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f7ce8dc7-9066-be14-b351-2443d7630622@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_190342_054306_8C988286 
X-CRM114-Status: GOOD (  20.95  )
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

SGkgTWF0aGlhcywKClNvIHlvdSB0aGluayB5b3UnbGwgYmUgYWJsZSB0byBzZW5kIGEgdjIgcGF0
Y2ggPwoKVGhhbmtzLApOZWlsCgpPbiAyMC8wNC8yMDIxIDE1OjAxLCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPiBPbiAxOS8wNC8yMDIxIDE2OjUwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gSGks
Cj4+Cj4+IFRoYW5rcyBmb3IgbG9va2luZyBhdCB0aGlzICEKPj4KPj4gVGhlIHN1YmplY3Qgc2hv
dWxkIGJlIDoKPj4gImRybS9tZXNvbjogZml4IGdyZWVuL3BpbmsgY29sb3IgZGlzdG9ydGlvbiBm
cm9tIEhEUiBzZXQgZHVyaW5nIHZlbmRvciBVYm9vdCIKPj4KPj4gT24gMTkvMDQvMjAyMSAxNjoz
MywgTWF0aGlhcyBTdGVpZ2VyIHdyb3RlOgo+Pj4KPj4+IEkgYWxzbyB3cm90ZSBhIHByb2dyYW0g
dG8gc2V0IHRoaXMgdmlhIC9kZXYvbWVtIGZyb20gdXNlciBzcGFjZTogaHR0cHM6Ly9naXRodWIu
Y29tL2JhbGxlcmJ1cmc5MDA1L2FuZHJvaWQtdHZib3gtMi1saW51eC1wYy1hbmQtc2VydmVyL2Js
b2IvbWFpbi9maXhfZ3JlZW5waW5rLmMgLgo+Pj4KPj4+Cj4+Cj4+IFBsZWFzZSBleHBsaWNpdCBo
ZXJlIHdoYXQgdGhlIHBhdGNoIGRvZXMsIG5vIG5lZWQgZm9yIHRoZSBleGFtcGxlIHByb2dyYW0s
IHRoZSBwYXRjaCBpcyBzZWxmIGV4cGxpY2l0Lgo+Pgo+PiBUaGVuIGFkZDoKPj4KPj4gRml4ZXM6
IDcyODg4Mzk0OGIwZCAoImRybS9tZXNvbjogQWRkIEcxMkEgU3VwcG9ydCBmb3IgVklVIHNldHVw
IikKPiAKPiBJIHRlc3RlZCBvbiBhIFZJTTMgd2l0aCB0aGUgdmVuZG9yIFUtYm9vdCwgYW5kIGl0
IHdvcmtzICEgVGhhbmtzICEKPiAKPiBBbmQgcGxlYXNlIGFkZCB0byB0aGUgdjIgcGF0Y2g6Cj4g
VGVzdGVkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gCj4g
VGhhbmtzLAo+IE5laWwKPiAKPj4KPj4gRmluYWxseSwgaXQgYWxzbyBuZWVkcyB5b3VyIHNpZ24t
b2ZmIGF0IHRoZSBlbmQgb2YgeW91ciBjb21taXQgbWVzc2FnZSwgc2ltcGx5IGNvbW1pdCB3aXRo
ICItcyIuCj4+Cj4+Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+Pj4gaW5kZXgg
NDUzZDhiNGM1Li43ZDkyOWI1YjIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHJ2LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYu
Ywo+Pj4gQEAgLTMwOCw2ICszMDgsMTAgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmluZF9tYXN0
ZXIoc3RydWN0IGRldmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQo+Pj4gwqDCoMKgwqDC
oMKgwqAgZHJtLT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZtZXNvbl9tb2RlX2NvbmZpZ19mdW5jczsK
Pj4+IMKgwqDCoMKgwqDCoMKgIGRybS0+bW9kZV9jb25maWcuaGVscGVyX3ByaXZhdGUgPSAmbWVz
b25fbW9kZV9jb25maWdfaGVscGVyczsKPj4+Cj4+PiArwqDCoMKgwqDCoMKgIC8qIHVuZG8gc2V0
dGluZ3MgbWFkZSBpbiB2ZW5kb3IgVWJvb3QgKi8KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqAgd3Jp
dGVsX2JpdHNfcmVsYXhlZCgxNSA8PCAxMywgMCwgcHJpdi0+aW9fYmFzZSArIF9SRUcoT1NEMV9I
RFIyX0NUUkwpKTsgLy8gZml4ZXMgZ3JlZW4vcGluayBjb2xvciBkaXN0b3J0aW9uIC0gcmVnX29u
bHlfbWF0IG11c3QgYmUgMAo+Pj4gKwo+Pgo+PiBUaGlzIHNob3VsZCBnbyBpbiBtZXNvbl92aXUu
YyBpbiBtZXNvbl92aXVfaW5pdCByaWdodCBhZnRlciBtZXNvbl92aXVfc2V0X2cxMmFfb3NkMV9t
YXRyaXgoKSBmb3IKPj4gVlBVX0NPTVBBVElCTEVfRzEyQSAoZXh0ZW5kIHRoZSBlbHNlIGlmIGNh
c2UpLgo+Pgo+PiBQbGVhc2UgZG9jdW1lbnQgdGhlIGJpdHMgeW91ciB3cml0ZSBpbiBtZXNvbl9y
ZWdpc3RlcnMuaCBsaWtlOgo+PiAjZGVmaW5lIE9TRDFfSERSMl9DVFJMX1ZESU4wX0hEUjJfVE9Q
X0VOIAlCSVQoMTMpCj4+Cj4+IGFuZCBzYW1lIGZvciBiaXRzIG1hdF9vX2VuIGFuZCByZWdfb3V0
X2ZtdCwgdGhlbiB1c2UgdGhlbSBpbiB3cml0ZWxfYml0c19yZWxheGVkKCkKPj4KPj4+IMKgwqDC
oMKgwqDCoMKgIC8qIEhhcmR3YXJlIEluaXRpYWxpemF0aW9uICovCj4+Pgo+Pj4gwqDCoMKgwqDC
oMKgwqAgbWVzb25fdnB1X2luaXQocHJpdik7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3JlZ2lzdGVycy5oCj4+PiBpbmRleCA0NDZlNzk2MWQuLjkxMzUxZjlhMyAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaAo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oCj4+PiBAQCAtNjM0LDYgKzYzNCw5
IEBACj4+PiDCoCNkZWZpbmUgVlBQX1dSQVBfT1NEM19NQVRSSVhfUFJFX09GRlNFVDIgMHgzZGJj
Cj4+PiDCoCNkZWZpbmUgVlBQX1dSQVBfT1NEM19NQVRSSVhfRU5fQ1RSTCAweDNkYmQKPj4+Cj4+
PiArLyogb3NkMSBIRFIgKi8KPj4+ICsjZGVmaW5lIE9TRDFfSERSMl9DVFJMIDB4MzhhMAo+Pj4g
Kwo+Pj4gwqAvKiBvc2QyIHNjYWxlciAqLwo+Pj4gwqAjZGVmaW5lIE9TRDJfVlNDX1BIQVNFX1NU
RVAgMHgzZDAwCj4+PiDCoCNkZWZpbmUgT1NEMl9WU0NfSU5JX1BIQVNFIDB4M2QwMQo+Pj4KPj4K
Pj4gVGhpcyBwYXJ0IHdpbGwgYmUgb2sgd2l0aCB0aGUgYml0cyBkZWZpbmVkLgo+Pgo+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMKPj4KPj4gTmVpbAo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
