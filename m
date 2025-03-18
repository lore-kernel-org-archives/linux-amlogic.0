Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481EAC282EC
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Mar 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9sOZ8ZtMudrMvr3Uir8q5Z2b/GvixpOwSGY1JDd07Y=; b=qmMGdK3qzX4zk0biLRhpQXiMib
	iATvFFsje+aRqXlEICaI35CJCBUOtWiqcEGXLMHGF/aL4XQNvRi0MzBDjOfomgZRYkoi5Y3YOFeDv
	ApN+9C3vN2+hnfe0+3/hh9mpHjvdFcUwc1HMijTTiGIvKG0M+SeoZAilgpYloDi8D5fcJ0YEjmnzh
	WxGfkIvuIyj3Q8dBp35WlLlD5fBfdabuGeHOI+sKeBtCQdwwO5mrecZmjjCU3g4K4WsfmQWGuTg/h
	eLfeTyF4k5j+AFCuFbXgAB19lZC7hdqnazHj/89CEnnehaYcb9huRChASvQ/+oWrpGN+lwQh0Q2jX
	b71lyDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUEt-00000005W9t-471V;
	Tue, 18 Mar 2025 10:32:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU7C-00000005Ucx-2k3q
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Mar 2025 10:24:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4073232f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Mar 2025 03:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742293444; x=1742898244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9s1MLqZ99Jjf0BTVsynVNUuDrFuTR6hcyH+PJ/kt3J0=;
        b=RMCqdeiZmX8j6Uwwh1+E2CjwwCjXRssv7nOwo9GKX38oV4Dgb3viNv6kWKyMv4f8pA
         Fmto1blpfGgy7U8HyfSsPBywSL1sag4utAGsczVzhKZkAU6O4twqotAtFLq/bx4lfxEF
         SRkUUyP8A9pNu2iruCj3r5YoJvmDxX++PzRRVZBv21PBYTsEOEES61KmPpLtc87LRjFl
         mYWhRuvKYijrlB8I1Iufe1WwN5c39AB0c68cICv5cRVTZNJJahgnkbhbFg1EXYgNGxPV
         UjCZ5rGZ/qUV+8jfDSMLq7/2TgU26gj1Ox7BFmuLasg+YfiZ0c+OXwdDyK2QCS5qUPHH
         Ye2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293444; x=1742898244;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9s1MLqZ99Jjf0BTVsynVNUuDrFuTR6hcyH+PJ/kt3J0=;
        b=FmKRIBoZuxToJNcKrPkCtSaoABZ4BZNB0nOy0BUckK0Tj1U/mfx248h0YSM2I/HDmE
         WkAi7ryLEidws+KNN+Ng3Ru+0tArs/tk7YJivFYQUejNBYJoVKMVF+5slOJkpWsN+DIr
         l9kHqAD2UFjf0poQ4U0Jyi938f/zlIZta+C/m1SOyJeP1GU/882rI6BKwUHF5XS4LNyJ
         DJSquYD1rSfir7sn2vBH83lyQK+jVx2RuAIHC/mIJJ43cXDmuMthevKYkb3aIXiDqXju
         JNPx02wFqfsVKM34nMqGLpv8KXc3XMr7w+Zl3cZpHEXXxQX4MWVtHkeGBFttssn7quv9
         C7jg==
X-Forwarded-Encrypted: i=1; AJvYcCV39/43qiq4bfkyOnodODvp83ymsgSufLTu2lFMLK3BcsdzPj6LMUjAaKdnSwokCWgXsVoCQ5yo2tsrT7GR@lists.infradead.org
X-Gm-Message-State: AOJu0YwYNrtBc3LJwb2I2Vq9d/5MK7edK2nDNBWWvqf2O4LnjI6EPf0u
	8Zlp0JbTn8y/zJ5tgbsnZhvVcdcCNMfh+Z39NTVrpRVFlHmlaC5DYD9TT2qa23I=
