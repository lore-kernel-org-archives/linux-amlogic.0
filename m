Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99192C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 16:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu0ECdZljShm3b8xjWZ5h/DK+V+OeVl79SD3qj3fZ7w=; b=FpNex0uPbhW0NHCNFmwt1N2g2k
	IyYFYSfzz51VXnNyv1ELrbyRmvw1JfczL60TBo2IhahF9UMf1gtbytWWZe4OcFzKtou6DAHPVyJVq
	2bFghm6/Jf3tqAqlf+wR0Uqe8Zg/LK2Oq751vz07IpxpCWs6YZ1JKM9Q+PCH4DFq1vwONCT3VEiuR
	MVBA/IprUkET7koCzzkcWGAfMNTmDXBrJ+bn/PZRdaQcj3zlEgy1NG1a5r0XK3kKQbry2vWjAd3tc
	FtD6zhrWoCN4TWaAb7MXch/W2d0ebjodjiqr/XQsr3EyTooGAYIaU9I0ZShgUeUgEwh0SdfviSd1m
	kTxxLVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywtN-0000000ENVD-0fMA;
	Mon, 22 Apr 2024 16:51:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rywtI-0000000ENUK-3zeL
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 16:51:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so9070895e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713804698; x=1714409498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJE4rl1eEAUqGfBZC2SJPu8F2JMT82hT5pkxBZ1KzUY=;
        b=uDZlh5V9kGz0yAG7xryR/DFVGPQ8I7HRMzZw0fTvwcjZXVZ9MZ0rz+gSK7dfyJ9bZy
         u64wqG8aYVrMdqaXUY8hXS+ajT/Bugzk6z0kxpoyXXTTAb6U35JJ0hoU/oe4geSmglSq
         dNd4vwlFhS9lPWJ7kaETeDsm7Wgm2ZvaBQM7N3F1cIx5JHnhlLtjv5RsSD71QUZib0kV
         pDU6Qj5nEamGAHTChXn4rz0RebEuiPb7eosq06zLKexhT1htkua4SO6wYJZHXlCiODme
         WXcJ8p7aT9XggxNN3514ytiGLJOja2lXlv0mGKSjMO2O+1X/tyPLEIC3/hQ0HuX0rGII
         RQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713804698; x=1714409498;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EJE4rl1eEAUqGfBZC2SJPu8F2JMT82hT5pkxBZ1KzUY=;
        b=gkRu34L+WrY2M+wQeipHVtF3TtRpPvVuNYXAr1MmDrmq8yqQd3yREeIZsRLQ1eIQpG
         qhAaLhm4wHlEKjuKzgilhEd+V1uvXj+6qYsMXqU0QoWfRkmcJBW7JRkZ0ndJZ0mC0Bh8
         8ZdrawgMyaevm1ShbQokX1YxKxN0GxbrpCwNH1GCVws5DMgXk1W+w4FpArGGJSTJ2Gpl
         F7zNWFh1EyKKpHo242GOYzKHYxE22ZNQyahnScruKjRJJcDbs0A/qSLHJXAb/W7ye95S
         vCUjg7tzeGf4k3ziVlGEuAj1QzdjEFwIPm0CD6p7WKgPSE4A/+PjUnFQc03Y427GXPWJ
         gQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5KGEwLrf9PpWuCOMipIE3dZu1RfBFRmortOoQ0XRWKjnsNEj3fbrKYHxJ/UNhWL3mnxY832BXJXKbzxZ0142XgWwVz1Dvczbf4pi4LZLQahk=
X-Gm-Message-State: AOJu0Yy+V6HUh5ABOEu967Hz3fDPChusurpe/r6No7y8LL+Mfsf6QcED
	/8SWu/5TqWuJ3uruoa5zeOpEOcLP5JzPOCCFo8hkBBAeQpzA68vEC2QqYCfGaWU=
X-Google-Smtp-Source: AGHT+IEnfwfQbwhcjAOciihqlrDnokk0wOxDOpXOkMdC9cD5R08X2KCDBWIiDoP1zJiRjjvC/4n74g==
X-Received: by 2002:a05:600c:a05:b0:41a:5d49:97e9 with SMTP id z5-20020a05600c0a0500b0041a5d4997e9mr157502wmp.9.1713804698013;
        Mon, 22 Apr 2024 09:51:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e5e5:892f:e81f:7cad? ([2a01:e0a:982:cbb0:e5e5:892f:e81f:7cad])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b004161af729f4sm17228944wmb.31.2024.04.22.09.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 09:51:37 -0700 (PDT)
Message-ID: <ee095697-d3b9-40b5-84a5-6d20ff14ca0f@linaro.org>
Date: Mon, 22 Apr 2024 18:51:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin
 <nbelin@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
 <CAFBinCChEc+GH+tdmByWDM=Gs_BUpDh=6S=ch3QbGUt501_Ejw@mail.gmail.com>
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
In-Reply-To: <CAFBinCChEc+GH+tdmByWDM=Gs_BUpDh=6S=ch3QbGUt501_Ejw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_095141_029206_11CB261B 
X-CRM114-Status: GOOD (  34.88  )
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

