Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8A606A323
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gY3Iu5Y9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2r2Wi12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o7EIk3Uc+9cxZ0RCUEsIfFGHENuFOuOrlFK6Bc4+LMA=; b=gY3Iu5Y9BVgNPUgCbk1KoyX9jh
	s9hnfzMTXm5SrOONbUkcFokVLRCOQEE5mum7XV8KGoAiqsigEFEKVh9SaMRlzHwEELy9AX25PNPAU
	c+YUHSR9Tj869CPlraEPyg2bkUW+zISuBp5vrYS/WK90slprizPlWu2bRW41rQfYy4nqZhYmeWApe
	lv0STjZEaFewCPaXgYQ+AI9XS6YDzihiIjZUOP21fjORnx1/7mLZ2VAsgJevTpGKYp2f0cEfpov6P
	uTxy+4bOgmhql4Seb0Lcd/p9Vzud569nXp77iAI87o2MQt43LQaZf1EG0cXyhoguWc3y3PWGGKiQ/
	6aQZvo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStQ8-00000001qvA-16fW;
	Mon, 16 Nov 2026 09:54:40 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStQ5-00000001qtX-3LxQ
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 09:54:39 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3490679f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2026 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822875; x=1795427675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=L2r2Wi12kRZTHZ/xWFnV/G/6a64mNFQljNqE07vIvrsT2wLEfbpr9I7Fz47ARWN8Ab
         lxxMLSKhJkKGWtcwXMqf8rBWqlylK2/buU1J8eYRlzhjEg7ShC2RFL9/2rcIV9zHbXYc
         ui26CfGdT1ICfNF3Kfsl4w1HtcRNVVXF+h1AQ+gfBKxfpX1REQxKy4+pb5hPcH7fWH6Z
         Wn+pIVZI77pL+Nu3SCoGgbOquV+R5IfSO7Zmb2hODrJ83ThKNnGpKsDyQ7WcpgAfdd8C
         2Oo9Iit9klG5/kjEzopigPomDEYsH8IjAConPolfVMGnd8L/1851/3JLFQRBpWuveYO8
         ljFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822875; x=1795427675;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=TbA07brlmkGDdhPsVUgTbgC9Z1etahQwqA75XPyiZoRfUYxQBoWuycV1tLVsTOHSiE
         ZaiWS511kaPL/zutcEt9G/nJWkDbd9Z92SCb6hB9L/XjKgtD+LiQ5SDd5aQ5ly5n8ov1
         DDuR2t++9biRSBvOtsTeiP0TBUplz2cplasdUWNV3WrO4vZ1nIJ4tBnd+5dfd2cI/VdN
         ltI2X0I5NFC99D2lMXmIlVne8N38CYBGNMC31jo4d8QJ3mXnbPVhI3HqZoXfR7QdZz0Q
         TQcNHH3WBcS7Bbr1Rk/UusCujI9AULZ+rwJTUKj/d6ULprtQEWxk7NKakMVEnLFHnZ/d
         wkag==
X-Forwarded-Encrypted: i=1; AL+hErHHf0AFW05TZUwYsAARBObU0rRYJzsUhCutesvYceU0okdqiw1apZBATFAHhXBvyBTifwi2lJXTzpftyySf@lists.infradead.org
X-Gm-Message-State: APuU4Z/cQjgzu5gtXgNqzFqU8JAK++bDQBGDoCRWiIGTxnbdMaJeYSVV
	HnfiUWm//pusou/KmAJaqaTPemsnPiIqKzd6DcXeWWYv8dLQvtrOaDBEXpc4E8O++94=
X-Gm-Gg: AZFdTZcPiHWHcTmyhYsaS8N4XBUwBYdNfUhkdQf+rJZCgsHksLvVl/z1PbRdFKdXTZm
	iJ4jw2u8mDHtzm0YnudKJNWsXLJulQ40wzBuoIw0fXcmlfx0YpZWTUpg1CTngzg0ewsRrtWh7Rw
	T5OfYinHOlyIe1MLZYKTNm4J3Sm9LOkj5kxu2nJfgnXlrYDyj2HFIVremdqNxzgW2JlkZirHQHl
	teB65FyZt7yGHlmEiI+8OVDCZcL3S0Vbnp+wA+8YGnyeKGGZc6U5ArNxdOIlY69YtCyP1DItZr+
	+fFzIRBZEnQ6BGKRIDNFXl9d7nsQdqENA+ABePk1haQ4CNO7GLxpQZNmItHBwNzGifK0fUJ+AkZ
	aH6UjEP9FWfDXJIJHMvDraj8LfBsxW9sNgbTUH5AyOl5YiRHdsDrZpz2K8d5mh5ovTCWMBPjUz2
	NwS4FH+RD8/BHpgMfyIgupby3AwlyeUrPzc/pHB3sByFM5vFSCud/qXvuFU+unu/x8+nkjJl+Ms
	0K7iQ5wA1l7R7qVGVzue3j67AUtXZzDrtHXaow8/vwU4bJ3p2vB5UWwwFszwpjIh8hTDmEH6KmI
	7+Zl+qrrt7NhjTE67CX4v+2nEtRP3SDcYejgQREzCHK5GwcKD+OmvJYTuq/p6whCJ8OedhL2spT
	Yhlfez/sHyQ==
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-49c714a2a99mr14346569f8f.24.1794822874794;
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20221619f8f.37.2026.11.16.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Message-ID: <93587a88-7b6d-4fd7-95d0-f958fc3ce1e8@linaro.org>
Date: Mon, 16 Nov 2026 10:54:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linusw@kernel.org, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015437_855157_6B8DFD24 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: 0.4 (/)
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

On 11/15/26 23:41, Martin Blumenstingl wrote:
> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
> 
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
> index 3da7f3799c3f..1f58752637a3 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> @@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
>   };
>   
>   static const char * const i2s_groups[] = {
> -	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
> -	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
> -	"i2s_am_clk_pins", "i2s_out_ch78_pins"
> +	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
> +	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
> +	"i2s_am_clk", "i2s_out_ch78"
>   };
>   
>   static const char * const sd_c_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
