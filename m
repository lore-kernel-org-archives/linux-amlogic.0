Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF478C388F9
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 10:27:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4600D2220B
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 10:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jea+/l0Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F59CCLbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4600D2220B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5iHXkzcc5wsPw6WNS4rVtzLQZrQRggxjJQfk0I4yk6E=; b=Jea+/l0YJDaQTfrmG80jHXHIp
	eF+Nw1SgxfRPc5pmzUkQHuZOk8xGu/9nTvI1n2C1yBWZ2WnPyKVsgu9mvV3o8/HF77NsJuyJwtUQZ
	bKmQvpk5Mz2sAmKwivwN28ufer/Ln3QiTOTsU8uBjBn/yYtBTrs8N1CvkSNWhxoNEoh0S8LOMQV3g
	3OwL6IJFqGQk/w9wxRjhuCujIT5ppIgv9ZawWg9j2BQctqBkkUR0+reYhmbp9fpvie6aie62WUqTO
	eRlIe7/Hk5qFKRHQ2zA1nY+DaOWrn4ISjM5DidVaXuGzYbAJSl87Zyv5m/SdtIi7cjGpqDEl3gakn
	dyXs0oN8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfh9T-0007h2-NV; Thu, 19 Nov 2020 10:26:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfh9Q-0007fn-JH
 for linux-amlogic@lists.infradead.org; Thu, 19 Nov 2020 10:26:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id p19so5968727wmg.0
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Nov 2020 02:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c23Edl6AfajHTlT5A6Obc1CCSUISJptEb8tnXWiS9oA=;
 b=F59CCLbOviJO/poY/ftXNOXj8zRuXdO2jihqFDmKycw2obSwIcYjurJ2AH9S22aL3A
 Z69VIdjRUCDbWoyU6g+eCz5wNXYFNhz1aBzlKqS3Cxc6LkHMVoFjD0108ewsAV6Hzht1
 nwjtEvIkGvZeG+k2P3F4CBpBQRYlTwseV94PQ3TYyIa/Fmijj1iNMNIzTZ20HgAKDYI7
 nIzRBY860YGYELzf4z1m7ppzZPQ68QubEb97PfzOscOb+Hqiw3GfnF4nHMpLsBDpZnTU
 txKo1EbXbVoc45UhQRb3TC0hkO21iWKLqPYSXab41RvpFUeFiYvFcjXnxEkDgbQ5n2Ef
 ZXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c23Edl6AfajHTlT5A6Obc1CCSUISJptEb8tnXWiS9oA=;
 b=Qv+pt5c2kP8tpltITQtgZHdfeZvrALpNyEy1ky/d81uzzdPqIBjuwRQW9W/hokx+IS
 soCb1HYYk2h4FV1yQBXjg0VABzoFUOAWMGcuPUPoCEDc4ewtzQGkAIg2CgG9XzAi8GL3
 6tgc8aJarcO/niDzbagKl/Ivrb4CxXtEcWk+23n+cqj6fIhbdrm8zEv0+CyGfUJ5c0j5
 812kIjOItI6us37KuuXwBRnNSxIdWreOb2tjaqbL2GvFRi+dEPXzxUnnzGqlJx5PYfs+
 IMe/RdXSbeZHChrYfDnmgB1cuRoRlLj7AHp7nbnI50ZejU5l8KuRj6f2mC4xnKybs4iN
 vTJw==
X-Gm-Message-State: AOAM532NgptD4zPDER/B+I13fGX68KbpKs1606jkrHKHdcaqck81d06Y
 fw3s/VQeZBsrgUuOhg6+6WqbqQ==
