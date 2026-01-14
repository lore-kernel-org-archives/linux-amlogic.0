Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369C3D31A2C
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFxPoEskqzyKwltwoiUDJHOdLD/ICURhZo33cgpet+g=; b=1Dgbe4fWqCodtvFhIR8ZZfvt+a
	TVyFBZ+x4DKanLgIBVyJOdKldvKOETVewpys/xNNAtc6Jj+uaq2co26P6HUdzxu9PWHrtdbkapLel
	s6NwcHI/r/3sFoiD30HVKbJWb7AfrXPXKSJADu49zJ2uioz+OxVb541IpEzV+2Pl9BE7q5NYsbdYW
	M69Z0lQ9T2rc3pipypWaOpDZsURm0ek7bBXP39YTFmrhupfmDuK0Z8DN5IAM7DwxwZn/+zSnjqlP8
	H0MgQND24YVsxtP0DrIxVe3z3S6aNubIOpJe71yPiF25m8EAXhN0Tbz6BrFqTqGVTShbhwCfuvVXL
	b+ksGlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwot-00000008SdC-0QXW;
	Wed, 14 Jan 2026 09:05:39 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwoq-00000008Sb7-15aw
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 09:05:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so53345265e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768381534; x=1768986334; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofYNEYsZ/JYVYWk8P2K9X7Vw7eOrU/DC/WvC2YuSY3E=;
        b=hBB4RF8u2IUHed63FsRqdnAzwzxtdx7hnk7uImdiB5gVRQV6zowk+SXnP5h1YykAuT
         MWop+0BXEJZBiOm4aRM4/x77hfv0YBHmw3y+/uzq0u9C3n4eAZ05m8sSRT2TxZmzgoho
         qpKtKLwzjVrvLD6XWNsbW9sFW5bV8oPsW+sZYhLSj4Pd4w9BX5cHfdiVyoXswdXYNqET
         1jmNvG9s762qaZRQ8HIOBaBP3RVx3U8xC8j8GOHR1at3eR/h4YhYaJoAuOpwQTeyF7ke
         duWVlGpALS4WKN9PckL1MKgLTnr61J8G5MNiUVxjRu9Ga1ElcsCAwV41qL8Zb4MUJyr4
         4PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381534; x=1768986334;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofYNEYsZ/JYVYWk8P2K9X7Vw7eOrU/DC/WvC2YuSY3E=;
        b=I2PrTIiq8pu/aMgmbCX5D3vOvDENG59iCudQuwnX1NzQI7v+e3BA+5NyHEmx5B4/Q5
         PVxDSzM16Ji7LIAvJLOxclOtrlojFm4V1a0pRXX1XCYQRKse7zafLovmzfbDV+xJ7hK0
         TAhQhHYshV2Nah/lMkJ6BT/HN0D7hFfJeK+sqVB7WXy1SBSAsB+4U5chVkomhCwc5bRl
         LLWwDbMHzulrn0buYZcPV8JwNWW0VdJivhnWyOg+3pQ8baNfDrFqeqL521VBoaoIJgCM
         QkTSsKhtXWW8grXl9ViWlED84PugyTIJC0IIF+oSE/dCmVA31otBQgX3TcNHdq2a9wtn
         wMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8VU/xGnfMTNG8hzg4xgIDZHNpYCox6ARECSlFFVObw+U3B0fxkqbP+7kMCD84zfyvkCAPZlqb1FSz9Hhe@lists.infradead.org
X-Gm-Message-State: AOJu0YxAyqvwTG++eVuZqUUgkwcsB/3ktrOUZCzxFuhOHeDH7tiXsq2f
	+tBgurby3w3NYsiPKz5T3+Gn2hxFTE2wTS6kMY+mwYuBzEbHmvg7PUUc4RGGQbu3K7E=
X-Gm-Gg: AY/fxX6RHmCgnB/QcYCC/caKy8Cy0PeE1cmHP8pl/fJlim1MhpN5nefieE1GOcxKv1q
	53aPF4VRnM3aIxXI74cBs9v3JokmLSMaMUkq1x4ATHJLKwhXSXoRhamZbqSPrsCkPad0nCzNo2G
	66e7glUKO2mV2/19MUmtAjFx0YRoZYQkwTU+9xKW2njSmZWaB2tfbvLeD28lGCzV0Vd+CPNBSdB
	wFrZuBymxrz37YoPMGZqw1CskhIvNyJVlZz0+kyTuuCLeoFFWg65XDc0h5An1OWEiH0XfYsdtMk
	72Jdugv1ZsO8lvvEYzVBo1b3Bf4XhOkfvQ7tW/hHjq/SzDUjAEan3ToEe3yfm2ebIYbp52Jbpi7
	55EMPxdUjeoZpNncf7z8WjSj+rnARUSvLjecbjYPJYWTyLqwnzd0s6Syxc0eyQ2h7gTA9s5P70r
	zBUQFaWWEmtzG8XGYTCLoky0mUUn9WkatM7aba9K7+WEUBWfdK3xkKZZF9p8toOuQ=
X-Received: by 2002:a05:600c:3acb:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47ee3353e2emr21588345e9.21.1768381534430;
        Wed, 14 Jan 2026 01:05:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee562d7aasm17655715e9.11.2026.01.14.01.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:05:33 -0800 (PST)
