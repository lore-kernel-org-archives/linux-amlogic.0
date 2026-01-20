Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26138D2ECF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jan 2026 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FF9hQlLyRiE6X2EPEn4g0UHUjMEtsLDNPcXMFWNqfI=; b=URKzht3LHNpajGhSI+oVOwz/rP
	fTky/yx/O206qptJlXp5/I/NsqTVfbth4So+Lucg+xbOkZk/Yr2j9dkcdUnsPwEj9JoE71bc1G/Tv
	8j5DPOgcHI2Vjn9wxNZ1d7VFq3UhQuu6rbEblJa+8u11jeU65qjP64OLKa00bVP1U4rF1G/03FAva
	9MaF1CzA0/3S+sRcNUQAfgjK4xLmdLpqesBgrFs9Fkv8ukq0fGEAYgGoHD1/aG8waKppMhQBnq4Fx
	e+p/FnIoieNbkU2FdYQY1Skjx9DsiISWGPVxzR6EcloGC3o1gGE4LEajvdcyYVpIv50W9FP6lEgl/
	nn1XyBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi750-00000003ShS-1Gak;
	Tue, 20 Jan 2026 08:27:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi74y-00000003Sgj-2a1g
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jan 2026 08:27:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so21360365e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jan 2026 00:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768897629; x=1769502429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhpKp4EOdc/uAxidXP5+DjIvtbDmc1Iqu+qiPd4ztK8=;
        b=xHu3u4ifSn8TklvE7CvkrPMxVzmUzNa9IK/bEMJKKC+6VL8q4LiSkNz2VGe1UHGT71
         5ywwjzHUOqtXox3zsBiMX2eIsNbakelgV/c0Upog7qVaJBvEiuzNuehEYDJw85KR08MJ
         SOmHuJdGUkEMOT3VvIF1weVutgJ5CJYIRLSStPRmhw832rnniShUwMjBl/sYfUzbIqyL
         5+IOim7Lyjnf/2NGOH0enXgsBjQP9Pz/x7Z7V7cXjsVQtsYf3Zztbqo+9PzGAreGHSw2
         v2hftEp50pBn+KqwQ4p7DPfKU4ktJ6SGiY/Ul4zyfKbwFO0RSj1HD/EzkMQvoIS3L3Jf
         P+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768897629; x=1769502429;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhpKp4EOdc/uAxidXP5+DjIvtbDmc1Iqu+qiPd4ztK8=;
        b=IkvpeYymlxiVrfuFPoO7Muc7j8RutrSYvkXgvOYFcSVYtFz1+Sp5Ff4CwmSBlPw5Sk
         JvycL0zWB6cq5TYDSWaR5TLxbxXVZlrQqQ2qyB/VPGiTd6uY23GkG0hXdDUQSFxlIR1L
         zzVPoTfwWXNLFosxARiUE1++uNHu+0WvE95AikJ9wQWJhN6rBxhdPw46QxkScZe8dZTm
         DEyABb9aAINbhVJMcwArwYwpYyWlPTFChQCZ/PRXhyHcEqottffQG8/gFmF59aQe/jz+
         D30rfc1PJa8eGbpQwVfB3NTZAwNbkE1Z+qcEJCpDMshlm5rGwS0OaNq8gDD9wsejkA7J
         1b4g==
X-Forwarded-Encrypted: i=1; AJvYcCUaeH40fKR/PQTHJag+rHx31zehcNmAetP1eZFzCcINh1eoRgaicyaG896G7KYj9qreYLRxlK0pozn87odX@lists.infradead.org
X-Gm-Message-State: AOJu0YyS3uhfjAOhgwa2LgMUj8BZj/y8tWY/jS0FJcZXBFuvf43oV009
	viM89sovFb6fEzrhJB43vVJ8PpyUfLzsVcSfdwBLS8biYRVIdklkIFQ9x5iBhU5o408=