X-Google-Smtp-Source: ABdhPJwUNc/HHD2R3ATImu0UwqysJ22sEb0lkl6ROiVf+cU84lVWuhIghlMG9N0Gs6h+NKLHOaYtZA==
X-Received: by 2002:a1c:9652:: with SMTP id y79mr3898100wmd.71.1605781608373; 
 Thu, 19 Nov 2020 02:26:48 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d?
 ([2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d])
 by smtp.gmail.com with ESMTPSA id z3sm36786852wrw.87.2020.11.19.02.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 02:26:47 -0800 (PST)
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
To: Marc Zyngier <maz@kernel.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
Date: Thu, 19 Nov 2020 11:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_052652_766127_AE226F9B 
X-CRM114-Status: GOOD (  16.52  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkvMTEvMjAyMCAxMToyMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+IE9uIDIwMjAtMTEtMTkg
MDg6NTAsIEd1aWxsYXVtZSBUdWNrZXIgd3JvdGU6Cj4+IFBsZWFzZSBzZWUgdGhlIGF1dG9tYXRl
ZCBiaXNlY3Rpb24gcmVwb3J0IGJlbG93IGFib3V0IHNvbWUga2VybmVsCj4+IGVycm9ycyBvbiBt
ZXNvbi1neGJiLXAyMDAuCj4+Cj4+IFJlcG9ydHMgYXJlbid0IGF1dG9tYXRpY2FsbHkgc2VudCB0
byB0aGUgcHVibGljIHdoaWxlIHdlJ3JlCj4+IHRyaWFsaW5nIG5ldyBiaXNlY3Rpb24gZmVhdHVy
ZXMgb24ga2VybmVsY2kub3JnLCBob3dldmVyIHRoaXMgb25lCj4+IGxvb2tzIHZhbGlkLgo+Pgo+
PiBUaGUgYmlzZWN0aW9uIHN0YXJ0ZWQgd2l0aCBuZXh0LTIwMjAxMTE4IGJ1dCB0aGUgZXJyb3Jz
IGFyZSBzdGlsbAo+PiBwcmVzZW50IGluIG5leHQtMjAyMDExMTkuwqAgRGV0YWlscyBmb3IgdGhp
cyByZWdyZXNzaW9uOgo+Pgo+PiDCoCBodHRwczovL2tlcm5lbGNpLm9yZy90ZXN0L2Nhc2UvaWQv
NWZiNjE5NmJmZDAxMjdmZDY4ZDhkOTAyLwo+Pgo+PiBUaGUgZmlyc3QgZXJyb3IgaXM6Cj4+Cj4+
IMKgIFvCoMKgIDE0Ljc1NzQ4OV0gSW50ZXJuYWwgZXJyb3I6IHN5bmNocm9ub3VzIGV4dGVybmFs
IGFib3J0OiA5NjAwMDIxMAo+PiBbIzFdIFBSRUVNUFQgU01QCj4gCj4gTG9va3MgbGlrZSB5ZXQg
YW5vdGhlciBjbG9jayBvcmRlcmluZyBzZXR1cC4gSSBndWVzcyBkaWZmZXJlbnQgQW1sb2dpYwo+
IHBsYXRmb3JtcyBoYXZlIHNsaWdodGx5IGRpZmZlcmVudCBvcmRlcmluZyByZXF1aXJlbWVudHMu
Cj4gCj4gTmVpbCwgZG8geW91IGhhdmUgYW55IGlkZWEgb2Ygd2hpY2ggcGxhdGZvcm0gcmVxdWly
ZXMgd2hpY2ggb3JkZXJpbmc/Cj4gVGhlIHZhcmlhYmlsaXR5IGluIERUIGFuZCBwbGF0Zm9ybXMg
aXMgcHJldHR5IGRpZmZpY3VsdCB0byBmb2xsb3cgKGFuZAo+IEkgZG9uJ3QgdGhpbmsgSSBoYXZl
IHN1Y2ggYm9hcmQgYXJvdW5kKS4KClRoZSByZXF1aXJlbWVudHMgc2hvdWxkIGJlIHRoZSBzYW1l
LCBoZXJlIHRoZSBpbml0IHdhcyBkb25lIGJlZm9yZSBjYWxsaW5nCmR3X2hkbWlfcHJvYmUgdG8g
YmUgc3VyZSB0aGUgY2xvY2tzIGFuZCBpbnRlcm5hbHMgcmVzZXRzIHdlcmUgZGVhc3NlcnRlZC4K
QnV0IHNpbmNlIHlvdSBib290IGZyb20gdS1ib290IGFscmVhZHkgZW5hYmxpbmcgdGhlc2UsIGl0
J3MgYWxyZWFkeSBhY3RpdmUuCgpUaGUgc29sdXRpb24gd291bGQgYmUgdG8gcmV2ZXJ0IGFuZCBk
byBzb21lIGNoZWNrIGluIG1lc29uX2R3X2hkbWlfaW5pdCgpIHRvCmNoZWNrIGlmIGFscmVhZHkg
ZW5hYmxlZCBhbmQgZG8gbm90aGluZy4KCk5laWwKCj4gCj4gVGhhbmtzLAo+IAo+IMKgwqDCoMKg
wqDCoMKgIE0uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
