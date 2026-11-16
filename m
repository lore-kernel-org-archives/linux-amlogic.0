Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A7606A323
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kiuOwxq1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kvJGMwdE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xcHX6CL0RyMc46hpP6fW1vAEOsK/mxMSEzej9VC0zso=; b=kiuOwxq1pYamv7shR1K0VeiECo
	g9yAH/9pje7/AwAoIunPDpZ0/vjTLKEvE6t59LB+b6Sc+8jeKf93qYk+gemH5NlPIjO7a//u/eZUX
	2oBV4gTn7nvwm5FUaOKHz5n/xP9IUuZqZ+4dLchxVmDzSX2SK/IAbS2j64+q5ZEnBTxxfnyecXAQs
	qKQOXM6wQnE/X0xbGR9+ehMAzQdKolqKwB8ySMZ2tLDx4fm1rm3giMbK3EmBQmXn92SiVQqv8yzeE
	1Fw/LOVk5+HpWySqkr/X56K8MmxQF+iQJJma/CKFjfAjobbd4Z3dFPqy+L9URShpATUBl2JmqwJ5S
	HJY+y9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVn-00000001sCw-1Vgr;
	Mon, 16 Nov 2026 10:00:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStVg-00000001s98-1k4F
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 10:00:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso19114595e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2026 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823222; x=1795428022; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=kvJGMwdEzbrcYijvZ6vYnDj3zqW/0FptPO/Hqbu43z4tL9BKra5JG7TdTeNS+sBvaw
         p/FQxyI995yC4ZJD0J4AJaAH24OEfTKPAap8DLYbPncKBfbInNuYJ2MpAdHiJo7jZEaf
         oMdjiwfzNd1hE446gJbVV1mpX/ubBbVZ9oHv0q+9ZBphZdX+A5Qw7z8oyl9OigYtOEp1
         JQ8aGJTBOtBcKwElO/TcN1ts2icyOcKL9KEaoSlzaC0o2qdXCZRlJf9uPMYkHAU1Ayj9
         Etj3p9CNmdubIgg75WmeFnGlMHXEAdaifdtFc/AzwwXod69EkTlUh7G8Mj7cek+Yng8Y
         aklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823222; x=1795428022;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=ME1R47LhJlZeMeaNhTYDqsjsYAbtEGWIqDvN7RCV/dAWNk2vDErv+/wHqBhUrvMh7k
         uGVAxDER9YbdcbTCjmg+gsKThi/8KCSz9cHVdfDSHgqN4MCYj4NVKNnljD1bba3OkzZR
         ijoWDpjF6oXD5Im2PLNoodopEwX2ASjVlggTIBepoysZzW9dLhigx5Ehy+KyOJ0D8w0k
         PxGY16oAgqN+V9TDBssSDdTGKZ9//ykrosmr4U12SWMe8swZw5Uwb57PEBdna0uzoq2L
         MPBTWnOY4ru/hYU7bNuLL2R6PTSwGwyeGWSQdaqeIAXsh8Bc7VJqST2GNrhD0VC1YAP1
         gbgQ==
X-Forwarded-Encrypted: i=1; AL+hErGfkbdDSb37Xul1S6PrHJOMBX+c0q5/iKJIhE3ENP2o67qJlFlvHIyT3jYFZjpzgJAauAtwOHDQVlUhWIBN@lists.infradead.org
X-Gm-Message-State: APuU4Z9FXD/SXhlc3O2uUCwb6J+fNYsxe113BTu/nrD76cK/YO4MWTl1
	BJmu/3Jaamx5pzeUJNbBH9xB+fHVJXZ0QZfONOEJY1G3R10LGmb9n4eT/f5uQLlZeg0=
X-Gm-Gg: AYBFou3f8bawU1gHkYDFyvICQqGFbDrI+tk1RfGnLp/eVqBANNfcXlx5NglAz82lB4t
	bQ18STqZvmC/lSMzMfQB8WKLCH1eN2HtW/8fYcyKiG2KInDBq6ITgQP1fUQ87478CbIJj7pNhPb
	LZERQi9W1HcvnQVSETCLBeTrp4lvC8QXAFHUM8EzZhEadBfXCYgZBB5uASK+vX6AsN/XHJJjGFD
	BtfFLiKwsARY+6J8L+nlyhNsmDK7n0DKGZnjmpxusDESOoaRV3LUPtN8afK93AyL824ZdAc7WiC
	/rbPAJekqqMwHR672z/wJPb4RnPnL4H9c6bF9LrbkbPAknrtIQHA+ytfp5Pau9XhSHyS5n2UMvp
	sXCZ5tdTP6mrO84i/bfonQqFWX67tzVhwhjZr3GxjQCdKZ/gc3PnUEBE95Vp9Do24t65yvSvFc5
	lPjxWun9PmOuFdeMUKuZn8AfV2zjjnkvoyJRf+xeS4lH7Q4Vz+LPkFFkaM1bf1c9daLvmNlnl1P
	LGs+J8s6dqKDCOtXCEmZPPpYb790EfKausUpeZLCQjOy/01rJXY+8Ts2zaOWBGznxIbQsxDzLkT
	atipU8rXm9qHS1qzENXrFb+3io4Ho03OcOvTo5boaLtbcMRwbIfHmKXsDmOeKhROkFxgZKyYO9t
	gzNOYlgc0
X-Received: by 2002:a05:600c:a012:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb55a907cfmr204744635e9.31.1794823221901;
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm282702355e9.9.2026.11.16.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Message-ID: <0498194e-6428-4424-82b6-c6e52ba25adb@linaro.org>
Date: Mon, 16 Nov 2026 11:00:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: zhentao.guo@amlogic.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020024_784410_C7A5AF78 
X-CRM114-Status: GOOD (  11.70  )
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

On 10/22/26 07:27, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
>   		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>   		CMD(SM_A1_PWRC_SET,		0x82000093),
>   		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
>   		{ /* sentinel */ },
>   	},
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
