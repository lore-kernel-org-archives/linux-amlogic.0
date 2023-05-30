Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B75C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbowIsjvFjQwDq5m6/foGlUMF4eUvktIFqlhV/1KGvM=; b=agWKdWl60A5ifo
	xW+ckyK1V4og/F8NuyWr5hYp0KmYXXVV1lub4dE8sxl+WbL4EH73Wbkb3PZfkhJ3qgaGoOYTurcOc
	9JdGSyVwMkSBxetAlMh+lF+ime78HQ0EOZ80gA5qbFXeOqWxslAatqWLcak6E04DXaKi5U/VO0nCG
	1Csu+5sTKEBWWWvXe6QdOTHmkgqFq2OoEwyC5vm1hB33NdwXfv/+pLRTyiibXNgstLJbBKUNiLm2o
	yqMXuv76LPSjY6E03FIyVEujf9NqjZs9yU+AT4+0xQDgMtAEMv5aSOhBxVmwa79MdG5fV5nAUaBA/
	EEZjidt0NyErhf3dRfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u4B-00CnYm-0g;
	Tue, 30 May 2023 07:46:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3u48-00CnXn-2S
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:46:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30abe551605so2935193f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432807; x=1688024807;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D3tv9LafCdtcG4LKNUeAhIv8DN2WExEc7/tKO97gh8E=;
        b=NGEDm2FkkVXGf36QtMqg5AiGLMPxoAQKsI7EHmjNDxNe92uyB26hXYuUSVOQspX67a
         xnaVOQogjhuG+TU4xBP1737ipNJtebFL2HAS6paCH4of5ZwazcqFpgTEuQlnXuFAUSd6
         CrnZ+3QWAPCc6c6msbo7d8IkEYsCzgm33eoHlGfItg9ztqiaWzxiOq+emId5Md1KsGbI
         a7rTX4ZxqyCCCt5mvB6mkFtNwahibDA0nXr28T6UrSevKiyWmpgoxLfbZHWEwKvd7z/Z
         +F0lbOvo+GILXJUyEkW8kszp0K3+di4oZ4R07VHZrdBgFAzzxbZC2o0EjMFwOgoqoyf/
         Dt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432807; x=1688024807;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3tv9LafCdtcG4LKNUeAhIv8DN2WExEc7/tKO97gh8E=;
        b=JzlbhTrsTnrtP2ACZ51z2gD64Fa3ukxqFd2ZvFH3SjdFxkuJLwDThqf2tpLAVBNP1h
         zN2UwZCjFt0YpoqXK9BI75VKOgbEoyugfc0A1723evwdM1ZTZ/aE9AdJrAPV/c7BZkGK
         pkYKsJUo+hIBCdq+m2u4oJiuWB3nKTHjgvz6xQnGcJJb5t/i1rPT1+G3CD7OaBir8Jnc
         TqqUgJs9p1/a+I6HlLVQ67MtORo3Zm6KIxiVom5CdYFsehqmQN6n8ggexBdoAhzsoknF
         leAcgzejjpSBBpKdg5rvU9fuhXEmLcuFU4C54YnzdY0iSkjjcO9GBgjQTYE0nyfykndV
         Y+zA==
X-Gm-Message-State: AC+VfDwoGReSPdSHDeghUrq5vp+u2APhljP6BD7j8esi7hcBPPOXi9HN
	0pSW0NZSfga182i17FEI2crd/A==
X-Google-Smtp-Source: ACHHUZ7TRqIEMVi19gXmcraFyCBW8SVvygvbDrk2U1oFebLnxtB2fJ2rx4iL8yuCfwzX2KV+ryOZbg==
X-Received: by 2002:adf:de81:0:b0:30a:d944:b765 with SMTP id w1-20020adfde81000000b0030ad944b765mr1261118wrl.15.1685432807252;
        Tue, 30 May 2023 00:46:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4a4c000000b003077a19cf75sm2319371wrs.60.2023.05.30.00.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:46:46 -0700 (PDT)
Message-ID: <e6b6ffea-8706-3305-5267-9cbf3672f65f@linaro.org>
Date: Tue, 30 May 2023 09:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] dw-hdmi: truly enforce 420-only formats when drm mode
 demands it
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
Cc: kernel@collabora.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-3-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230528140001.1057084-3-adrian.larumbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_004648_804767_71438AFF 
X-CRM114-Status: GOOD (  14.95  )
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

T24gMjgvMDUvMjAyMyAxNjowMCwgQWRyacOhbiBMYXJ1bWJlIHdyb3RlOgo+IFRoZSBjdXJyZW50
IG91dHB1dCBidXMgZm9ybWF0IHNlbGVjdGlvbiBsb2dpYyBpcyBlbmZvcmNpbmcgWVVWNDIwIGV2
ZW4KPiB3aGVuIHRoZSBkcm0gbW9kZSBhbGxvd3MgZm9yIG90aGVyIGJ1cyBmb3JtYXRzIGFzIHdl
bGwuCj4gRml4IGl0IGJ5IGFkZGluZyBjaGVjayBmb3IgNDIwLW9ubHkgZHJtIG1vZGVzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFkcmnDoW4gTGFydW1iZSA8YWRyaWFuLmxhcnVtYmVAY29sbGFib3Jh
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
IHwgNyArKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4g
aW5kZXggZDU5YTU0N2Y5Y2IyLi4xYWZiOGYyNjAzYTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0yNzEwLDkgKzI3MTAsMTAgQEAgc3RhdGlj
IHUzMiAqZHdfaGRtaV9icmlkZ2VfYXRvbWljX2dldF9vdXRwdXRfYnVzX2ZtdHMoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwKPiAgIAkJLyogRGVmYXVsdCA4Yml0IGZhbGxiYWNrICovCj4gICAJ
CW91dHB1dF9mbXRzW2krK10gPSBNRURJQV9CVVNfRk1UX1VZWVZZWThfMF81WDI0Owo+ICAgCj4g
LQkJKm51bV9vdXRwdXRfZm10cyA9IGk7Cj4gLQo+IC0JCXJldHVybiBvdXRwdXRfZm10czsKPiAr
CQlpZiAoZHJtX21vZGVfaXNfNDIwX29ubHkoaW5mbywgbW9kZSkpIHsKPiArCQkJKm51bV9vdXRw
dXRfZm10cyA9IGk7Cj4gKwkJCXJldHVybiBvdXRwdXRfZm10czsKPiArCQl9Cj4gICAJfQo+ICAg
Cj4gICAJLyoKCkFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
