Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1,WEIRD_PORT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B6CC63777
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C7422226
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCc8nmvt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FViVQOB+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4C7422226
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VhtkkXXyTF0GSkWi5GZVEyKpUlVvcWgiyQDy/T7tFqw=; b=kCc8nmvtyJHUTKY7ejT36iexS
	k4K9xLFOOXnNcsAEMKKZhgW3E0pv6pkLNXHVdeD0rR/nGID8CuIqvOY6eG6DTLm87FSCKK73xd3SK
	0dQ86qKzLhTsA5PFQx6ymkn1gisSJRTQJbGzqwTX4xRKkjHbOoDDl48zjMA7CG6WHm4G/9uLf/MPi
	VbT1+6z4kXY0zRYIARKXedruc5RFAFY8RE43fP9i0w8A0xO2ziTGRVemJ7kyRl/pGKuzxhzNGWCdb
	9hpdZ9a4OybCHoBMRWfLNmvcOOf3iA4McbGO1xySKTsx79UFbPV9BurdTz/GGRFdj8G2rbsoKrthn
	05Qwtsq5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2h1-0000xg-Fc; Fri, 20 Nov 2020 09:26:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2gx-0000wC-GL
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 09:26:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id h21so9173521wmb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zeFjuFGeYCYUaAKQyjMkKInsaG2E8UkQCv+L8e6qaRM=;
 b=FViVQOB+4kPRotuMYoJNz12BqNGgO5A8FGRC0TVJJvZ72dvVbsWWqwWhdV9pCMk7mW
 yyZpsNG7JS2QYGMBIB2+lFw4V6ig0n2QAahhacASKrLMKO5B3gjdY7Hb3C079bRalirC
 /qhN8NsMIO3L1ZAHDZI4/+lSheCVUV2t+KedKlKTGuwXRZznmUh1GgXqlkj2E2pmVUAP
 vG5GxiPhh1LQCVsTrHOXeOWmjunXJ8WUJmKXJ4thKIgVmmBGBownrU0djwVPPOn18zII
 NMhXR/G1TK0Lcu504spx+pofzzQYFWb2L9fW6hPHo2yfNHvBETUFi8bpr1eNrPuhXID1
 JuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zeFjuFGeYCYUaAKQyjMkKInsaG2E8UkQCv+L8e6qaRM=;
 b=UDhxEOKscLbCMcnDh6exNa+rAzsKZNJnJxDaYleI/1rqmoVXMDWd/j/axfPTbzV3Qe
 sR2AUk9TO/XivnsgMnXiTthQce9pB+VY6aicN2HW1ZnmQu2q8QKlR6J6feZZqomdBQhD
 cJrjTMFvv6Vj8JRIajLKyX8o8Hr/0tSl+O1pMRlF5rhEPWePczVOK2+6asrjAr7z1raG
 oi2RuwbhYLztEbmAbyurg1MwG8BWK7gpbFXlEe6tcBFH3PzZxV+zV8q5cTBMO/wcBm87
 KT8NF7TO5c9vKIjCFPXRDAh1fFIeBHCmIP3qZ5rlGaBsFwv5XBpGtWmLuGx4dPSxVi+X
 NH4w==
X-Gm-Message-State: AOAM532PA0m6ISxu3lr8qloSQv16lIUPI+0bZOAQaf6GPBZywD2/XeRb
 XnXQvcwOl9dzg7KRc3g5AdK11w==
X-Google-Smtp-Source: ABdhPJwT6EX04fltJ1c/P+yeHfvNo4GGo2vd/oODlWJKISvukVhe/TAnbsSuH5WC/OUhzU12Yjy0xg==
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr8979275wmm.150.1605864413787; 
 Fri, 20 Nov 2020 01:26:53 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7?
 ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id x63sm4049700wmb.48.2020.11.20.01.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 01:26:52 -0800 (PST)
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
To: Marc Zyngier <maz@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
 <c76273f5fe483766e6a7f509f82d928a@kernel.org>
 <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
 <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
 <00a10c12a4eb2a9cdd9f50e88a293c3f@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <93dcf61a-be80-8870-48f5-30e215cc56ed@baylibre.com>
