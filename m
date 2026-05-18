Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B998CD4F49
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E7tPz5fDaYP7/dm87j6pK0zsrcJBLQO8VDI5otyoXk=; b=fHM9V+9m/ETzw788bMFUCl51xh
	8mRryDHfFJSfHjetT3IldgunlM6oYSSjg/du8DtPZLDPjghNn0awpihfYjAYGXACE352kRlEyq7r0
	MtqoNyjT3x5GVs3D6WXgOZ1HlFf3Gkv8iKdPxGpFylbiwAc7kHx6Iw2jiKQtA6KY0XmlfGiY1UmXf
	wFtDT7b4+XQ0N+MngmddjUZlK1q9ZL7kJbCj2FXEJkhyRMmVChDJxmHnF3sYL3ehG2UfkGEpuy7dN
	BPBgzxDgvQVt/dqIrDCd2TENOQKLz/F/xrYbK9NmgXcdpa/XsZ9qwl4/uRncNDFeVUVns+U1bUcY8
	5oHTtvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyn3-0000000Fx2D-3Oet;
	Mon, 18 May 2026 14:17:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyn1-0000000Fx1C-1K47
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 14:17:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45562c41ec7so1366068f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779113869; x=1779718669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap6+yPzKT0WeFxFH9OI4zXlnbIBpH1fA8AyGWnx8G38=;
        b=JJRtOvb4pbscoR9ZFDamQHaRMP2c1aIWqbWnGm8ULs4f7Fw1t7tQDyFFNitH9Y3ohT
         ojLRAsgZmiHIlTBzgE2vlirWR6POWiqlCf1O9U/TdL7+RmVg479EX8dl1lzojOD9zZj6
         aioojyQy0qF3aEwRPrMulq24/z4V/sPhhG7FS4dMqKQiEFiwqrzx6tL8URa0Ws4Jgva5
         tcIVLaYeTiswgJk2x2PiZWAv8fD6RJClsKMSPcTypdtsVg1Zyif/y/W1dVuhHP7ICYND
         3eJG036hnVGNnUJUSYz2MPRm4BVfx3pZiW8lCOU9n5CxjvxxnJMu3Ubz9Iyhsk/4IkNd
         cPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113869; x=1779718669;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap6+yPzKT0WeFxFH9OI4zXlnbIBpH1fA8AyGWnx8G38=;
        b=NjC43S21dvWiejzu5aGyz0GYldb43N0sSDGpGf6lUJ/Xb0BkCqcajayzm4Hq/xxenO
         6l5xBjsLbx5QoTebUXXrUIP50PQQlH2GyLDTXCSm7nEOaAMrpKVJQI59TLl5efm4DvhK
         Nh0q2u9M2YPyeZn+xIbd3Jje1GwEJPsC6VkwfmgPs+mxzczwV8d/HYCE00ey1AUfFArg
         dTcwPkACJX6yCD7Eb5l7dHmRN9ca2Nb4h3WXZlZxDFyN/0DTsUVGP/nJkAUoZ9bM8gZ3
         2YuxFusnCpwEALMw4vSJZYLLpEftVCofG2IMD7Hyx8aB2xcCmz4jvCsHJRwNP2HMTuuM
         Vp8Q==
X-Gm-Message-State: AOJu0Yy1MplZTMl4wDTKydrkOrddWbgQE89oxHM6Th5Dm+W01ENe//Fe
	O9c9A9XJO2HGShgp1+hHJ7meUtR5Pm9am9dAQcoSgj3obWzAERLtcLkUxDYZNLmYoTQ=
X-Gm-Gg: Acq92OFNVrREriNbzalxucA1NQSP8M/c3uqtTc1ibsGh95G4s5mm2Lg/w3lDqtA9q8Z
	lTdgtxTgsJ8lg8Ij3+//4qdI6yJ63l6R+OqQSZp1Uw31m1ulyjBe7Ut1Ncs5obClyxUmTIsORw+
	48vlSfRK2IaJavVPwm9D1HqbFNaTknoxiIeCQTNrc6NYJP+74yoxj3iSCKwywvvQKavbne7rdF3
	RZzW3AkwKhWdC9bAAchL+dhMaIWM5BbPHeNVx2sq3edWj3V9HWDSbtCw51zgR5bPKxbIG4th8Lc
	sPI7jjnL1vnwLhmijTr+6f7Qn5rVo1prbEspwLNTw4/sAnIK6aGdx3hBNNHsaQlxBEn1x80C+Tk
	VzCTQp7HI/0Eju6nnnru58zHFhoyA8Fs77pououSjWoua9lcAfEAtQOUOQSt680O6DYFwyiVKg3
	XYa1RFHFxoIF4OFoyRn6KdSCAZmyMxCXxBHQ9Hl9HCNHSgYO8s/fQ+WoYx+FfKwmthtLWZrZtkY
	HPT3Fs=
