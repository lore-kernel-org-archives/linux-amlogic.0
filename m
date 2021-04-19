Return-Path: <SRS0=2Oki=JQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0072DC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 14:50:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6FDD61245
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Apr 2021 14:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6FDD61245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KizQ0SkZP3tu9yAtGlwLNucgnhTRgPkDKQ6+5f8JI9s=; b=AzXTmnTfUywqYs0qy3hhhdOmd
	e2RyzIKYEp9EvxSElJEGtJ1EJaaLlLusYbrjaqZfLEIBK6y3PKpwCp7Z3t5LclEKBj3J+bHHeTf/i
	DZG2UUhsIrg9muo0OFjIOg2mINyiWLjirNMqLfQNWvVIbIcDP8SCZsTKuD7QXswBVR+90KoU6ZBDx
	AqO+tEzO9zMK5S3PLVNGmLPHDq/LZ9oG+5tPr6Lh7ogfHM3+igZ5fpktlxP3KivNBbwEsQ9K7Pl0B
	QwTD/q5wjF6Kq4bXTgvM47+BCULWDL7q4GpPjMS3BlPVRO2Uzesp1O8HcHT9j3dA4lbeFJHiPkSkz
	O/MKlnp6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVEX-00A8jM-TB; Mon, 19 Apr 2021 14:50:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVEW-00A8jA-DT
 for linux-amlogic@desiato.infradead.org; Mon, 19 Apr 2021 14:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=K+s6VqljfbLPnu2aCH4hA3Swp10FzoJKWnjxeTTInQw=; b=kGWklIkbQ2aS64CtjHSFRV+MGZ
 //zF5qhOC8c11IUynLg9KAPVZnOssepMiTRdzgn5LtsPXOqysQxivC1cF7Gxlzb8IPdEGJeMZV8Vf
 Hu6e7Mlw3DjpkIaJp6QEqhsJOruf4s4ENRku6KFVNwu2nS2yccXyI5BsiFBU/CcdJwUg4+3qq7TVW
 4YA5cRWjUg5Ws7wmMDnWtt5jNs66duWLGwEt1rzh/NfbXwe+UtMrqfH4ev8gsLQ8qFq3jgTaXu1/q
 lKvspe1f1crypfAOCYrwcptZDsFAvHUAnQdy92iD4D+9zbrPaP8h0oubS2teS7yHEFU0MbSqGMUHT
 u4VQHpdA==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVER-00BSsu-Cg
 for linux-amlogic@lists.infradead.org; Mon, 19 Apr 2021 14:50:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id k26so17932841wrc.8
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Apr 2021 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K+s6VqljfbLPnu2aCH4hA3Swp10FzoJKWnjxeTTInQw=;
 b=MT1ZhoA2rjxRsTEPGmQzio2HKJGxA7rx6OWWz2OvuO0dtFuObr6xD5KPt/l0MsHncQ
 HCBY2Uds+LU1eDFQ37D9n6sdpejghXhoNFuFptfr2SLlu3MUXk2Gwc6vRcKnnWs/hjGU
 dSGJ5PzeU+AGf0k93xJjUWaouTjIuhMrwTpJXiRBUQtHOb+zzg+eB9yikzUyHfQ/19sb
 nOkPRVQL+O3j+HREO4iF7V0vJMHqxqKsJm/slo+Kbvk7hnCmfHrVR/NCtjJTfc8Fw6DE
 7Ghct7ZMYzxWgmJMN/933s3bIk8n3CpBdPVXYJ7kLH7/haMy/CDtwhmwAMQuHjdEs0yx
 quiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=K+s6VqljfbLPnu2aCH4hA3Swp10FzoJKWnjxeTTInQw=;
 b=FWpEV11fhuQI5KEkd07DqYMwL2croXptunyouhjUltnHsPLBNN1/SPX+mPEIIEoy/O
 7lJhoNkVGCE6b42rQo5iuQxww8aw4WiwtXZV7UL1yfqCQCi1Hxb55erIVjsFmxQMmO7r
 kJJbOmiXL3uquEGjTvAtv+gbutsHQVc99AIujvoRWvIGOZogZgJmGL+C48G1RpDTPo3+
 rTanAGy8PYCoDUeepRHXQUO0jWwbpqdUrybqQExyarpVL+ESCApT3Dr1rO3bzINWfHhG
 WcfrNOVac81j2fP8QLZfHvwryGLRDHascPNt4ES/5X94ppEeC+oCAfRWqvGZHOkGp2zw
 aaog==
