Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C8607150C
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSGJF6Ca;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NQkMKeUJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M0f3svfzkwY6vy00oOABksUaC1TuGDVRoI+cqaT3dgk=; b=CSGJF6CazMN3MwL3dDtAWgry18
	0UxA8BTvfWpH9tbeaX7qJV2+tzJZ3a6H9E7vQaCHH/R7LBh7GWFD6RM7CQSogSd6eDntc4rdknCkY
	jkwDW3FJFz0LNXPu3jCypfopWzEmEoeVOG7JzNHD3APYVGYicGQpUXbipvvCl/V1l2SHXTsdQ9lC8
	SP1ZTLygycFWlVQbQ3FzWf51/qzSdVntBI/Q52xVGsc2yttpv9R7V/ST3BqBFTh0AbrxE2qPIqlkk
	aIqklxpdxudWy8cocKnkk0a+23wPM4zEVhNGGVw3MZgsMWAWHb/S+/zM9exCbIpI/EtKtcIVVExaN
	3wHSPHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP4Z-00000002XK0-2KWR;
	Mon, 23 Nov 2026 08:06:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVP4W-00000002XIw-1ddQ
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 08:06:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso22487725e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795421199; x=1796025999; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
        b=NQkMKeUJa/UeJtgIeyE3B24SB2TE0ijLoSM4Zp7X9pFDPmduMQqKZLKf9Tfxs5cWBq
         wNLIqSt2aoH5mT7mfovwI1BeN9ps9aNWn7CBPQAs1cqU/PdDH8J0yxsWNho/H/FHUUk7
         8icIpjlHThc71VTIRopNaOz5t+AhXnedS704JQ95w2PQXfFAj/ARPKvVqg2d+bjXKLaO
         tJfCBaZDiR/ulq64KdGw8RQCknNGI1ztFrl6AUVD4TQInY4kFJVyyD7Rh9TYReGjuLgz
         I0NXYg5dHcmFnV31rP+WDQp4OZ8L5Xzb/KXYna4UmRNhVyj9fBqLtWyYt9lVKvDpaWAC
         xppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421199; x=1796025999;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
        b=DcPXNA6sG8Nid7+voKqlpB2gLog7+wePRDJdbkuZL318jObSwUXrihBuZWJ7m70Cet
         zbQMlsyqRZjt9vVrV0+saP68/vaQ/fEPRejvWHYwmEaAMevtuWSY+lbIp7FTY1iByKPM
         JWFXZUGG5O66MM1aZPrxVJfkek0eO8UY7DfNXZyZJRII4uDriuj4mNqQ7Mo6NWQXr+V0
         WpLv4/dN/Kt8pPYXuGkMg0t6YuQMt8KkeH2N0HSDKFbeVEYBcuZ4IxGcXt2aH/ktUfS9
         oD9UfqlEVHxhDRm2W8m56Ysgs6pZRlt1mxZuGsVAi0qkbVsoEmYCygiYtOBosOLUCS94
         ru3A==
X-Forwarded-Encrypted: i=1; AL+hErE2DxtWBXPWxBZdZaloGWDwVdG1xvnFGnyiniYhGOw9gv2e3qNr4cbtrbeicpeYCrVi4NEZNvYcOAs8v9cR@lists.infradead.org
X-Gm-Message-State: APuU4Z/c40/DqamezOE4hvEohpR9Pe4gfso4y0RocvTb4iCJUg+ej1iC
	8ZfLliJjlkza9rC5gaYfMKWjs1lKxDEoMjSkT/QxkPFXgvc/T6Bpx+v3E3kuC7Ik3S8=
X-Gm-Gg: AZFdTZdcDKMBHKqn3nZhYQOQ8zYVULBk7uyv07ZUbxEQwCTb2ebXgAtaaPBzLBIfaNj
	I4K3iPAZ17oiDp8i7ZNl28Em519QZXwQcR3U6f3Y0SYt6EHxY+xBhgoKH9eWrBoCEFFm8OY7FRy
	2eNnkE/YgYfeBBxDg13OJF24AMpv2wo+zjmxVdugJiStoYxezdbBNJ74trvQwRJ3eZ43QqfuALI
	Nh5Fcl/XRftchYn8+0ULJXbgKMmOWKIO/f4Av1jByrz49nLWZs4b1xDIezlK3g2O1AW3wm+hU1s
	p3olkZuDz4qTodiK3AbyfU1hmOb0fWDLAcLVE4/paqk8SglOznpfs7Pe73Pp16Pd5KbxwICz0OO
	teh0sdnRzN6uB/VOY8SVoM63ucFqPvAE+NDBaXgqKDyDwch5vETutS4xhasLoq3uuPGMBQWikdF
	nfIBi1IFf4lS28yidS+CtcqnoInJFX0F+TPnZyxqRKWED4urgi2Bcp42YA3N8kdLNw/bxjULtsR
	q8QbdaXmIJfRgpJU95Cijfr9abH9LEgoqPsbZFgIXFjL/SQGmb7zOHGPWIisTxZyaiMRsj/wuBX
	j08Y/pNrtrenLXbc5Ks/dLHvVhvNeU6QRubcj3ECRYydTNBl8indU0jCtdwETyTXwDeJbkDJxFT
	lP2FhshmL
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr161630505e9.10.1795421199031;
        Mon, 23 Nov 2026 00:06:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm360424565e9.8.2026.11.23.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:06:38 -0800 (PST)
Message-ID: <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Date: Mon, 23 Nov 2026 09:06:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX PHY
 binding
To: sashiko-reviews@lists.linux.dev,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
 <sashiko-outbox-227302@kernel.org>
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
In-Reply-To: <sashiko-outbox-227302@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_000644_466497_C112BF78 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/21/26 20:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: phy: amlogic: redundant word binding in commit
>    subject
> --
> 
> commit fbd4563b5cd10db3f75db052197f808e3b36bc55
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
> 
> This commit adds a Device Tree binding schema for the HDMI TX PHY found on
> Amlogic Meson GXBB, GXL, and G12A SoCs.
> 
>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
> 
> [Severity: Low]
> The dt-bindings: prefix already indicates that this patch adds a binding,
> so repeating "binding" at the end of the subject is redundant ("dt-bindings:
> phy: amlogic: Add Meson HDMI TX PHY").
> 

Use the "dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY"

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