X-Received: by 2002:a05:600c:4e46:b0:48f:e230:8cab with SMTP id 5b1f17b1804b1-48fe6626cfbmr237786615e9.31.1779113869320;
        Mon, 18 May 2026 07:17:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1029:e3c5:362e:1250? ([2a01:e0a:106d:1080:1029:e3c5:362e:1250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm66435415e9.11.2026.05.18.07.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:17:48 -0700 (PDT)
Message-ID: <4df49ad2-797b-4971-a8a9-13fd438e7c6f@linaro.org>
Date: Mon, 18 May 2026 16:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/8] Add VIM4 MCU/FAN support
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
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
In-Reply-To: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_071751_528566_DDC4BAB8 
X-CRM114-Status: GOOD (  19.95  )
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

SGksCgpPbiA1LzE2LzI2IDE5OjE3LCBSb25hbGQgQ2xhdmVhdSB2aWEgQjQgUmVsYXkgd3JvdGU6
Cj4gVGhlIEtoYWRhcyBWSU00IGJvYXJkIGZlYXR1cmVzIGEgZGlmZmVyZW50IE1DVSB2YXJpYW50
IGNvbXBhcmVkIHRvCj4gcHJldmlvdXMgVklNIGJvYXJkcy4KPiBXaGlsZSBpdCBzaGFyZXMgdGhl
IHNhbWUgSTJDLWJhc2VkIGNvbW11bmljYXRpb24gbW9kZWwsCj4gaXQgZGlmZmVycyBpbiBzb21l
IHdheXM6Cj4gCj4gICAgLSBBIGRpc3RpbmN0IHJlZ2lzdGVyIG1hcCB3aXRoIGl0cyBvd24gdm9s
YXRpbGUvd3JpdGVhYmxlIHJlZ2lzdGVyIHNldAo+ICAgIC0gQSBmYW4gY29udHJvbCB3aXRoIDDi
gJMxMDAgbGV2ZWxzIGluc3RlYWQgb2YgdGhlIDDigJMzIGxldmVscyBwcmV2aW91c2x5Cj4gICAg
LSBBIGZhbiBwb3dlciBzdXBwbHkgZ2F0ZWQgdGhyb3VnaCBhIHJlZ3VsYXRvcgo+IAo+IFRoaXMg
c2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhpcyBuZXcgdmFyaWFudCBieToKPiAKPiAgICAxLiBS
ZWZhY3RvcmluZyB0aGUga2hhZGFzLW1jdSBNRkQgZHJpdmVyIHRvIHVzZSBwZXItdmFyaWFudCBk
YXRhCj4gICAgICAgc3RydWN0dXJlcyAocmVnbWFwIGNvbmZpZywgY2VsbHMsIGZhbiBwbGF0Zm9y
bSBkYXRhKSwKPiAgICAgICBhbmQgYWRkaW5nIHRoZSBraGFkYXMsdmltNC1tY3UgY29tcGF0aWJs
ZSBzdHJpbmcuCj4gCj4gICAgMi4gRXh0ZW5kaW5nIHRoZSBmYW4gdGhlcm1hbCBkcml2ZXIgdG8g
cmV0cmlldmUgdGhlIGZhbiByZWdpc3Rlcgo+ICAgICAgIGFuZCBtYXhpbXVtIGxldmVsIGZyb20g
cGxhdGZvcm1fZGF0YSwKPiAgICAgICBhbmQgdG8gb3B0aW9uYWxseSBtYW5hZ2UgYSBwb3dlciBy
ZWd1bGF0b3IgZm9yIHRoZSBmYW4gc3VwcGx5Lgo+IAo+ICAgIDMuIEFkZGluZyB0aGUgY29ycmVz
cG9uZGluZyBEVFMgbm9kZSBmb3IgdGhlIFZJTTQsIHdpcmluZyB0aGUgTUNVIHRvCj4gICAgICAg
dGhlIEkyQyBBT19BIGJ1cyBhbmQgZXhwb3NpbmcgaXQgYXMgYSB0aGVybWFsIGNvb2xpbmcgZGV2
aWNlLgoKSSB3aWxsIGRpcmVjdGx5IHBpY2sgcGF0Y2ggNiBub3csIGFuZCBwYXRjaCA3ICYgOCBs
YXRlciB3aGVuIHBhdGNoZXMgMSwyLDMsNCBhcmUgcGlja2VkCmJ5IHRoZSBpMmMgJiBtZmQgbWFp
bnRhaW5lcnMuCgpQYXRjaCA1IHNob3VsZCBub3QgYmUgYXBwbGllZCB3aXRob3V0IHBhdGggNC4K
Ck5laWwKCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1k
ZXZAYWxpZWwuZnI+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NjoKPiAtIFBBVENIIDQ6IEFkZHJlc3Mg
TGVlJ3MgcmV2aWV3IGNvbW1lbnRzOgo+ICAgIC0gVXNlIGFuIGVudW0gdG8gZGlzY3JpbWluYXRl
IGJldHdlZW4gTUNVIHR5cGVzIGluc3RlYWQgb2YgcGFzc2luZwo+ICAgICAgTUZEIGRhdGEgdGhy
b3VnaCB0aGUgRFQgbWF0Y2ggdGFibGUKPiAgICAtIEZpeCBlcnJvciBjb2RlIGZyb20gLUVJTlZB
TCB0byAtRU5PREVWIHdoZW4gbm8gTUNVIHR5cGUgaXMgbWF0Y2hlZAo+ICAgIC0gTWFrZSBraGFk
YXNfbWN1X2Zhbl9jZWxscyBhbmQga2hhZGFzX21jdV9jZWxscyBjb25zdAo+ICAgIC0gVXNlIGRl
dl9lcnJfcHJvYmUoKSBmb3IgcmVnbWFwIGluaXRpYWxpemF0aW9uIGVycm9yCj4gICAgLSBEb2N1
bWVudCBmYW4gc3BlZWQgbGV2ZWxzIGZvciBtYXhfbGV2ZWwKPiAtIExpbmsgdG8gdjU6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA0MjQtYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjUt
MC1hZmNmYTcxNTdiMjNAYWxpZWwuZnIKPiAKPiBDaGFuZ2VzIGluIHY1Ogo+IC0gUEFUQ0ggNTog
UmVwbGFjZSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoKSB3aXRoIGRldm1fcmVndWxhdG9y
X2dldCgpCj4gICAgICAgICAgICAgdG8gc2ltcGxpZnkgZXJyb3IgaGFuZGxpbmcgYW5kIHJlbW92
ZSBOVUxMIGNoZWNrcywgYWxzbwo+ICAgICAgICAgICAgIG9yZGVyaW5nIGFzIHJldmVyc2UgY2hy
aXN0bWFzIGFjY29yZGluZyB0byBOZWlsJ3MgZmVlZGJhY2suCj4gLSBMaW5rIHRvIHY0OiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNDIxLWFkZC1tY3UtZmFuLWtoYWRhcy12aW00LXY0
LTAtNDQ3MTE0YTI4ZjJkQGFsaWVsLmZyCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIFBBVENIIDE6
IGxpbWl0IGZhbi1zdXBwbHkgcHJvcGVydHkgYnkgY29tcGF0aWJsZSBhY2NvcmRpbmcgdG8gQ29u
b3IncyBmZWVkYmFjay4KPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNjA0MTctYWRkLW1jdS1mYW4ta2hhZGFzLXZpbTQtdjMtMC1hNmE3ZjU3MGIxMWJAYWxpZWwu
ZnIKPiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gUEFUQ0ggMTogYWRkaW5nIGNvbW1lbnQgb24gdmlt
NCBjb21wYXRpYmxlIHNheWluZyBpdCBpcyBub3QgZGlzY292ZXJhYmxlLAo+ICAgICAgICAgICAg
IHRoYW5rcyB0byBSb2IncyBhbmQgTmVpbCdzIGZlZWRiYWNrLgo+IC0gTGluayB0byB2MjogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQwMy1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12
Mi0wLTcwNTM2YjIyNDM5YUBhbGllbC5mcgo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBQQVRDSCA1
OiBBZGQgcmVndWxhdG9yX2Rpc2FibGUgb24gc3VzcGVuZCB0aGFua3MgdG8gTmVpbCdzIGZlZWRi
YWNrLgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDQwMi1h
ZGQtbWN1LWZhbi1raGFkYXMtdmltNC12MS0wLTJiMTJlYjRhYzdiMEBhbGllbC5mcgo+IAo+IC0t
LQo+IFJvbmFsZCBDbGF2ZWF1ICg4KToKPiAgICAgICAgZHQtYmluZGluZ3M6IG1mZDoga2hhZGFz
OiBBZGQgbmV3IGNvbXBhdGlibGUgZm9yIEtoYWRhcyBWSU00IE1DVQo+ICAgICAgICBkdC1iaW5k
aW5nczogaTJjOiBhbWxvZ2ljOiBBZGQgY29tcGF0aWJsZSBmb3IgVDcgU09DCj4gICAgICAgIG1m
ZDoga2hhZGFzLW1jdTogQWRkIHBlci12YXJpYW50IGNvbmZpZ3VyYXRpb24gaW5mcmFzdHJ1Y3R1
cmUgYW5kIFZJTTQgc3VwcG9ydAo+ICAgICAgICBtZmQ6IGtoYWRhcy1tY3U6IEFkZCBzdXBwb3J0
IGZvciBWSU00IE1DVSB2YXJpYW50Cj4gICAgICAgIHRoZXJtYWw6IGtoYWRhcy1tY3UtZmFuOiBB
ZGQgZmFuIGNvbmZpZyBmcm9tIHBsYXRmb3JtIGRhdGEgQWRkIHJlZ3VsYXRvciBzdXBwb3J0Cj4g
ICAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBBZGQgaTJjIHBpbmN0cmwgbm9kZQo+ICAg
ICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiB0NzogQWRkIGkyYyBjb250cm9sbGVyIG5vZGUKPiAg
ICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGtoYWRhcy12aW00OiBBZGQgaTJjIE1DVSBm
YW4gbm9kZQo+IAo+ICAgLi4uL2JpbmRpbmdzL2kyYy9hbWxvZ2ljLG1lc29uNi1pMmMueWFtbCAg
ICAgICAgICAgfCAgMTMgKystCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQva2hhZGFz
LG1jdS55YW1sICAgICAgICB8ICAxOCArKysrCj4gICAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10
Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzICB8ICAxMyArKysKPiAgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgICAgICAgIHwgIDIwICsrKysKPiAgIGRyaXZlcnMv
bWZkL2toYWRhcy1tY3UuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTE5ICsrKysrKysr
KysrKysrKysrKy0tLQo+ICAgZHJpdmVycy90aGVybWFsL2toYWRhc19tY3VfZmFuLmMgICAgICAg
ICAgICAgICAgICAgfCAgMzcgKysrKystLQo+ICAgaW5jbHVkZS9saW51eC9tZmQva2hhZGFzLW1j
dS5oICAgICAgICAgICAgICAgICAgICAgfCAgNDQgKysrKysrKy0KPiAgIDcgZmlsZXMgY2hhbmdl
ZCwgMjM2IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0
OiBmN2I2NGVkOTQ4NzE4MjkwMjA5MDc0YTUwYmIwZGYxN2U1OTQ0ODczCj4gY2hhbmdlLWlkOiAy
MDI2MDQwMi1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC1hYzFjYmU1NTNjOWIKPiBwcmVyZXF1aXNp
dGUtbWVzc2FnZS1pZDogPDIwMjYwMzI2MDkyNjQ1LjEwNTMyNjEtMS1qaWFuLmh1QGFtbG9naWMu
Y29tPgo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogZjAzYTA4NmI0MTM3MTU4NDEyYjJkNDdiM2Rl
NzkzYjg1OGRlOGRkZQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMTIzOTcwYzliMjljMjA5MDQ0
MGYyZmQ3MWM4NWQzYzZmZDhlMzZkZQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogM2UyZTU2YjA5
MjZiYTMyN2I1MjBmOTM1ZGY0Y2VkNTA4OWJiZTUwMwo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDog
NjVhNWQ3NmZmZGJjOWIzYWFiMzM4NWJiNjVjYjAyNzAwNGMzMGU3ZQo+IHByZXJlcXVpc2l0ZS1w
YXRjaC1pZDogMjM3MjY5ODAxODI2ZGQzYWQ3ZmIxNmViNGQ3ZDZkNGVhYjUwNDI3OAo+IHByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogNTdlOWIwOGE5NjhhZWRmNTQzZDNkMGQ1NmNmMWNhNGRiMjBiMmEx
Ngo+IHByZXJlcXVpc2l0ZS1jaGFuZ2UtaWQ6IDIwMjYwMzI2LWFkZC1iY200Mzc1Mi1jb21wYXRp
YmxlLWUyNjRhNGY3OTczYTp2Mgo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogY2Q5OGI3NGZhNTZh
ZjcyYWYyNTUzZjM5MWM0MDA5ODFkODNjZDRmNAo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYjcz
MGY1ZTQyYmUxZDg5ZDE5M2U2M2EwMjY1NDk1Y2RiZjJjN2Q3Ygo+IHByZXJlcXVpc2l0ZS1jaGFu
Z2UtaWQ6IDIwMjYwMzMwLWZpeC1pbnZhbGlkLXByb3BlcnR5LWJiZTU0ZDkzM2Y3MTp2Mgo+IHBy
ZXJlcXVpc2l0ZS1wYXRjaC1pZDogOGQ2NzVlN2EyMzk5ODVjNzYyODQzNTE1YjI0MWYwYTJmNDVm
OWM5Mgo+IHByZXJlcXVpc2l0ZS1jaGFuZ2UtaWQ6IDIwMjYwMzMxLWZpeC1hbWwtdDctbnVsbC1y
ZXNldC0yYjYwOGViZjlkYTQ6djEKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDViNWRlNzdhZjEx
NzQ3Y2U5NjQ0MDRmYjgyN2QyZWUyYmZmNDdlYTUKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDFl
MzdmYzc1ZmVkMWU1MzNhZGVlMGYzZTdlNmVhZDFmOGZmM2M1NWMKPiBwcmVyZXF1aXNpdGUtcGF0
Y2gtaWQ6IDY1YTVkNzZmZmRiYzliM2FhYjMzODViYjY1Y2IwMjcwMDRjMzBlN2UKPiBwcmVyZXF1
aXNpdGUtcGF0Y2gtaWQ6IDJkYWY1ODNmYjVlNzQ0OWEwMmJkMjE3ZDhhY2EzMzAxNzFiNTk4YWEK
PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDIzNzI2OTgwMTgyNmRkM2FkN2ZiMTZlYjRkN2Q2ZDRl
YWI1MDQyNzgKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGQxZGRmOWI3NzEwZTkxZjgwNjJkZTgz
YmQ3YmE1NWFmYjJjNGMxMTIKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDU3ZTliMDhhOTY4YWVk
ZjU0M2QzZDBkNTZjZjFjYTRkYjIwYjJhMTYKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGNkOThi
NzRmYTU2YWY3MmFmMjU1M2YzOTFjNDAwOTgxZDgzY2Q0ZjQKPiBwcmVyZXF1aXNpdGUtcGF0Y2gt
aWQ6IGI3MzBmNWU0MmJlMWQ4OWQxOTNlNjNhMDI2NTQ5NWNkYmYyYzdkN2IKPiBwcmVyZXF1aXNp
dGUtcGF0Y2gtaWQ6IDlkZWJkODhmYTYwZmViZWQ5Y2Q3MjA4Zjg2NjAzYjRjMmQyNzA1MjAKPiBw
cmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDMxNGVmOWZmMGM0ZDFkMTVkYWIxZGVhOWQ5MmFhMDY1ZjFl
YWMzZTkKPiAKPiBCZXN0IHJlZ2FyZHMsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
