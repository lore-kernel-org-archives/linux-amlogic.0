Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1675BFE51F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsiST9edX9ek/98JIXnDZvcyD9bpF/30sImfdZwMm64=; b=LPaJAQ0PXzHxFhKVANeejUptQj
	seGwqYNJvG3YgvsbZR74cuKViUPHD1DeX7INhO15B+vIXzy1LBuG+P8ZaN9uX9oOKdqU9yZiw7DyI
	5CifKg8RSWNK2673A2rjrvHMC5T1+pH+ZDQhSo90uxzAxVd9dwmaNrb4Udz5CkQHwofU1ta6DPWNV
	MO91jge8Y1sWGXsOvYU8w0mnfzCSn0pn2GmRS5dhOP4KYpU2yRgshxFnkMjfvuE76eeWQJzF+DBIh
	CsBdG/U4M1ytqW1CQbcdTiTOqsJEnxE8O29uDcyTgsXtiOTTLmZm8aqZit2h0Gv+bQ/IH9xPPI0AP
	7scpdPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDEG-0000000Cy4z-0zuu;
	Fri, 24 Apr 2026 09:53:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDEC-0000000Cy2s-3oyZ
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:53:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891f625344so62782915e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024419; x=1777629219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=;
        b=cvwazGgXX7iawnyYHLgwAcJXud7mByx6H7dOU566rL9zhKek18gKrMk2B1/1pNuQIV
         IoCIKNK00en1sQ3z+qWUoe+4RIpsWe+ywWHbzJW0QkqwNCTPt1PKRkGBUXSMeX6JBt1l
         vqY6rvyVXrekZFWuteYhOYLyoGCOq454ogHKYn6JY4qJtFcqA3SDs6cL258nu18WXx2J
         HbXXydiv0j6WZfUDaukyUxlsr5AHuJsk6eQpvDG2A5ElggI527sjQdf8UNuEdMpihyH3
         Z5UVuF7VVRVvYchcGuNHHJGVdkS4uk71hGs90U70RjWiWhW5KPcvFvj27xdeIgaf9US4
         2+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024419; x=1777629219;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEAIB1gXAkAlj/KMWcgqb/qT0IRmtE0X48MG1aGhroA=;
        b=Oh5zUyD5jyhEj4iHaYriOtZ90iDG3zjg7c5a5xQd1WIt//9tVaH/n0g2xQ7K62b3EI
         IXcvAQXIYKNVd8uMu37J5mpyCZARDy7iPUXAWA8/xpvg9I81YHRzPcX0O5mZ0a71IgkH
         EkYpE4DkDuzeltzDHLFQMbetbjKYphTdD51PE9HXTGnPaqGZh2Hd/fMxM9yQRtPS1r1N
         UyJJ8goFm82R8jb1qR6z8EhGGX7pgK4pcYwyEfieeGCVJA6unGysRMQjsCjb5x/qqT+Y
         pS8BgWHGtTZ1ea4JKOUJBrYBjqi9P8RnCbhpqIYGNhWkrotUIxT38r42qauvRywYoRQh
         3RRw==
X-Forwarded-Encrypted: i=1; AFNElJ+OeGlZVs8+9NEsxk+3SYNwHhVZ+Atv4EF90UfZGiQas0pb4ZALfhD/JggZLrPfqT3CAueVHxcpUZ5NQi3j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1EB6IIiGjLWX7vTSQgaxOVGOOcH3rRwV3yDtKJN6Ki+vkD52y
	KijBCRllK2cua45VtFFYuXpoHFfx68Mk4+MBtdecuSI73LNRciuwz4Fq2LZOSpIl650=
X-Gm-Gg: AeBDieva4H37s0S9TW7fr4uwd1X2JT7yyq8SeJ9Tuu8kF36JmIXuCcbOc/kJsvFF5eb
	nqiWHNjYKm5yxNknjE5gP2IIUIA0R6tRfpwZ5Te5h/XT+enIICKQBy+5Jb9a8mA4JXenwyXjPY1
	CrHpd6/ijmGfRmbBzzAwY/OWgHzHxjhb72dsL/PI2JlHsNI3s7aB9WUrdhYjHS4pclFNZtE36JO
	na/BlwVa5nkWpwHHTqMqpnIcHlQkkt1I0hMGey7H5oPrp1fQWspr8CT4ujoNgQfp35KbNqaeueZ
	w+rKWRzqqXv37esT5TIEDcfjcdYAH4LFMqR33peanm8ZAPawAEJ0A2L2tsRcixZlHIA5+NBb4w8
	zf4YFrazWIux6VB2MriQUAIWlspI98AUCapV2s2S52GOFNjlhmB6JMFcHOQD2PMGJrinM35zR2G
	y0kGkOdgq+bowWmx8JNNIAJ0ryRh/DGX0/pc4Bntat6XJNeu6E7rnFhTkEkK/rlWV5X2rg44FFp
	g/xYLO/yC8tkmp/DA==