X-Gm-Message-State: AOAM533riO6vyXfBCoFk501L/PuUqRoJ90GDvUS4bcH6/ymkny6s+2JY
 75tOuYkkczUHSMm9t7Md48Mh78K9H5JyahhQ
X-Google-Smtp-Source: ABdhPJxpTbAfJ8rEp1y6kl8y1WKmzLXx8AGcBBGIT28WgrpuifJHsHJEXwHyX8rfhqg5pKt590XDGw==
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr15059539wrn.75.1618843833018; 
 Mon, 19 Apr 2021 07:50:33 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2e82:31e6:67f1:4f33?
 ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id c16sm22408270wrm.93.2021.04.19.07.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 07:50:32 -0700 (PDT)
Subject: Re: [PATCH] fix green/pink color distortion from HDR set during
 vendor Uboot
To: Mathias Steiger <mathias.steiger@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <50fb92c7-28f2-f3c8-7986-425cdac77c78@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e546b4b8-5380-3c57-4c9c-8dcbe674a3e1@baylibre.com>
Date: Mon, 19 Apr 2021 16:50:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <50fb92c7-28f2-f3c8-7986-425cdac77c78@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_075035_492029_EBE4B0AE 
X-CRM114-Status: GOOD (  19.78  )
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

SGksCgpUaGFua3MgZm9yIGxvb2tpbmcgYXQgdGhpcyAhCgpUaGUgc3ViamVjdCBzaG91bGQgYmUg
OgoiZHJtL21lc29uOiBmaXggZ3JlZW4vcGluayBjb2xvciBkaXN0b3J0aW9uIGZyb20gSERSIHNl
dCBkdXJpbmcgdmVuZG9yIFVib290IgoKT24gMTkvMDQvMjAyMSAxNjozMywgTWF0aGlhcyBTdGVp
Z2VyIHdyb3RlOgo+IAo+IEkgYWxzbyB3cm90ZSBhIHByb2dyYW0gdG8gc2V0IHRoaXMgdmlhIC9k
ZXYvbWVtIGZyb20gdXNlciBzcGFjZTogaHR0cHM6Ly9naXRodWIuY29tL2JhbGxlcmJ1cmc5MDA1
L2FuZHJvaWQtdHZib3gtMi1saW51eC1wYy1hbmQtc2VydmVyL2Jsb2IvbWFpbi9maXhfZ3JlZW5w
aW5rLmMgLgo+IAo+CgpQbGVhc2UgZXhwbGljaXQgaGVyZSB3aGF0IHRoZSBwYXRjaCBkb2VzLCBu
byBuZWVkIGZvciB0aGUgZXhhbXBsZSBwcm9ncmFtLCB0aGUgcGF0Y2ggaXMgc2VsZiBleHBsaWNp
dC4KClRoZW4gYWRkOgoKRml4ZXM6IDcyODg4Mzk0OGIwZCAoImRybS9tZXNvbjogQWRkIEcxMkEg
U3VwcG9ydCBmb3IgVklVIHNldHVwIikKCkZpbmFsbHksIGl0IGFsc28gbmVlZHMgeW91ciBzaWdu
LW9mZiBhdCB0aGUgZW5kIG9mIHlvdXIgY29tbWl0IG1lc3NhZ2UsIHNpbXBseSBjb21taXQgd2l0
aCAiLXMiLgoKCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+IGluZGV4IDQ1M2Q4YjRj
NS4uN2Q5MjliNWIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+IEBAIC0zMDgs
NiArMzA4LDEwIEBAIHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZp
Y2UgKmRldiwgYm9vbCBoYXNfY29tcG9uZW50cykKPiDCoMKgwqDCoMKgwqDCoCBkcm0tPm1vZGVf
Y29uZmlnLmZ1bmNzID0gJm1lc29uX21vZGVfY29uZmlnX2Z1bmNzOwo+IMKgwqDCoMKgwqDCoMKg
IGRybS0+bW9kZV9jb25maWcuaGVscGVyX3ByaXZhdGUgPSAmbWVzb25fbW9kZV9jb25maWdfaGVs
cGVyczsKPiAKPiArwqDCoMKgwqDCoMKgIC8qIHVuZG8gc2V0dGluZ3MgbWFkZSBpbiB2ZW5kb3Ig
VWJvb3QgKi8KPiArCj4gK8KgwqDCoMKgwqDCoCB3cml0ZWxfYml0c19yZWxheGVkKDE1IDw8IDEz
LCAwLCBwcml2LT5pb19iYXNlICsgX1JFRyhPU0QxX0hEUjJfQ1RSTCkpOyAvLyBmaXhlcyBncmVl
bi9waW5rIGNvbG9yIGRpc3RvcnRpb24gLSByZWdfb25seV9tYXQgbXVzdCBiZSAwCj4gKwoKVGhp
cyBzaG91bGQgZ28gaW4gbWVzb25fdml1LmMgaW4gbWVzb25fdml1X2luaXQgcmlnaHQgYWZ0ZXIg
bWVzb25fdml1X3NldF9nMTJhX29zZDFfbWF0cml4KCkgZm9yClZQVV9DT01QQVRJQkxFX0cxMkEg
KGV4dGVuZCB0aGUgZWxzZSBpZiBjYXNlKS4KClBsZWFzZSBkb2N1bWVudCB0aGUgYml0cyB5b3Vy
IHdyaXRlIGluIG1lc29uX3JlZ2lzdGVycy5oIGxpa2U6CiNkZWZpbmUgT1NEMV9IRFIyX0NUUkxf
VkRJTjBfSERSMl9UT1BfRU4gCUJJVCgxMykKCmFuZCBzYW1lIGZvciBiaXRzIG1hdF9vX2VuIGFu
ZCByZWdfb3V0X2ZtdCwgdGhlbiB1c2UgdGhlbSBpbiB3cml0ZWxfYml0c19yZWxheGVkKCkKCj4g
wqDCoMKgwqDCoMKgwqAgLyogSGFyZHdhcmUgSW5pdGlhbGl6YXRpb24gKi8KPiAKPiDCoMKgwqDC
oMKgwqDCoCBtZXNvbl92cHVfaW5pdChwcml2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3JlZ2lzdGVycy5oCj4gaW5kZXggNDQ2ZTc5NjFkLi45MTM1MWY5YTMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oCj4gQEAgLTYzNCw2ICs2MzQsOSBAQAo+IMKg
I2RlZmluZSBWUFBfV1JBUF9PU0QzX01BVFJJWF9QUkVfT0ZGU0VUMiAweDNkYmMKPiDCoCNkZWZp
bmUgVlBQX1dSQVBfT1NEM19NQVRSSVhfRU5fQ1RSTCAweDNkYmQKPiAKPiArLyogb3NkMSBIRFIg
Ki8KPiArI2RlZmluZSBPU0QxX0hEUjJfQ1RSTCAweDM4YTAKPiArCj4gwqAvKiBvc2QyIHNjYWxl
ciAqLwo+IMKgI2RlZmluZSBPU0QyX1ZTQ19QSEFTRV9TVEVQIDB4M2QwMAo+IMKgI2RlZmluZSBP
U0QyX1ZTQ19JTklfUEhBU0UgMHgzZDAxCj4gCgpUaGlzIHBhcnQgd2lsbCBiZSBvayB3aXRoIHRo
ZSBiaXRzIGRlZmluZWQuCgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