X-Gm-Gg: AY/fxX6lEuJrMrx0pvS37rmZ4Yf/W2EqkJLgX+zoFXJQTe0A2hRj2Z+biKlkp/LNGRv
	zbB3d9ImHl+q2rjjCzdoKiFsHvkdzxmqGQ7i//k3QVDq0yzBlLVOS+TzybI0A0G3aeF2QZdIMQ1
	dPuXjo35qMIZVwlGWItS6lRh96upJ66R4KLP0UU2po8lXoCZDtVKeCRczrgzmNgSwPtVRMzE9Uu
	B81rgW5Y2qbR/4FG3eX9sBxfRerCDz7R8G4KAOpguLGWaq/RrSWfny6g/0gAQhTNkX3YhrwhoZg
	ASnNBcuCZwu9RKaZcypTLbFDmuBM4WjYtzqMGCEXk7MRsTcRQRq84Hk/mI0FNhzCIb07+DTzzpg
	huvPdkISi4weL71lIIooBeHh6WNtWmI9QdPGzyRLf6U9oMryWTbSAk4FkE+NsZZ33nHT7NsdRHn
	XLEapuaHhaGmXKd68JuHgA1Bzu1uAafnZvYAHlDOARu5T/rVHFah5HnD3v0XEQ3mc=
