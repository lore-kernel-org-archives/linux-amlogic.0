Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE54C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9X6tf6tRISsQJlUqUZ+Alyxg4PqQF2YJJQx+HJIXGlk=; b=13KEctYvNMt2yi
	wSgDM0vqkRRjgJd/X9THGvG2eUPdzdfJho4JY9Bfs/avWHQxnRy7/nHyG3usHzNshsQs4DEO/iDli
	TLov4zwpWOrTEwP9oWAYocKxLrIT36xbwU9AncJJc8RkFwPeA/HH9h0STyOiJeBw4an2YSyb1sSNO
	e0EINSXL9ateqp3A44F5eTY0vAV9TbaPAMJycKEsQkiDqdz/VYvu4Q3dvWxM3QWk8XjgVvS8yuH72
	7O9BUKUq26RJXO31LuelJHAOzxZ4WFv4vIqAMLbzfZr2XvGQxdFRODm8eHWKVAr4OKwZ+8tvW59ZZ
	Xb5OLZ/a+KmX5TMmqdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u6a-00Co34-1o;
	Tue, 30 May 2023 07:49:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u6Y-00Co2Z-0L
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:49:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso27757065e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432956; x=1688024956;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3yzDJiO92tk0bxoG2nEqpyCLLDHUupgzwTW49Ku5GEo=;
        b=AWXODoAuHoLWQJkyUfkIlriTJYyc7oFKMQbHDVpaH016DnDI3eXFICHNWPpXOVemD4
         o7JsxtjOrEJbixQc8OMRSAJ/E++HoRbbnuYA7d7O74SVyqQ37fK4Sv2O4L4J/wjvEX0s
         wkUt1WoMsR432PwirW683j+mRruqVccxxxokic8Sqbpw9JupD805MZApvax5Jou3OOYR
         cpqlaYu+8mPkuLUCy7eLvi3QsJLrUopSvTeYPlglVw9WQIcLkqhPe011ZmYuHpOiFNAa
         3T5kLdDW2OQVI4kLOEmkAIjJCUStD/STk6jiJJLFH7Oi7woFgtdzmOqtAUgg9Tj2uaMc
         JANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432956; x=1688024956;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yzDJiO92tk0bxoG2nEqpyCLLDHUupgzwTW49Ku5GEo=;
        b=PGtlOHK6M+SRVwBS7ys2IuFoyt4A0S22lIuySSuCJ4FC5sXEZezIrWL/KRZMKbYL2k
         Kbk1TW3w7CVe5aPg4HIChsP5YvBaMNaRcV4rTvrr1AM45L1FGKcrrke5Xx+vMgJNRHpK
         ruMlH+KjDmVT6EMdcsnka/5g78Ps6Ccr+udsO8hAmItzbpdDvghgEN+DmjkRPlaOlDjX
         nYhWACF70Sewc7oeNiHaptT3NHNWfR8dF+zNh3g/Nzoh96FtSetzqYOeyt2dcRFGm/de
         j0yZO69QfJayrNhfe6tAgfZGlYqkcdpqtUmzaIJlwucWnrc5fPnEc4cKBitKzUrahk/U
         zibg==
X-Gm-Message-State: AC+VfDyIk2wMXxNgaXEUK6rlcIJuwE4fMaXSo/54NwqYcoqJQGrQYt8d
	rWeqnGH4HN5tAMeGKqLrqbmqkQ==
X-Google-Smtp-Source: ACHHUZ4gLjpSdu/61modjFAKen/mfbt/HGkIZBNy6fQEvijiipYvM5rMo3kOeQ0U9/OW6n4cC6NT2Q==
X-Received: by 2002:a05:600c:2214:b0:3f6:2d8:4823 with SMTP id z20-20020a05600c221400b003f602d84823mr948485wml.3.1685432956587;
        Tue, 30 May 2023 00:49:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c00c500b003f0ad8d1c69sm20042544wmm.25.2023.05.30.00.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:49:16 -0700 (PDT)
