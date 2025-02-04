Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C7AC0218F
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Feb 2025 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5BP5Y8KBzf0lQG07jpoQiPmOTLl8EfvH/w9rKOgWX4=; b=1WbW8Jx1f/QT3ZPed2B0hb62W1
	yQ5mrg2T0L3CPV/txBrHzD288PaSWWM5qwiTgGt7THbVwjyUiyzZM4wDigV9jSoy4KXhznR2K0Z/4
	kLq2xEHxDoI/lz+tvyDx17oIVgNaB1przGKqesu9ip+7lUi5uniqV7OXER/h0TFqO/gC9AaI3t7cy
	OzPzeyDv9PNKBIY/Iu9IduiHDqpazO1ZiOUzHLODhMtfPTJRlYqxIMPoU++KF20CPHuhf1by1ln5i
	DNGpGaVteqhYsRaJNrvDKvPChlYBsuYbkwtIKMsPHRLagQLsnjTWnz/J1+jHIs3dQoh0s6AP3AKnv
	5pY6MdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfE5r-0000000HVZb-0PPY;
	Tue, 04 Feb 2025 08:15:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfE4V-0000000HVRe-1tO4
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Feb 2025 08:14:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43690d4605dso35907135e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Feb 2025 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738656853; x=1739261653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sCR9UpdvPq54knP20h3bb4wqIzkXCrYqODJJrs8Hjo=;
        b=q7roPgp1MNBlV5W8dsUJcRY2op8qPQD+RUOpQQW2TpIukrcRBOtrxn6BnqaGWPyEFb
         5oy7gEHn87w/HWucLi/Sh3mEwHn+QkOlENZKcVAvtqybtcjbQ6Fp/yl/5rl1WRAEP8z3
         QWyUL4ZZgoGbC0FTgQATKedupKHK/z6HUiz2NdduwvfwkXjAqCAinbpg+pQnh8Fwqwtx
         +RI/kcnGzD6ubgXCpHaVk92tf5AuICUnzWpIh4+01GskP8xM+TxZ01GhkZBRp+zyJW43
         woomFwSJLecE1/ct+Kwcetk0sVEFM/Z5+rFMvoMegzcT3onbQotGdyjPBq+1dZKfGVVL
         VoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738656853; x=1739261653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8sCR9UpdvPq54knP20h3bb4wqIzkXCrYqODJJrs8Hjo=;
        b=RVatlI5jEfeNr1UV87cHR9p2XoqizqBLjzcOIYzhLKs0PDmIQRIMGTAK4J0RBm7S9b
         z/swsPkWgIXEOQXjzey0rHx14+Rs5/fc1kRSfmKXO3M6ZkPa7wU7u+GKxl1a6OTy9Yzh
         eHN2k4mmoEufPCmGQJPriPAwnB4v419W8j603yP1oBjsEWU9GGZ4ueOPLJUPwG6phUIz
         /fxQwhZWxoLMlm8lTu4mdy/V6JVRJgrLyMZY2vd6dkSt+WsjTnc3Iym8DwFGWTh4e5e0
         HwNOlIQIEF7Sm6iGnRdoiL1nZdxuY/qPGR9+9jIzaGgrhRF6yNY0o+2bLrJE6OaOUsZy
         adLg==
X-Forwarded-Encrypted: i=1; AJvYcCVBxt9/XQ+z4SB9DuSx33nI4coV33t0lxS/s0mkAQrUkUxaw0sZnyyusgVaiYVYzxldMvLeIN1ClA+Az9vx@lists.infradead.org
X-Gm-Message-State: AOJu0YyHs55YpermctF19Ma7T4ZPfiKcXgn7aZ/NXCWYiwVJUN2asS/a
	/XXOlQ8W8Zhvj2yXaK+7J1HOSQ19zkx/5u0JGHX5CHHF+Y0MuDcvkvOFe/jN+JE=
X-Gm-Gg: ASbGncu6CFKSG1vIFKf23WyvTI+Tfs1scAsXRUaNNN9YwSD9FRniDVmAnfF6Uc7Jerr
	FalsmqXcjUvM3ukr1Xl9XGJF3T++iRZjrbjJ9BfCZqa/vzl2u5nhjL8tP2KKmwPWwZEgaOriuTs
	29RI7vL1KJdk5Z+rPYwsu/dvcKZ0mnK6ENvegnaWdrifehUYL503I5lSI7rVkvj+YDHrbYVmT/b
	K4SQCdKorEmH4o43v5tNoM5MRfazfVmWgz4k6ZJccEF+lp0P10bO8f6qcLcXnlq11imShwy3/AQ
	k/SOLZxIEybZGYL5cGs7RuUTo69GdwyF4iiDrqcayF4bhkZ9rFhRjRFnO98P+KstGAbb