X-Gm-Gg: ASbGncvPGmiU3bHeS2nl1crTKgqVq7+iM5m2vEfqSlzMBECMKT5DwKu797AQd4sfPCQ
	I+22lEqVB24P/s2iF63vSaoVlk5O6FuynALshn7jb/y7WSVzzzr2D1MmnvEmyfOWtedImxwqPoU
	E11FRlWbjI713IdgoO+6R3XBMXiK1Zx6gsTtsVxCOcm8yRs5VVYOJr+zenmJj1UoZP3izhsnaE+
	PA0C5nun0uW12bzVpcMtpk/HfxZFRbY6klmtL62iVcteA5hvOWafdVsHDA1iTSuXc/yeHywjoxD
	Z+JmZnIsHPyEPWMEZfwihNT1EUH7oZT6ixqOo/3Y1EeK5zt16PSk0C2vziWhcdyx4u0XLjpUk6k
	9u801edhBUniaxoAnY1Zq2Q==
X-Google-Smtp-Source: AGHT+IHtzyqVRAga6Hl6uXNlyniza06JK+93mCeNwBJWGNRf6bcJIa0OCbOvW1yls2I+teoXyKiouQ==
X-Received: by 2002:a05:6000:1566:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-3996bb560d6mr2356028f8f.25.1742293444284;
        Tue, 18 Mar 2025 03:24:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a10sm17870384f8f.36.2025.03.18.03.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:24:03 -0700 (PDT)
Message-ID: <61a0eb6c-aa15-4316-9e4b-929c3cad13c9@linaro.org>
Date: Tue, 18 Mar 2025 11:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: Add Ugoos AM3
To: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
 <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
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
In-Reply-To: <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032406_699371_948CD98D 
X-CRM114-Status: GOOD (  23.66  )
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

