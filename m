Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4237C61DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Aug 2026 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NRhwJOzPLIdiw06i3xCRPvoMbGn2zqVeqAJ+C3k9UQ=; b=evlvWtFrF38TKBJa2eqLXgbirJ
	27WgA7AmlWurPsvRTJdfFMjeNR8XcqPN0Oizim1GzcJqqfk/nfCKeT8U+eh/dV3EV+YLLT8zu4ix7
	rG5eYGPHUPqUGNSj1LqhAtWj7cPe/5zB8FoJosN1+u+9EYsxvjeQYKc/2Iw3jjqefAs43ik0D+b9M
	ff6EJqe7sylERdoOeQy9GJjzOkl6WJiK49kBKcZDzlzZ18WxW+L+ZrPGQlCBtG4PBGZa01QNbmCLL
	LsZQ1ks7yfr7spCr5Bit2Kg8dN6gW4fqiD2J300H3pXqwfxvnLqDEw7fgi7xAy1ygawGcZe07EPbk
	DMpUJCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0f9r-00000007iug-0Upp;
	Sun, 30 Aug 2026 13:01:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0f9o-00000007iu0-4AmT
	for linux-amlogic@lists.infradead.org;
	Sun, 30 Aug 2026 13:01:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so17891815e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Aug 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788094866; x=1788699666; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAfuZ7JluHHOG6+wKchV68mnIiwDxkUArIKVwzrSUYI=;
        b=Ibk5MVUt90jg2aai9qGRhaqBOSQ7ggN9yp13J4JVc3hW0f22uU3Jm2KfbkdDYk5O9K
         kJBbh7WEHdxE6/xl00oe7BbbPe19f9Q+DcD3fx0LCXYFpY5jCut0YlEu9ZiBuwYILNoe
         57hIYFiWPyo4FhJfYPfyj6A81JFyNn7xgEJFOxQG4EES2iHQe/6Z8t1AFCjoKJiNJ4n8
         MvYOX0mtAC+p9JG3e9FYlovncDWnsASKhzGI+FFCp+vi1IzXQIx9GGUBQN2kLcTznePS
         9ln6pkk/p9VgpKqgfvZ4/PcEGENlpBf+rSdaRol6Ba1Y51o6t6T6Oj+q/r99RUx5B+R0
         AJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094866; x=1788699666;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAfuZ7JluHHOG6+wKchV68mnIiwDxkUArIKVwzrSUYI=;
        b=WPEzObXmHvnQaZLqPtgHkH7xdjeJoEXk3omfh6WY9bDLtiIBSaFIDefDx/dgmnjUBj
         JVZVX1KuLYhpm6IthQWiQ83XoB7Sf+uH8IFuc4D90SQS4/2yrqeaWLNCpd+uYdLx00Ej
         Pz36NajrqlaqAliEYVAswpxcXOk7l/lPQpz6zUM2h2vtgkr6PUEOCah1QvibsPwbhCmO
         5jk5pa8jWHzRnxgNhWvWaeYI/cYdp9iicTT3S7wihiLgURkpj6f8Mq5yHZZjeVrbCrn/
         mRCD1wmjv1tX6mnNYpkIpFqnzeC2aeWQ0x/vtMATlNu1Zs9C4SSTRL7RO+sLsMDc7+fV
         mHHg==
X-Forwarded-Encrypted: i=1; AHgh+RoLy2AmEfOMwibFOoNEHOqpxhPdhskwGkl03/g4ooaJ5rfIV5i7GmUJ0CtoGldh/HG8E23PEV5+gIWFpnNc@lists.infradead.org
X-Gm-Message-State: AFuF++nfA86m4smwMylCWsHXS8ZaCKx1gP8g2Xx5SVbJQaqjJISf8+Py
	xsWy7xt9D8gC7mPVqA4uaqkBfylgXuow+DviAwF2dg54Ddsg3fduvyL4kX4+y2un/M8=
X-Gm-Gg: AR+sD10Rv0OEvJ9IbK6qqoFAOJD/1Ui9MKCZu+wmuNhzDE65Y9zCybUc602w6bPW1qc
	3UNOgRqBefuoMmMLNMmG3d3dJbWGY8WjX68YDSnSjWSfdfCKOfBw7auPGQxWtuCHRsyLxAuuBW5
	/S8+8Kc9rXgZKaokYkuSlIfuRvAQrzCbcSJTR4QhIruZE9i8IgvMcLD8EPpMAucq/hkRJuyWaWO
	b9lnrAtnw65T9xBGWSYiDepyoADnzp5aURUO2EFX0hEFz7emPXsAP/8RSHG/TN+yGGixigrXYW8
	rHRFqfqmyodkPY6iwoV6GwdKo1LRj4kpQl9PqAj+5CO5zvGqWmAacrmUhL9WvbcA0DaTAMA7j5T
	oqeAnSN1HYetzlgqdtNyajYgjCHt64OvBX41sicX+JIYB+2bAUDZJ4i2QgCftGIREg8J6ivM2bs
	pmJ22U+/96VkKc+iAu/4lqs7FSdFVOWINxcTFffQZdw87nBzDANJkfOFN1hFtZi2RGt/gn7kM=
X-Received: by 2002:a05:600c:3f0c:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ccedff89amr119461615e9.16.1788094865580;
        Sun, 30 Aug 2026 06:01:05 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm81979695e9.2.2026.08.30.06.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:01:04 -0700 (PDT)
Message-ID: <d7380972-d54b-4162-84d1-b377d4cf2189@linaro.org>
Date: Sun, 30 Aug 2026 15:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with tabs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_060109_076213_3A039925 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 8/29/26 21:39, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                 | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
