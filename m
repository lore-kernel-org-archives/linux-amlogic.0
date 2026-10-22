Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E76606A319
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WAKgZjx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nzZDXdBw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=faFct8rJJI/pVL9L3U+3Y18KWKSyeGkbGyf3AwOXb54=; b=4WAKgZjxqiYdJ2M1UB1WHeoQ7+
	nAzmaeB3j/kqbp2dovXR2lgUlNsAkFH5Sn+9LzgVbraV43FzxclC8eADszcoKTZn9HbUA9mNVimjO
	xzMf7K4dDID/h3jpjLcZoEy1mPZFGpigsJJBo4atweDCNr7QtLPpKcykup9907Bx3ApD4cM5LU45E
	rMYiECl8OBHjphczrmSxv77gS8C1gMeisHKov+QvVsRN7r+yCXhTf/2tYK/4jzGaIdwsqk8s5JggI
	+vsPH0t1CtSp/14gP5AqJH3SUfcn54C9YYq2oQSiRdpP1LYiz4etLrCEijMmJgI5FmNvXOiUlDXYf
	k9VUss+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvfn-0000000EUf9-3iJZ;
	Thu, 22 Oct 2026 16:29:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvfl-0000000EUe7-0j31
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 16:29:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so22260885e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792686582; x=1793291382; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkJ+Hvopv5+q0wZYLQ8lIJJt9XgBmk76/q4ZT67Wlao=;
        b=nzZDXdBwU7blX1z/+kjk4sFf/K8TRLYuroeXvofrXXKA8jYksGLZQXjhaMy3t/aluM
         k4prQ127SQKHS1oDsdDD/vnhBYpL+XTS2ZR1tyZiNxad2xt6ZYCH+Ldu897vSG0mCrNM
         gGP1RloBWdUuQ2ZqEGFD2VQxEAzxpvxMWXwmpsiSir0lXSVoGJyN4X+UhwgRMOtXGSRr
         1ON0/FC07UbN51W9ZQ7YJcG27tVPHHvvknwAt3TR2qSvL4fOx75r/1WLBQPV8t+Z9oHE
         fat2I3nvNz0TT68j7J5G+sFdif3GBUomILKv3La5LZq/xjssqIp+0jkuVEDxcgalvMW6
         d80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686582; x=1793291382;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkJ+Hvopv5+q0wZYLQ8lIJJt9XgBmk76/q4ZT67Wlao=;
        b=WVYsgs2IFf0xKvSXErCfTQizLxLK7A8XwxGMk1uQl7BKTEtinI2skC3YPvmPcmi0k4
         vesdkUOVNAaFf0fexdF3LeyaQwNLqZYnIvSaHlg7XKHqRPEVablsZL8PQrEOy9lNXvnB
         nc3V94uZ8KxYXr1jwlzFbFHedpDTrGWj4+qE/g/dya/F8kIp0yX7ncKt13/rHUPlsEz3
         63Gdovq/AZzCLYc4b3jAuDDURfVHuIRUbB99DW8Urq8huuOfQeXAUGVGdE+sA4V8HJDI
         uyjeCRKFPXwDlu43OSniQKSjVT6JRWL4QXTl4UCDaSr3N3Fk9s+9GEw0IvFPdUMdeveg
         x7nw==
X-Forwarded-Encrypted: i=1; AKwUvBxBwufMLrpFAZ+bWMUtCYVLLgEtkmO74YX3VsIquKMVAcXF3oVFK+5WZm9fZ2cidy7E5tCs4QS2pgdQSBbi@lists.infradead.org
X-Gm-Message-State: AFq9FYIP8W2nhj7Lk9sd/KgrmkSx52ZJj5SZs8OWhUKKWo/5aMioVoKs
	/Q8jKoroJcvaP+m4zkurpsRangKuiPcW8umrXiWurZWo3IO8EPunJvIkRX9megCqZpo=
X-Gm-Gg: AYBFou1+zE82+KLaFVBas2tWBY14jc7V4DU9R+zh+Ysm3edSciQ9TPVRuv/iIQmHqRV
	jFh1yJSwngVcyK21oOmGEnQPibI44Dz5ImE/2v5rzxObK5cVNKcjoJABmohr7vLrhQvrPABKxwF
	MBGpUwvcew+DwdTRYh2JObs1woYF5YhjhnmxUIfrxsqnh3b+gxJJdo9hGeJZ4NhDFDNdBrwbsII
	uaXPDua1gw/5cGazrA4Hwu0fdVE7sQEDAGJUmVlyFZ78WMkxX5yJh9W5PwTbD9OUZj8bLuaHnhf
	v1Qb/0INxcPt6zHOXJfag8TPH+ey6VgVjmLUI76QKcEr1/Gi/IWhXBmiwsUtTnSptlZr09FaAOK
	WcpRGSirNiwhIquu4bVzvHeulKZzjh8evX4Mtz53QksJ04h1E/RzllItLkgMl2Li1czGCSV/l8H
	oDTocJ1zJ1gp5kc4itxrxufT2PVFeoIQTpDzfLJ7l+RnQbqiVHjGgst/OOaUb5VL1bI9eo+e/Z9
	LlW9lbzE8vErAPUrL+W91USR8UP13SxPeVhgWvUS0veaWhf0yDZ/Xn6/M/j4udWWBYC1bMC3lmw
	ErbtNa0ZMIYoC8h9CIyHPDDidUPVmDwsK1c=
X-Received: by 2002:a05:600c:3115:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a1fdaf7457mr119190055e9.9.1792686582353;
        Thu, 22 Oct 2026 09:29:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:211e:45da:8a88:2665? ([2a01:cb1c:fcf:4600:211e:45da:8a88:2665])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21046b92esm6567865e9.10.2026.10.22.09.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:29:41 -0700 (PDT)
Message-ID: <cc5fc382-a628-49b7-a15f-355180c10312@linaro.org>
Date: Thu, 22 Oct 2026 18:29:41 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic Meson
 SoC CLOCK FRAMEWORK
To: Carlo Caione <ccaione@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
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
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_092945_262458_5F717137 
X-CRM114-Status: GOOD (  13.84  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 17:57, Carlo Caione wrote:
> The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
> GXBB and Meson8 headers were the only clock headers, and only the A1
> ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
> and T7 clock controllers in include/dt-bindings/clock/ are not covered,
> so ./scripts/get_maintainer.pl does not return this section for them.
> 
> Match every amlogic,* clock header, and the axg* and g12a* ones.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..e5bda99b3015 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2555,7 +2555,9 @@ L:	linux-amlogic@lists.infradead.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/clock/amlogic*
>   F:	drivers/clk/meson/
> -F:	include/dt-bindings/clock/amlogic,a1*
> +F:	include/dt-bindings/clock/amlogic,*
> +F:	include/dt-bindings/clock/axg*
> +F:	include/dt-bindings/clock/g12a*
>   F:	include/dt-bindings/clock/gxbb*
>   F:	include/dt-bindings/clock/meson*
>   
> 
> ---
> base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
> change-id: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a
> 
> Best regards,
> --
> Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
