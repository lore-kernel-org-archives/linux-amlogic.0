Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E0C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKCwODaeTxZAurlik3YNnxXedLpksIlTp//pefGPsvE=; b=syrC7/O5VdMVaGWbi3osXQFhpd
	sKgQrtsHKwxCf0N/5exYWtVEaeAEfyai9a5srEtCzxr8Jg7n/yDDpc08SmRXjnwsPRpiM1m2J6Yfc
	JlEMm2oV+ZQFvIjrDp8jCSkioKv5IuEwCuR9FE+UOowg1jq78mxxYBkrxDIHJEObs6afT5HAnI9cI
	UpCrf4t3msIXju9AWHF8TCKrpe8sj371zwIhrGcooBwL4FzmRXLkM4spwVVTA1V05dyQkHSCHh5CU
	hwVSulmYb438IIexiD6pupGOvEeW0vX2z+d0TW1r8neYn5vH40kkuEvlwYkBE8KbTY1zZyK6MOslu
	JjYwV/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pec1G-00CWNT-1k;
	Tue, 21 Mar 2023 13:27:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pec1A-00CWLc-1Z
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 13:27:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso758144wmo.0
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679405231;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nmuE9i4BOGv8wbGqII05vBX2hvOFUNZmklG6jr67aGk=;
        b=TWUgzxiNQuNvs7HKZcuVl11DJ1mctEQVxFLCpudW0tHRvL0lXGjm+4L6Z2fiaI/kMt
         xI+L3BVymVEMvaQK8wSVmHvCH9quIyRsWF1gknYrMmNvvLG3ETJtwVl2mPgLUQ6v2fc4
         djM+OmxrRuie9OnzKX+gOmRYv2OJnFTzDHBWw/H2/TrZxeW8qddUCFCHytTBZGotJxUH
         xudE6MwyuMnO4yDx/jwRvxDZcgI5h5zo28nlnmZTaCFgIbKmxEK9crSUkF2ej13pjdU2
         rNhaVogcHF+Keavw1r2sOJYFlXOcCzPT7BL9CL2wTQQnsqRtDOzrujTEwvjA3lS//L8Q
         2jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679405231;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmuE9i4BOGv8wbGqII05vBX2hvOFUNZmklG6jr67aGk=;
        b=iP/UotWjAEOZl9H/9JzxYMCPJ0HZt117y49iQQ0dqgMSbjjPK+4X4IQtRcUCy7irKb
         quLa2oFUKDGeCurz30Fqj5QCzZa3fLLjXhr67yKhOASTt4Ev4ZPGseK9w/FDYXsS/iVs
         lHnUAlnDiy44HjAnDn4b2nfg1afEzBD2fz8tKbuhSLtaqi9jyUZBKcsz1FA5627o1+co
         0w12Np0D4MFB9FQZS0CmLydMPo3e8tkjS+NQBZVxjKmpIPfemooozVePVIBwl9RKNNEv
         FX2PLRQj6fi0Hl2Do2bcc6vHdO6nXuuzGCKa6mMKDdECa9DHzix6+U8FP/sw/+pWdacS
         5csw==
X-Gm-Message-State: AO0yUKVqSU0MnOX4KZ1b3F0SpiG1stfLgwlwOsso/yup37bgSYuynC/m
	E9KNpIltpGddo9lkKMjGaUtaKQ==
X-Google-Smtp-Source: AK7set9+2mXnERPRLq+QIR9/XRsWTj2Mg5s8G1jTh6AI8V1S7SD/6C6xUGT5J2z1GE5KNYG1w8JPug==
X-Received: by 2002:a05:600c:28d3:b0:3ed:2eb5:c2dd with SMTP id h19-20020a05600c28d300b003ed2eb5c2ddmr2133002wmd.39.1679405230793;
        Tue, 21 Mar 2023 06:27:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c8ed:7915:30cc:f830? ([2a01:e0a:982:cbb0:c8ed:7915:30cc:f830])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b003eda357cfc5sm11232426wmq.43.2023.03.21.06.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 06:27:09 -0700 (PDT)
