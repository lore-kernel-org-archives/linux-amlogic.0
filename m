Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E7BC369A8
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMPotjIS50Elyqhr4QGEjGWylq8OUp7hYMUKikwohIU=; b=K5QUFZFuPw2LKDkYofnIumVs6G
	6+TZD26xTIFjUOPRP7X4bZpAyhA4mOz5MuIKJ50jOiGb1u0Bdp9NQsBHTwQq987fjy7LdisCLOQgv
	JDrx20LRWCIsIDukgM57x1vHZiK+Mwc6ums4EsA2tmFuX+Xp0NlLt14g1xOxa4frO+Sp88916kuDf
	XwXdXlUT7K+urHIyChqn2sUVsliJ1qFnuR2/ZtwYMN29nXDyghIkDOnisuMFx1DqWnl11oPorsdqP
	eK/GD0aS0b9bGmhfaggjw6J7lcyf/G3GydIkWGsaZXPHFfjuf8SUcg64GWV1dD66uLP9lP//hX02t
	Xlw566lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oO-0000000D1l1-0UZt;
	Fri, 11 Apr 2025 08:32:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39oL-0000000D1ja-37lp
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 08:32:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so18036845e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360347; x=1744965147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyJXtMKyLy/gns1v7npOhaJocsF372rKr0wtnaGZSjU=;
        b=BGAyKWgdBomsRjyi12bJggTsIs5cZ+TTsQU4cJabsqPIe4Xhq4ceApPzZSeitSoB+U
         +vjRXye2Sjg4EWYplHj8tDRlVfEJUyhoGFxxvB8ZtyZvv9Rpp9W6K/4M0UOa9kMcitOz
         pbBwTUgWd7OhbBeB9EgpbT6AsMtqXZz6CfezNX9aeC3rW4t9soYQQDdjQUjxFO37r5AV
         +Aas7XExSIXX8p4v/GnV7171i3FGzBzyhdYF5Mb0SUAzC+ISb+SMi9lJL4W7EnOZnJHc
         7naLOf6dJINstgtQg33cNda3RKc6lC0+8Q7Hm4MzGUV95w6t40cJUVb+nFdkPnsDXMPz
         gtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360347; x=1744965147;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pyJXtMKyLy/gns1v7npOhaJocsF372rKr0wtnaGZSjU=;
        b=WYfm8ucywtFpilpXRifdiwSIWnLA14Zn/kqV4nIrsPSyrEySX10yBl1WeZ4GkJja3j
         8vaxfEbXmNYm6m6aqwE8iSCl0B7lvh3dCDhIcumzK9IhOhnC0EuRmDyiFq4tIfVuy2Yz
         QGmU5uIY5zoNawaIEW9rVMv3bbJ+51br6tcdupkqQ2l6MAg93TN1gt+7wbemhKScfIzM
         qnsu4pOxhC/j9dHPIlSXwcScFa0O8qg6EIIEfqK+c9pbAANTCOk/yWU12j/ikVu/m7Rm
         kYwTnHEwwr8xbPK8KUjOAi5ujDIao35duIxEEl2bxr9CiKnzIzInj8zoysUsxUwtrFim
         nBhw==
X-Forwarded-Encrypted: i=1; AJvYcCXFFUhq+gYB90WxVWn7xS32MM0TBhT8VJN2St62pDlV9eDCYr/0wcNh2L2MAUy7nyq+6FFqHNHpx+bs1Bla@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZwLcs66bOq6A/etccWH5Rp5yv13HiWfX4ainEba3bW59kKa2
	g9SAm2hN1ZUOOQa3IWIyv6MP1v8mrTB7olEwHOfdF8kSChCLQlVmQx6SDjqwkOU=
X-Gm-Gg: ASbGncvYqmxl6elGRUC9uJb5i9P2zprAs+TD+ra/cNWpro19tYRHwcIBW64Kvq2oHVx
	9yXczql3Kj1IfGZF5ttJBBY31JZEOfPpVu4B/8tRVH3sj5BTSw4wbGVFJFCZzicteyInOIpf/mh
	WG6XpUGXKZ1Xiu439TCOaAqY/amu3HBawWRKGyJizjFJwu1ijL6FWjhIsbA54LKro6zU4MW/J/B
	L7NB5ODX9g+HHnr62bx6b/A3KAiaJ/Lu6wZ1NUlCdNC0GCfDeMTDu4Z/VME+NWWzkp40IpPEXYZ
	rEdtShy9oTzcgUzKE42sNn4K4vWrGuZlv4nxiex0ZM9Ai4ip5oFJFHCF3paP+Bk130lPxyZ7Cav
	n0zAivSRHGpE8Nrvb9g==
X-Google-Smtp-Source: AGHT+IFRP0ceYDboDUf7YhFap3N+kvOHTY96QqO4YWtRCrLo1IyOLrYHKFOroWBQKK4GWZyRGmFbMg==
X-Received: by 2002:a05:600c:1546:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43f3a9336e6mr13947315e9.1.1744360346497;
        Fri, 11 Apr 2025 01:32:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572b5bsm75951255e9.28.2025.04.11.01.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:32:26 -0700 (PDT)
Message-ID: <ab32c7bf-7788-4992-83a9-26963f520455@linaro.org>
Date: Fri, 11 Apr 2025 10:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/3] arm64: dts: amlogic: Add A4 Reset Controller
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
 <20250320-a4-a5-reset-v5-2-296f83bf733d@amlogic.com>
 <e01d48c6-287b-476a-b5ca-de670375561d@linaro.org>
 <8a0f383f-e100-4928-a040-91ec0aa9aa6f@amlogic.com>
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
In-Reply-To: <8a0f383f-e100-4928-a040-91ec0aa9aa6f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013229_789186_59CA7BDD 
X-CRM114-Status: UNSURE (   6.62  )
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

T24gMTEvMDQvMjAyNSAxMDoyMywgS2VsdmluIFpoYW5nIHdyb3RlOgo+IEhpIE5laWwsCj4gCj4g
VGhlcmXigJlzIGEgY29uZmxpY3QgaW4gYW1sb2dpYy1hNC1jb21tb24uZHRzaSBkdWUgdG8gcmVj
ZW50IG1lcmdlcy4KPiBTaG91bGQgSSByZWJhc2Ugb250byB0aGUgbGF0ZXN0IGNvZGUgYW5kIHNl
bmQgYSB2Nj8KClllcyBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiBodHRwczovL3dlYi5naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQvbG9nLz9o
PXY2LjE2L2FybTY0LWR0CgpUaGFua3MsCk5laWwKCj4gCj4gT24gMjAyNS8zLzI0IDE1OjA2LCBO
ZWlsIEFybXN0cm9uZyB3cm90ZToKPj4KPj4gT24gMjAvMDMvMjAyNSAxMDo0MiwgS2VsdmluIFpo
YW5nIHZpYSBCNCBSZWxheSB3cm90ZToKPj4+IEZyb206IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9u
Z0BhbWxvZ2ljLmNvbT4KPj4+CjxzbmlwPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