Date: Fri, 20 Nov 2020 10:26:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00a10c12a4eb2a9cdd9f50e88a293c3f@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_042655_685043_62331E94 
X-CRM114-Status: GOOD (  26.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkvMTEvMjAyMCAxOTozNSwgTWFyYyBaeW5naWVyIHdyb3RlOgo+IE9uIDIwMjAtMTEtMTkg
MTg6MTMsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+IE9uIFRodSAxOSBOb3YgMjAyMCBhdCAxOTow
NCwgR3VpbGxhdW1lIFR1Y2tlcgo+PiA8Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJvcmEuY29tPiB3
cm90ZToKPj4KPj4+IEhpIE1hcmMsCj4+Pgo+Pj4gT24gMTkvMTEvMjAyMCAxMTo1OCwgTWFyYyBa
eW5naWVyIHdyb3RlOgo+Pj4+IE9uIDIwMjAtMTEtMTkgMTA6MjYsIE5laWwgQXJtc3Ryb25nIHdy
b3RlOgo+Pj4+PiBPbiAxOS8xMS8yMDIwIDExOjIwLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4+Pj4+
PiBPbiAyMDIwLTExLTE5IDA4OjUwLCBHdWlsbGF1bWUgVHVja2VyIHdyb3RlOgo+Pj4+Pj4+IFBs
ZWFzZSBzZWUgdGhlIGF1dG9tYXRlZCBiaXNlY3Rpb24gcmVwb3J0IGJlbG93IGFib3V0IHNvbWUg
a2VybmVsCj4+Pj4+Pj4gZXJyb3JzIG9uIG1lc29uLWd4YmItcDIwMC4KPj4+Pj4+Pgo+Pj4+Pj4+
IFJlcG9ydHMgYXJlbid0IGF1dG9tYXRpY2FsbHkgc2VudCB0byB0aGUgcHVibGljIHdoaWxlIHdl
J3JlCj4+Pj4+Pj4gdHJpYWxpbmcgbmV3IGJpc2VjdGlvbiBmZWF0dXJlcyBvbiBrZXJuZWxjaS5v
cmcsIGhvd2V2ZXIgdGhpcyBvbmUKPj4+Pj4+PiBsb29rcyB2YWxpZC4KPj4+Pj4+Pgo+Pj4+Pj4+
IFRoZSBiaXNlY3Rpb24gc3RhcnRlZCB3aXRoIG5leHQtMjAyMDExMTggYnV0IHRoZSBlcnJvcnMg
YXJlIHN0aWxsCj4+Pj4+Pj4gcHJlc2VudCBpbiBuZXh0LTIwMjAxMTE5LsKgIERldGFpbHMgZm9y
IHRoaXMgcmVncmVzc2lvbjoKPj4+Pj4+Pgo+Pj4+Pj4+IMKgIGh0dHBzOi8va2VybmVsY2kub3Jn
L3Rlc3QvY2FzZS9pZC81ZmI2MTk2YmZkMDEyN2ZkNjhkOGQ5MDIvCj4+Pj4+Pj4KPj4+Pj4+PiBU
aGUgZmlyc3QgZXJyb3IgaXM6Cj4+Pj4+Pj4KPj4+Pj4+PiDCoCBbwqDCoCAxNC43NTc0ODldIElu
dGVybmFsIGVycm9yOiBzeW5jaHJvbm91cyBleHRlcm5hbCBhYm9ydDogOTYwMDAyMTAKPj4+Pj4+
PiBbIzFdIFBSRUVNUFQgU01QCj4+Pj4+Pgo+Pj4+Pj4gTG9va3MgbGlrZSB5ZXQgYW5vdGhlciBj
bG9jayBvcmRlcmluZyBzZXR1cC4gSSBndWVzcyBkaWZmZXJlbnQgQW1sb2dpYwo+Pj4+Pj4gcGxh
dGZvcm1zIGhhdmUgc2xpZ2h0bHkgZGlmZmVyZW50IG9yZGVyaW5nIHJlcXVpcmVtZW50cy4KPj4+
Pj4+Cj4+Pj4+PiBOZWlsLCBkbyB5b3UgaGF2ZSBhbnkgaWRlYSBvZiB3aGljaCBwbGF0Zm9ybSBy
ZXF1aXJlcyB3aGljaCBvcmRlcmluZz8KPj4+Pj4+IFRoZSB2YXJpYWJpbGl0eSBpbiBEVCBhbmQg
cGxhdGZvcm1zIGlzIHByZXR0eSBkaWZmaWN1bHQgdG8gZm9sbG93IChhbmQKPj4+Pj4+IEkgZG9u
J3QgdGhpbmsgSSBoYXZlIHN1Y2ggYm9hcmQgYXJvdW5kKS4KPj4+Pj4KPj4+Pj4gVGhlIHJlcXVp
cmVtZW50cyBzaG91bGQgYmUgdGhlIHNhbWUsIGhlcmUgdGhlIGluaXQgd2FzIGRvbmUgYmVmb3Jl
IGNhbGxpbmcKPj4+Pj4gZHdfaGRtaV9wcm9iZSB0byBiZSBzdXJlIHRoZSBjbG9ja3MgYW5kIGlu
dGVybmFscyByZXNldHMgd2VyZSBkZWFzc2VydGVkLgo+Pj4+PiBCdXQgc2luY2UgeW91IGJvb3Qg
ZnJvbSB1LWJvb3QgYWxyZWFkeSBlbmFibGluZyB0aGVzZSwgaXQncyBhbHJlYWR5IGFjdGl2ZS4K
Pj4+Pj4KPj4+Pj4gVGhlIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHJldmVydCBhbmQgZG8gc29tZSBj
aGVjayBpbiBtZXNvbl9kd19oZG1pX2luaXQoKSB0bwo+Pj4+PiBjaGVjayBpZiBhbHJlYWR5IGVu
YWJsZWQgYW5kIGRvIG5vdGhpbmcuCj4+Pj4KPj4+PiBBIGJldHRlciBmaXggc2VlbXMgdG8gYmUg
dGhpcywgd2hpY2ggbWFrZXMgaXQgZXhwbGljaXQgdGhhdCB0aGVyZSBpcwo+Pj4+IGEgZGVwZW5k
ZW5jeSBiZXR3ZWVuIHNvbWUgb2YgdGhlIHJlZ2lzdGVycyBhY2Nlc3NlZCBmcm9tIG1lc29uX2R3
X2hkbWlfaW5pdCgpCj4+Pj4gYW5kIHRoZSBpYWhiIGNsb2NrLgo+Pj4+Cj4+Pj4gR3VpbGxhdW1l
LCBjYW4geW91IGdpdmUgdGhpcyBhIGdvIG9uIHlvdXIgZmFpbGluZyBib3g/Cj4+Pgo+Pj4gSSBj
b25maXJtIGl0IHNvbHZlcyB0aGUgcHJvYmxlbS7CoCBQbGVhc2UgYWRkIHRoaXMgdG8geW91ciBm
aXgKPj4+IHBhdGNoIGlmIGl0J3MgT0sgd2l0aCB5b3U6Cj4+Pgo+Pj4gwqAgUmVwb3J0ZWQtYnk6
ICJrZXJuZWxjaS5vcmcgYm90IiA8Ym90QGtlcm5lbGNpLm9yZz4KPj4+IMKgIFRlc3RlZC1ieTog
R3VpbGxhdW1lIFR1Y2tlciA8Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJvcmEuY29tPgo+Pj4KPj4+
Cj4+PiBGb3IgdGhlIHJlY29yZCwgaXQgcGFzc2VkIGFsbCB0aGUgdGVzdHMgd2hlbiBhcHBsaWVk
IG9uIHRvcCBvZgo+Pj4gdGhlICJiYWQiIHJldmlzaW9uIGZvdW5kIGJ5IHRoZSBiaXNlY3Rpb246
Cj4+Pgo+Pj4gwqAgaHR0cDovL2xhdmEuYmF5bGlicmUuY29tOjEwMDgwL3NjaGVkdWxlci9hbGxq
b2JzP3NlYXJjaD12NS4xMC1yYzMtMTAyMS1nYjg2NjhhMmU1ZWExCj4+Pgo+Pj4gYW5kIHRoZSBl
eGFjdCBzYW1lIHRlc3Qgb24gdGhlICJiYWQiIHJldmlzaW9uIHdpdGhvdXQgdGhlIGZpeAo+Pj4g
Y29uc2lzdGVudGx5IHNob3dlZCB0aGUgZXJyb3I6Cj4+Pgo+Pj4gwqAgaHR0cDovL2xhdmEuYmF5
bGlicmUuY29tOjEwMDgwL3NjaGVkdWxlci9qb2IvMzc0MTc2Cj4+Pgo+Pj4KPj4+IFRoYW5rcywK
Pj4+IEd1aWxsYXVtZQo+Pj4KPj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9kd19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRt
aS5jCj4+Pj4gaW5kZXggN2Y4ZWVhNDk0MTQ3Li41MmFmOGJhOTQzMTEgMTAwNjQ0Cj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPj4+PiBAQCAtMTQ2LDYgKzE0Niw3IEBA
IHN0cnVjdCBtZXNvbl9kd19oZG1pIHsKPj4+PiDCoMKgwqDCoCBzdHJ1Y3QgcmVzZXRfY29udHJv
bCAqaGRtaXR4X2N0cmw7Cj4+Pj4gwqDCoMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKmhkbWl0
eF9waHk7Cj4+Pj4gwqDCoMKgwqAgc3RydWN0IGNsayAqaGRtaV9wY2xrOwo+Pj4+ICvCoMKgwqAg
c3RydWN0IGNsayAqaWFoYl9jbGs7Cj4+Pj4gwqDCoMKgwqAgc3RydWN0IGNsayAqdmVuY2lfY2xr
Owo+Pj4+IMKgwqDCoMKgIHN0cnVjdCByZWd1bGF0b3IgKmhkbWlfc3VwcGx5Owo+Pj4+IMKgwqDC
oMKgIHUzMiBpcnFfc3RhdDsKPj4+PiBAQCAtMTAzMyw2ICsxMDM0LDEzIEBAIHN0YXRpYyBpbnQg
bWVzb25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFz
dGVyLAo+Pj4+IMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoCBjbGtfcHJlcGFyZV9lbmFibGUobWVz
b25fZHdfaGRtaS0+aGRtaV9wY2xrKTsKPj4+Pgo+Pj4+ICvCoMKgwqAgbWVzb25fZHdfaGRtaS0+
aWFoYl9jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAiaWFoYiIpOwo+Pj4+ICvCoMKgwqAgaWYgKElT
X0VSUihtZXNvbl9kd19oZG1pLT5pYWhiX2NsaykpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2
X2VycihkZXYsICJVbmFibGUgdG8gZ2V0IGlhaGIgY2xrXG4iKTsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIFBUUl9FUlIobWVzb25fZHdfaGRtaS0+aWFoYl9jbGspOwo+Pj4+ICvCoMKgwqAg
fQo+Pj4+ICvCoMKgwqAgY2xrX3ByZXBhcmVfZW5hYmxlKG1lc29uX2R3X2hkbWktPmlhaGJfY2xr
KTsKCgpPbiBwcmV2aW91cyBTb0NzLCBpYWhiIHdhcyBkaXJlY3RseSB0aGUgYnVzIGNsb2NrIChj
bGs4MSksIGFuZCBvbiByZWNlbnQgc29jcwp0aGlzIGNsb2NrIGlzIGEgZ2F0ZS4KClRoZSBxdWVz
dGlvbiBpcyB3aHkgaXMgaXQgZGlzYWJsZWQuIE1heWJlIGEgcHJldmlvdXMgZmFpbGVkIHByb2Jl
IGRpc2FibGVkIGl0CmluIHRoZSBkdy1oZG1pIHByb2JlIGZhaWx1cmUgY29kZSBhbmQgdGhpcyBj
bG9jayBpcyBuZWVkZWQgZm9yIG1lc29uX2R3X2hkbWlfaW5pdCgpLApzbyB5ZWFoIHRoaXMgaXMg
dGhlIHJpZ2h0IGZpeC4KClRoYW5rcy4KCkNvdWxkIHlvdSBzZW5kIGEgcmV2ZXJ0IG9mIGIzMzM0
MGUzM2FjZGZlNWNhNmE1YWExMjQ0NzA5NTc1YWUxZTA0MzIgYW5kIHRoZW4gcHJvcGVyIGZpeCB3
aXRoIGNsa19kaXNhYmxlX3VucHJlcGFyZSBhZGRlZCA/Cgo+Pgo+PiBJZiB5b3UgZ3V5cyBhcmUg
Z29pbmcgYWhlYWQgd2l0aCB0aGlzIGZpeCwgdGhpcyBjYWxsIHRvCj4+IGNsa19wcmVwYXJlX2Vu
YWJsZSgpIG5lZWRzIHRvIGJlIGJhbGFuY2VkIHdpdGggY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkg
c29tZWhvdwo+IAo+IFl1cCwgZ29vZCBwb2ludC4KPiAKPiBBbHRob3VnaCB0aGlzIGRyaXZlciAq
bmV2ZXIqIGRpc2FibGVzIGFueSBjbG9jayBpdCBlbmFibGVzLCBhbmQgbGVhdmVzIGl0Cj4gdG8g
dGhlIG1haW4gRFcgZHJpdmVyLCB3aGljaCBJIGd1ZXNzIG1ha2VzIGl0IGxlYWsgcmVmZXJlbmNl
cy4KPiAKPiBTbyBhbGwgMyBjbG9ja3MgbmVlZCBmaXhpbmcuCgpFeGFjdC4KClRoeCBHdWlsbGF1
bWUgZm9yIHRlc3RpbmcsCgpOZWlsCgo+IAo+IFRoYW5rcywKPiAKPiDCoMKgwqDCoMKgwqDCoCBN
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