X-Received: by 2002:a05:600c:3055:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-489032bae49mr216070105e9.6.1777024419012;
        Fri, 24 Apr 2026 02:53:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm364827355e9.9.2026.04.24.02.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:53:38 -0700 (PDT)
Message-ID: <c26122b2-b5c7-4a5f-8d42-c691ff992937@linaro.org>
Date: Fri, 24 Apr 2026 11:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
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
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-8-d4c1528d5044@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025340_973842_272D76F0 
X-CRM114-Status: GOOD (  12.06  )
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

T24gNC8yMy8yNiAxODowNywgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+IEZy
b206IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+IAo+IEFkZCBh
biBhY3RpdmUgdHJpcCBhdCA1MMKwQyB0byBhbGwgc2l4IHRoZXJtYWwgem9uZXMgYW5kIG1hcCBp
dCB0byB0aGUKPiBraGFkYXNfbWN1IGZhbiBjb250cm9sbGVyLCB1c2luZyBjb29saW5nIHN0YXRl
cyAzMCB0byAxMDAuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+Cj4gLS0tCj4gICAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1h
MzExZDIta2hhZGFzLXZpbTQuZHRzICB8IDEwMiArKysrKysrKysrKysrKysrKysrKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00
LmR0cwo+IGluZGV4IDVkN2Y1MzkwZjNhNjYuLmJhOTIxOTA3M2RkMGEgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00
LmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFk
Mi1raGFkYXMtdmltNC5kdHMKPiBAQCAtMTU3LDYgKzE1Nyw3NCBAQCB3aWZpMzJrOiB3aWZpMzJr
IHsKPiAgIAl9Owo+ICAgfTsKPiAgIAo+ICsmYTUzX3RoZXJtYWwgewo+ICsJdHJpcHMgewo+ICsJ
CWE1M19hY3RpdmU6IGE1My1hY3RpdmUgewo+ICsJCQl0ZW1wZXJhdHVyZSA9IDw1MDAwMD47IC8q
IG1pbGxpY2Vsc2l1cyAqLwo+ICsJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNp
dXMgKi8KPiArCQkJdHlwZSA9ICJhY3RpdmUiOwo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCWNvb2xp
bmctbWFwcyB7Cj4gKwkJbWFwIHsKPiArCQkJdHJpcCA9IDwmYTUzX2FjdGl2ZT47Cj4gKwkJCWNv
b2xpbmctZGV2aWNlID0gPCZraGFkYXNfbWN1IDMwIDEwMD47Cj4gKwkJfTsKPiArCX07Cj4gK307
Cj4gKwo+ICsmYTczX3RoZXJtYWwgewo+ICsJdHJpcHMgewo+ICsJCWE3M19hY3RpdmU6IGE3My1h
Y3RpdmUgewo+ICsJCQl0ZW1wZXJhdHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+
ICsJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KPiArCQkJdHlwZSA9
ICJhY3RpdmUiOwo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCWNvb2xpbmctbWFwcyB7Cj4gKwkJbWFw
IHsKPiArCQkJdHJpcCA9IDwmYTczX2FjdGl2ZT47Cj4gKwkJCWNvb2xpbmctZGV2aWNlID0gPCZr
aGFkYXNfbWN1IDMwIDEwMD47Cj4gKwkJfTsKPiArCX07Cj4gK307Cj4gKwo+ICsmZ3B1X3RoZXJt
YWwgewo+ICsJdHJpcHMgewo+ICsJCWdwdV9hY3RpdmU6IGdwdS1hY3RpdmUgewo+ICsJCQl0ZW1w
ZXJhdHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+ICsJCQloeXN0ZXJlc2lzID0g
PDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KPiArCQkJdHlwZSA9ICJhY3RpdmUiOwo+ICsJCX07
Cj4gKwl9Owo+ICsKPiArCWNvb2xpbmctbWFwcyB7Cj4gKwkJbWFwIHsKPiArCQkJdHJpcCA9IDwm
Z3B1X2FjdGl2ZT47Cj4gKwkJCWNvb2xpbmctZGV2aWNlID0gPCZraGFkYXNfbWN1IDMwIDEwMD47
Cj4gKwkJfTsKPiArCX07Cj4gK307Cj4gKwo+ICsmaGV2Y190aGVybWFsIHsKPiArCXRyaXBzIHsK
PiArCQloZXZjX2FjdGl2ZTogaGV2Yy1hY3RpdmUgewo+ICsJCQl0ZW1wZXJhdHVyZSA9IDw1MDAw
MD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+ICsJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxs
aWNlbHNpdXMgKi8KPiArCQkJdHlwZSA9ICJhY3RpdmUiOwo+ICsJCX07Cj4gKwl9Owo+ICsKPiAr
CWNvb2xpbmctbWFwcyB7Cj4gKwkJbWFwIHsKPiArCQkJdHJpcCA9IDwmaGV2Y19hY3RpdmU+Owo+
ICsJCQljb29saW5nLWRldmljZSA9IDwma2hhZGFzX21jdSAzMCAxMDA+Owo+ICsJCX07Cj4gKwl9
Owo+ICt9Owo+ICsKPiAgICZpMmNfbV9hb19hIHsKPiAgIAlzdGF0dXMgPSAib2theSI7Cj4gICAJ
cGluY3RybC0wID0gPCZpMmMwX2FvX2RfcGlucz47Cj4gQEAgLTE3MCw2ICsyMzgsMjMgQEAga2hh
ZGFzX21jdTogc3lzdGVtLWNvbnRyb2xsZXJAMTggewo+ICAgCX07Cj4gICB9Owo+ICAgCj4gKyZu
bmFfdGhlcm1hbCB7Cj4gKwl0cmlwcyB7Cj4gKwkJbm5hX2FjdGl2ZTogbm5hLWFjdGl2ZSB7Cj4g
KwkJCXRlbXBlcmF0dXJlID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCj4gKwkJCWh5c3Rl
cmVzaXMgPSA8MjAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+ICsJCQl0eXBlID0gImFjdGl2ZSI7
Cj4gKwkJfTsKPiArCX07Cj4gKwo+ICsJY29vbGluZy1tYXBzIHsKPiArCQltYXAgewo+ICsJCQl0
cmlwID0gPCZubmFfYWN0aXZlPjsKPiArCQkJY29vbGluZy1kZXZpY2UgPSA8JmtoYWRhc19tY3Ug
MzAgMTAwPjsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiArCj4gICAmcHdtX2FiIHsKPiAgIAlzdGF0
dXMgPSAib2theSI7Cj4gICAJcGluY3RybC0wID0gPCZwd21fYV9waW5zPjsKPiBAQCAtMjY2LDMg
KzM1MSwyMCBAQCAmdWFydF9hIHsKPiAgIAljbG9ja3MgPSA8Jnh0YWw+LCA8Jnh0YWw+LCA8Jnh0
YWw+Owo+ICAgCWNsb2NrLW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKPiAgIH07Cj4g
Kwo+ICsmdnB1X3RoZXJtYWwgewo+ICsJdHJpcHMgewo+ICsJCXZwdV9hY3RpdmU6IHZwdS1hY3Rp
dmUgewo+ICsJCQl0ZW1wZXJhdHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+ICsJ
CQloeXN0ZXJlc2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KPiArCQkJdHlwZSA9ICJh
Y3RpdmUiOwo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCWNvb2xpbmctbWFwcyB7Cj4gKwkJbWFwIHsK
PiArCQkJdHJpcCA9IDwmdnB1X2FjdGl2ZT47Cj4gKwkJCWNvb2xpbmctZGV2aWNlID0gPCZraGFk
YXNfbWN1IDMwIDEwMD47Cj4gKwkJfTsKPiArCX07Cj4gK307Cj4gCgpSZXZpZXdlZC1ieTogTmVp
bCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CgpUaGFua3MsCk5laWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