Message-ID: <35aa4401-8b35-09b5-9d97-59867d1df15c@linaro.org>
Date: Tue, 21 Mar 2023 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230306103533.4915-1-johan+linaro@kernel.org>
 <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
 <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
Organization: Linaro Developer Services
In-Reply-To: <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_062712_532089_82B1CCF4 
X-CRM114-Status: GOOD (  14.59  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjEvMDMvMjAyMyAxNDoxNCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+IE9uIFRodSwgTWFyIDA5
LCAyMDIzIGF0IDEwOjQxOjE4UE0gKzAxMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4g
Cj4+IE9uIE1vbiwgTWFyIDYsIDIwMjMgYXQgMTE6MzXigK9BTSBKb2hhbiBIb3ZvbGQgPGpvaGFu
K2xpbmFyb0BrZXJuZWwub3JnPiB3cm90ZToKPj4gWy4uLl0KPj4+IEBAIC0zMjUsMjMgKzMyNSwy
MyBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9iaW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYs
IGJvb2wgaGFzX2NvbXBvbmVudHMpCj4+Pgo+Pj4gICAgICAgICAgcmV0ID0gbWVzb25fZW5jb2Rl
cl9oZG1pX2luaXQocHJpdik7Cj4gCj4+IEknbSB3b25kZXJpbmcgaWYgY29tcG9uZW50X2JpbmRf
YWxsKCkgY2FuIGJlIG1vdmVkIGZ1cnRoZXIgZG93bi4KPj4gUmlnaHQgbm93IGl0J3MgYmV0d2Vl
biBtZXNvbl9lbmNvZGVyX2N2YnNfaW5pdCgpIGFuZAo+PiBtZXNvbl9lbmNvZGVyX2hkbWlfaW5p
dCgpLiBTbyBpdCBzZWVtcyB0aGF0IGVuY29kZXJzIGRvbid0IHJlbHkgb24KPj4gY29tcG9uZW50
IHJlZ2lzdHJhdGlvbi4KPiAKPiBQZXJoYXBzIGl0IGNhbiwgYnV0IHRoYXQgd291bGQgYmUgYSBz
ZXBhcmF0ZSBjaGFuZ2UgKHVubGVzcyB0aGVyZSBpcwo+IHNvbWV0aGluZyBpbmhlcmVudGx5IHdy
b25nIHdpdGggdGhlIGN1cnJlbnQgaW5pdGlhbGlzYXRpb24gb3JkZXIpLgoKVGhlIENWQlMgZG9l
c24ndCByZWx5IG9uIGFueSBjb21wb25lbnRzIHVubGlrZSBIRE1JLCB0aGlzIGV4cGxhaW5zIHRo
ZQpjdXJyZW50IHBvc2l0aW9uIG9mIGNvbXBvbmVudF9iaW5kX2FsbCgpLgoKPiAgIAo+PiBVbmZv
cnR1bmF0ZWx5IEkgYW0gYWxzbyBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIGFuZCBJJ20gaG9waW5n
IHRoYXQKPj4gTmVpbCBjYW4gY29tbWVudCBvbiB0aGlzLgo+IAo+IEFueSBjb21tZW50cyBvbiB0
aGlzIG9uZSwgTmVpbD8KClllcCwgY29tcG9uZW50cyBzaG91bGQgYmUgYmluZCBmb3IgSERNSSBl
bmNvZGVyL2JyaWRnZSBpbml0LgoKQW55d2F5IGZvciB0aGlzIHBhdGNoLCBzb3JyeSBmb3IgdGhl
IGRlbGF5LCBidXQgaXQncyBsb29rcyBmaW5lOgoKQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKPiAKPiBKb2hhbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