Message-ID: <a09feb0e-6736-49a9-aba1-799174c9b43a@linaro.org>
Date: Wed, 14 Jan 2026 10:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
To: Chuan Liu <chuan.liu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
 <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
 <2491170c-d055-4231-8fd1-164d89198ae3@amlogic.com>
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
In-Reply-To: <2491170c-d055-4231-8fd1-164d89198ae3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_010536_368328_ED486A16 
X-CRM114-Status: GOOD (  14.89  )
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

T24gMS8xNC8yNiAwMzo0OCwgQ2h1YW4gTGl1IHdyb3RlOgo+IGhpIEplcm9tZSwKPiAKPiBPbiAx
LzEzLzIwMjYgNjozOSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+Cj4+IE1NQyBBIGFuZCBDIGFyZSBtaXMtcmVwcmVzZW50ZWQgYXMgaGF2aW5nIHRoZWly
ICJjbGtpbjAiIGlucHV0IGNvbm5lY3RlZCB0bwo+PiB4dGFsIHdoaWxlIGl0IGlzIGFjdHVhbGx5
IGNvbm5lY3RlZCB0byB0aGUgTU1DIGNsb2NrLCBtb3N0bHkgaW4gYW4gYXR0ZW1wdAo+PiB0byBw
cm92aWRlIDI0TUh6IHRvIHRoZSBkZXZpY2Ugb24gdGhpcyBpbnB1dC4KPiAKPiBSaWdodC4KPiAK
Pj4KPj4gRml4IHRoaXMgYW5kIGFzc2lnbiB0aGUgY2xvY2sgdG8gMjRNSHogdG8gYWN0dWFsbHkg
cHJvdmlkZSB0aGUgcmVxdWlyZWQKPj4gcmF0ZS4KPj4KPj4gRml4ZXM6IDNhYjlkNTRiNWQ4NCAo
ImFybTY0OiBkdHM6IGFtbG9naWM6IGVuYWJsZSBzb21lIGRldmljZSBub2RlcyBmb3IgUzQiKQo+
PiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4g
LS0tCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIHwgMTIg
KysrKysrKysrKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRz
aQo+PiBpbmRleCA2MjUzOGZkOWRiNmIxZmZiMzNhODhlMTI2MjhhYWRlZmJhYTQ1M2VjLi42MzI0
ZDFlYjU5OTQwMDlkZjViMDk5MjNjY2UzNzNhODcyMjlmNGI4IDEwMDY0NAo+PiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+PiBAQCAtODE5LDEzICs4MTksMTcgQEAg
c2RpbzogbW1jQGZlMDg4MDAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHhmZTA4ODAwMCAweDAgMHg4MDA+Owo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDE3NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmY2xrY19wZXJpcGhzIENM
S0lEX1NERU1NQ19BPiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmeHRhbD4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNsa2NfcGVyaXBo
cyBDTEtJRF9TRF9FTU1DX0E+LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjbGtjX3BsbCBDTEtJRF9GQ0xLX0RJ
VjI+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2xvY2stbmFtZXMgPSAiY29yZSIsICJjbGtpbjAiLCAiY2xraW4xIjsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmVzZXQgUkVT
RVRfU0RfRU1NQ19BPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNhcC1zZGlvLWlycTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGtlZXAtcG93ZXItaW4tc3VzcGVuZDsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFz
c2lnbmVkLWNsb2NrcyA9IDwmY2xrY19wZXJpcGhzIENMS0lEX1NEX0VNTUNfQT47Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc3NpZ25lZC1jbG9jay1w
YXJlbnRzID0gPDA+Owo+IAo+IElzIGl0IHBvc3NpYmxlIHRvIHJlbW92ZSBhc3NpZ25lZC1jbG9j
ay1wYXJlbnQ/CgpZZXMgaXQncyBub3QgbmVjZXNzYXJ5IHRvIGtlZXAgaXQuCgpOZWlsCgo+IAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8MjQwMDAwMDA+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Owo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZDogbW1jQGZl
MDhhMDAwIHsKPj4gQEAgLTg0OSwxMyArODUzLDE3IEBAIGVtbWM6IG1tY0BmZTA4YzAwMCB7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgwIDB4ZmUwOGMwMDAgMHgwIDB4ODAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNzggSVJRX1RZUEVf
RURHRV9SSVNJTkc+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfTkFORD4sCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
Jnh0YWw+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPCZjbGtjX3BlcmlwaHMgQ0xLSURfU0RfRU1NQ19DPiwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDwmY2xrY19wbGwgQ0xLSURfRkNMS19ESVYyPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiY2xr
aW4wIiwgImNsa2luMSI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXNldHMgPSA8JnJlc2V0IFJFU0VUX05BTkRfRU1NQz47Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1zZGlvOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm8tc2Q7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAi
ZGlzYWJsZWQiOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBhc3NpZ25lZC1jbG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9TRF9FTU1DX0M+
Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWdu
ZWQtY2xvY2stcGFyZW50cyA9IDwwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0MDAwMDAwPjsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDCoMKgwqDCoCB9Owo+
PiDCoCB9Owo+Pgo+PiAtLSAKPj4gMi40Ny4zCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
Cj4+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
