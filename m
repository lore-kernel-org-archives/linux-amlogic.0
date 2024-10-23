Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F901D2E022
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2024 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIn5LRW54x4/KIKZ94/LygIH7xtWtTST8cdagfxbz1I=; b=CjbDumJXIy+5F7Se8N5zwspb4t
	MyN1rhVNfd5iC+kgmjXgbUW+w+KgesQPIAQ0E+n1tZ0LWO8CV+8xmN2ozFN3bV3kuqIDsrC7TEOyb
	9vQeY+G0QjXFife9UVg4bsAt1tka/MR8SVZhmeM3BeaOd60toNKIc2lULA081a6ag07eDvMgpRuWy
	6NgXqVP83awDmfSiHDxxoJ8KtUKgh/xrGJRqlnOAYbRtRzDOKwL7bPLHh0p64EVG7CSpnvCdrFl8W
	wOHW6MkFEdpYwEFcoURVck25VHXFaNjBkeiWh5u4ubP1Q0X5zkp/oHKZteJO0PKWnOB4pKhz7VoZh
	XQbBcIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WlJ-0000000DZVC-2VW1;
	Wed, 23 Oct 2024 08:30:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wde-0000000DY4A-3qLq
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Oct 2024 08:22:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d47eff9acso4443639f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Oct 2024 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729671760; x=1730276560; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZeibUM7HddfM+a+Ry1X+LSQiHn1Kf3JGuVfKpMjSxE=;
        b=sSWgpuVtk1xBOIscuQwDpHBKP0JeYfziFFCvut0FzfqVcgHoT5bSSmH8qtv6kCbBUQ
         PF1apRkUCtB8LxR3OcIwN3S5AKL/ivtZ/PLPUG+AKV0rufI+0T1ETZ+L9sNU4+z2AehD
         qC4t8z1a7kzaBa9NUX/sb66awSBNYJrfR2+xWg2N8sRtgJMI7gHrQhUzUVCXvQFxRVBI
         FJql4LFkNjz9zQDj5BzyRzUKmVGWqKtV0QsVjxAYb6gy2iyw/DdWrKypQPArFV3I6h2h
         CLDfhmEeNdsVSo/pwAHF+6Ui4wvBPbPpfvGbNc7+H/v8sT6RBxD86fB3bvaKxMzQj7Q4
         bG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729671760; x=1730276560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GZeibUM7HddfM+a+Ry1X+LSQiHn1Kf3JGuVfKpMjSxE=;
        b=JQzyf/3HOuhpa5DriSuZaaHa4tzxxrBvDWT7G+vC/+pE9LYY6YK+E6ilycrIASQJJ5
         6zCmzmTRIVbALP4PUm5Rmqk4BxrK5ebyujLEqPhB3UjLmIbTTmpFZmUrikPJ8uVpvm8/
         IquNzl7xJ6HHTIMZuwwhGSQyperNG9J5BgK7cZZEtbwwttbDVQgTWcmNmJnVIDxr0E+4
         qAJ3Gekf1WisVw0TPRVLJFb/rGK9fkTDE+nj4vZQd/loVO4qyTw0MI1XO0mgas3gMTRW
         3HGF3AljMKcE2D0YnoDxqBpQiTpzIi2Lg7JXIFm1MIxj3G0odxZ5uGYnDGtZq4SlXaNf
         QQ8Q==
X-Gm-Message-State: AOJu0YyUPC00GrAo93Cp5A1PuApQiBIYic+9YjId9wP+TM6tqQhrDUUD
	L5U8TeW0qWC0j6lPVcfD4ECJ/JplvrLNd0VOCb3MsbSK9lsSjH5/ZSFT9vJvMj5MM4eP3ZCXK6j
	RFfU=
X-Google-Smtp-Source: AGHT+IENH/k2ADAWYi431Yq0XGAAwC9n/nPgRYEvT4VTXEtu2gQLKA1M0/o5QAibMZ58KnjtJDENzA==
X-Received: by 2002:a05:6000:d08:b0:37d:446b:7dfa with SMTP id ffacd0b85a97d-37efcf7ebd9mr1023484f8f.39.1729671760580;
        Wed, 23 Oct 2024 01:22:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f9e2:19d:5b22:8044? ([2a01:e0a:cad:2140:f9e2:19d:5b22:8044])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb15sm8377768f8f.99.2024.10.23.01.22.39
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 01:22:40 -0700 (PDT)
Message-ID: <40c07e23-0784-4bcd-8da6-485866e81425@linaro.org>
Date: Wed, 23 Oct 2024 10:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: meson: Enabling full-range HDMI output
To: linux-amlogic@lists.infradead.org
References: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
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
In-Reply-To: <CAN-StX2faaw60pUqRcDtHgrovWYFsM+PGDDAhU8wbT6aeDQKwg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_012243_025690_6E066A27 
X-CRM114-Status: GOOD (  15.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 23/10/2024 10:00, Francisco Ayala Le Brun wrote:
> Hello,
> 
> I am seeking some guidance regarding enabling full-range HDMI output.
> Specifically, I am wondering which component in the video pipeline
> could be clamping HDMI output values to 16-235? Further details
> follow:
> 
> I have been trying to get full-range HDMI output from a Le Potato
> s905x SBC. At the moment, HDMI output seems to be hard-coded to color
> quantization limited range (16-235). This greatly diminishes the
> contrast in full range displays.
> 
> So far setting the VIU_OSD1/2_FULL_RANGE bit in the
> VIU_OSD1/2_CTRL_STAT2 register does not seem to work. I have also
> looked at the color space conversion matrix in dw_hdmi in case that is
> the culprit, but the values seem fine and setting that to zero does
> produce a signal in the full range (0). The buffer from the VIU is
> using a YUV format so dw_hdmi is not using the full to limited range
> conversion matrix.

Indeed the internal VPU pipeline is in 10bit YUV444, so it requires enabling
the dw-hdmi CSC, so perhaps those are not designed to output full-range RGB ?

Could you revert:
d3d6b1bf85ae drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420

This would give you direct YUV444 HDMI output without CSC involved, reverting
is not an options because of low-cost HDMI panels lying in their EDID
and not really supporting YUV HDMI...

So if the original YUV is in full range, the culprit is in the DW-HDMI CSC
table.

Neil

> 
> Thank you in advance,
> Francisco
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
