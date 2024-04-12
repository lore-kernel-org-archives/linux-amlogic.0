Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B856EC04FF9
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgNO68OcpmjaMoMLFVDRR2FAHOX/BdCdyPVHL+Srkew=; b=hTbHp1/CPnJ7gi+XZLH0dsgmk5
	yPo29kJN+nSVGleNS1RXBlp9QRvLsyMsDe2SIqOEHMBLDYyzUS8W1IQyN90G+zkp8chM9WG5fllke
	4ShQkFR/n40mhVaRGdkDv4mfbFyEadxpk6OiVigZV3wAvzHcdIh5NhaEOo+qURXJnFEKkMdIBIrqo
	zQTmI/bbEN4ny7hYTfNDLrEOcOEya0ugJ98UYrRNULZzz86upm37dwTK7lpnm/MIEkLBLiF+Ca8Xy
	u8ga0wU9Fnjf9VlClrIa7NxuMNzj3svcwhJ48TQOAJw/lSD2LnN1JYNDjCOkV/OEY1NdZ8irh9nbq
	4qRuR7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGZ9-0000000HDIk-080a;
	Fri, 12 Apr 2024 13:03:39 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGZ0-0000000HDCv-2deQ
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:03:37 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2da01cb187cso13563901fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927007; x=1713531807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nm8LSvH+A0aysY1LVMvbC5kt2UeJVTw7St9EkLFip3k=;
        b=L87mZjK/g6YhLbUMzCqdyDXBPWM579RzmgiuwgpTlDql4JTcS+QT3TX+CQ98CsTA04
         8iK1HAFbCOAt2fah74wu+yitDe5xx/+MInz1toIgiel2gv7jlFJN+ceBQHdTNzeJxHa7
         zt0RYJQz9xu0qfc8qa7I0Xf38zyzDSRlgp+yoUJqnwgd7/iolmOUwjnw2Cl4IghLxGc/
         V8D7NfCj/eGoOLfX/dJOYjVJa5DzvQeBhx80dltICE6LbZnoE4GnhYDTTR9+TG39zHNI
         wXRHMIiboEvoTobUfWdxQ5iZElDl/nNzltSygmICHthvYapRJ+jfCgKDIDQsqFfIO9RQ
         w+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927007; x=1713531807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nm8LSvH+A0aysY1LVMvbC5kt2UeJVTw7St9EkLFip3k=;
        b=Ieo/FI5h7mWqS/mfo7G5v/rnSNpSym3TtsTW6oSugVORfROJ9DHf6YSCUoZVUqZVlZ
         VUpn+1QJPBoQm9yHKoH0NPFPL93AlevB37N2kOcJzz3nB+gxKD0Lfzugdq9RKzk/l2bm
         95dd/zqYSY4R0V+LaSK6K4Hy8jXJPNHM6krMBtkvTi1+zG3FgoO0zlEJBYT4IDqi/t1W
         ToE7Gz6MYzB7d5MtHFpHBhX2C6BLDQNCcxHyL0GZY+wKz4OV+5ox5H2nw3ZnXu1C/qWK
         ssre1hXyg9m/EO3hJN6lJXDfIXIBOrsaJ7C6iWjbJl7vB/x8oRAbrqUmiJYZG/t2VRZs
         Y9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgXFYD9ivIGMcupvNBe6H4k/psGUUFX7ykni4Yg99ATmx30IX9dezAtW5wGOrj/CEsAYzq+BLnb1MIHnh1aC+Xjnh4abYkfNoMOK++vmVuqBg=
X-Gm-Message-State: AOJu0Yx6CfwY08mKZaMroSH1my9tKSVsbTcA+iVdNoQiT9bazyNRy2Bl
	ouI5ZlPKIxEP1PLahcincZH/jamIpmbHX3NOxx1C7IrD3Blv8/itHyhPaVePogw=
X-Google-Smtp-Source: AGHT+IHK4CQtsJnkc980vV5S8swNBkt4lBLxARVMCpXsWDOLaK3XIHiJ4ubaGIkNoNRiom/1KZvtjQ==
X-Received: by 2002:a2e:a545:0:b0:2d8:58b6:c10d with SMTP id e5-20020a2ea545000000b002d858b6c10dmr2214877ljn.18.1712927006961;
        Fri, 12 Apr 2024 06:03:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:986c:54c:12ce:a121? ([2a01:e0a:982:cbb0:986c:54c:12ce:a121])
        by smtp.gmail.com with ESMTPSA id n9-20020a05651c000900b002d2697570fcsm502800lja.93.2024.04.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:03:26 -0700 (PDT)
