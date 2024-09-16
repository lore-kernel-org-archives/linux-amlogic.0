Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D79C3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaW4it6Q1OnsMcU28xz3AJX/TgERlXPlIR9qgwMdL+I=; b=M5kjBmCmw7f+NOCW50LnzMg2W2
	3hr4hSb/vjDVlq/tSIcBHFnvVO8oIp2o80iD8SWnd84j1Czu+/W6Zg1gRiMruvNiLsYFBAm0PRopq
	58UvT89IlswSVQpXMS1ky22JQelFuY8EmOC79mZKTa0XOL6bGoPDSK1yhnIsrXo93pueO7w9z5lM4
	d04zbZK77qM4NPgGLr6gQKSJPQjdg4aGWkaLw33ZAW0nOm0+boqexcEBg7VeIhY7BDLo1rbGh45/a
	upFcHcPuvgzk7KmGJMD6LJALNpCrU+EvIEDfle9hDaeWawyCZueDQQAbr0Jq4q2HDvXYJvmlW6VUg
	thTiuXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq66K-00000003IzP-39B4;
	Mon, 16 Sep 2024 07:24:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq64R-00000003Ilg-0B9z
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 07:22:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-374b9761eecso3371151f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726471369; x=1727076169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQRRM/mH51EC/qZ7+uQmbqHjpVWrzmibnaBSD/Tfr84=;
        b=mT3CFeKLJNk06iS70nQ6UWlf6Sci+9q2N0BauEGFWI5jJivsr7L7a+O+asxL4w2YiM
         viRC5kuwZ9Ai6G57csLS+3LmByvQxEJxBtDcsa1eouIsGqC0fCthZpUHYvbz07o4Q+W8
         lszyGGdnHyBiCNfpfUC6fTKo5vxMvZEGplY/73NlecUUpCNxJwXHugs+4jd4EUG6tajE
         ig7qy6iKjGnZsMVGY2drt4EJGth/Re9cco/+hvkZ5glHCPTzNPF0tFNXbKmHxjXi30+z
         Ads76pqun7/vk4nzPM6Za1/jJVo27COgs+eH1YKPLCoE6G5A48IIArbZYTJ/Jry6jHrq
         FDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726471369; x=1727076169;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vQRRM/mH51EC/qZ7+uQmbqHjpVWrzmibnaBSD/Tfr84=;
        b=G3QB1DHcBy/CPuhS31/FFaAEuf0Co56Nqso8rwCTfRSEydKM+rVheoN2o+fdwmjU9S
         0ZJCd1NRwxFo033Y7ORcdPYK8c5BU4XytlU9tVkzH50vAxlDggTiyEO9tXGyG36J23Aj
         j8k+liQM9SqXLddwRH1H5zCT59PIdIzzTnyIoOn/K0hoDyzArw2zaZ0qrrg9ea4UHg5+
         L3zMgT2H3Mmc4xPghPv/EIsvIXmdbMxjXAcwB66jUDiS6w5T51BUpkUPuttfZF04JZcm
         v73K62q7TgBN5EpmJ1QPi3WT1Upad7V2hsEMbjnCHBp4f99ogNn0I5zc0YJ1TdFvuOwd
         x9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWcdrS38lpg+muBT9RmJKadNGO//FNZ+wTEH+ZeiN9C9ftLXXipLWTIs7kiyq9TIfC84hfMBcY+GWm7x+Lk@lists.infradead.org
X-Gm-Message-State: AOJu0YxbzV2R9JI0czgY7ZtuSckRSYZ9q6FAvFFVDG7Qug7VjA5W1Nwh
	ULoJWnDe9o5KlXsVnfb7Oi2kK/W1kfBnyBmEwGPHMz8admZVBYq0c6q3A5XtQIg=
X-Google-Smtp-Source: AGHT+IEPbS68cKrd4qLSDtChv/rpC7prenEEqKK0N+FUURrEuFk2T0MKq/3LkR9Zz2z3L+Iw8e/ScA==
X-Received: by 2002:a05:6000:1375:b0:371:8ec6:f2f0 with SMTP id ffacd0b85a97d-378c2cf3d2fmr8651954f8f.16.1726471369146;
        Mon, 16 Sep 2024 00:22:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c? ([2a01:e0a:982:cbb0:46e0:9b1e:8680:c41c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7805193sm6294169f8f.98.2024.09.16.00.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 00:22:48 -0700 (PDT)
Message-ID: <35989f73-5b35-4b02-91e1-146f66d78b66@linaro.org>
Date: Mon, 16 Sep 2024 09:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/7] ARM: dts: amlogic: fix /memory node name
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-6-feaabb45916b@linaro.org>
 <CAFBinCB8dhzNExOaO=VrDzTYLHHKUaxHZ49HzAYVnNZhAT_YFw@mail.gmail.com>
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
In-Reply-To: <CAFBinCB8dhzNExOaO=VrDzTYLHHKUaxHZ49HzAYVnNZhAT_YFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_002251_139735_EFAF3CC8 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

T24gMTUvMDkvMjAyNCAyMTowNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBOZWls
LAo+IAo+IE9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDEyOjE54oCvUE0gTmVpbCBBcm1zdHJvbmcK
PiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gWy4uLl0KPj4gLSAgICAgICBt
ZW1vcnkgewo+PiArICAgICAgIG1lbW9yeUAwIHsKPj4gICAgICAgICAgICAgICAgICBkZXZpY2Vf
dHlwZSA9ICJtZW1vcnkiOwo+PiAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDQwMDAwMDAwIDB4
ODAwMDAwMDA+Owo+IE9uIHRoZSAzMi1iaXQgU29DcyB3ZSBzcGVjaWZ5IG1lbW9yeSBhdCBhbiAw
eDQwMDAwMDAwIG9mZnNldC4KPiBTaG91bGRuJ3Qgd2UgdXNlIG1lbW9yeUA0MDAwMDAwMCBpbiB0
aGF0IGNhc2U/CgpZZXMgeW91J3JlIHJpZ2h0LCBJJ2xsIGZpeCBpdCBpbiB2MgoKTmVpbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
