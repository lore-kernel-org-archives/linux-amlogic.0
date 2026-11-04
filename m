Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA07606A328
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KG+n6kDU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T9vWr4TV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yZ22vtLVcsj4G7YnzfWLzvFXXC2ZicQki3Y+6+1asxQ=; b=KG+n6kDUQWtrTUnRf+l0aaDNVT
	QgT8/j36CjrJxm+aa78ejC+VQYq8czlDPhKsTgB7+qZLuRzS6NMTV6/YAp3aF79fMcoMeho7RH9Rw
	JgMWqB6dBf/1CQj5Nx046v553Djjvn3eXmudfYrxabB6P+TLdn46JrNX+yt3Ai5po0VH++1bXKZh2
	KHb49ftoTQMF0orZdv4fkcirrdarXhQ/CRtdmH3jikXTc3bW2HeYdkUHK2W1j5VYQYie0jk0ZLn7P
	OmhbM6HZRV/WWVYl1ldR8Y0OoitQzNGR+YP0u37O4iK7EgdW5pm7W0fNgGZqj+xLNbpbiAvK1luec
	jTskPaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWcu-00000004kSs-2TWn;
	Wed, 04 Nov 2026 08:45:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWcp-00000004kR0-3b3E
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Nov 2026 08:45:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso3639435e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2026 00:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793781941; x=1794386741; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PY/ho+NWplWZr5hzq7a2dKL6DiDdkQ/o2tiv08eUeXw=;
        b=T9vWr4TVjEWgnC1VhpDCvb0ouM5hny9/SVcM8CLSZVJi7y1K24jSvqTbiD9Gx0rjkv
         bsHMm9HkZVNOBgRgvvioXFXUN9CcmKIFXiNA0EnhsIq376P4tSyh+gn+yqXJzDkDPkq6
         49FAOMOOj1jcAHH7684HYsa9PMvktg24kO1sB2AP6S+ieSTo1xiTZIxbFFh4HoQ3gP8/
         B+CmyZNLUZVfhHflFoHsUMUK+MZWgXs62GgZ6atYHHDeJBdAdLVWlx/W9yyBc7n53NMI
         MVrUrbmqiik2nXVRnr79v+K6Wzoti+w/7Sjinh7eg0840iY2p1Zy+huoCWCOXjeMNOSQ
         cGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781941; x=1794386741;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PY/ho+NWplWZr5hzq7a2dKL6DiDdkQ/o2tiv08eUeXw=;
        b=rvmwYUm2ppG+oo7Pw4+z7cHGY1Vdn9rGt5jLUU8YOMrk7PjDrcHLP5edmuvtwYSTWR
         xc0fWDAhdUiplYY8XF5Ycy1aP/64r5+alBYgKdYDiWaZcd+F++Wh/eP1CqW3y0TySb/K
         9mSF6gZ1dbyhaUfxQ2FJSYRZHNulRpd7hOuiUln21WOWYet06n6b8RoIuti2SzAaVjbi
         C4rIMczxwjQQkcvXl1CbQvBwWsmvdlTjEatqK7/MCOi/PS9411wfXHbUHGcUKbUQV9XI
         yebNoYQ2v5fTfQ83Tt9BACzDHi0FnLrvM4GtJiTMSfDZCBTVnuDzrftwOiXOKtb/+a5A
         Aa2w==
X-Forwarded-Encrypted: i=1; AKwUvBx+YdYuqB0sGf66U+jWO24SvSrLqDGfSsBFxDiyAoyStOT287oFKtwV2u+IJDS2uzRP0wpB7FMkPEu15F0x@lists.infradead.org
X-Gm-Message-State: APuU4Z+DlnfBT9ET4SIqx/VsPhJWm8envzCbQoQ6OxKn+/B29eAPMbOA
	Y5BI7qjH2rMgYX0OGWrh4UrB8Ykc/BB9DpSn2uD1nt0OQNBV90LRa36QEkJjFk4YAVM=
X-Gm-Gg: AYBFou2ubpXpRQ7RLxIX8SO6pTvLynwluI25BInxvu0GpYZe26Lt269+IJ7Ia9YNze9
	ZGkiFT6puLksFBpKH/e9AcJR4Se/FJ7iJ9Ae5DvpvCwQez9uAC3l4MA04+ooTSn9z/FS72xSMgY
	NcWk5/6aY6LiQhlgjVm+rNU604Y0zdbjMO9ruhmQmIs+MyrWOApv0NOULmX29bZEHYgQnMPYx91
	mVDhfunK4avF3a9rYf03UlezdaD89Xp3qCA0v2QVVRFU6K8Z/Y+h4VLkk2qbskt2QmpGBsVKSuw
	55TITzJBiHRdQq8RN8TgHAn5uqDzzEYmvBBnXUoH5+Szqe/ipXZ4TaubKbLmidSHNQUWS9MSlF8
	1PqfKBo2S+TfEYuntyQ/xR9qG8bkHESOQHTda1IKGz3JiJawzXwrlU+gr6QC1E+4QqR1gG3kT6i
	YeTwion3C40OvF+0TfpRQPYh4HoeymA07wIxqu006sjehmneoWQjj5iNMOx4YX8H9d4NwTanzUW
	oSlMpaIavr/t85jqxAiEM6tqlgo5JWnzRe5sPRVDxK9kcjF2DBsJK95Ff1BR3RHpeuEBDwuUMP/
	YMzDQVsM1sYgHbusofEDidlpS88nDRbHdSNLquR8aXDuIEvHoALMiV12XJGA+6NXUBdyTqiRsLt
	+MJvdOPlN
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr366958235e9.22.1793781941394;
        Wed, 04 Nov 2026 00:45:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d7b0727sm34521615e9.14.2026.11.04.00.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:45:40 -0800 (PST)
Message-ID: <1022a8b5-3f2e-4499-a432-f3be713110e0@linaro.org>
Date: Wed, 4 Nov 2026 09:45:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] serial: meson: unregister the UART driver if port
 registration fails
To: Wentao Liang <vulab@iscas.ac.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20261104021501.1468500-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021501.1468500-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004543_951317_2EE0CCAC 
X-CRM114-Status: GOOD (  18.33  )
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

On 11/4/26 03:15, Wentao Liang wrote:
> meson_uart_probe() registers the shared uart_driver on the first port and
> relies on meson_uart_remove() to unregister it once the last port is
> removed.  If uart_add_one_port() fails, probe returns an error, so remove
> is never called and the driver stays registered, leaking its tty driver
> and per-port state.
> 
> Remember whether this probe registered the driver and unregister it again
> when adding the port fails.
> 
> Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/tty/serial/meson_uart.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index a6cb2a535f9d..a51362f73dee 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -702,6 +702,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	int ret = 0;
>   	int irq;
>   	bool has_rtscts;
> +	bool registered = false;
>   
>   	if (pdev->dev.of_node)
>   		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
> @@ -753,6 +754,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>   		if (ret)
>   			return dev_err_probe(&pdev->dev, ret,
>   					     "can't register uart driver\n");
> +		registered = true;
>   	}
>   
>   	port->iotype = UPIO_MEM;
> @@ -781,8 +783,11 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	}
>   
>   	ret = uart_add_one_port(uart_driver, port);
> -	if (ret)
> +	if (ret) {
>   		meson_ports[pdev->id] = NULL;
> +		if (registered)
> +			uart_unregister_driver(uart_driver);
> +	}
>   
>   	return ret;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
