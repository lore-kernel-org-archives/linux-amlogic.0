Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7A606A320
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LaOrdL4v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XC7+K9EB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aBBqhdgYO2bwbpzUhJYdh6HscUAr5X6XT5ATxtY7UOs=; b=LaOrdL4vSiqZ8XSDGa0ObmcC0h
	Jx+OPc1atPXT+iRbdoKVuq1LMoteXEmcLdfA49feMvh93uPIG64FZw4qzCoi1U/Cw8U0V8qCkm4Yk
	HoOMZHB4kxtn7LGvwb9bUPqbShjhPVgf5v73/0RMnI/xavd1Gz/A8U462q9lrpAWvEnlmwjcKu3f9
	GAid4hJ092E42AsIQY7lm95phrK/2HKYtdxLyZNI6XeBNM5umzkUhJGIlWdU68pxMEtnmtzTTh3VI
	osNrnW2yxGlBvfdTXA68cQjI86oo+XRqxX9FygbbwpIVuuruTPSIrBMVkk71SK8Yyb5ACOJmBDib3
	KKhqdIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTerx-00000008rcj-2B1e;
	Wed, 18 Nov 2026 12:34:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTert-00000008rar-3AVh
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 12:34:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so6434395e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005267; x=1795610067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=XC7+K9EBaKh+ccMK0KciS+vGQsu3wQ+5Fimfqj5vStBkSqwEK5FSzwQbtEEPoA/X6E
         1u9Sec2FtDMQQ4UEilthe+IetRaGnBaKF0y345OYzyaY91gGaPd+fvHNkamGmRjshL6D
         04dbnyINZ876d5h4NE0qDDryXDWPd8lepRJG7iR8RTmr75pfmEMs51VgFOYV4AuhMZQB
         ksfmjXlCZzSgM3cvYv0U5QBJdQxnM5wEaf+6NfTzSdP5HmReCznnU+XTlJL1C7CpOBEb
         uFpWMS71DsxZ9qCzX6WkQihoLQeiW7cOAzYalx1ElziWX2sL6MK2zp3Uhxv7Bcmf6R4D
         G+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005267; x=1795610067;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=BdTZD+1oSUkNeJbMWBT3JbZIHHLpavUk5vnW2/xEKaITIQF6zIIoTB79JX0O6krjMj
         vGuBQyllovU/Ng1yPmZ/y/JAY5MJDwk+YTsBMOa/UAH7CPAVcGR/JUmZKxCMxAyiZWkP
         Rl+CfDbqTzhNA5cYGVEUllq8LYd/tTB8YAi1Ibi2P1XZrhEZDOFLJ3joZ+WSQTCLHpNo
         tO37bpMBDPUVuHe6BYT/YlI+/C9Pb/iJHl2BUVaM6VFc9LDJ2oAtvAWYsnEvxdK7Pbfo
         PPP0ZQ1CDPxV859+frIVLff6uozFCNsubTnbykaUy5LNU9cnU/aAjXfzDSB+x7oZQjLG
         xczg==
X-Forwarded-Encrypted: i=1; AL+hErEJvzDZr6yoVtcXQSB5YQl/wmgYJzvc0SwKjA4ZMKSjAaPFYn//x+wigJLq3hik5VPzk0y8zeYiYDK01KKH@lists.infradead.org
X-Gm-Message-State: APuU4Z/StEolXwccJuXfMpM3Zt5Yk+ArPCor+pLCzUNHNN5BXupfJwmo
	WqMKd2wjKweDVPQyiksdqVFhMkh1adMdtk2iiniZE/XQWBMvHTDGQgLT6rto9vVyGMs=
X-Gm-Gg: AYBFou2zhn9lbeZmUAUW0ggsE6zWa8dAfald5wIbtbt1hSjopFsF0NZUXHEpm6yyj/b
	w2hxw+hHONMcXiWfiwkQADFYNNLi7SpxwBeAINyzIDVYHhLL6CHUEv3dTaLA0uli6srQrsKLTUZ
	7pdmJ+6VwUwZsy7Dv12UHEBabib4y81nGLz/RkvR4AX9eIDOgLhHlx3Md6mqLKEwOrJ/0VZYox3
	liUo0Ya0BtnsefWTYQ2zyP7vkRULhYgIGBb222vTE0Y9eM+BFxgF5//8R4Iy96CV2rUrMBg+dYP
	G/xuq2sP6zFcyErzBoJ8BPj/EhdNe3qd6XyU2smQ2V9PBNqJD1JarUykwEvhAL122lt0CtNjGAP
	/AAUjcyZGda4tU8DpJepznD/ctvWtibhG09I3idkg94+kLxfTD0oO4iJ8RIl/USQmrR8J6XhX6e
	LNA3crLz/3UUb/C5KhXdfumAlsHNKfQycgccb9dHT8FC5mPdNUhTVFlm9AtNuH791zxi2RS59n4
	ZcN+XioPUTVd8STizVSsGG/bYIVA+mnavSobGI2n9vFWu+etCjeWDQuse6Kcv0F2E8JXBXnEitf
	Xm1M98pFPQeIyTHP9gWH2DUlBiC58aBWramKHXyrsLULbZWxhba9sNGwsiHDfkLlQei2p5tZqvG
	TmuZrbmkS
X-Received: by 2002:a05:600c:1d06:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb7da25158mr46260185e9.18.1795005266845;
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57664esm26749835e9.1.2026.11.18.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Message-ID: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Date: Wed, 18 Nov 2026 13:34:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
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
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_043430_036240_97387671 
X-CRM114-Status: GOOD (  15.32  )
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

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The HDMI TX PHY now has its own binding and driver. Describe the link
> between the HDMI TX controller and its PHY with a "phys" property
> holding a single phandle, named "hdmi" through "phy-names", and update
> the example accordingly.
> 
> The properties are optional so that existing DT, which do not describe
> the PHY, keep validating; the driver falls back to creating the PHY
> itself in that case.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index 416fe263ac92..5a033fec21b0 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -108,6 +108,12 @@ properties:
>   
>     sound-name-prefix: true
>   
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: hdmi

I don't think phys-name is necessary here.

Neil

> +
>   required:
>     - compatible
>     - reg
> @@ -136,6 +142,8 @@ examples:
>           power-domains = <&pd_vpu>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> +        phys = <&hdmi_tx_phy>;
> +        phy-names = "hdmi";
>   
>           /* VPU VENC Input */
>           hdmi_tx_venc_port: port@0 {
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
