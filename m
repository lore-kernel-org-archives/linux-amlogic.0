Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80C2CF34A0
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2024 11:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lQRkbj6tX6/HmaS6tT/dODpoYgx1gH86XeD2yGodD0=; b=zlnXWjZaGp0UPo6jTRMH819nVc
	Sh3qIzvhM8tPZZ6qNloYzsSX/e51jxDKR30jlQDYuQU7EnziWw5vaAW8r8PII35httFfTMI35iYKG
	WzPFvm12R9L2rPPO0kBcgpE3+84mLFSnRnUhtnDF0qTao6KScw5Fb9HEKPgWwnn6bViyS5tOBHNu6
	vVLye/Trs4+neUUlVPv3JKYQUR+mSyFb+PQSWFbIMkYCDWSiFjjYeyJmWyiKvNqTNxDwdmSB3wPoN
	9piARaPjWN5x8zmfc8LySxSP8vjM0mNgAxkutfOCTKyjHOiwVRVwwMVOP4JPwloxoO3HXKiBYwsYX
	H0ewsvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swKQf-00000008xTH-43jg;
	Thu, 03 Oct 2024 11:55:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swKQb-00000008xSF-4C7P
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Oct 2024 11:55:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cb2191107so7757905e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Oct 2024 04:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727956528; x=1728561328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab2R4/kCazlaYiRKlRL0Q879kkxP9RVXhQRJAU5QMOs=;
        b=yeEsPjYP1hGfwCtWwhWEmm6ZviVslYKdTBkewvjVXaBQCmSgCC4q7jT4jl4A9bltKx
         kqJNNyP/fEJLzbMzzmO1OVQzhRuN3PjXtRKFuGaHLUItbkSaVkIbPaNq/O8iCp59xiYm
         0y2Mw7QbyvAffv8KhloII57XsPtbmt7wFxTOypSEHYjrcKAUDc0QXu6GJRaAGFbooV9h
         5SWfAzKyRYujewnHQBigE6rNv7w0g/J6KqnMMZYHBwjjW5C/IgKEdN6HZ4848ANaFxig
         Ony9ji67NzjcF5O2uifcmr5DBHLqq+Q6iYC7UUyRye7NljhPk4CKXlfSo6AkQoCFKlMq
         W2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727956528; x=1728561328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ab2R4/kCazlaYiRKlRL0Q879kkxP9RVXhQRJAU5QMOs=;
        b=vP6MFM174UApbILT7hRXaIn8Yx2D7ZRfROc19rulbj1/uDQYEVZ6KyHEXDme6Qac15
         JJT+V4YFTSf7E4wP7YTfxKBE1c5mo41+JQqIM4JO1Dkl8dxlVYwzDaOj+WQenBI0Hpex
         V9VJjNEwyaV+4LN79xOR7Qm0ElFaawPg/mh9ILBidR7K9pfqTy3MjDHAWcbN2oRvFS8c
         D/fYg9yhK0ZhgmuPWza/XTDSEXU6du8rPt8ltH/Mjd/HVZfwPiXcod0K7KOw1mCSjOFN
         WWzbJDXZQ96g829JJ1OV+3YEwI6J4YAIwMhNFbHS54+5pRJhN7xio3a0VC1H8qTin/+L
         hSzA==
X-Gm-Message-State: AOJu0YwZqGKqCZbSxqAsqCGlGOVFkM7768aJo1WZus/w77WBcI7ZvQfY
	AAgb2sASFpmPTjBz0gVMiUcCyl5K1eMRafLrFXiAQYLoRrYxjyoJNa0J1jwdMvE=
X-Google-Smtp-Source: AGHT+IHKkgKdKG0k1hqIM9d4fDHkrFEKwWLLdhNb4lgY3k1F+nM7LOLAqJc+U0jg5McKkr6iIe+jqQ==
X-Received: by 2002:adf:f70c:0:b0:378:8dea:4bee with SMTP id ffacd0b85a97d-37cfb8d0a68mr3759720f8f.33.1727956527703;
        Thu, 03 Oct 2024 04:55:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e534:c027:e113:29a1? ([2a01:e0a:982:cbb0:e534:c027:e113:29a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d20bcsm1112388f8f.100.2024.10.03.04.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 04:55:27 -0700 (PDT)
Message-ID: <13b81191-b647-4577-a92f-b98c521a7727@linaro.org>
Date: Thu, 3 Oct 2024 13:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/10] drm/meson: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-11-ville.syrjala@linux.intel.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241003111851.10453-11-ville.syrjala@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_045530_064425_738FEB05 
X-CRM114-Status: GOOD (  12.63  )
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

T24gMDMvMTAvMjAyNCAxMzoxOCwgVmlsbGUgU3lyamFsYSB3cm90ZToKPiBGcm9tOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+IEFsbG93IG1lc29u
IHRvIGJlIGJ1aWx0IHdpdGggQ09NUElMRV9URVNUPXkgZm9yIGdyZWF0ZXIKPiBjb3ZlcmFnZS4g
QnVpbGRzIGZpbmUgb24geDg2L3g4Nl82NCBhdCBsZWFzdC4KPiAKPiBDYzogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vS2Nv
bmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnCj4gaW5kZXggYjQxMGUwZDgwMTVhLi40MTdmNzk4
MjljZjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vS2NvbmZpZwo+IEBAIC0xLDcgKzEsNyBAQAo+ICAgIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gICBjb25maWcgRFJNX01FU09O
Cj4gICAJdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZvciBBbWxvZ2ljIE1lc29uIERpc3BsYXkgQ29u
dHJvbGxlciIKPiAtCWRlcGVuZHMgb24gRFJNICYmIE9GICYmIChBUk0gfHwgQVJNNjQpCj4gKwlk
ZXBlbmRzIG9uIERSTSAmJiBPRiAmJiAoQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVCkKPiAg
IAlkZXBlbmRzIG9uIEFSQ0hfTUVTT04gfHwgQ09NUElMRV9URVNUCj4gICAJc2VsZWN0IERSTV9D
TElFTlRfU0VMRUNUSU9OCj4gICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCgpSZXZpZXdlZC1ieTog
TmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
