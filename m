Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B005C369C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 07:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvwsvRCYyS9/IVgyH9UXIqYIQnYEwPbehj158KT99BU=; b=02NgSeCowVObWlpSj+/fv2XOQn
	QNAwzlG+PFaAgo2nczWg6QxXkKpoR96Z3Q7SQS8OLK5Ak56DkwawhJ0l7lXjJAEF3u2jp20tiHIIA
	G0OmuNyRz3rwwGkbNVlXyx5JAcIzPl3X4jLW6F53GRaKM4VaOyBUqJyjHbiKPR8o4JAgHmiWhxjtn
	aIVJgECAN8iW42OUHUdP8OAMllMt2axda6raPa1C6q3IKkUlza9k30rxboWkOdIifSrVJgDotFXLc
	JnAC7EoHX4FESkjzu9PGsWxc78y5z9fVUNC10j8kG22jG7QuoRkhnDNG6acPbAcohyDq9i4xZrXyI
	j73z2BCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78Eu-000000069gU-3UYL;
	Tue, 22 Apr 2025 07:40:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77gC-000000063mA-19at
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 07:04:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4315920f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305466; x=1745910266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
        b=FvsNu9zowFk5ba7uDii4YlAacDE5fzckcnYY7a29f/gCAUMmhGu9rWiPg30a56GjR+
         Bfl02KBFH30krvWtMCmWI+kSKxK+rhAzrH30UzQSJmA+5mrYCo+YoN+MVxlbOpbXJ9qr
         SobIS7kd4R9yZ8acjt0b2hwLpd5tjbCIj7hVckEFrMysRbJVkT8yeXCjyPc8wsZazAbf
         aWKsCmavJY2ljVNGSpzpr8TNQsOKs7AALryiZM2Whw/43+cNiJIrmjcTyDw5hf6GwC3B
         Vp9pbMIKdDCA2G0qGCeLeeaDWp12TdM6ggyTWilWQqKth7/dclKCUELqrn8PT77Obfep
         O2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305466; x=1745910266;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
        b=p/+rWFW86xAjbch+BOZin+Vjgtk2WyCviK3LF4mNxBAvwGCLwJlVSgMYJ/X4/RPufP
         YO3QO7FnympTcbI6ZGqlbtBijOk5CT4ag9Qw0fai2j3BfDoFAc16MjutWeSiebtaiuEV
         O2hj96ZhWLwVQYjN4z2YdXAznBoq036pAjHsAZ74FRhC1Br/Nmz9vj/+cRofBqcCTcmU
         KC6eKIRI7fRm2l4vVop7MWK8aosqthWIUhIxfKLdCTOrip3KkiXEsYIwORwgW/NlTQic
         JCsEEACqF0px493zTef0E/rqcaEAg+JidmTGqfbvoQgSqK1Dp81h/heFS1M9MlxxuS9v
         Hh7A==
X-Gm-Message-State: AOJu0YwzmX1ThNAcc6jeCmglg42UgVZBY2W/ujBs78MGm/qADZImu8/I
	MuEdH7tFSHnirxaKVAoX5YV13FcSmQSADtiqOtkMeY/KsSTn0JT88xDrqqbW0yM=
X-Gm-Gg: ASbGnctSRTFAX0zoe7SERMlfFg4BBz0U0OBbwW6d5ccRK3gA4+4nYSM5gMNJNMZ88cS
	G1kdg4Tc8iOF7bQlQ3SULzKr3kywwn7et0mhyPY1LtZb/VP6ExfKSkKwJxVqNtQx1zMebUuMd7H
	MC2rtRyLP7Z8yPVaNMG5GfBVLlV95aAJJmHpm3EtQKv7U6L7nOqkvTBJn63OxcWX3UOVAUlz1D1
	ULL35+Ujv9y4v5sf0+4nUdUn2IEFsbpLGgMQfgcuQLIkVeO7Are/oYgT007LSWNlIEw+vY7WMa2
	BrXpm+9jbl36FJ5L7g3MmZavqcdYjjSWm7d2giQ/2xpiQVsF/5UnB7ZhjFdprsAiz6C+YvFlF0B
	kIQZ/XA0GwHu85i3kr756zxwCLFlj
X-Google-Smtp-Source: AGHT+IFkoSeVngdhH4gWhO7gH9R1jUTNRyHvXAKvr6AmKds7Pokhh7kLUhAv02Z1AP3MT8O8IomR5w==
X-Received: by 2002:a05:6000:4a03:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39efba8a4demr11868054f8f.33.1745305466576;
        Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d006sm14361970f8f.56.2025.04.22.00.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Message-ID: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
Date: Tue, 22 Apr 2025 09:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
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
In-Reply-To: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_000428_320196_F9BD31D3 
X-CRM114-Status: GOOD (  20.89  )
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

