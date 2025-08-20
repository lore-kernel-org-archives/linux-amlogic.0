Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A227CA0EE4
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Aug 2025 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjdKPPeKQMyQqK93TEbBWf+BtrvmR3KvGFALaHtXDi0=; b=GbUmWCgFs01SgHu+X5Ar/q2BQu
	kQMxxA3L22fUw7NBZj86luOXwnt3hPQTW39aF8WimG3+AYEU0mLVSevvN0/x2w005XXEgDv8+lEOZ
	Hxzz5IOoq0rSwqEE929IlHEtwrDbjvpuHsOolWQGx+A2r9M7LZVeoFQ0Ui/e+KdC5bexLHsDWd86d
	tIXb2qmEPcGw3Mpkw9oyG8xEuSLAEmsjudSimFD6FVk3xTvGCCTqzF8AGOom2v6noUn9IRTpPp3xF
	uNwIM8jGEUjqAKGUyYVZlBVgiMiGlLTdV+nkGs9TZHUBvHU1qdol2ldRuEFbKMvllzMu294/Lxavx
	Ethxl+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolZd-0000000ENgO-1Dco;
	Wed, 20 Aug 2025 16:22:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojuK-0000000E6K8-0OEv
	for linux-amlogic@lists.infradead.org;
	Wed, 20 Aug 2025 14:35:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso36327245e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 20 Aug 2025 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755700518; x=1756305318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lyug+3qlgRJRhXiV8Js+LFY/rJHmnY0zI7jbnl8sttM=;
        b=grSSet/3mXyQzaO1miCpUY1ZquSnQDCGSfxvJsF1RdzfZYK17DHhIKoyJk/LFuUUdt
         A+zKoP/F0vWOXm+3ymuR7P/nX0ufuDYoN8/AQiDc5Zwf+B9fwHC4U4NoZqojuBM0DB4E
         XIYheUcTaGbhEcKAvWfmsQkMKuW/XMHwOuZeMlJtW3jD7UZxBm+d5W0Dr4LgAhuILday
         zX+X5IeMynh+I/xQqN6BnomWofaigk1ZhfLsb5pcXN6fyYmDcO/Doj6oRF2TtD6/qq7y
         yT1DzjvUimJdH7DKggUa/yVj0i6LEgdhPyaXgrw2TWPIJFUssVFXLI5NPxsRuhir590g
         rLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755700518; x=1756305318;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lyug+3qlgRJRhXiV8Js+LFY/rJHmnY0zI7jbnl8sttM=;
        b=wPBOXti866Glm/KDXEOuT+TIyhZJaodcHi87Tp11B/wGk/l+emZOOIXEIWei2Cf3b3
         OGESyWu73PK7Pta+iuJ6pqp54k9wZdSKMr7c0Wv20UNugb9g4paQeE/0ZlXL4g5eP5ZQ
         2UIIix87qHhAlg3kidF7NVliVYXTiiYpq8U9LXng5gt1Wv7g6lSlxHMopDdFJz0C26hO
         BRpDq4uJ7PWDHkphsHzzoQmtOtvU2z+0IvbOxFnDUAKiOIGdMpkQImAKBkh91tMorI+w
         p7pnyuGD8/1rKcma1zx95kre0X2Fajxb1A8qEGii3lTZcBT7kvnTNvDueCPC//eAHoSx
         i+cw==
X-Forwarded-Encrypted: i=1; AJvYcCWA9hj1jUMwn4Unzssad+xgxB5o6O6xj1FjmDr9/XXEufQxmH5TozPumRk7/mgWwh3m5HZi5jzOs0HU4boR@lists.infradead.org
X-Gm-Message-State: AOJu0YzaJ8qbDXnPhLnRZoW0caLznFzks5YBQH4dbfJP0O32VmwXICVb
	OazaszvPdY5JwLqnyd6UuNDh7IUGo2lm5sf5uvyRvnaSvhehpnIQP8Swb6MgQ1QsMTzQXwDurPo
	dWhnbCjs=
X-Gm-Gg: ASbGncvGMiT5eBDPsyRYbiMoqAtcaysFsZKFbqrx2kJTZF680qv/AqM766rmJh1Vdbl
	kWJ/5Wdm+zMOUyliwUh1Bgo7o10cpByCc3uomn398Zgba0fv5STMT/wBZZPuJcdq0yMtsLIOlH/
	2pikgA2XGNy4PmaAeU+uJMVqkP2k+wflxvjSnhei8JhEYEGzQZBL5kO7AjDPhJCCGtxJyWHitNy
	lZPHhNvA4ZJmIhAvsnXk5diYu2i/guqkFLozpPU1wA0yfk5p4zcw+fkA1tvDcJ3sIg9lljBAyE3
	l7Eup2PeGwcjziC5V0ikBz//3rihjQjrVCt1uhyx2UmKhau4CSUVLxJXuvKYq59ulYUJT+UtkNX
	D7DhxhCXSBcNx85qkQi1JZTnkWQXgLCp4Zz57onaYaHHGmo7cWp+EJiEeCMRSmDWCOVfRndzUCH
	Dc4ix6WcfRpA==
