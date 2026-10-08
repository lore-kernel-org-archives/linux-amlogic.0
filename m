Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5306FCA6007
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2026 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hn5dkE3V1m2DJwwE8D1s9NaI7Ntgr2pO2zMIts9fmpU=; b=bhrwn4mHvtDLqkmHqmsBAlbl6H
	m1awHk30LnaHFegb8RPdlNAPVaJHCapfpZVzM9mw64M8PZv/MtR1SVTKvTVEDtbTPhpCuazF1mF7R
	DWlmqmjrZ9bdTVUNCpMvUpebzhNyKJ3/eoVRCUvh0/Sfu5wwE29VGCElmpSv3STPx33e+n6YuSn8Q
	y+IVEp9ZreN9bf3i549SEA03U0OvNpL0KTcvG3MDj10pKS4zVpe8KDhcg0JObWqRxHEyZVbPcTqMD
	50JsaelA7QKCOTt2pXDXuiR7vnceZQ2qhfEVWa9vauUKPE7yQ6knSXsJwipRYqAGyhL6s5hmLSVyL
	WQT+GidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjWW-00000003sCG-0EQY;
	Thu, 08 Oct 2026 08:30:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjWT-00000003sAH-0YKA
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Oct 2026 08:30:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so17349345e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Oct 2026 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791448239; x=1792053039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K52pgwEsFh/s2byahqoHEGKJhKcLRQ+lmV8r0ELRlTc=;
        b=B4FgFmNptXsFq0bxNnjPBIPmV96FWxqvnEwU6GIba/7JQSJbNFqNpxWdzSMxiBNiT2
         yfEorrHVL/QdMb57rBI9FANgtHMUkzyWHOCqRiZuRzhkT3UptOb+yKuHy4w8naQkVe/7
         nA+888SM9rintw0bvxrU7ECOS1EI9JnnSN//hkeVh7osRpZqOHoD+hT/L6hADR/KN92o
         KI8m8NPtRsB3cZ0xjLtjBOH3HHUX5rpaANdu8yu6QnwORz4KyXyoTMwsbx6AhbwMi3vF
         z3qPMnmcoGyKYfkLlAkK4KJo6qX+28WiAYeqbPIiXM4gSLGoDKnhK+LV1kv0H7GPKPTF
         /yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448239; x=1792053039;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K52pgwEsFh/s2byahqoHEGKJhKcLRQ+lmV8r0ELRlTc=;
        b=0R9WF78hf2F47Dj1E1kXE6s/bgDybY7HdQ7erGoCH9axOFXx3dmVZydXbMrfjYxBvi
         wpkJw8OOHmIx+CPXrxhSk1qqvpMsNwskFkSZaJI1HKdvydRwiHjFsakdFH49FecvkDPE
         x7OJLqVdJ2j7ftK6FFqbVqCTJlZn8CSgQy570ZdDV0dDfk5yHu7hyauyHUfd9r5nC+s6
         oGFeo3+CQy5iYJFY6LbHxPlwn9q+hoaS8NV+i6w1u/NAgWQzaZEaaFpupk/tiucsya99
         YkJ30SNlHF1BMFMKTjL1suzAgLhtS+oxsZHvJeXwVCAWYP2skhopU5lMCMgtQ49XEYNQ
         QjXg==
X-Forwarded-Encrypted: i=1; AKwUvBwMLIOvq9nAD91Dfpef2peERq6LSK1QVwmI6zfwkpt+cKVXL5YDoTdbfmVqiwrxxjBIuzbJjGUUTkLnvp0u@lists.infradead.org
X-Gm-Message-State: AFuF++mmD9URf0ItAxZeCbxW81isLmT5Z4q065yGjl/gdFRbIEl9xv0p
	NC8Yy4itDexxgSo2og4L1ONdk+jASwupb49/NBsSP3IgPzX36Ee6Y9hnYVBDek1ss2o=
X-Gm-Gg: AYBFou1ipQRB0PPf/nf9wcyH2GNrx1CejJyKTXlrk7hRsNFqH7sFF3sHIqso/yme8Zh
	ORZDeNRYGu/O4g1Eayxu64SSqro5Vnf174sXQX1tqEnfNhB9UX+0pvIlXmP5uGVXyI/FRJRnWuO
	+2dBU+QcXaz2ZXue2z2a+cGDEdFavVDeqFiEvleEZdHdiOh3jAq2LUm3vqC4givsKUeWwvgj2ZA
	J1zyDqYXEQ14SCvi7tbJl68teBZxzie5N3Hlh4Xtzi+MEluTw7D7DNgcGTuvghQIOhBzwZgdfpd
	Uceld7qGj5cRVqbrjVTCCg+Hritarz5oa22fwVg5ndPvkL/TYUtHK0u5kuiB2ALRmPXjuuKc9t2
	o7d7O5m7tjJAlmyHmeQqCqPnw9a4fP1GfAuQOWwXKNX7V4RjnRHKE+vyg3W3y5itsvXByuSyyyh
	0ZjefSg6R3tx6uGTTPJuJmj7THhCypXKGlGiiQRq0Pk2RHfNC3cKNc+GolLgZCViK6aUERGzhtB
	JQIuo526lsvok5/Q8S9gqLNYEDD5JA=
