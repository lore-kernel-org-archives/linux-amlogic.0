Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D565C369CB
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1U2krYvzoV5X2CU8EmZY9m5N1W+8bnGuzk1gQPMONM=; b=n2XRSC2PvHAvvh
	PpAmsbYVvG9dAA2KPrXQEf+1hRezm/RpGxbl6TuUSoGwRNjmDvWGLu1LazBQpY0blh7X+ji6z3dUX
	JNNWmbhFOPDHL47mntSSx09rs2oSlbx+++2sN9soc+Da301Jzy6A/2HvIHgstEpVsNBhMXF94YacI
	uMA+7Ny4A43duol00YCjQYZO83I6PEPGRZjV2rV8bFSH5lkc1P8/dWxcSUfb1M8VVfT1ShiSlqw54
	5uJMVxBzz5jbP/SDldGy9uRYWUxCB/lO+5NkCJ9zV2+hmAzteGfmEKNQNExt+0xQhiIAD5LoGLJsl
	/OW6+3RUVADbsMIpvLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u792k-00000006Jxg-0HzE;
	Tue, 22 Apr 2025 08:31:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77yi-000000066SR-26r3
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 07:23:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3913b539aabso2848656f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745306615; x=1745911415; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
        b=L0xw77IySOGzsVVkRyQLEhmMMmoSt71cmi17a/BJMCze2eCY0cSGszGBWLMuaove2u
         5Lk7yfwW1m+6H3U0tQXrSLVGpexuiZDqz/ikGuTU5CiSiNZdB15pOSm3r1h/rv/Ojrrq
         neX/Or+0qI7GEaNZoajwWzAYUKIpET6w6TvR0+2Eicn5jZbjeXgbW1Qs91cwmuPjU23Q
         /LHKVoZ+W6M+5Xkhc1S410nFWJu+1VB1kuYUneWUXkAhId49IJIGhSS7eGURge8/cua4
         noQo6ICFiECg+5GMyVXVMYnbqRwdRbQmqbcpjxAbXD6VGInX/ux1vKTx3GIWZZje489f
         0ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745306615; x=1745911415;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
        b=pCHP6oa69e/1ZODRdq1bc5bbIdpfltl+9ZrdonD782AEVTcFFuuAWNpPfdRYKsE79n
         zCXzcJlAlOKn57L7PnfzycAxeLgHd3KNcIO4lcHCDyG0D1Z5gmLMjQAnwX2lF23/K29A
         NFoqlTXRu/1SXFZABMfy2Oi/ndli5sgi+D2igdsF6Ddwd8YH6Sfyqt9jpyZDgAjCEeCG
         wYAbSjHVMQjU1lE1TRNY8uoQOGpwrPOsKgwhsYHO+nirc4/UebAWFWOjgW2R+w/gmTKE
         lokjUQj/J0DXdhjRlqTYHhqGsCpDa6rw73hvuv6KDIp1M+BeJ1r1IuemY0r54oWOh4+i
         eVXg==
X-Gm-Message-State: AOJu0YyDVszMi4S58gHVKigxvGdju8PJzEZCVO0Qk+6iWCRmwkcEeTXL
	oJkC+NcHLVXicUFYVuq9iIl0sc62G5SzZ6mi7LQnvpeOWnxHof9mkIxGTt6pB6o=
X-Gm-Gg: ASbGnctxnTpV1ON13diUljY1f6+2mNs/hBVnyyvP5HAvX39tBGUGxJKw0AktRiW5c8G
	1LmtEs58lm/JI2KASgyVKvGJpiEVwFzLlPUKjx7WffyOXs1iJs7VXaISJjZHOiSunpeSqgSLZYD
	aeLaxL0dWsgXeLnK+pyXFx08up9aeEqv3aORZ3dJZFcBPY9tXyChxxuiWoYC/5oakjLcLsQVe8a
	tKHoDHy9FWmyIX0Sr0+6RGqKxvwRVBV/r4gO0IlH8KFjF7yhNPGxAsjqL02AWfepQa/g231Z8cB
	BS4Hfjtn4ZLBmiDJmZIXHMnEMAF1ywF+qusfQ61fy/Pv0NU9ht4Q8zsPCG7Gvgw1wrFeTBuBHq3
	POCNSsg8areQiVIaGEA==
X-Google-Smtp-Source: AGHT+IGywozzMisXwYOT/E5KYtUsJDT/HnunTc8XE7Knara8DcfAQ+yJD6UJRsAe6X3X6bs1me8xhw==
X-Received: by 2002:a5d:5f4c:0:b0:39e:f89b:85d3 with SMTP id ffacd0b85a97d-39efb9538afmr11846283f8f.0.1745306615026;
        Tue, 22 Apr 2025 00:23:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm13981589f8f.48.2025.04.22.00.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:23:34 -0700 (PDT)
Message-ID: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
Date: Tue, 22 Apr 2025 09:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
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
In-Reply-To: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_002336_546356_556E9078 
X-CRM114-Status: GOOD (  17.91  )
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

