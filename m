Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C518AC282C5
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15IM315NThlv2+Ti++gQw1hZ+Ur7Zc6pqnDoCPYyys0=; b=yDf3r/hSBqwG18L4nydj7Ou9AD
	9wz2dP+OqnFPm4zbxBIccd/ZE+ozR2zNn+v/DVNui+2esCj0hk4PNkRXy0tqXDLe8sbx1XsIn3Hxh
	VJrZ45fK29YsOUKusckambAMQUMafDmtjAYW26XRsjbQM0vZ4ccCab01eEKFvlGRBfu+3u3ZtZgpH
	YFsAeJJs6nrv/ESBmzZJmkzkiIlUPYbWlzkuQ1uZz6lNQWtRsgbxrr8laF80S083KnncvOz8SV12t
	lQEB0AeMlAlCXQIVazTLJnS17qexKsr/erzCiTqAPJeY+UWg1AfdrP0qlsVQ3g3hmUzRYtV0gpirz
	fkhrdVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvjk-0000000ABaY-1vGL;
	Fri, 28 Feb 2025 08:28:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvdo-0000000AACk-04Yl
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 08:22:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso12655535e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740730958; x=1741335758; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWBUahnOFyPNyFGFF08VvduuyQVGQsvnK+/x+xqO5Lg=;
        b=nUIwBbfDkg/T6L3izHW6qk7NjXBFcYXXIFkh8GqB/FtEf3hZbQEHkVgooj06RREKjA
         vlCRFGlGnL83DUP7/at1sKpayJ3HbKnByYuGxezk0yMRWX3H5JID1w9feQvd2GTO4HFe
         EPN4K9KTI+idJkOveeXoLyzKOyplnB9Fqrhb9JDdiJpJQcvKjbukl3+XQF9znj3Pt7Uk
         YKAZkKYSZAfsrlkp8jiWsOMh/spcFi0zHtFLAIOGMAAnnQmpSrbIlOBfckzoQ+3Vq+39
         a6WperXGl8+V5gibvSqbgoRM+1im19jr2NV+qrJ8WwzM2+u2EZNoR506ZkA5ROTgTMbR
         NH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730958; x=1741335758;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RWBUahnOFyPNyFGFF08VvduuyQVGQsvnK+/x+xqO5Lg=;
        b=LlgCVEFkNEDHyyV5d2iVYGEd5EmFHn/j/+1CwjeTkoWKItK17bP8swE8zfruXCwEAN
         bu86apycIDopfnCwDV97BqMWFzihr90ZsPIt+Z+JTWlqnva22pFONsIHjtG2LA3OddBy
         mIPwIbPN82xyRqWluaoD973kkmxohabwW9QZFprTKKIRvdjJqMzHBM3NgsJ95Rg+sYNR
         TNCZtNWOsQwNN2fSf6S/VGTG0xIcbA+mLIX+cpHuGa/U9apu1E1kMUT93mcCtSaC2SYL
         GMY63LqdlxF0Hp7iiV4aQ47JzI+Egn0sFI4UTOOY4NG/hrRdZ7ze0OOPs1QpJaby2lOd
         Ri6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVREa3YZR1MWo938D0jmo7Xvsp85i0Nh2vb3IFO00TkTGQtB3LuELyxT7ppg1gFlilyCTqbOnQ1oxEsAG8Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyMDWUbkmFSFV7L8nMnvyHN+plYFjY2Kl6MJGIzsfLu0FEypX5F
	YlbGEq/V3jcWp5MCrgHPgAzwSQxxQFJx51Q9j0qPEoz02D4RSKmoanF4+avH7HM=
X-Gm-Gg: ASbGncuHN1rHEDr43QM2zmScl1tPBmiE+6njq0hboMfYgSI3P9ibMwEhblv2eIU7em/
	D/v+Tl8akE0zo69M/yaCazWoaXuiBKkoCyj3BSxM66XMW8CuXucR3tUIkbPEOmp5URfTJR4HGpI
	GBbs609MnmAxNzqPsfYKzaPLlaCIP8U6JduH00Cb5A9YVlgK78xZoXGGkoRfpMFpqFLDfdWgn9b
	CREe8cgw7gYFpKVjjzDChvJEQGaUkAwhTDqmAcK1hW/tW2jDajESygNKyY9o0t7/TuGGzzI5v2K
	rpZoiAtLtNxIfYeQAUIakLhDPrXwsYQpJoAK/vBQeuoEB2CouFh1n5/buxMs1d0UI0kqWR4z8HB
	i6vk=
X-Google-Smtp-Source: AGHT+IFyYei/dEAxk9MKfGVhD1RID7xVrL1ORWSm7J7H0FBPENv6nYFNGtp+2MRGC22AtVbDsUCCuw==
X-Received: by 2002:a5d:64a6:0:b0:38d:e304:7478 with SMTP id ffacd0b85a97d-390eca06cffmr2412164f8f.38.1740730957988;
        Fri, 28 Feb 2025 00:22:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c728:ed22:3bb8:f351? ([2a01:e0a:982:cbb0:c728:ed22:3bb8:f351])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7c43sm4383676f8f.49.2025.02.28.00.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 00:22:37 -0800 (PST)
Message-ID: <6d0bc02b-5a03-42ee-ad8c-d348b6ebab8d@linaro.org>
Date: Fri, 28 Feb 2025 09:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
To: Linus Walleij <linus.walleij@linaro.org>, xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
 <CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40khNZDdYb01-BGigw@mail.gmail.com>
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
In-Reply-To: <CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40khNZDdYb01-BGigw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_002240_085056_B1B4BFBF 
X-CRM114-Status: GOOD (  10.59  )
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

T24gMjgvMDIvMjAyNSAwMDowNywgTGludXMgV2FsbGVpaiB3cm90ZToKPiBIaSBYaWFud2VpLAo+
IAo+IEkgYXBwbGllZCBwYXRjaGVzIDEsIDIsIDMgYW5kIDUgdG8gdGhlIHBpbmN0cmwgdHJlZSBv
biB0aGlzCj4gaW1tdXRhYmxlIGJyYW5jaDoKPiBodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LXBpbmN0cmwuZ2l0L2xvZy8/aD1p
Yi1hbWxvZ2ljLWE0Cj4gCj4gT24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgNjoyNOKAr0FNIFhpYW53
ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21A
a2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4+ICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBhNDog
YWRkIHBpbmN0cmwgbm9kZQo+IAo+IFBsZWFzZSBmdW5uZWwgdGhpcyBwYXRjaCB0aHJvdWdoIHRo
ZSBTb0MgdHJlZS4KPiAKPiBJZiB0aGVyZSBhcmUgZGVwZW5kZW5jaWVzLCB0aGV5IGNhbiBiZSBw
dWxsZWQgaW4gZnJvbSB0aGUgaW1tdXRhYmxlCj4gYnJhbmNoLgoKVGhhbmtzIHB1bGxlZCB0aGUg
aW1tdXRhYmxlIGJyYW5jaCBhbmQgdGhlIHBhdGNoIDQuCgpOZWlsCgo+IAo+IFlvdXJzLAo+IExp
bnVzIFdhbGxlaWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