X-Google-Smtp-Source: AGHT+IG3tRoGmZu1OmIgYWpqEIVgV5wfqw0l/woeaKBkcCKJ2qcs0i4efob+omaMPGS57HdE6nfnIA==
X-Received: by 2002:a05:600c:3510:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438dc3af8c1mr200771315e9.6.1738656853012;
        Tue, 04 Feb 2025 00:14:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb? ([2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dac5a3e79sm900306f8f.63.2025.02.04.00.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 00:14:12 -0800 (PST)
Message-ID: <3ecf58f4-38c0-4435-899a-400df62f5d51@linaro.org>
Date: Tue, 4 Feb 2025 09:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: mmc: move compatible property to its
 specific binding
To: Dharma.B@microchip.com, robh@kernel.org, conor@kernel.org
Cc: ulf.hansson@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 martin.blumenstingl@googlemail.com
References: <20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com>
 <20241219-scenic-revision-17da9231d61a@spud>
 <91dfdd42-6ddb-490f-acda-41ce55782959@microchip.com>
 <CAFBinCCxZjuXL0duy3ePPDtL1oJS_GZiX3=djXpHR+-6gLkN_w@mail.gmail.com>
 <39be0bea-c207-4bcd-b464-ca93e91cec93@microchip.com>
 <CAFBinCAO0bpd7PXaVJWMby4Mqj1On5DaqNZua4V3gPUDms8=LA@mail.gmail.com>
 <779651f3-e5d4-4de8-878a-84653735e5cb@microchip.com>
 <f312c7ff-8d9b-4317-a75b-ce3d0f94a7ae@microchip.com>
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
In-Reply-To: <f312c7ff-8d9b-4317-a75b-ce3d0f94a7ae@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_001415_505293_DE4CA510 
X-CRM114-Status: GOOD (  15.81  )
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

SGksCgpPbiAwNC8wMi8yMDI1IDA1OjI0LCBEaGFybWEuQkBtaWNyb2NoaXAuY29tIHdyb3RlOgo+
IFJvYiAvIENvbm9yLAo+IAo+IE9uIDIwLzAxLzI1IDEwOjAwIGFtLCBEaGFybWEgQiB3cm90ZToK
Pj4gSGkgUm9iL0Nvbm9yLAo+Pgo+PiBPbiAwOS8wMS8yNSAyOjI2IGFtLCBNYXJ0aW4gQmx1bWVu
c3RpbmdsIHdyb3RlOgo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdwo+Pj4gdGhlIGNvbnRlbnQgaXMgc2FmZQo+
Pj4KPj4+IEhpIERoYXJtYSwKPj4+Cj4+PiBPbiBXZWQsIEphbiA4LCAyMDI1IGF0IDQ6MTHigK9B
TSA8RGhhcm1hLkJAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4+PiBbLi4uXQo+Pj4+ICJPbmUgaXNz
dWUgaXMgJ2NvbXBhdGlibGUnIGlzIHJlcXVpcmVkLiBFaXRoZXIgdGhhdCB3b3VsZCBoYXZlIHRv
IGJlCj4+Pj4gZHJvcHBlZCBhcyByZXF1aXJlZC4iCj4+Pj4KPj4+PiBJbnN0ZWFkIG9mIGp1c3Qg
ZHJvcHBpbmcgaXQgZnJvbSAicmVxdWlyZWQ6IiwgSSByZW1vdmVkIHRoZSBwcm9wZXJ0eQo+Pj4+
IGl0c2VsZiBhbmQgbW92ZWQgaXQgdG8gYW5vdGhlciBiaW5kaW5nLgo+Pj4+Cj4+Pj4gSSB3aWxs
IHNlbmQgYSB2MiBieSByZW1vdmluZyBpdCBmcm9tIHRoZSByZXF1aXJlZCwgd2lsbCBpdCBiZSBm
aW5lPwo+Pj4gRm9yIG1lIHRoaXMgaXMgZmluZS4KPj4+Cj4+PiBNeSB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgaWYgd2UgZHJvcCB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBjb21wbGV0ZWx5Cj4+PiB0
aGVuIGFueSBjb21wYXRpYmxlIHN0cmluZyB3aWxsIGJlIGFsbG93ZWQgKGZvciBleGFtcGxlOiBj
b21wYXRpYmxlID0KPj4+ICJyYW5kb20sbmFtZSIpLiBUaGlzIGlzIGJlY2F1c2UgbW1jLXNsb3Qu
eWFtbCBpbmhlcml0cyB0aGUgcHJvcGVydGllcwo+Pj4gZnJvbSBtbWMtY29udHJvbGxlci1jb21t
b24ueWFtbCB3aGljaCBpdHNlbGYgaGFzCj4+PiAiYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUi
Lgo+Pj4gSG93ZXZlciwgaWYgd2UgYWxsb3cgaXQgYnV0IG1ha2UgaXQgb3B0aW9uYWwgaXQgbWVh
bnMgdGhhdCB0aGVyZSdzCj4+PiBvbmx5IHR3byB2YWxpZCBzdGF0ZXM6Cj4+PiAtIG5vIGNvbXBh
dGlibGUgcHJvcGVydHkgKG9uIHRoZSBBdG1lbCAvIE1pY3JvY2hpcCBTb0NzKQo+Pj4gLSBhIGNv
bXBhdGlibGUgcHJvcGVydHkgd2l0aCB0aGUgdmFsdWUgIm1tYy1zbG90IiAoYXMgdXNlZCBvbiBB
bWxvZ2ljCj4+PiBNZXNvbiBhbmQgQ2F2aXVtIFRodW5kZXIgU29DcykKPj4+IC0gKGFueXRoaW5n
IGVsc2UgaXMgY29uc2lkZXJlZCBpbnZhbGlkKQo+Pj4KPj4+IFJvYiwgQ29ub3I6IGNhbiBjb25m
aXJtIHRoaXMgb3IgY29ycmVjdCBtZSB3aGVyZXZlciBJIGdvdCBzb21ldGhpbmcKPj4+IHdyb25n
Lgo+Pj4gSSBob3BlIHRoYXQgeW91ciBmZWVkYmFjayB3aWxsIGhlbHAgRGhhcm1hIHdyaXRlIGEg
Z29vZCBwYXRjaAo+Pj4gZGVzY3JpcHRpb24gZm9yIHYyLgo+Pgo+PiBTaGFsbCBJIHByb2NlZWQg
d2l0aCB2MiBieSBkcm9wcGluZyB0aGUgY29tcGF0aWJsZSBmcm9tIHRoZSByZXF1aXJlZAo+PiBw
cm9wZXJ0eSBsaXN0Pwo+IAo+IEkgaG9wZSB0aGlzIGVtYWlsIGZpbmRzIHlvdSB3ZWxsLiBKdXN0
IGZvbGxvd2luZyB1cCBvbiBteSBwcmV2aW91cwo+IG1lc3NhZ2UgZnJvbSAyMC8wMS8yNSwgYXMg
aXQgc2VlbXMgdG8gaGF2ZSBhY2hpZXZlZCBhbiBpbXByZXNzaXZlCj4gZmVhdOKAlHBlcmZlY3Qg
c3RlYWx0aCBtb2RlLiBFaXRoZXIgbXkgcGF0Y2ggaXMgc28gZmxhd2xlc3MgdGhhdCBpdCBsZWZ0
Cj4gZXZlcnlvbmUgc3BlZWNobGVzcywgb3IgaXQgaGFzIGJlZW4gc2lsZW50bHkgc2FjcmlmaWNl
ZCB0byB0aGUgaW5ib3gKPiBnb2RzLiDwn5iFCj4gCj4gSWYgdGhlcmUgYXJlIGFueSBjb25jZXJu
cywgZmVlZGJhY2ssIG9yIGEgc2VjcmV0IHJpdHVhbCBJIG5lZWQgdG8KPiBwZXJmb3JtIHRvIGdl
dCBhIHJlc3BvbnNlLCBwbGVhc2UgZG8gbGV0IG1lIGtub3cuIFdvdWxkIGxvdmUgdG8gaGVhcgo+
IHlvdXIgdGhvdWdodHMgd2hlbiB0aW1lIHBlcm1pdHMuCj4gCj4gTG9va2luZyBmb3J3YXJkIHRv
IGJyZWFraW5nIHRoZSByYWRpbyBzaWxlbmNlIQoKSnVzdCBzZW5kIGEgdjIgYXMgUkZDLCBzbyB3
ZSBjYW4gY29tbWVudCBvbiBpdC4KClRoYW5rcywKTmVpbAoKPj4KPj4+Cj4+Pgo+Pj4gQmVzdCBy
ZWdhcmRzLAo+Pj4gTWFydGluCj4+Pgo+Pgo+Pgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