Message-ID: <3b48e709-5bc5-74ed-05a4-2e9909e2f0ed@linaro.org>
Date: Tue, 30 May 2023 09:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] dw-hdmi: remove dead code and fix indentation
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Cc: kernel@collabora.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-4-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230528140001.1057084-4-adrian.larumbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_004918_149971_0A5A0092 
X-CRM114-Status: GOOD (  13.33  )
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

T24gMjgvMDUvMjAyMyAxNjowMCwgQWRyacOhbiBMYXJ1bWJlIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVtYmVAY29sbGFib3JhLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMjIgKysrKy0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMKPiBpbmRleCAxYWZiOGYyNjAzYTAuLjBhY2NmYjUxNTA5YyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTQ5LDIwICs0OSw2IEBACj4gICAK
PiAgICNkZWZpbmUgSERNSTE0X01BWF9UTURTQ0xLCTM0MDAwMDAwMAo+ICAgCj4gLWVudW0gaGRt
aV9kYXRhbWFwIHsKPiAtCVJHQjQ0NF84QiA9IDB4MDEsCj4gLQlSR0I0NDRfMTBCID0gMHgwMywK
PiAtCVJHQjQ0NF8xMkIgPSAweDA1LAo+IC0JUkdCNDQ0XzE2QiA9IDB4MDcsCj4gLQlZQ2JDcjQ0
NF84QiA9IDB4MDksCj4gLQlZQ2JDcjQ0NF8xMEIgPSAweDBCLAo+IC0JWUNiQ3I0NDRfMTJCID0g
MHgwRCwKPiAtCVlDYkNyNDQ0XzE2QiA9IDB4MEYsCj4gLQlZQ2JDcjQyMl84QiA9IDB4MTYsCj4g
LQlZQ2JDcjQyMl8xMEIgPSAweDE0LAo+IC0JWUNiQ3I0MjJfMTJCID0gMHgxMiwKPiAtfTsKPiAt
Cj4gICBzdGF0aWMgY29uc3QgdTE2IGNzY19jb2VmZl9kZWZhdWx0WzNdWzRdID0gewo+ICAgCXsg
MHgyMDAwLCAweDAwMDAsIDB4MDAwMCwgMHgwMDAwIH0sCj4gICAJeyAweDAwMDAsIDB4MjAwMCwg
MHgwMDAwLCAweDAwMDAgfSwKPiBAQCAtODU2LDEwICs4NDIsMTAgQEAgc3RhdGljIHZvaWQgZHdf
aGRtaV9ncF9hdWRpb19lbmFibGUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4gICAKPiAgIAlpZiAo
cGRhdGEtPmVuYWJsZV9hdWRpbykKPiAgIAkJcGRhdGEtPmVuYWJsZV9hdWRpbyhoZG1pLAo+IC0J
CQkJCSAgICBoZG1pLT5jaGFubmVscywKPiAtCQkJCQkgICAgaGRtaS0+c2FtcGxlX3dpZHRoLAo+
IC0JCQkJCSAgICBoZG1pLT5zYW1wbGVfcmF0ZSwKPiAtCQkJCQkgICAgaGRtaS0+c2FtcGxlX25v
bl9wY20pOwo+ICsJCQkJICAgIGhkbWktPmNoYW5uZWxzLAo+ICsJCQkJICAgIGhkbWktPnNhbXBs
ZV93aWR0aCwKPiArCQkJCSAgICBoZG1pLT5zYW1wbGVfcmF0ZSwKPiArCQkJCSAgICBoZG1pLT5z
YW1wbGVfbm9uX3BjbSk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIGR3X2hkbWlfZ3BfYXVk
aW9fZGlzYWJsZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKCldpdGggcHJvcGVyIGNvbW1pdCBkZXNj
cmlwdGlvbjoKCkFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