Message-ID: <00b0e513-bb8a-4db7-aa8e-57632add4752@linaro.org>
Date: Fri, 12 Apr 2024 15:03:22 +0200
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
X-CRM114-CacheID: sfid-20240412_060330_870260_26D4EC99 
X-CRM114-Status: GOOD (  32.04  )
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

T24gMTAvMDQvMjAyNCAyMTozNCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBOZWls
LAo+IAo+IE9uIFdlZCwgQXByIDMsIDIwMjQgYXQgOTo0NuKAr0FNIE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gRGlzYWJsZSB0aGUgcHhfY2xr
IHdoZW4gc2V0dGluZyB0aGUgcmF0ZSB0byByZWNvdmVyIGEgZnVsbHkKPj4gY29uZmlndXJlZCBh
bmQgY29ycmVjdGx5IHJlc2V0IFZDTEsgY2xvY2sgdHJlZSBhZnRlciB0aGUgcmF0ZQo+PiBpcyBz
ZXQuCj4+Cj4+IEZpeGVzOiA3N2Q5ZTFlNmI4NDYgKCJkcm0vbWVzb246IGFkZCBzdXBwb3J0IGZv
ciBNSVBJLURTSSB0cmFuc2NlaXZlciIpCj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25n
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHdfbWlwaV9kc2kuYyB8IDcgKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl9kd19taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X21p
cGlfZHNpLmMKPj4gaW5kZXggYTZiYzFiZGIzZDBkLi5hMTBjZmYzY2ExZmUgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jCj4+IEBAIC05NSw2ICs5NSw3
IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcGh5X2luaXQodm9pZCAqcHJpdl9kYXRhKQo+PiAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+ICAgICAgICAgIH0KPj4KPj4gKyAgICAgICBj
bGtfZGlzYWJsZV91bnByZXBhcmUobWlwaV9kc2ktPnB4X2Nsayk7Cj4gbml0LXBpY2s6IGNsa19k
aXNhYmxlKG1pcGlfZHNpLT5weF9jbGspOyBzaG91bGQgYmUgZW5vdWdoIGhlcmUgYXMgbXkKPiB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgd2Ugb25seSBuZWVkIHRvIHt1bix9cHJlcGFyZSBhIGNsb2Nr
IG9uY2UuCj4gCj4+ICAgICAgICAgIHJldCA9IGNsa19zZXRfcmF0ZShtaXBpX2RzaS0+cHhfY2xr
LCBtaXBpX2RzaS0+bW9kZS0+Y2xvY2sgKiAxMDAwKTsKPj4KPj4gICAgICAgICAgaWYgKHJldCkg
ewo+PiBAQCAtMTAzLDYgKzEwNCwxMiBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3BoeV9pbml0
KHZvaWQgKnByaXZfZGF0YSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiAgICAg
ICAgICB9Cj4+Cj4+ICsgICAgICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKG1pcGlfZHNpLT5w
eF9jbGspOwo+PiArICAgICAgIGlmIChyZXQpIHsKPj4gKyAgICAgICAgICAgICAgIGRldl9lcnIo
bWlwaV9kc2ktPmRldiwgIkZhaWxlZCB0byBlbmFibGUgRFNJIFBpeGVsIGNsb2NrIChyZXQgJWQp
XG4iLCByZXQpOwo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiBJZiB3ZSBldmVyIGhp
dCB0aGlzIGVycm9yIGNhc2UgdGhlbiB0aGVyZSB3aWxsIGJlIGEgbG90IG9mIGFkZGl0aW9uYWwK
PiBlcnJvcnMgaW4gdGhlIGtlcm5lbCBsb2c6Cj4gLSBpbml0aWFsbHkgdGhlIGNsb2NrIGlzIHBy
ZXBhcmVkIGFuZCBlbmFibGVkIGluCj4gbWVzb25fZHdfbWlwaV9kc2lfcHJvYmUoKSBieSBjYWxs
aW5nIGRldm1fY2xrX2dldF9lbmFibGVkKCkKPiAtIHdlIHRoZW4gZGlzYWJsZSB0aGUgY2xvY2sg
YWJvdmUgKGdlbmVyYWxseSBkaXNhYmxpbmcgYSBjbG9jayBpcwo+IGV4cGVjdGVkIHRvIGFsd2F5
cyBzdWNjZWVkKQo+IC0gaWYgdGhlIGNsb2NrIGNhbiBOT1QgYmUgcmUtZW5hYmxlZCBoZXJlIHdl
IGp1c3QgbG9nIHRoZSBlcnJvcgo+IC0gaW4gY2FzZSBhIHVzZXIgdHJpZXMgdG8gcm1tb2QgdGhl
IGRyaXZlciAodG8gbW9kcHJvYmUgaXQgYWdhaW4pIHRvCj4gdHJ5IGFuZCByZWNvdmVyIGZyb20g
YW4gZXJyb3IgdGhlIGF1dG9tYXRpYyBkaXNhYmxpbmcgb2YgdGhlIHBpeF9jbGsKPiAoYmFzZWQg
b24gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3aGVyZSBpdCB3YXMgZW5hYmxlZCBpbml0aWFsbHkp
IHRoZXJlCj4gd2lsbCBiZSBhIHNwbGF0IGJlY2F1c2UgdGhlIGNsb2NrIGlzIGFscmVhZHkgZGlz
YWJsZWQgKGFuZCBlbmFibGVkCj4gY291bnQgaXMgemVybywgc28gaXQgY2Fubm90IGJlIGRpc2Fi
bGVkIGFueSBmdXJ0aGVyKQo+IAo+IEZvciB0aGUgMzItYml0IFNvQyB2aWRlbyBjbG9ja3MgSSBr
ZWVwIHRyYWNrIG9mIHRoZW0gYmVpbmcgZW5hYmxlZCBvcgo+IGRpc2FibGVkLCBzZWUgWzBdLCBb
MV0gYW5kIFsyXS4KPiBJbiBteSBjYXNlIHRoaXMgaXMgaW1wb3J0YW50IGJlY2F1c2Ugd2UgY2Fu
IHJ1biBpbnRvIGNhc2VzIHdoZXJlIHRoZQo+IFBMTCBkb2Vzbid0IGxvY2sgKEkgYW0gbm90IHN1
cmUgaG93IGxpa2VseSB0aGlzIGlzIGZvciB5b3VyIGNhc2UpLgo+IAo+IEl0ICpzZWVtcyogbGlr
ZSB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyIGFzCj4gZHdfbWlwaV9kc2lfcGh5X2lu
aXQoKSBjYW4gYmUgY2FsbGVkIHdoZW4gY2hhbmdpbmcgdGhlIGRpc3BsYXkKPiByZXNvbHV0aW9u
IChvciB3aGVuZXZlciBkcm1fYnJpZGdlX2Z1bmNzLmF0b21pY19wcmVfZW5hYmxlKSBpcyBjYWxs
ZWQuCj4gVG8gaWxsdXN0cmF0ZSB3aGF0IEkgaGF2ZSBpbiBtaW5kIEkgYXR0YWNoZWQgYSBkaWZm
IChpdCdzIGJhc2VkIG9uCj4gdGhpcyBwYXRjaCkgLSBpdCdzIGNvbXBpbGUgdGVzdGVkIG9ubHkg
YXMgSSBoYXZlIG5vIERTSSBoYXJkd2FyZS4KPiBJbiBjYXNlIGR3X21pcGlfZHNpX3BoeV9pbml0
KCkgaXMgY2FsbGVkIG9ubHkgb25jZSBwZXIgZGV2aWNlCj4gbGlmZWN5Y2xlIHRoaW5ncyBtYXkg
Z2V0IGVhc2llci4KCkluZGVlZCB5b3VyIHNjaGVtZSBsb29rcyBnb29kLCBJJ2xsIHRyeSBpdCBz
aW5jZSBpbmRlZWQgd2Ugb25seSBuZWVkCnRvIHByZXBhcmUgaXQgb25jZSBpbiB0aGUgbGlmZXRp
bWUgb2YgdGhlIGRyaXZlci4KCj4gCj4gUFM6IEknbSBzbyBoYXBweSB0aGF0IHdlIGRvbid0IG5l
ZWQgYW55IGNsb2NrIG5vdGlmaWVycyBmb3IgdGhpcyEKPiBTbzogZ29vZCB3b3JrIHdpdGggdGhl
IGNsb2NrIGRyaXZlciBiaXRzLgoKVGh4ICEKCj4gCj4gCj4gTGV0IG1lIGtub3cgd2hhdCB5b3Ug
dGhpbmssCj4gTWFydGluCj4gCj4gCj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS94ZGFya2xpZ2h0
L2xpbnV4L2Jsb2IvbWVzb24tbXgtaW50ZWdyYXRpb24tNi45LTIwMjQwMzIzL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMjTDExNzctTDExNzkKPiBbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL3hkYXJrbGlnaHQvbGludXgvYmxvYi9tZXNvbi1teC1pbnRlZ3JhdGlvbi02LjktMjAyNDAz
MjMvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyNMMTA3Nwo+IFsyXSBodHRwczov
L2dpdGh1Yi5jb20veGRhcmtsaWdodC9saW51eC9ibG9iL21lc29uLW14LWludGVncmF0aW9uLTYu
OS0yMDI0MDMyMy9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jI0wxMDUzCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
