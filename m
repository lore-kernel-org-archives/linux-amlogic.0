Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A04CD342C
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83GdehNWYNc6rKyYoQ2G2POR5sEKuuXLKv8ofVTPvAk=; b=GlKEAaDELDU4uc3wEDxgfLA2SV
	MBIFE//sCwaWTXXinuIvMzohi99JHSZmoWfw7CoA3J7Z8cj9Jk6Fcuz6wPSb2TI328HLS6savdXZp
	M7tp2J3FJtqn1x4rc9lsiWckIpREyCTJr2oWjw234p1CZkOpCQZczPREOkh0Er1JrBfSOOsoWOHuQ
	ZJTMNvwwCM+j5nY3hMAzKGtdNbHx5Qr/kOJuQdzZCwZsNEuJ7Q5R1yED4S3Pu8TG5WZniu15I8srv
	/RmzTRuPE0M7vIy5lFEc5z06vddKOBhNQo9tbxYU1+2DsOKxQjMe15hZCvnaNExnnjkm+a6LsdPhK
	EFaJnhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeam-00000001Pys-2TyR;
	Wed, 06 May 2026 15:55:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeal-00000001Py0-0gff
	for linux-amlogic@lists.infradead.org;
	Wed, 06 May 2026 15:55:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so83090095e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2026 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778082917; x=1778687717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=;
        b=xrT1oOAjQGMXNLkhOZQ5VRhbh+8zifoycwkSWLwnro+8VWW58raFklg08ewcvqsXnz
         jRzdtGVy+i2r0CNmNf0Ug+bbUWSjAg6qyfPFwfREO35wfev3zw1LM+2rf/DnQrN9ZUvT
         8PWz8mwTKsNVzfLMVyBUflz7UgDVAMeZDjLHJpvlTyDM9wEXs+8jSbho6Vkol/Iq8pLY
         TT1ooCxqDwGgayqSYsx+V7TmN/6ZMLls4IO8fZndhNpjGytA3e0su+B8Iw58ndlw2uO9
         l5CiErbkRzwp+HYkk/islfuavRZHnuPXf40+poFnuQiy4HbYurvpRwFrL7sJB3aN6pqd
         SR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082917; x=1778687717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=;
        b=V+rQzxbX6WS+rKaRGZbWkn2GnlGJgnXRzFJ3avrIn3HIi/hKcc4I2XNZtmXVon0v/R
         n6CFpHnHGDsHI3eQ14JkcEzj1WlqqPWXvKNrpzm0ZDs+ZYwOMqte+ic8FnsKhmLwWvSU
         8VZTCpu2dcTJl/RhZbDDWRewg34DWGU8i7XWZd+Xpg+BeALJR3rqy8tx9a+sYmMp7cOJ
         fGsTZ+oiWcL5uCxawEvEjwwJawQ9fl+FkUyceieNzKTu027+zm82WmHnBlXt+U91iU7a
         oxv7N5zISt1tSVydPoaFATc4rk/b5M+lkMbhhlwtj+mCnqJZJJfv09iAwCCuDgR97Y5g
         XoaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/w2mO9G1mCdZ9b2IAtvcrLFn8v6VXI+knJyDptzGOesPd6On3UmpOO/VpIL2OAh1HQe4ulrj3qBEuHXspC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1fW7JGppkQvbSqy1Tyl4vdq1FI0WjYr/LUU/pSWk5VpsHVKBE
	CjRrajvWpBN61/x5DnyP9AID6pNvnFCGV8LqrZlDhMp7bWqsOI5RwH8Pr7wc1MhcG44=
X-Gm-Gg: AeBDietljmPYfxqo1Ltf4d6ZUFXNB2Cd930QmwZ/S1BwvTmaDqtasF+AvfThw7YV5aM
	HeH19/5ysbOtQjzJizzbHkM5mjpd3XJ+Diq8NMeXr1O+TFV7a8bnEStdIu5fzXOR7oNBTz+WvwG
	pbxKjGNt7IB/jBq+8iHmsnVI3lYv7O8C783hyXfSkIudosFrMGyN+f3Rguc/7qLK9sLU3bBFmtN
	8sxBgSDS3O9K3q8qwk+L5tC1sYJ1wBJ9pnTQnwUp/7rAICbmwgV2jG7isilwZ7nkTeSKPR/NAgt
	mR7DzvwxC9cqAc4zPuY8i2me3c5Na3cmCMjezmrJnFSnl9jPnedkC0otr6zsLcR6U9tYhybgpBc
	9BH93KDDLB1c/WEdi8zqzoARlVBj3qHAW61N7tV6LTXIourykgfjrkYLQd6daMfSCafRlJRp9ZF
	OTyWXFjGjiPcvpqxYN+bkzrG1NK7d4NQbJP946WU0mgjQZt9rtkPcvJXupJC/reH2NLR67ovoNc
	UwddukYDJgxquypbA==
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr71562705e9.14.1778082916975;
        Wed, 06 May 2026 08:55:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a547bsm62226385e9.5.2026.05.06.08.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:55:16 -0700 (PDT)
Message-ID: <27d7363e-b8bc-4e69-a9d2-abd7e12fe562@linaro.org>
Date: Wed, 6 May 2026 17:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
 <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
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
In-Reply-To: <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_085519_237812_F6BE85D8 
X-CRM114-Status: GOOD (  11.42  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gNS82LzI2IDE3OjQ1LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiA0LzI0LzI2IDE3OjQ1
LCBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gCj4gWyAuLi4gXQo+IAo+PiAr
c3RhdGljIGludCBhbWxvZ2ljX3RoZXJtYWxfcHJvYmVfc20oc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBhbWxvZ2ljX3RoZXJtYWwgKnBkYXRhKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7Cj4+ICvCoMKgwqAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBwaF9h
cmdzOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBvZl9wYXJzZV9w
aGFuZGxlX3dpdGhfZml4ZWRfYXJncyhwZGV2LT5kZXYub2Zfbm9kZSwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFtbG9naWMsc2VjdXJl
LW1vbml0b3IiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxLCAwLCAmcGhfYXJncyk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIXBoX2FyZ3MubnApIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHBhcnNlIHNlY3VyZSBt
b25pdG9yIHBoYW5kbGVcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7Cj4+
ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcGRhdGEtPnNtX2Z3ID0gbWVzb25fc21fZ2V0KHBo
X2FyZ3MubnApOwo+PiArwqDCoMKgIG9mX25vZGVfcHV0KHBoX2FyZ3MubnApOwo+PiArwqDCoMKg
IGlmICghcGRhdGEtPnNtX2Z3KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZh
aWxlZCB0byBnZXQgc2VjdXJlIG1vbml0b3IgZmlybXdhcmVcbiIpOwo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcGRh
dGEtPnRzZW5zb3JfaWQgPSBwaF9hcmdzLmFyZ3NbMF07Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4g
bWVzb25fc21fZ2V0X3RoZXJtYWxfY2FsaWIocGRhdGEtPnNtX2Z3LAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZwZGF0YS0+dHJpbV9pbmZvLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBkYXRhLT50c2Vuc29yX2lk
KTsKPiAKPiBUaGlzIGRyaXZlciBoYXMgYSBkZXBlbmRlbmN5IG9uIHBhdGNoIDIgYW5kIDMuIFNo
YWxsIHRob3NlIGJlaW5nIG1lcmdlZCB0aHJvdWdoIHRoZSB0aGVybWFsIHRyZWUgPwoKSXQncyBm
aW5lIGZvciBtZS4KCk5laWwKCj4gCj4gCj4+ICt9Cj4gCj4gCj4gWyAuLi4gXQo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