X-Received: by 2002:a05:600c:190c:b0:4a1:7f8e:6e67 with SMTP id 5b1f17b1804b1-4a1800d6880mr71908935e9.4.1791448239166;
        Thu, 08 Oct 2026 01:30:39 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2d563sm9920967f8f.41.2026.10.08.01.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:30:38 -0700 (PDT)
Message-ID: <1ade78a4-b1cb-400d-932a-3a7423f9892b@linaro.org>
Date: Thu, 8 Oct 2026 10:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: honour the busy timeout for R1b commands
To: iav@iav.lv, Ulf Hansson <ulfh@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261008-meson-gx-busy-timeout-v1-1-d92f3c68c409@iav.lv>
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
In-Reply-To: <20261008-meson-gx-busy-timeout-v1-1-d92f3c68c409@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013041_225534_3762300C 
X-CRM114-Status: GOOD (  32.63  )
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

On 10/8/26 06:26, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> For a command without data the driver programs a fixed 1024 ms into the
> CMD_CFG timeout field, and for R1b the controller waits for the card to
> release busy within that time. The driver does not set max_busy_timeout,
> so the core sends erase and cache flush as R1b with busy timeouts of up
> to 60 s and 30 s, and the controller gives up after one second:
> 
>    mmc_erase: erase error -110, status 0x0
>    mmc1: cache flush error -110
> 
> Program the timeout from cmd->busy_timeout, rounded up to a power of
> two and kept within 1024..32768 ms, and report 32768 ms, the largest
> value the field holds, as max_busy_timeout. The core then sizes discards
> to fit and, for a longer wait, sends R1 and polls for busy itself.
> sdhci takes its command timeout from cmd->busy_timeout in the same way.
> 
> Fixes: 51c5d8447bd7 ("MMC: meson: initial support for GX platforms")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ODROID-N2+ (S922X), 256 GB eMMC, btrfs root with discard=async, Armbian builds in docker as load.
> Without the patch (7.3-rc6): 262 errors in 3 h and 68 in 2.5 h in two runs; the first came 4 and 43 min into the build.
> With the patch (7.3-rc6): 0 in 2.4 h.
> On 7.1 with the previous eMMC module, a synthetic test (20 GiB write + fstrim) gave 48 errors without the patch, 0 and 0 with it.
> 
> The timeout is rounded up to a power of two: the field holds powers of two only, and the timeout is a lower bound.
> MMC_CAP_WAIT_WHILE_BUSY is not set: I have not checked that the controller waits for busy on every R1b command, HS400 switches included.
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 7ef16d7c03cb..8de3eb65ccb0 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -125,6 +125,7 @@
>   #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
>   #define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
>   #define SD_EMMC_CMD_TIMEOUT_DATA 4096 /* in ms */
> +#define SD_EMMC_CMD_TIMEOUT_MAX 32768 /* in ms, 2^15: limit of CMD_CFG_TIMEOUT_MASK */

This is a cleanup and be sent separately

>   #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
>   #define SD_EMMC_DESC_BUF_LEN PAGE_SIZE
>   
> @@ -212,7 +213,21 @@ static unsigned int meson_mmc_get_timeout_msecs(struct mmc_data *data)
>   
>   	timeout = roundup_pow_of_two(timeout);
>   
> -	return min(timeout, 32768U); /* max. 2^15 ms */
> +	return min_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT_MAX);
> +}

Same here

> +
> +/* For R1b the controller waits for busy to be released within this timeout. */
> +static unsigned int meson_mmc_get_cmd_timeout_msecs(struct mmc_command *cmd)
> +{
> +	unsigned int timeout = cmd->busy_timeout;
> +
> +	if (!timeout)
> +		return SD_EMMC_CMD_TIMEOUT;
> +
> +	timeout = roundup_pow_of_two(timeout);
> +
> +	return clamp_t(unsigned int, timeout, SD_EMMC_CMD_TIMEOUT,
> +		       SD_EMMC_CMD_TIMEOUT_MAX);
>   }
>   
>   static struct mmc_command *meson_mmc_get_next_command(struct mmc_command *cmd)
> @@ -841,7 +856,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>   		cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
>   	} else {
>   		cmd_cfg |= FIELD_PREP(CMD_CFG_TIMEOUT_MASK,
> -				      ilog2(SD_EMMC_CMD_TIMEOUT));
> +				      ilog2(meson_mmc_get_cmd_timeout_msecs(cmd)));
>   	}
>   
>   	/* Last descriptor */
> @@ -1168,6 +1183,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>   
>   	mmc->caps |= MMC_CAP_CMD23;
>   
> +	/* The longest busy wait the CMD_CFG timeout field can hold. */
> +	mmc->max_busy_timeout = SD_EMMC_CMD_TIMEOUT_MAX;

So you seem to fix 2 issues:
- for timeouts larger than 32768U, we don't wait enough, so ok this should be in a single changeset
- we don't wait the right time for r1b, so you add meson_mmc_get_cmd_timeout_msecs(), ok
   so please sent it in a separate change aswell

> +
>   	if (mmc->caps & MMC_CAP_SDIO_IRQ)
>   		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
>   
> 
> ---
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> change-id: 20261005-meson-gx-busy-timeout-7e8e3fdcb3e3
> 
> Best regards,

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