T24gMjIvMDQvMjAyNSAwOTowNCwgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZyB3cm90ZToKPiBP
biAxOS8wNC8yMDI1IDIzOjMyLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+PiBIaSBNYXJ0
aWpuLCBIaSBOZWlsLAo+Pgo+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCA4OjQ24oCvUE0gPGxp
bnV4QG1hcnRpam52YW5kZXZlbnRlci5ubD4gd3JvdGU6Cj4+Pgo+Pj4gSGkgTWFydGluLAo+Pj4K
Pj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Pj4KPj4+IEkgZW5jb3VudGVyZWQgdGhpcyBp
c3N1ZSBzb21lIHRpbWUgYWdvIGFzIHdlbGwgYW5kIGhhZCBhIHBvc3NpYmxlIGZpeCBpbiBteSB0
cmVlIChzZWUKPj4+IGJlbG93KS4KPj4+IE15IGFwb2xvZ2llcyBmb3Igbm90IHVwc3RyZWFtaW5n
IGl0IGVhcmxpZXIuCj4+IE5vIHdvcnJpZXMsIHdlJ3JlIGFsbCBidXN5IHdpdGggYm90aCwgb2Zm
bGluZSBhbmQgb25saW5lIGxpZmUgOy0pCj4+Cj4+PiBXaGlsZSBteSBmaXggaXMgbm90IGFzIHN5
bW1ldHJpYyBhcyB5b3Vyc+KAlEkgbGlrZSBzeW1tZXRyeeKAlGl0IGlzIHNvbWV3aGF0IHNpbXBs
ZXIuIEl0Cj4+PiBkaWQgbWFrZSB0aGUgYXNzdW1wdGlvbiB0aGF0IG9ubHnCoCBjYWxsaW5nIGNv
bXBvbmVudF91bmJpbmRfYWxsKCkgd2FzIGF0IGZhdWx0IGFuZCB0aGUgdGhlIHJlc3Qgb2YgdGhl
Cj4+PiBjb2RlIHdhcyBjb3JyZWN0LiBUaGVyZWZvcmUsIGNhbGxpbmcgb25lIG9mIHRoZSBmb2xs
b3dpbmcgZnVuY3Rpb25zOgo+Pj4gbWVzb25fZW5jb2Rlcl9kc2lfcmVtb3ZlKCkKPj4+IG1lc29u
X2VuY29kZXJfaGRtaV9yZW1vdmUoKQo+Pj4gbWVzb25fZW5jb2Rlcl9jdmJzX3JlbW92ZSgpCj4+
PiBpbiBjYXNlIHRoZWlyIGNvdW50ZXJwYXJ0IHdhcyBub3QgY2FsbGVkLCBzaG91bGQgbm90IHJl
c3VsdCBpbiBhbnkgaXNzdWVzLgo+Pj4KPj4+IEkganVzdCB2ZXJpZmllZCwgYW5kLCBhcyBmYXIg
YXMgSSB1bmRlcnN0YW5kLCBhbGwgb2YgdGhlc2UgZnVuY3Rpb25zIGRvIGEgY2hlY2sgdG8gY29u
ZmlybQo+Pj4gd2hldGhlciB0aGUgZW5jb2RlciB3YXMgaW5pdGlhbGl6ZWQgYmVmb3JlIHByb2Nl
ZWRpbmcgd2l0aCBjbGVhbnVwLgo+PiBZZXAsIHRoYXQgc2VlbXMgdG8gYmUgdGhlIGNhc2Ugcmln
aHQgbm93Lgo+PiBOZWlsLCB3b3VsZCB5b3UgbGlrZSBNYXJ0aWpuJ3MgbW9yZSBzaW1wbGUgYXBw
cm9hY2ggd2l0aCBhIEZpeGVzIHRhZwo+PiBhbmQgYmFja3BvcnQgdGhhdD8KPj4gVGhlbiBJJ2Qg
c2VuZCBteSBwYXRjaCBhcyBhIHNtYWxsIGNsZWFudXAgd2hpY2ggZG9lc24ndCBoYXZlIHRvIGJl
Cj4+IGJhY2twb3J0ZWQuIE90aGVyd2lzZSBJJ2Qgc3BpbiBhIHYyIHdpdGggYSBmaXggZm9yIHRo
ZSBpc3N1ZSB0aGF0Cj4+IE1hcnRpam4gZm91bmQgKGFuZCBpbmNsdWRpbmcgQW5hbmQncyBSZXZp
ZXdlZC9UZXN0ZWQtYnkpPwo+IAo+IFBsZWFzZSBzZW5kIGEgZm9sbG93LXVwLCBJJ2xsIGFwcGx5
IHRoaXMgb25lIHRvZGF5Lgo+IAoKWWVhaCBmaW5hbGx5IHBsZWFzZSBzcGxpdCB0aGlzIGluIHR3
bzoKLSBwYXRjaCAxIHRoYXQgY2FuIGJlIGJhY2twb3J0ZWQKLSBwYXRjaCAyIHJlbWFpbmluZyBj
aGFuZ2VzCgpUaGFua3MsCk5laWwKCj4gVGhhbmtzLAo+IE5laWwKPiAKPj4KPj4gWy4uLl0KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4+Pj4gYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPj4+PiBpbmRleCA4MWQyZWUzN2U3NzMu
LjAzMTY4NmZkNDEwNCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHJ2LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKPj4+
PiBAQCAtMzE0LDM1ICszMTQsMzUgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmluZF9tYXN0ZXIo
c3RydWN0IGRldmljZQo+Pj4+ICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihkcm0tPmRldiwg
IkNvdWxkbid0IGJpbmQgYWxsCj4+Pj4gY29tcG9uZW50c1xuIik7Cj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogRG8gbm90IHRyeSB0byB1bmJpbmQg
Ki8KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoYXNf
Y29tcG9uZW50cyA9IGZhbHNlOwo+Pj4KPj4+IEFib3ZlIHR3byBsaW5lcyBhcmUgbm8gbG9uZ2Vy
IHVzZWQsIHNvIGNhbiBiZSByZW1vdmVkLgo+PiBXZWxsIHNwb3R0ZWQsIHRoYW5rIHlvdSEKPj4K
Pj4KPj4gQmVzdCByZWdhcmRzLAo+PiBNYXJ0aW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