SGkgTWFydGluLAoKT24gMTAvMDQvMjAyNCAyMTozNCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90
ZToKPiBIaSBOZWlsLAo+IAo+IE9uIFdlZCwgQXByIDMsIDIwMjQgYXQgOTo0NuKAr0FNIE5laWwg
QXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gRGlzYWJs
ZSB0aGUgcHhfY2xrIHdoZW4gc2V0dGluZyB0aGUgcmF0ZSB0byByZWNvdmVyIGEgZnVsbHkKPj4g
Y29uZmlndXJlZCBhbmQgY29ycmVjdGx5IHJlc2V0IFZDTEsgY2xvY2sgdHJlZSBhZnRlciB0aGUg
cmF0ZQo+PiBpcyBzZXQuCj4+Cj4+IEZpeGVzOiA3N2Q5ZTFlNmI4NDYgKCJkcm0vbWVzb246IGFk
ZCBzdXBwb3J0IGZvciBNSVBJLURTSSB0cmFuc2NlaXZlciIpCj4+IFNpZ25lZC1vZmYtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+PiAtLS0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfbWlwaV9kc2kuYyB8IDcgKysrKysrKwo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX2R3X21pcGlfZHNpLmMKPj4gaW5kZXggYTZiYzFiZGIzZDBkLi5hMTBjZmYzY2ExZmUg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jCj4+IEBA
IC05NSw2ICs5NSw3IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcGh5X2luaXQodm9pZCAqcHJp
dl9kYXRhKQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+ICAgICAgICAgIH0KPj4K
Pj4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUobWlwaV9kc2ktPnB4X2Nsayk7Cj4gbml0
LXBpY2s6IGNsa19kaXNhYmxlKG1pcGlfZHNpLT5weF9jbGspOyBzaG91bGQgYmUgZW5vdWdoIGhl
cmUgYXMgbXkKPiB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgd2Ugb25seSBuZWVkIHRvIHt1bix9cHJl
cGFyZSBhIGNsb2NrIG9uY2UuCj4gCj4+ICAgICAgICAgIHJldCA9IGNsa19zZXRfcmF0ZShtaXBp
X2RzaS0+cHhfY2xrLCBtaXBpX2RzaS0+bW9kZS0+Y2xvY2sgKiAxMDAwKTsKPj4KPj4gICAgICAg
ICAgaWYgKHJldCkgewo+PiBAQCAtMTAzLDYgKzEwNCwxMiBAQCBzdGF0aWMgaW50IGR3X21pcGlf
ZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+PiAgICAgICAgICB9Cj4+Cj4+ICsgICAgICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KG1pcGlfZHNpLT5weF9jbGspOwo+PiArICAgICAgIGlmIChyZXQpIHsKPj4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIobWlwaV9kc2ktPmRldiwgIkZhaWxlZCB0byBlbmFibGUgRFNJIFBpeGVsIGNs
b2NrIChyZXQgJWQpXG4iLCByZXQpOwo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiBJ
ZiB3ZSBldmVyIGhpdCB0aGlzIGVycm9yIGNhc2UgdGhlbiB0aGVyZSB3aWxsIGJlIGEgbG90IG9m
IGFkZGl0aW9uYWwKPiBlcnJvcnMgaW4gdGhlIGtlcm5lbCBsb2c6Cj4gLSBpbml0aWFsbHkgdGhl
IGNsb2NrIGlzIHByZXBhcmVkIGFuZCBlbmFibGVkIGluCj4gbWVzb25fZHdfbWlwaV9kc2lfcHJv
YmUoKSBieSBjYWxsaW5nIGRldm1fY2xrX2dldF9lbmFibGVkKCkKPiAtIHdlIHRoZW4gZGlzYWJs
ZSB0aGUgY2xvY2sgYWJvdmUgKGdlbmVyYWxseSBkaXNhYmxpbmcgYSBjbG9jayBpcwo+IGV4cGVj
dGVkIHRvIGFsd2F5cyBzdWNjZWVkKQo+IC0gaWYgdGhlIGNsb2NrIGNhbiBOT1QgYmUgcmUtZW5h
YmxlZCBoZXJlIHdlIGp1c3QgbG9nIHRoZSBlcnJvcgo+IC0gaW4gY2FzZSBhIHVzZXIgdHJpZXMg
dG8gcm1tb2QgdGhlIGRyaXZlciAodG8gbW9kcHJvYmUgaXQgYWdhaW4pIHRvCj4gdHJ5IGFuZCBy
ZWNvdmVyIGZyb20gYW4gZXJyb3IgdGhlIGF1dG9tYXRpYyBkaXNhYmxpbmcgb2YgdGhlIHBpeF9j
bGsKPiAoYmFzZWQgb24gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3aGVyZSBpdCB3YXMgZW5hYmxl
ZCBpbml0aWFsbHkpIHRoZXJlCj4gd2lsbCBiZSBhIHNwbGF0IGJlY2F1c2UgdGhlIGNsb2NrIGlz
IGFscmVhZHkgZGlzYWJsZWQgKGFuZCBlbmFibGVkCj4gY291bnQgaXMgemVybywgc28gaXQgY2Fu
bm90IGJlIGRpc2FibGVkIGFueSBmdXJ0aGVyKQo+IAo+IEZvciB0aGUgMzItYml0IFNvQyB2aWRl
byBjbG9ja3MgSSBrZWVwIHRyYWNrIG9mIHRoZW0gYmVpbmcgZW5hYmxlZCBvcgo+IGRpc2FibGVk
LCBzZWUgWzBdLCBbMV0gYW5kIFsyXS4KPiBJbiBteSBjYXNlIHRoaXMgaXMgaW1wb3J0YW50IGJl
Y2F1c2Ugd2UgY2FuIHJ1biBpbnRvIGNhc2VzIHdoZXJlIHRoZQo+IFBMTCBkb2Vzbid0IGxvY2sg
KEkgYW0gbm90IHN1cmUgaG93IGxpa2VseSB0aGlzIGlzIGZvciB5b3VyIGNhc2UpLgo+IAo+IEl0
ICpzZWVtcyogbGlrZSB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyIGFzCj4gZHdfbWlw
aV9kc2lfcGh5X2luaXQoKSBjYW4gYmUgY2FsbGVkIHdoZW4gY2hhbmdpbmcgdGhlIGRpc3BsYXkK
PiByZXNvbHV0aW9uIChvciB3aGVuZXZlciBkcm1fYnJpZGdlX2Z1bmNzLmF0b21pY19wcmVfZW5h
YmxlKSBpcyBjYWxsZWQuCj4gVG8gaWxsdXN0cmF0ZSB3aGF0IEkgaGF2ZSBpbiBtaW5kIEkgYXR0
YWNoZWQgYSBkaWZmIChpdCdzIGJhc2VkIG9uCj4gdGhpcyBwYXRjaCkgLSBpdCdzIGNvbXBpbGUg
dGVzdGVkIG9ubHkgYXMgSSBoYXZlIG5vIERTSSBoYXJkd2FyZS4KPiBJbiBjYXNlIGR3X21pcGlf
ZHNpX3BoeV9pbml0KCkgaXMgY2FsbGVkIG9ubHkgb25jZSBwZXIgZGV2aWNlCj4gbGlmZWN5Y2xl
IHRoaW5ncyBtYXkgZ2V0IGVhc2llci4KPiAKPiBQUzogSSdtIHNvIGhhcHB5IHRoYXQgd2UgZG9u
J3QgbmVlZCBhbnkgY2xvY2sgbm90aWZpZXJzIGZvciB0aGlzIQo+IFNvOiBnb29kIHdvcmsgd2l0
aCB0aGUgY2xvY2sgZHJpdmVyIGJpdHMuCgpJIGNoZWNrZWQgYW5kIHRlc3RlZCB5b3VyIHBhdGNo
ZXMgYW5kIGl0IGRvZXNuJ3Qgd29yayBiZWNhdXNlIHRoZSBwY19jbGsKbmVlZHMgdG8gYmUgZGlz
YWJsZWQgJiBwcmVwYXJlZCBpbiBvcmRlciB0byBjb3JyZWN0bHkgcmVzZXQgYW5kIHNldHVwIGFn
YWluCnRoZSB2aWRlbyBjbG9jayB0cmVlLgoKZHdfbWlwaV9kc2lfcGh5X2luaXQoKSBpcyBjYWxs
ZWQgYXQgZWFjaCBEU0kgbW9kZSBjaGFuZ2UsIGJ1dCBpdCByZXF1aXJlcyBhCmZ1bGwgY2xvY2sg
dHJlZSByZWNhbGMgYW5kIHJlc2V0LCBzbyBpdCdzIHNhZmVyIHRvIGtlZXAgdGhlIGN1cnJlbnQg
ZGVzaWduLgoKSSdsbCB0cnkgdG8gc2VuZCBhIGNoYW5nZSB0byBiZXR0ZXIgaGFuZGxlIHRoZSBk
aXNhYmxlX3VucHJlcGFyZSgpIGZhaWx1cmUsIGJ1dApkZWZpbml0ZWx5IG9ubHkgY2FsbGluZyBj
bGtfZGlzYWJsZSgpIHdhc24ndCBlbm91Z2guCgpUaGFua3MsCk5laWwKCj4gCj4gCj4gTGV0IG1l
IGtub3cgd2hhdCB5b3UgdGhpbmssCj4gTWFydGluCj4gCj4gCj4gWzBdIGh0dHBzOi8vZ2l0aHVi
LmNvbS94ZGFya2xpZ2h0L2xpbnV4L2Jsb2IvbWVzb24tbXgtaW50ZWdyYXRpb24tNi45LTIwMjQw
MzIzL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMjTDExNzctTDExNzkKPiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL3hkYXJrbGlnaHQvbGludXgvYmxvYi9tZXNvbi1teC1pbnRlZ3Jh
dGlvbi02LjktMjAyNDAzMjMvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyNMMTA3
Nwo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20veGRhcmtsaWdodC9saW51eC9ibG9iL21lc29uLW14
LWludGVncmF0aW9uLTYuOS0yMDI0MDMyMy9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNs
ay5jI0wxMDUzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
