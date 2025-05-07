Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEEFC3ABBF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 May 2025 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcFI6Ck1RTWbdvGQOwZoictcQysEP5J4CNHpq+IrxfQ=; b=gOep1eUcEYQezSt0f+PQs7rhmR
	6cdTFzqf9cXiJ3uL6y017XB/DtxRhy+evdnZ8ebXxAIt+3AmXUpSB6PrZjeeARd9fRzB816sF6nFf
	QYIMNEJCdbSxEyDLmk+EQuTMXtYatJVx129WJtRSESFMZS1QThpQ9gRHFySpxtYzOsEnd3ziHEyyO
	gee+EkcUAvmTrvI/jB9JneBVL1Q+aVXBZuEzxFdNr5LGWCR3tnCmUsGshZ45vIGDjLpUpSdzb+SvU
	SVGo33ESo/a/BYUo+3BS2rYbx9IigITox3t6+TY4McbFAS4r2zHvel/WbY1NZ9srPSnuO5mBk6vW+
	vVMgpJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdWv-0000000FJHh-3hVZ;
	Wed, 07 May 2025 12:05:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdT8-0000000FIS2-2zZ3
	for linux-amlogic@lists.infradead.org;
	Wed, 07 May 2025 12:01:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf848528aso51777825e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 May 2025 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746619304; x=1747224104; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/EZs/5P3xPz8a1FS8ijckX7N7lrxVsTDArOdHFDVOU=;
        b=IkGAC/1NtD/6Hwk3yCf7lhfqP23DrHaSb+34zZ3ag/MmZoFadfSL6UEW8knxjzyzL0
         IP8Az2wVaQ+13y3I4hJnt83Ap1dXpzZQAl2cSWkfSu0R+hrsV0h+2DkUEeapB+vcLHFS
         +bRgP6V09JYvy+bSi5kL87MqoalXRnqjLcYmHbW1fJwKPVeBHdCSH5o8/2V8GiNgeLMQ
         JTGfzHXwy9TwdEpFADdEYR/ir3IJ0DuIG2JK35pkbvsBXHBAcmamLeoeNrkuS6HzheII
         Xf3DoK5zT557kW2kMkt1i2LkH9gggkUm6RoIlAFc1vXtk9SF2r5F8XeOmfHBLWfPx/KF
         vgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619304; x=1747224104;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5/EZs/5P3xPz8a1FS8ijckX7N7lrxVsTDArOdHFDVOU=;
        b=e7RVldfBz/ocflnpoq407VLVppq50zWZpCfgjJnqxF6Q0IuUXZLjYcrz9CIhgOlq9m
         KZOo8RJfBJ1NG0KnLwUdKAaNVvdgntlk+gQXedw0S4ASFfSgQ8zXER5GsMl1yaR4+3Kd
         dvgKsVpuAiEo15+swUnrM6b4Rxi6Z0KDY6ZnLTuu9GpVnrObjIcmIbHXonGY8WDk5h0D
         l/V9FFKQ0p0f0UqSMg5kDoEei7BucuDc4d4ZuOUxJ2agl4GO2wRcR5iq4gHocuUjPMci
         3CPAX8ZN+BxhK+r6F3uDDpEQzQrrzPTQtcqVzf+8lgj7zXrENsaMjkfyB9WeGoscIG4l
         cAbg==
X-Forwarded-Encrypted: i=1; AJvYcCUj4PWSJnQJgZ4M6sjtA0kAPKz1+paOy+WqhYZojyZg/fqwbTRTurVziF22Gf+0GpwdfNburc1C0WMcEZOm@lists.infradead.org
X-Gm-Message-State: AOJu0YwjMmgezJIjcdqa8zQ78DNJ+YYUL/WYr/usq1mOiBIp98hiWE9w
	yvPJMSS1zOdVRxb96lfSwKXVORIKi1kcR8BngSRE/aD72boV/6O/nMtKBwmRLxY=
X-Gm-Gg: ASbGncvMfinhjuM/Lok9+9v2jvjN/iM02oUHWV/FfpFTBbdm89Mjh1Y9CM/0bHa/uM+
	O0pt4gYzKiD46K5jGVZZs0ef1eZ/t0oMiwFvUC/53ntsUskNn3jYwuhkXo6YE7crbND7UGfIfx1
	aAGEOxdrn+9Oh8IDHw4LJsLWz25P4+co+evf9lPFbJ+ixDyhhpi+sY+gM4SONIGTqf6zrflTb3t
	CNmKecXbyeYXLm4wVHL3Ru1WpcqMNTU570hFn2+X8oVjPOsZFu7+YBoBQKk857DZyKU1J/6PwTV
	itqg2/hZivVbEqxoEXFIzxmcWXArOBHeNDvyHW25Snc/05XAatnh4cwm9NoxZ1pjdUo7JOhXrrj
	m3Yobc3cz023OAx/Vgg==
X-Google-Smtp-Source: AGHT+IEm9H6jOdRU5tvuHDlvV9wm5h68WGhM78RvTo/EH/a9N5+wvGGtt8QPEz87ONNk1Kif6Dl5ZA==
X-Received: by 2002:a05:600c:1e24:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-441d44c7d80mr23917915e9.19.1746619304392;
        Wed, 07 May 2025 05:01:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:784f:3312:6406:12a9? ([2a01:e0a:3d9:2080:784f:3312:6406:12a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d441559dsm29877735e9.34.2025.05.07.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 05:01:43 -0700 (PDT)
Message-ID: <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org>
Date: Wed, 7 May 2025 14:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: Odroid n2+ usb broken on reboot
To: Wayne Schroeder <raz@chewies.net>
Cc: u-boot@lists.denx.de, "u-boot-amlogic@groups.io"
 <u-boot-amlogic@groups.io>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org>
 <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
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
In-Reply-To: <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_050146_751620_94DED845 
X-CRM114-Status: UNSURE (   8.12  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDUvMDUvMjAyNSAxNToxMiwgV2F5bmUgU2Nocm9lZGVyIHdyb3RlOgo+IElmIEkgYWRkIHRo
ZSB1c2IgcmVzZXQgY29tbWFuZCwgaXQgd29ya3MgcmVsaWFibHkgYXQgcmVib290LCBidXQgaXQK
PiBkb2VzIG5vdCB3b3JrIG9uIGEgZnJlc2ggcG93ZXItdXAgd2l0aCB0aGF0IGNoYW5nZS4KCk9L
IHRoaXMgbWVhbnMgdGhlcmUncyBhIGRhbmdsaW5nIHJlc291cmNlLCBEb2VzIFVTQiBhbHdheXMg
d29yayB3aXRoaW4KVS1Cb290IG9yIGl0IGJyZWFrcyBVLUJvb3QgYW5kIExpbnV4IGluIHRob3Nl
IGNhc2VzID8KCj4gCj4gCj4gT24gTW9uLCBNYXkgNSwgMjAyNSBhdCAyOjA34oCvQU0gPG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+PiBJIHRoaW5rIGl0J3MgYSB2ZXJ5IGxv
bmcgdGVybSBpc3N1ZSwgVVNCIGxhY2tzIGEgcHJvcGVyIHJlc2V0IGF0IHByb2JlIG9uCj4+IHdh
cm0gcmVzZXQsIGRvZXMgVVNCIHN0aWxsIHdvcmsgZnJvbSBVLUJvb3QgYWZ0ZXIgdGhlIHJlYm9v
dCA/Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