T24gMTQvMDMvMjAyNSAwMDoxMSwgSi4gTmV1c2Now6RmZXIgdmlhIEI0IFJlbGF5IHdyb3RlOgo+
IEZyb206ICJKLiBOZXVzY2jDpGZlciIgPGoubmVAcG9zdGVvLm5ldD4KPiAKPiBUaGUgVWdvb3Mg
QU0zIGlzIGEgc21hbGwgc2V0LXRvcCBib3ggYmFzZWQgb24gdGhlIEFtbG9naWMgUzkxMiBTb0Ms
Cj4gd2l0aCBhIGJvYXJkIGRlc2lnbiB0aGF0IGlzIHZlcnkgY2xvc2UgdG8gdGhlIFEyMHggZGV2
ZWxvcG1lbnQgYm9hcmRzLgo+IFRoZSBNTUMgbWF4LWZyZXF1ZW5jeSBwcm9wZXJ0aWVzIGFyZSBj
b3BpZWQgZnJvbSB0aGUgZG93bnN0cmVhbSBkZXZpY2UKPiB0cmVlLgo+IAo+ICAgIGh0dHBzOi8v
dWdvb3MuY29tL3Vnb29zLWFtMy0xNmcKPiAKPiBUaGUgZm9sbG93aW5nIGZ1bmN0aW9uYWxpdHkg
aGFzIGJlZW4gdGVzdGVkIGFuZCBpcyBrbm93biB0byB3b3JrOgo+ICAgLSBkZWJ1ZyBzZXJpYWwg
cG9ydAo+ICAgLSAidXBkYXRlIiBidXR0b24gaW5zaWRlIHRoZSBjYXNlCj4gICAtIFVTQiBob3N0
IG1vZGUsIG9uIGFsbCB0aHJlZSBwb3J0cwo+ICAgLSBIRE1JIHZpZGVvL2F1ZGlvIG91dHB1dAo+
ICAgLSBlTU1DLCBNaWNyb1NELCBhbmQgU0RJTyBXTEFOCj4gICAtIFMvUERJRiBhdWRpbyBvdXRw
dXQKPiAgIC0gRXRoZXJuZXQKPiAgIC0gSW5mcmFyZWQgcmVtb3RlIGNvbnRyb2wgaW5wdXQKPiAK
PiBUaGUgZm9sbG93aW5nIGZ1bmN0aW9uYWxpdHkgZG9lc24ndCBzZWVtIHRvIHdvcms6Cj4gICAt
IFVTQiByb2xlIHN3aXRjaGluZyBhbmQgZGV2aWNlIG1vZGUgb24gdGhlICJPVEciIHBvcnQKPiAg
IC0gY2FzZSBMRUQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0
ZW8ubmV0Pgo+IC0tLQo+IAo+IFYyOgo+IC0gRml4IHZlbmRvciBuYW1lIGluIHBhdGNoIHN1Ympl
Y3QKPiAtIFJlbW92ZSBpbmNvcnJlY3Qgb3ZlcnJpZGUgb2YgU0RJTyBwd3JzZXEgcmVzZXQgbGlu
ZQo+IC0tLQo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAg
ICAgICAgfCAgMSArCj4gICAuLi4vYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC1wMjN4
LXEyMHguZHRzaSB8ICAyICstCj4gICAuLi4vYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1n
eG0tdWdvb3MtYW0zLmR0cyB8IDkxICsrKysrKysrKysrKysrKysrKysrKysKPiAgIDMgZmlsZXMg
Y2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvTWFrZWZpbGUKPiBpbmRleCAyZmJkYTg0MTljNjVhMzA1NjQxMGFjNDVjYTNk
ZGFjZWI2OWVhNGY1Li5iZjJiYzE0NTI4YmZhMjdlOGQ2YWUyNzMwMDg1ZmMzNTZkNmM2ZGQ4IDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+IEBAIC03Niw2ICs3Niw3IEBA
IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcTIwMC5kdGIKPiAgIGR0Yi0k
KENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcTIwMS5kdGIKPiAgIGR0Yi0kKENPTkZJ
R19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tcmJveC1wcm8uZHRiCj4gICBkdGItJChDT05GSUdf
QVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXM5MTItbGlicmV0ZWNoLXBjLmR0Ygo+ICtkdGItJChD
T05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXVnb29zLWFtMy5kdGIKPiAgIGR0Yi0kKENP
TkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tdmVnYS1zOTYuZHRiCj4gICBkdGItJChDT05G
SUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3htLXdldGVrLWNvcmUyLmR0Ygo+ICAgZHRiLSQoQ09O
RklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXM0LXM4MDV4Mi1hcTIyMi5kdGIKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LXAyM3gtcTIweC5kdHNpCj4gaW5k
ZXggNDVjY2RkZDFhYWYwNTQ2NjMyYzgxYTUyYzg5MTdhOTIzYmVhZTg4My4uNDIyM2IyNmY3ZDBm
M2FhNDdlNDJlOTQzNGQyNGY3M2IyMDQ0MTk4MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kKPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kKPiBAQCAtOTcsNyArOTcs
NyBAQCBzZGlvX3B3cnNlcTogc2Rpby1wd3JzZXEgewo+ICAgCQljbG9jay1uYW1lcyA9ICJleHRf
Y2xvY2siOwo+ICAgCX07Cj4gICAKPiAtCWN2YnMtY29ubmVjdG9yIHsKPiArCWN2YnNfY29ubmVj
dG9yOiBjdmJzLWNvbm5lY3RvciB7Cj4gICAJCWNvbXBhdGlibGUgPSAiY29tcG9zaXRlLXZpZGVv
LWNvbm5lY3RvciI7Cj4gICAKPiAgIAkJcG9ydCB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uYmE4
NzFmM2Y1M2JiOTliNDdiMzI1YmFlMjI4YjU5YjcyMmM1MTIzYgo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3htLXVnb29zLWFtMy5kdHMK
PiBAQCAtMCwwICsxLDkxIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyNSBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0
ZW8ubmV0Pgo+ICsgKgo+ICsgKiBEZWJ1ZyBVQVJUICgzLjNWLCAxMTUyMDAgYmF1ZCkgYXQgdGhl
IGNvcm5lciBvZiB0aGUgYm9hcmQ6Cj4gKyAqICAgKDQpICgzKSAoMikgWzFdCj4gKyAqICAgVmNj
IFJYRCBUWEQgR05ECj4gKyAqLwo+ICsKPiArL2R0cy12MS87Cj4gKwo+ICsjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvaW5wdXQvaW5wdXQuaD4KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FtbG9naWMsbWVzb24tZzEyYS1ncGlvLWludGMuaD4KPiArCj4gKyNpbmNs
dWRlICJtZXNvbi1neG0uZHRzaSIKPiArI2luY2x1ZGUgIm1lc29uLWd4LXAyM3gtcTIweC5kdHNp
Igo+ICsKPiArLyB7Cj4gKwljb21wYXRpYmxlID0gInVnb29zLGFtMyIsICJhbWxvZ2ljLHM5MTIi
LCAiYW1sb2dpYyxtZXNvbi1neG0iOwo+ICsJbW9kZWwgPSAiVWdvb3MgQU0zIjsKPiArCj4gKwlh
ZGMta2V5cyB7Cj4gKwkJY29tcGF0aWJsZSA9ICJhZGMta2V5cyI7Cj4gKwkJaW8tY2hhbm5lbHMg
PSA8JnNhcmFkYyAwPjsKPiArCQlpby1jaGFubmVsLW5hbWVzID0gImJ1dHRvbnMiOwo+ICsJCWtl
eXVwLXRocmVzaG9sZC1taWNyb3ZvbHQgPSA8MTcxMDAwMD47Cj4gKwo+ICsJCWJ1dHRvbi1mdW5j
dGlvbiB7Cj4gKwkJCWxhYmVsID0gIlVwZGF0ZSI7Cj4gKwkJCWxpbnV4LGNvZGUgPSA8S0VZX1ZF
TkRPUj47Cj4gKwkJCXByZXNzLXRocmVzaG9sZC1taWNyb3ZvbHQgPSA8MTAwMDA+Owo+ICsJCX07
Cj4gKwl9Owo+ICt9Owo+ICsKPiArJmN2YnNfY29ubmVjdG9yIHsKPiArCS8qIE5vdCB1c2VkIG9u
IHRoaXMgYm9hcmQgKi8KPiArCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gK307Cj4gKwo+ICsmZXRo
bWFjIHsKPiArCXBpbmN0cmwtMCA9IDwmZXRoX3BpbnM+Owo+ICsJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKPiArCj4gKwkvKiBTZWxlY3QgZXh0ZXJuYWwgUEhZIGJ5IGRlZmF1bHQgKi8KPiAr
CXBoeS1oYW5kbGUgPSA8JmV4dGVybmFsX3BoeT47Cj4gKwo+ICsJYW1sb2dpYyx0eC1kZWxheS1u
cyA9IDwyPjsKPiArCj4gKwkvKiBFeHRlcm5hbCBQSFkgaXMgaW4gUkdNSUkgKi8KPiArCXBoeS1t
b2RlID0gInJnbWlpIjsKPiArCj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmZXh0
ZXJuYWxfbWRpbyB7Cj4gKwlleHRlcm5hbF9waHk6IGV0aGVybmV0LXBoeUAwIHsKPiArCQkvKiBS
ZWFsdGVrIFJUTDgyMTFGICgweDAwMWNjOTE2KSAqLwo+ICsJCXJlZyA9IDwwPjsKPiArCj4gKwkJ
cmVzZXQtYXNzZXJ0LXVzID0gPDEwMDAwPjsKPiArCQlyZXNldC1kZWFzc2VydC11cyA9IDw4MDAw
MD47Cj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8gR1BJT1pfMTQgR1BJT19BQ1RJVkVfTE9XPjsK
PiArCj4gKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb19pbnRjPjsKPiArCQkvKiBNQUNfSU5U
UiBvbiBHUElPWl8xNSAqLwo+ICsJCWludGVycnVwdHMgPSA8MjUgSVJRX1RZUEVfTEVWRUxfTE9X
PjsKPiArCX07Cj4gK307Cj4gKwo+ICsmaTJjX0Igewo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArCXBpbmN0cmwtMCA9IDwmaTJjX2JfcGlucz47
Cj4gKwo+ICsJcnRjOiBydGNANTEgewo+ICsJCWNvbXBhdGlibGUgPSAiaGFveXUsaHltODU2MyI7
Cj4gKwkJcmVnID0gPDB4NTE+Owo+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsKPiArCX07Cj4gK307
Cj4gKwo+ICsvKiBXTEFOOiBBdGhlcm9zIDEwayAoUUNBOTM3NykgKi8KPiArJnNkX2VtbWNfYSB7
Cj4gKwltYXgtZnJlcXVlbmN5ID0gPDIwMDAwMDAwMD47Cj4gK307Cj4gKwo+ICsvKiBlTU1DICov
Cj4gKyZzZF9lbW1jX2Mgewo+ICsJbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+ICt9Owo+
IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
