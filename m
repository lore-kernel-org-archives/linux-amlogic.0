Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD55C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 14:04:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C8D6109F
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 14:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C8D6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkzmamO5bQuwgk3ZeF7BXqSIlQmK1gjVMlpC/EdQTtM=; b=BIrS53CAk4hcKYgQ0PCx6cIivh
	S9VtiQGgTvTZ6SZ5uKIzwE3009AEGTtggw9HxZapj5LwJJ8kxygdpMlpaiiaWtXmYJp8f5U+Zmeve
	nhl2h41jHy7X3kTWBUn7idYfbC1rmdruMK0SaACtdUx0KTvRaEYW/3QR3dtHDS2EKh/eAEJ+2lOCi
	xpYX7M8EMWXmbOZuzjD9t65ciFxXjMVAb5JsuKzREbHGRsJvUegw3gaDREsieQEdf3jRK2NmcskaN
	BOt3BA5HRZxLv8//teH0uDokSMMuyQmbOs8yHGW3s2oBK2qm1yw1NdLc6V4Et2cEPUQH9lVH99/tz
	zJKQTbxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljjI5-001Lii-DA; Thu, 20 May 2021 14:04:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljjI3-001Lht-31
 for linux-amlogic@desiato.infradead.org; Thu, 20 May 2021 14:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=lysX0NGIaLk7pRP/JnS0JZ66O8+uWUofW0R1MAu0sIw=; b=cAgReZ5y5pNgGRNQFps+hlOHZg
 WDCrluFGcfpQIw6ZgWCEphzKg8Rms1vCRPqW5RuL1v8nCm8DXJKfEteQJyFiGEVSMjNUtkjZ6MVM2
 uAIKtKKftTku22KjQi4zHRW7JCxQH47Rpsee/A/9RqQkYhiE+JprQ7qSAGJqwROnPYuq3LmibWzgE
 z/TqJ6H4hze6op2D4sc1dJiECS5rkYW5efo3fTVWkl1nbSuBlgCRe6bVf92GjXMoO6N2uwcz16ZuB
 ZamsQpWKXOTxRzPAt+6m0RgaVugv0CgAjRhQiHo7NQ9sTvpdAju7hZHClhvZYmzuBuN24c8nG0J00
 MuJhivZg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljjI0-00GP88-CE
 for linux-amlogic@lists.infradead.org; Thu, 20 May 2021 14:04:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id h4so17771063wrt.12
 for <linux-amlogic@lists.infradead.org>; Thu, 20 May 2021 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lysX0NGIaLk7pRP/JnS0JZ66O8+uWUofW0R1MAu0sIw=;
 b=2DVlwJ/wHLxpCrQR6/MvCxcj0AYmjTCDDEefD3znrLsuC7wA0JJjdtAEMl7zR2S+gZ
 jNB4v1KHoH1dBwG3Wy2npXm8MTFKfK8QDSDgPYtedeAf90H8yp64dBHN8XU7s170ExKz
 OH2zWb1OobmcZrZPCtlDnPN6vTePmPEQVMpsS3E52d1115J+0Y1JdUzOy6Vjl12JMRnX
 lp7rpClJHThWq7Vr3xSw1LsYbQ8Bi5zrTfBjSKsETp6ay3T026zfhKcJJDa8stmSci86
 S8q4YTtmKQQgOzXwWyK8lF5dMTVwQHnMi+djS5SShx14KCw6Cdx4q+foeq4hb8cGLxb/
 9Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lysX0NGIaLk7pRP/JnS0JZ66O8+uWUofW0R1MAu0sIw=;
 b=fpAbbjfpbERFKZtg6GGFYLZ5se7Yc55jEmsZFYj9E4zJtiJOrwOOjtUqe4lEMyJd2h
 GBj+LRli0TZwIRzu8TYBTmyJQ1vEiCTEon/gv79D4SB90HzZY1GplgDZL3fSybpsVfpF
 p99Lxzy3S4W8xDdjJLF1SWpYNwYQs81Y0416NyqQALw2Uo1qeiiEuc/lEcAvZRf6yeV6
 BLWQFi61kGp7FC29aMpGqFnQlnqSyEK+hzu79Rxy2Ebcsc9ttDo8ThjDVGQ8GIufk3i4
 sSPp580gWlUmOl0vNbKH4bHxeeAkc9VaIQnLw1E64Hnvs3zkNrtbesg1rH0yKjTY3QpE
 UN+g==
X-Gm-Message-State: AOAM530A86pm69mVxl0rh31z6ufpCgQ1yPhNRuIv8K8B2wO9FfEwvmyK
 zkw/cyftg/uNvc7DNe6gDC6ULmh9bRL4t1yp
X-Google-Smtp-Source: ABdhPJzH+Vfyn6mS8C2gqiBJ5w31/+dnlKGvXzaAy6cai4TZf0ucpY+lKlFX7JoFVvqaMfKawgkMWA==
X-Received: by 2002:a5d:4006:: with SMTP id n6mr4650190wrp.63.1621519477909;
 Thu, 20 May 2021 07:04:37 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d88a:b479:b222:83bb?
 ([2a01:e0a:90c:e290:d88a:b479:b222:83bb])
 by smtp.gmail.com with ESMTPSA id c194sm9614845wme.46.2021.05.20.07.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 07:04:37 -0700 (PDT)