X-Received: by 2002:a05:600c:4748:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4801eb10a4amr178650505e9.27.1768897628697;
        Tue, 20 Jan 2026 00:27:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0d5:3a84:e303:190e? ([2a01:e0a:3d9:2080:f0d5:3a84:e303:190e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e80c477sm274167845e9.0.2026.01.20.00.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:27:08 -0800 (PST)
Message-ID: <3bf9ab54-6d9d-4d17-bd43-9f6ad10c48bb@linaro.org>
Date: Tue, 20 Jan 2026 09:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYxXSBhcm02NDogZHRzOiBhbWxvZ2lj?=
 =?UTF-8?Q?=3A_meson-s4-s905y4-khadas-vim1s=3A_enable_SDIO_interface?=
To: Nick Xie <nick@khadas.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "khilman@baylibre.com" <khilman@baylibre.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "xieqinick@gmail.com" <xieqinick@gmail.com>
References: <20260116023900.2036657-1-nick@khadas.com>
 <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
 <PS1PPF62EEA9B1D468A8845F947D26A387BAE89A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
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
In-Reply-To: <PS1PPF62EEA9B1D468A8845F947D26A387BAE89A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_002712_703456_56B1749C 
X-CRM114-Status: GOOD (  15.63  )
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

T24gMS8yMC8yNiAwMjozNCwgTmljayBYaWUgd3JvdGU6Cj4gWy4uLl0KPj4+ICsmc2RpbyB7Cj4+
PiArwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+ICvCoMKgwqDCoMKgwqAgcGluY3Ry
bC0wID0gPCZzZGlvX3BpbnM+Owo+Pj4gK8KgwqDCoMKgwqDCoCBwaW5jdHJsLTEgPSA8JnNkaW9f
Y2xrX2dhdGVfcGlucz47Cj4+PiArwqDCoMKgwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCIsICJjbGstZ2F0ZSI7Cj4+PiArwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
Pj4gK8KgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4+ICvCoMKgwqDCoMKgwqAgYnVz
LXdpZHRoID0gPDQ+Owo+Pj4gK8KgwqDCoMKgwqDCoCBjYXAtc2QtaGlnaHNwZWVkOwo+Pj4gK8Kg
wqDCoMKgwqDCoCBzZC11aHMtc2RyNTA7Cj4+PiArwqDCoMKgwqDCoMKgIHNkLXVocy1zZHIxMDQ7
Cj4+PiArwqDCoMKgwqDCoMKgIG1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Owo+Pj4gK8KgwqDC
oMKgwqDCoCBub24tcmVtb3ZhYmxlOwo+Pj4gK8KgwqDCoMKgwqDCoCBkaXNhYmxlLXdwOwo+Pj4g
Kwo+Pj4gK8KgwqDCoMKgwqDCoCBhbWxvZ2ljLGRyYW0tYWNjZXNzLXF1aXJrOwo+PiBIYXZlIHlv
dSB0cmllZCB3aXRob3V0IHRoaXMgcHJvcGVydHk/IFRvIG15IGtub3dsZWRnZSBvbmx5IGVhcmx5
IEcxMkEKPj4gYW5kIEcxMkIgU29DcyByZXF1aXJlZCB0aGlzLgo+PiBUaGUgbW9kZSBlbmFibGVk
IGJ5IHRoaXMgcHJvcGVydHkgbGltaXRzIHRoZSBTRElPIHRocm91Z2hwdXQuIFNvIGl0Cj4+IHNo
b3VsZCBvbmx5IGJlIHVzZWQgaWYgdGhlIHNpbGljb24gcmVxdWlyZXMgdGhpcy4KPiAKPiBXaXRo
b3V0IHRoaXMgcHJvcGVydHkgaXQgd2lsbCBnZXQgYW4gd2FybmluZzoKPiAKPiBtZXNvbi1neC1t
bWMgZmUwODgwMDAubW1jOiB1bmFsaWduZWQgc2cgbGVuIDk2IGJsa3NpemUgNTEyLCBkaXNhYmxp
bmcgZGVzY3JpcHRvciBETUEgZm9yIHRyYW5zZmVyCj4gCj4+PiArwqDCoMKgwqDCoMKgIG5vLXNk
Owo+Pj4gK8KgwqDCoMKgwqDCoCBuby1tbWM7Cj4+PiArwqDCoMKgwqDCoMKgIG1tYy1wd3JzZXEg
PSA8JnNkaW9fcHdyc2VxPgo+Pj4gK8KgwqDCoMKgwqDCoCB2bW1jLXN1cHBseSA9IDwmdmRkYW9f
M3YzPjsKPj4+ICvCoMKgwqDCoMKgwqAgdnFtbWMtc3VwcGx5ID0gPCZ2ZGRpb19hbzF2OD47Cj4+
IEknbSBtaXNzaW5nOgo+PiAgwqAgY2xvY2tzID0gPCZzZGlvXzMyaz47Cj4+ICDCoCBjbG9jay1u
YW1lcyA9ICJscG8iOwo+IAo+IE1heWJlIGl0IGlzIG5vdCBuZWVkZWQ/IFRoaXMgY2xvY2sgcHJv
cGVydHkgbG9va3MgZm9yIHRoZSBibHVldG9vdGggbm90IGZvciB0aGUgV2ktRmkgPwo+IAo+Pj4g
K8KgwqDCoMKgwqDCoCBicmNtZjogd2lmaUAxIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlZyA9IDwxPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAiYnJjbSxiY200MzI5LWZtYWMiOwo+PiBJcyBBUDYyNTYgdXNpbmcgYSBiY200MzQ1
NiBjaGlwPyBJZiBzbyB0aGVuIHRoaXMgc2hvdWxkIGJlIChhY2NvcmRpbmcKPj4gdG8gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC93aXJlbGVzcy9icmNtLGJjbTQzMjktZm1h
Yy55YW1sKToKPj4gIMKgwqAgY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzNDU2LWZtYWMiLCAiYnJj
bSxiY200MzI5LWZtYWMiOwo+IAo+IE9LLCBJIHdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4K
PiAKPiBXaXRoIHRoaXMgU0RJTyBwYXRjaCwgdGhlIFNESU8gY2FyZCBkZXRlY3RlZCB3ZWxsLCBi
dXQgd2hlbiB0cnkgdG8gY29ubmVjdCB0aGUgd2lmaSwgaXQgc3RpbGwgZmFpbGVkLgo+IFNvIG1h
eWJlIGV4dHJhIHBhdGNoZXMgYXJlIG5lZWRlZCB0byBtYWtlIFdpLUZpIHdvcmtpbmcuCj4gCj4g
WyAgICA1LjkwOTg1OF0gbWVzb24tZ3gtbW1jIGZlMDg4MDAwLm1tYzogYWxsb2NhdGVkIG1tYy1w
d3JzZXEKPiBbICAgIDYuMTEzMTYwXSBtbWMyOiBuZXcgVUhTLUkgc3BlZWQgU0RSMTA0IFNESU8g
Y2FyZCBhdCBhZGRyZXNzIDAwMDEKPiBbICAgMTkuMjA2MDE5XSBicmNtZm1hYzogYnJjbWZfZndf
YWxsb2NfcmVxdWVzdDogdXNpbmcgYnJjbS9icmNtZm1hYzQzNDU2LXNkaW8gZm9yIGNoaXAgQkNN
NDM0NS85Cj4gWyAgIDE5LjIwODYzOF0gYnJjbWZtYWMgbW1jMjowMDAxOjE6IERpcmVjdCBmaXJt
d2FyZSBsb2FkIGZvciBicmNtL2JyY21mbWFjNDM0NTYtc2Rpby5raGFkYXMsdmltMXMuYmluIGZh
aWxlZCB3aXRoIGVycm9yIC0yCj4gWyAgIDE5LjIxODE3MF0gYnJjbWZtYWMgbW1jMjowMDAxOjE6
IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciBicmNtL2JyY21mbWFjNDM0NTYtc2Rpby5jbG1fYmxv
YiBmYWlsZWQgd2l0aCBlcnJvciAtMgo+IFsgICAxOS4zMzIwOTFdIGJyY21mbWFjOiBicmNtZl9j
X3Byb2Nlc3NfY2xtX2Jsb2I6IG5vIGNsbV9ibG9iIGF2YWlsYWJsZSAoZXJyPS0yKSwgZGV2aWNl
IG1heSBoYXZlIGxpbWl0ZWQgY2hhbm5lbHMgYXZhaWxhYmxlCj4gWyAgIDE5LjMzMjExM10gYnJj
bWZtYWM6IGJyY21mX2NfcHJvY2Vzc190eGNhcF9ibG9iOiBubyB0eGNhcF9ibG9iIGF2YWlsYWJs
ZSAoZXJyPS0yKQo+IFsgICAxOS4zMzIzMjddIGJyY21mbWFjOiBicmNtZl9jX3ByZWluaXRfZGNt
ZHM6IEZpcm13YXJlOiBCQ000MzQ1Lzkgd2wwOiBKdW4gMjUgMjAyMSAxNzoxMzozOCB2ZXJzaW9u
IDcuNDUuOTYuOTQgKDdiYjZiMTRAU1lOQSkgKHI3NDU3OTApIEZXSUQgMDEtMmJkZmI2NGMgZXM3
LmM1Lm40LmEzCj4gWyAgIDE5LjMzMjczMV0gYnJjbWZtYWM6IGJyY21mX3NkaW9fcmVhZF9jb250
cm9sOiByZWFkIDIzMiBjb250cm9sIGJ5dGVzIGZhaWxlZDogLTg0Cj4gWyAgIDE5LjMzMjk4OF0g
YnJjbWZtYWM6IGJyY21mX3NkaW9fcnhmYWlsOiBhYm9ydCBjb21tYW5kLCB0ZXJtaW5hdGUgZnJh
bWUsIHNlbmQgTkFLCj4gWyAgIDIxLjkzOTA5MF0gYnJjbWZtYWM6IGJyY21mX3NkaW9fYnVzX3J4
Y3RsOiByZXN1bWVkIG9uIHRpbWVvdXQKPiBbICAgMzUuNTg3NDIyXSBtZXNvbi1neC1tbWMgZmUw
ODgwMDAubW1jOiB1bmFsaWduZWQgc2cgbGVuIDk2IGJsa3NpemUgNTEyLCBkaXNhYmxpbmcgZGVz
Y3JpcHRvciBETUEgZm9yIHRyYW5zZmVyCgpUaGlzIGlzIGFuIGlzc3VlIHdpdGggdGhlIGRyaXZl
ciwgaXQncyB1bnJlbGF0ZWQgd2l0aCB0aGUgYW1sb2dpYyxkcmFtLWFjY2Vzcy1xdWlyaywgd2hp
Y2ggZml4ZXMgdGhpcyBiZWNhdXNlIHdlIHVzZSBhIGJvdW5jZSBidWZmZXIuCgo+IFsgICA0NC40
MTI2NzddIGllZWU4MDIxMSBwaHkwOiBicmNtZl9jZmc4MDIxMV9jb25uZWN0OiBCUkNNRl9DX1NF
VF9TU0lEIGZhaWxlZCAoLTUyKQo+IFsgICA0NS42OTY5MDFdIGllZWU4MDIxMSBwaHkwOiBicmNt
Zl9jZmc4MDIxMV9jb25uZWN0OiBCUkNNRl9DX1NFVF9TU0lEIGZhaWxlZCAoLTUyKQo+IFsgICA0
Ny40OTE3NjhdIGllZWU4MDIxMSBwaHkwOiBicmNtZl9jZmc4MDIxMV9jb25uZWN0OiBCUkNNRl9D
X1NFVF9TU0lEIGZhaWxlZCAoLTUyKQo+IFsgICA1My4yOTIwOTBdIGllZWU4MDIxMSBwaHkwOiBi
cmNtZl9jZmc4MDIxMV9jb25uZWN0OiBCUkNNRl9DX1NFVF9TU0lEIGZhaWxlZCAoLTUyKQo+IFsg
ICA1OS44NjYzMjhdIGllZWU4MDIxMSBwaHkwOiBicmNtZl9jZmc4MDIxMV9jb25uZWN0OiBCUkNN
Rl9DX1NFVF9TU0lEIGZhaWxlZCAoLTUyKQo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBOaWNrCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