T24gMTkvMDQvMjAyNSAyMzozMiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBNYXJ0
aWpuLCBIaSBOZWlsLAo+IAo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDg6NDbigK9QTSA8bGlu
dXhAbWFydGlqbnZhbmRldmVudGVyLm5sPiB3cm90ZToKPj4KPj4gSGkgTWFydGluLAo+Pgo+PiBU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPj4KPj4gSSBlbmNvdW50ZXJlZCB0aGlzIGlzc3VlIHNv
bWUgdGltZSBhZ28gYXMgd2VsbCBhbmQgaGFkIGEgcG9zc2libGUgZml4IGluIG15IHRyZWUgKHNl
ZQo+PiBiZWxvdykuCj4+IE15IGFwb2xvZ2llcyBmb3Igbm90IHVwc3RyZWFtaW5nIGl0IGVhcmxp
ZXIuCj4gTm8gd29ycmllcywgd2UncmUgYWxsIGJ1c3kgd2l0aCBib3RoLCBvZmZsaW5lIGFuZCBv
bmxpbmUgbGlmZSA7LSkKPiAKPj4gV2hpbGUgbXkgZml4IGlzIG5vdCBhcyBzeW1tZXRyaWMgYXMg
eW91cnPigJRJIGxpa2Ugc3ltbWV0cnnigJRpdCBpcyBzb21ld2hhdCBzaW1wbGVyLiBJdAo+PiBk
aWQgbWFrZSB0aGUgYXNzdW1wdGlvbiB0aGF0IG9ubHkgIGNhbGxpbmcgY29tcG9uZW50X3VuYmlu
ZF9hbGwoKSB3YXMgYXQgZmF1bHQgYW5kIHRoZSB0aGUgcmVzdCBvZiB0aGUKPj4gY29kZSB3YXMg
Y29ycmVjdC4gVGhlcmVmb3JlLCBjYWxsaW5nIG9uZSBvZiB0aGUgZm9sbG93aW5nIGZ1bmN0aW9u
czoKPj4gbWVzb25fZW5jb2Rlcl9kc2lfcmVtb3ZlKCkKPj4gbWVzb25fZW5jb2Rlcl9oZG1pX3Jl
bW92ZSgpCj4+IG1lc29uX2VuY29kZXJfY3Zic19yZW1vdmUoKQo+PiBpbiBjYXNlIHRoZWlyIGNv
dW50ZXJwYXJ0IHdhcyBub3QgY2FsbGVkLCBzaG91bGQgbm90IHJlc3VsdCBpbiBhbnkgaXNzdWVz
Lgo+Pgo+PiBJIGp1c3QgdmVyaWZpZWQsIGFuZCwgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgYWxs
IG9mIHRoZXNlIGZ1bmN0aW9ucyBkbyBhIGNoZWNrIHRvIGNvbmZpcm0KPj4gd2hldGhlciB0aGUg
ZW5jb2RlciB3YXMgaW5pdGlhbGl6ZWQgYmVmb3JlIHByb2NlZWRpbmcgd2l0aCBjbGVhbnVwLgo+
IFllcCwgdGhhdCBzZWVtcyB0byBiZSB0aGUgY2FzZSByaWdodCBub3cuCj4gTmVpbCwgd291bGQg
eW91IGxpa2UgTWFydGlqbidzIG1vcmUgc2ltcGxlIGFwcHJvYWNoIHdpdGggYSBGaXhlcyB0YWcK
PiBhbmQgYmFja3BvcnQgdGhhdD8KPiBUaGVuIEknZCBzZW5kIG15IHBhdGNoIGFzIGEgc21hbGwg
Y2xlYW51cCB3aGljaCBkb2Vzbid0IGhhdmUgdG8gYmUKPiBiYWNrcG9ydGVkLiBPdGhlcndpc2Ug
SSdkIHNwaW4gYSB2MiB3aXRoIGEgZml4IGZvciB0aGUgaXNzdWUgdGhhdAo+IE1hcnRpam4gZm91
bmQgKGFuZCBpbmNsdWRpbmcgQW5hbmQncyBSZXZpZXdlZC9UZXN0ZWQtYnkpPwoKUGxlYXNlIHNl
bmQgYSBmb2xsb3ctdXAsIEknbGwgYXBwbHkgdGhpcyBvbmUgdG9kYXkuCgpUaGFua3MsCk5laWwK
Cj4gCj4gWy4uLl0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHJ2LmMKPj4+IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4+PiBpbmRleCA4
MWQyZWUzN2U3NzMuLjAzMTY4NmZkNDEwNCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kcnYuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2Rydi5jCj4+PiBAQCAtMzE0LDM1ICszMTQsMzUgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmlu
ZF9tYXN0ZXIoc3RydWN0IGRldmljZQo+Pj4gKmRldiwgYm9vbCBoYXNfY29tcG9uZW50cykKPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vycihkcm0tPmRldiwgIkNvdWxkbid0IGJpbmQg
YWxsCj4+PiBjb21wb25lbnRzXG4iKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgLyogRG8g
bm90IHRyeSB0byB1bmJpbmQgKi8KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgaGFzX2NvbXBv
bmVudHMgPSBmYWxzZTsKPj4KPj4gQWJvdmUgdHdvIGxpbmVzIGFyZSBubyBsb25nZXIgdXNlZCwg
c28gY2FuIGJlIHJlbW92ZWQuCj4gV2VsbCBzcG90dGVkLCB0aGFuayB5b3UhCj4gCj4gCj4gQmVz
dCByZWdhcmRzLAo+IE1hcnRpbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