Subject: Re: drm/meson: fix green/pink color distortion from HDR set during
 vendor Uboot
To: Mathias Steiger <mathias.steiger@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <553e127c-9839-d15b-d435-c01f18c7be48@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9fd1d2db-4ae7-a24d-a525-ebcd693d1dd4@baylibre.com>
Date: Thu, 20 May 2021 16:04:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <553e127c-9839-d15b-d435-c01f18c7be48@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_070440_439684_A3CDA4DA 
X-CRM114-Status: GOOD (  16.37  )
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

SGkgTWF0aGlhcywKCk9uIDI4LzA0LzIwMjEgMDE6MTEsIE1hdGhpYXMgU3RlaWdlciB3cm90ZToK
PiAKPiBGaXhlczogNzI4ODgzOTQ4YjBkICgiZHJtL21lc29uOiBBZGQgRzEyQSBTdXBwb3J0IGZv
ciBWSVUgc2V0dXAiKQo+IAo+IFRlc3RlZC1ieTogTmVpbCBBcm1zdHJvbmc8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+CgpUaGUgZm9ybWF0dGluZyBpcyB3cm9uZywgYnV0IEknbGwgcmVmb3JtYXQg
aXQgYmVmb3JlIGFwcGx5aW5nIGl0LCBidXQgSSBuZWVkIHRvIGNvbmZpcm0geW91IHNpZ24tb2Zm
IHRoaXMgcGF0Y2gKd2l0aCBzb21ldGhpbmcgbGlrZSAiU2lnbmVkLW9mZjogTWF0aGlhcyBTdGVp
Z2VyIDxtYXRoaWFzLnN0ZWlnZXJAZ29vZ2xlbWFpbC5jb20+IiBmb3IgbXkgdG8gYXBwbHkgaXQu
CgpUaGFua3MsCgpOZWlsCgo+IAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fcmVnaXN0ZXJzLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0
ZXJzLmgKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKPiBAQCAtNjM0LDYg
KzYzNCwxMSBAQAo+IMKgI2RlZmluZSBWUFBfV1JBUF9PU0QzX01BVFJJWF9QUkVfT0ZGU0VUMiAw
eDNkYmMKPiDCoCNkZWZpbmUgVlBQX1dSQVBfT1NEM19NQVRSSVhfRU5fQ1RSTCAweDNkYmQKPiDC
oAo+ICsvKiBvc2QxIEhEUiAqLwo+ICsjZGVmaW5lIE9TRDFfSERSMl9DVFJMIDB4MzhhMAo+ICsj
ZGVmaW5lIE9TRDFfSERSMl9DVFJMX1ZESU4wX0hEUjJfVE9QX0VOwqDCoMKgwqDCoMKgIEJJVCgx
MykKPiArI2RlZmluZSBPU0QxX0hEUjJfQ1RSTF9SRUdfT05MWV9NQVTCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEJJVCgxNikKPiArCj4gwqAvKiBvc2QyIHNjYWxlciAqLwo+IMKgI2RlZmluZSBPU0Qy
X1ZTQ19QSEFTRV9TVEVQIDB4M2QwMAo+IMKgI2RlZmluZSBPU0QyX1ZTQ19JTklfUEhBU0UgMHgz
ZDAxCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92aXUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92aXUuYwo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl92aXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92aXUu
Ywo+IEBAIC00MjYsOCArNDI2LDE0IEBAIHZvaWQgbWVzb25fdml1X2luaXQoc3RydWN0IG1lc29u
X2RybSAqcHJpdikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX3ZwdV9pc19jb21wYXRp
YmxlKHByaXYsIFZQVV9DT01QQVRJQkxFX0dYTCkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG1lc29uX3ZpdV9sb2FkX21hdHJpeChwcml2KTsKPiDCoMKgwqDCoMKgwqDCoCBlbHNl
IGlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJsZShwcml2LCBWUFVfQ09NUEFUSUJMRV9HMTJBKSkK
PiArwqDCoMKgwqDCoMKgIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVzb25f
dml1X3NldF9nMTJhX29zZDFfbWF0cml4KHByaXYsIFJHQjcwOV90b19ZVVY3MDlsX2NvZWZmLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRydWUpOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIGZpeCBncmVlbi9waW5rIGNvbG9yIGRpc3RvcnRpb24gZnJv
bSB2ZW5kb3IgdWJvb3QgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWxf
Yml0c19yZWxheGVkKE9TRDFfSERSMl9DVFJMX1JFR19PTkxZX01BVCB8Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IE9TRDFfSERSMl9DVFJMX1ZESU4wX0hEUjJfVE9QX0VOLCAwLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcml2
LT5pb19iYXNlICsgX1JFRyhPU0QxX0hEUjJfQ1RSTCkpOwo+ICvCoMKgwqDCoMKgwqAgfQo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqAgLyogSW5pdGlhbGl6ZSBPU0QxIGZpZm8gY29udHJvbCByZWdpc3Rl
ciAqLwo+IMKgwqDCoMKgwqDCoMKgIHJlZyA9IFZJVV9PU0RfRERSX1BSSU9SSVRZX1VSR0VOVCB8
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
