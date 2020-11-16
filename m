Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE2FC55ABD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 08:49:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF65208C7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 08:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x7fMoV9a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="o40VuBTi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF65208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cMi77D4llJZJf9wdhevdSLWadjTIpVtAhqo8uiVSl98=; b=x7fMoV9a40vzCTDwCWJGspJkF
	33gQoDYL2mDpBZT16qegERcQaY6UNxK2DDSdKhEkeN8uLFtB640YKVPwBOG1JXfx1i8CtcV/VnS3w
	oq/liVudyYkkg0dHr253jqfVxxAx5OtQLXTo3hbPs7qua4hftL70xWYw61vzCk2B6JBf7oLpGA1U+
	Z6xNYyQLkQ/RSo1DG80rJ7SlIstrV+VgJN7sUbwdp9VcWSTlnDp7Qci+CWYKf3smaluGR4k5yuiY+
	p0O2lt2TEN8gQipvIgwZY9mGblUwKPpuoR+To1oDs3/4RppgaHZgQbEDX3eZHOp7V1Wpbu+yh/0mC
	NaX+4OQcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keaCP-0006Ao-Tq; Mon, 16 Nov 2020 08:49:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keaCJ-00066c-SS
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 08:49:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id s8so17722658wrw.10
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 00:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+bJlyMAEB2wHlml8EIC85KvHJwpTysu8mR/NuE9XAF0=;
 b=o40VuBTiIdI/Be8sg+w9Di15L8i1eXDUFX/wCpzqcC6HiQe7XtMC7o16DbBbB0q9CG
 +6rUOVb57r5yY22FEA7Y1ClAoU0JAQpTEp6QlyiEEBpaZyxG52QH8gs4Smm74LVp/77P
 rLS3zGpph0gp7HbHw+lbnstGIFj0B/ZGHY71FnAqPcvRiRFIHzkROAs7K6+ygfFEgsEc
 ylm1j+XILPV/M/jzLVMnyeflbDG3wz4GZi+6rBdY+BDym72p76/FC4iAdwWC+0q8gw+c
 vDADDOF8wnet1+tfQSJdtGmDadhgsHGnWB7fJCICco0bFNZA5QUs5ufvPMZcXg7O4kTI
 +Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+bJlyMAEB2wHlml8EIC85KvHJwpTysu8mR/NuE9XAF0=;
 b=J4hP4kvdZQY/rhLXEKfdbXUGQKqJmcQlSUlGPeOS7jNAP2+IyrsBzMbpHsUzRhWIXp
 4mVplr6W4vlYDRBvYuixOZFlkPtI+8CXxah+WRZ2W+FTB/QznmOQc/mIAIgEvsKXLxxU
 ClszI16sK97ZIBb9WTVObe0LPL3ezrrnLi6XB8ufn89zgejbt3kCozzbSJTMrUoy7D2/
 QIB3koKgQ2/XvlnB3h64kYm9DBufWe5F4wowN/2etXW2Oq6rsQjB4RJcb0WhSRwkcBWc
 sglNzRXqvGdjrrpc+vI54OIytwF1theoHXcyDbg1SGyoDm40Zk0wUQbhXMx9qw9KCwot
 PvIg==
X-Gm-Message-State: AOAM531pDk+FuUg27VaObO3OmSdKT2lMYz1WcHnWFjC/KhOHJ61slfmm
 nLnWCJxya8HzvZr58mS2qV+1Yg==
X-Google-Smtp-Source: ABdhPJwrA53uPM354BPUgss5N/mtk4pEdi0rbBm9IYMCj7W9gwIRiSDqLRePwC7xAvcFToS7EZo1rg==
X-Received: by 2002:adf:a40c:: with SMTP id d12mr18407470wra.154.1605516553626; 
 Mon, 16 Nov 2020 00:49:13 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb?
 ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id m22sm22832111wrb.97.2020.11.16.00.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 00:49:12 -0800 (PST)
Subject: Re: [PATCH 17/40] drm/meson/meson_vclk: Make two local functions
 static
To: Lee Jones <lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-18-lee.jones@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9ef1827b-c415-6e17-2b0d-46477dce6d83@baylibre.com>
Date: Mon, 16 Nov 2020 09:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113134938.4004947-18-lee.jones@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034916_048274_A971BBAD 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTMvMTEvMjAyMCAxNDo0OSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmNsay5jOjEzNDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9y
IOKAmG1lc29uX3ZpZF9wbGxfc2V04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYzo0OTA6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1z4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KPiAKPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxp
YnJlLmNvbT4KPiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gQ2M6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCA4ICsrKystLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCj4gaW5kZXggMGViODY5NDNhMzU4OC4uMmE4MjEx
OWViNThlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwo+IEBAIC0xMzEsNyAr
MTMxLDcgQEAgZW51bSB7Cj4gIAlWSURfUExMX0RJVl8xNSwKPiAgfTsKPiAgCj4gLXZvaWQgbWVz
b25fdmlkX3BsbF9zZXQoc3RydWN0IG1lc29uX2RybSAqcHJpdiwgdW5zaWduZWQgaW50IGRpdikK
PiArc3RhdGljIHZvaWQgbWVzb25fdmlkX3BsbF9zZXQoc3RydWN0IG1lc29uX2RybSAqcHJpdiwg
dW5zaWduZWQgaW50IGRpdikKPiAgewo+ICAJdW5zaWduZWQgaW50IHNoaWZ0X3ZhbCA9IDA7Cj4g
IAl1bnNpZ25lZCBpbnQgc2hpZnRfc2VsID0gMDsKPiBAQCAtNDg3LDkgKzQ4Nyw5IEBAIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgaW50IHBsbF9vZF90b19yZWcodW5zaWduZWQgaW50IG9kKQo+ICAJ
cmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXZvaWQgbWVzb25faGRtaV9wbGxfc2V0X3BhcmFtcyhzdHJ1
Y3QgbWVzb25fZHJtICpwcml2LCB1bnNpZ25lZCBpbnQgbSwKPiAtCQkJICAgICAgIHVuc2lnbmVk
IGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAo+IC0JCQkgICAgICAgdW5zaWduZWQgaW50IG9k
MiwgdW5zaWduZWQgaW50IG9kMykKPiArc3RhdGljIHZvaWQgbWVzb25faGRtaV9wbGxfc2V0X3Bh
cmFtcyhzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCB1bnNpZ25lZCBpbnQgbSwKPiArCQkJCSAgICAg
IHVuc2lnbmVkIGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAo+ICsJCQkJICAgICAgdW5zaWdu
ZWQgaW50IG9kMiwgdW5zaWduZWQgaW50IG9kMykKPiAgewo+ICAJdW5zaWduZWQgaW50IHZhbDsK
PiAgCj4gCgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