X-Google-Smtp-Source: AGHT+IF9B7tqIKdb0iENG78IKFvAW+b3aPLefvK3bcUp3eG0jsgNx9wqXhniQbUfVg6Xi43bgw/eBA==
X-Received: by 2002:a05:600c:3144:b0:458:f70d:ebd7 with SMTP id 5b1f17b1804b1-45b479f7aa4mr22885645e9.20.1755700517998;
        Wed, 20 Aug 2025 07:35:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:dc4b:4af3:f382:7aa7? ([2a01:e0a:3d9:2080:dc4b:4af3:f382:7aa7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c29c9dsm37952745e9.4.2025.08.20.07.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 07:35:17 -0700 (PDT)
Message-ID: <d1c0a646-8089-4d5c-ac5a-068c4910bb66@linaro.org>
Date: Wed, 20 Aug 2025 16:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-5-linux.amoon@gmail.com>
 <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org>
 <CANAwSgTOpDmZGR33veBWrzr75=xEZ-28iu=GeCzqa0ZPXxDchw@mail.gmail.com>
 <f87069a4-042c-467a-94fb-0b65bfa4758d@linaro.org>
 <CANAwSgR1+Fb5Si6yBU6JXCfRiq-XU0xjr-ecVbnALMj7qmv0Sg@mail.gmail.com>
 <CANAwSgQvYyE3rZqBHR2_Q0FzggznOh=fhtBQVJZ1DRn73P24pQ@mail.gmail.com>
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
In-Reply-To: <CANAwSgQvYyE3rZqBHR2_Q0FzggznOh=fhtBQVJZ1DRn73P24pQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_073520_145066_D1981270 
X-CRM114-Status: GOOD (  20.45  )
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

T24gMjAvMDgvMjAyNSAxNjowMCwgQW5hbmQgTW9vbiB3cm90ZToKPiBIaSBOZWlsLAo+IAo+IE9u
IFR1ZSwgMjcgRmViIDIwMjQgYXQgMTg6MzQsIEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIE5pZWwsCj4+Cj4+IE9uIFR1ZSwgNiBGZWIgMjAyNCBhdCAy
MDozMSwgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIDA2LzAy
LzIwMjQgMTE6MTUsIEFuYW5kIE1vb24gd3JvdGU6Cj4+Pj4gSGkgTmVpbCwKPj4+Pgo+Pj4+IE9u
IFR1ZSwgNiBGZWIgMjAyNCBhdCAxNDozMCwgTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiAwNS8wMi8yMDI0IDE4OjE5LCBBbmFu
ZCBNb29uIHdyb3RlOgo+Pj4+Pj4gQXMgcGVyIFM5MjJYIGRhdGFzaGVldCBhZGQgbWlzc2luZyBj
YWNoZSBpbmZvcm1hdGlvbiB0byB0aGUgQW1sb2dpYwo+Pj4+Pj4gUzkyMlggU29DLgo+Pj4+Pj4K
Pj4+Pj4+IC0gRWFjaCBDb3J0ZXgtQTUzIGNvcmUgaGFzIDMyIEtCIG9mIGluc3RydWN0aW9uIGNh
Y2hlIGFuZAo+Pj4+Pj4gICAgICAgICAzMiBLQiBvZiBMMSBkYXRhIGNhY2hlIGF2YWlsYWJsZS4K
Pj4+Pj4+IC0gRWFjaCBDb3J0ZXgtQTczIGNvcmUgaGFzIDY0IEtCIG9mIEwxIGluc3RydWN0aW9u
IGNhY2hlIGFuZAo+Pj4+Pj4gICAgICAgICA2NCBLQiBvZiBMMSBkYXRhIGNhY2hlIGF2YWlsYWJs
ZS4KPj4+Pj4+IC0gVGhlIGxpdHRsZSAoQTUzKSBjbHVzdGVyIGhhcyA1MTIgS0Igb2YgdW5pZmll
ZCBMMiBjYWNoZSBhdmFpbGFibGUuCj4+Pj4+PiAtIFRoZSBiaWcgKEE3MykgY2x1c3RlciBoYXMg
MSBNQiBvZiB1bmlmaWVkIEwyIGNhY2hlIGF2YWlsYWJsZS4KPj4+Pj4KPj4+Pj4gRGF0YXNoZWV0
IHNheXM6Cj4+Pj4+IFRoZSBxdWFkIGNvcmUgQ29ydGV44oSiLUE3MyBwcm9jZXNzb3IgaXMgcGFp
cmVkIHdpdGggQTUzIHByb2Nlc3NvciBpbiBhIGJpZy5MaXR0bGUgY29uZmlndXJhdGlvbiwgd2l0
aCBlYWNoCj4+Pj4+IGNvcmUgaGFzIEwxIGluc3RydWN0aW9uIGFuZCBkYXRhIGNoYWNoZXMsIHRv
Z2V0aGVyIHdpdGggYSBzaW5nbGUgc2hhcmVkIEwyIHVuaWZpZWQgY2FjaGUgd2l0aCBBNTMKPj4+
Pj4KPj4+PiBPaywKPj4+Pgo+Pj4+IFNpbmNlIGFsbCB0aGUgQ29ydGV44oSiLUE3MyBhbmQgQ29y
dGV44oSiLUE1MyBzaGFyZSBzb21lIGltcHJvdmVtZW50cyBpbgo+Pj4+IHRoZSBhcmNoaXRlY3R1
cmUgd2l0aCBzb21lIGltcHJvdmVtZW50cyBpbiBjYWNoZSBmZWF0dXJlcwo+Pj4+IGhlbmNlIEkg
dXBkYXRlIHRoZSBjaGFuZ2VzIGFjY29yZGluZ2x5Lgo+Pj4+IEFsc28sIEkgY2hlY2tlZCB0aGlz
IGluIHRoZSBBUk0gZG9jdW1lbnRhdGlvbiBlYXJsaWVyIG9uIHRoaXMuCj4+Pgo+Pj4gSSBkb24n
dCB1bmRlcnN0YW5kLCBBbWxvZ2ljIHN0YXRlcyBpdCdzIGEgc2hhcmVkIEwyIGNhY2hlLCBidXQg
eW91IHRydXN0Cj4+PiB0aGUgQVJNIGRvY3VtZW50YXRpb24gaW5zdGVhZCA/Pz8KPj4KPj4gWWVz
IHBsZWFzZSBmaW5kIHRoZSBDb3J0ZXjihKItQTczIFRSTQo+PiBMMSBDYWNoZQo+PiBodHRwczov
L2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vMTAwMDQ4LzAwMDIvbGV2ZWwtMS1tZW1v
cnktc3lzdGVtL2Fib3V0LXRoZS1sMS1tZW1vcnktc3lzdGVtP2xhbmc9ZW4KPj4gTDIgQ2FjaGUK
Pj4gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uLzEwMDA0OC8wMDAyL2xl
dmVsLTItbWVtb3J5LXN5c3RlbS9hYm91dC10aGUtbDItbWVtb3J5LXN5c3RlbT9sYW5nPWVuCj4+
Pgo+Pj4+Cj4+Pj4+IEFuZCB0aGVyZSdzIG5vIGluZGljYXRpb24gb2YgdGhlIEwxIG9yIEwyIGNh
Y2hlIHNpemVzLgo+Pj4+Cj4+Pj4gV2hhdCBJIGZlZWwgaXMgaW4gZ2VuZXJhbCBhbGwgdGhlIENv
cnRleOKEoi1BNzMgYW5kIENvcnRleOKEoi1BNTMgc3VwcG9ydHMKPj4+PiBMMSBhbmQgTDIgY2Fj
aGUgc2l6ZSBzaW5jZSBpdCBpcyBwYXJ0IG9mIHRoZSBjb3JlIGZlYXR1cmVzLgo+Pj4+IGJ1dCBJ
IG9wdGVkIGZvciB0aGVzZSBzaXplIHZhbHVlcyBmcm9tIGEgV2lraXBlZGlhIGFydGljbGUuCj4+
Pj4KPj4+PiBPbiBteSBPZHJvaWQgTjIrLCBJIG9ic2VydmUgdGhlIGZvbGxvd2luZy4KPj4+Pgo+
Pj4+IEkgaGF2ZSBhbHNvIGRvbmUgc29tZSB0ZXN0aW5nIG9uIHRoZSBzdHJlc3MtbmcgdG8gdmVy
aWZ5IHRoaXMuCj4+Pgo+Pj4KPj4+IE9rIEkgZG9uJ3QgZmVlbCBjb25maWRlbnQgYWRkaW5nIG51
bWJlcnMgdGhhdCBjb21lcyBvdXQgb2YgdGhpbiBhaXIsCj4+PiBhbmQgZXZlbiBtb3JlIHNpbmNl
IHRoZXkgYXJlIG9ubHkgc2hhcmVkIHRvIHVzZXJzcGFjZS4KPj4+Cj4+PiBJIHRoaW5rIHdlIHNo
b3VsZCBvbmx5IGFkZCB0aGUgbnVtYmVycyB3aGljaCBhcmUgMTAwJSBzdXJlCj4+Cj4+IEJlc3Qg
d2F5IHRvIGxldCB0aGUgQW1sb2dpYyBTb0MgbWVtYmVycyBjb21tZW50IG9uIHRoZSBDUFUgIEwx
LyAvIEwyIGNhY2hlIHNpemUuCj4+IEJ1dCB3aXRoIHRoZSBsYWNrIG9mIHByZWYgUE1VIGV2ZW50
cyB3ZSBjYW5ub3QgdGVzdCB0aGlzIGZlYXR1cmUuCj4+Cj4+Pgo+Pj4KPj4+IFRoaXMgbG9va3Mg
cHJldHR5LCBidXQgbGV0J3Mga2VlcCBleHBvcnRpbmcgdmVyaWZpZWQgZGF0YS4KPj4+Cj4gSSBq
dXN0IHdhbnRlZCB0byByZXZpc2l0IHRoaXMgcGF0Y2ggc2VyaWVzIHdpdGggc29tZSB1cGRhdGVz
IG9uCj4gCj4gSGVyZSBpcyB3aGVyZSB0aGUgQW5kcm9pZCBUViBwcm92aWRlcyB0aGUgY2FjaGUg
ZGV0YWlscy4KPiBbMV0gaHR0cHM6Ly9hbmRyb2lkcGN0di5jb20vY29tcGFyYXRpdmUtYW1sb2dp
Yy1zOTIyeC8KPiAKPiBBbWxvZ2ljIFM5MjJYIEhleGEgQ29yZSBTb0MgaGFzIGZvdXIgQVJNIENv
cnRleC1BNzMgY29yZXMgY2FwYWJsZSBvZgo+IHJlYWNoaW5nIDEuOEdoego+IHdpdGggMU1CIEwy
IGNhY2hlICsgMiBDb3J0ZXgtQTUzIFJBTSBwcm9jZXNzb3JzIHdpdGggMjU2ayBMMiBjYWNoZSwK
PiAKPiBodHRwczovL2JvYXJkb3IuY29tL2Jsb2cvdW5kZXJzdGFuZGluZy10aGUtYXJjaGl0ZWN0
dXJlLW9mLWFybS1jb3J0ZXgtYTUzLWNhY2hlCj4gCj4gQWxzbyAgQW1sb2dpYyBBMzExRCBwcm9j
ZXNzb3IgdXRpbGl6ZXMgYSAiYmlnLkxJVFRMRSIgYXJjaGl0ZWN0dXJlLCBjb21iaW5pbmc6Cj4g
Cj4gUXVhZC1jb3JlIEFSTSBDb3J0ZXgtQTczOgo+IEVhY2ggQ29ydGV4LUE3MyBjb3JlIGhhczoK
PiAgICAgICA2NCBLQiBMMSBpbnN0cnVjdGlvbiBjYWNoZSA2NCBLQiBMMSBkYXRhIGNhY2hlCj4g
VGhlIENvcnRleC1BNzMgY2x1c3RlciBzaGFyZXMgYSAxIE1CIHVuaWZpZWQgTDIgY2FjaGUuCj4g
Cj4gRHVhbC1jb3JlIEFSTSBDb3J0ZXgtQTUzOgo+IEVhY2ggQ29ydGV4LUE1MyBjb3JlIGhhczoK
PiAgICAzMiBLQiBMMSBpbnN0cnVjdGlvbiBjYWNoZSwgMzIgS0IgTDEgZGF0YSBjYWNoZQo+IAo+
IFRoZSBDb3J0ZXgtQTUzIGNsdXN0ZXIgc2hhcmVzIGEgNTEyIEtCIHVuaWZpZWQgTDIgY2FjaGUu
Cj4gCj4gIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIENQVSBjYWNoZXMgYXJlIGEgY29yZSBmZWF0
dXJlIG9mIHRoZSBDUFUuCj4gRG8geW91IHRoaW5rIEkgc2hvdWxkIHVwZGF0ZSB0aGVzZSBwYXRj
aGVzIGFuZCByZXNlbmQgPwoKWWVzIHN1cmUsCgpOZWlsCgo+IAo+IFRoYW5rcwo+IC1BbmFuZAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
