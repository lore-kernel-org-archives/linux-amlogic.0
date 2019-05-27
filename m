Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C8BC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8FD204EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLlq4fbx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z+yNRVST"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8FD204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BV4BhltKsPLB4rWcOCN0BuweB9qVnK8BC1QOAYpGHc=; b=PLlq4fbxJ+5Ayl
	PQRwUaKo0dUgDDm3ULMqbuOGlE9+MzeSunEhu467SObzJEakkbL1nmDBRArnkkSPGSF6I167g9uvM
	6SQ2jhUEsBHU8UXgcaz8tiAhmDNkooOi2TFIVVl0CGuEbA5pXAygtSsZqSoPMnxmuZnVeYBuHkfHZ
	Wrw2Kma4CGyy7Yf5EweGRS3o9KB1tWfEYBhe4GyGNr2BpAckjHYMdKg7QD0ghlO/R12EIyRhSTfQN
	CCqzMtIfYqbQeuTtwcIMKbEKsyZaGLTGrt1tGwHbnfCVEemnoE7BEW63Qd9VrfCkXM9QrfCI4Ih8A
	Hv3mKDhuKFhsl6oWDxxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEmW-0001RO-8r; Mon, 27 May 2019 12:31:12 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEmN-00015v-PY
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:31:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id f204so16003917wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cF2hnG6hZXcvSFfj9OvEi8dus7rJkhJotSYDGymsZec=;
 b=Z+yNRVSTaPvfM7i31o9NwSOJ+HLHNNnx3Lba8zTicoOW0ufqPmZO8xqHjqmwrKsrXP
 INemQtHgoe+xUxXgPXfuWnXif971WcA4akb5v5KsqkW6Y6uWQz2b/kif4uE988b9BTEQ
 zpU5oFaGSxasZx2lN/KwfilQ5i2WED8io7lxmapsDjqGQdN4kyiAFyn5TLjwmxkAuHL0
 SLTlS2MXOQf+gwyNQZX2KkGraZaOiOYBMXXjNyKyyKu0McJ26IZ9tyjIPM5Krf29gjHQ
 qnYDpM5LXE3GFf/Qqrjc38GQOAtRk4AM2zMJioAVGPaFEwekrzp7OxkS6dqV7x6wPRSC
 uAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cF2hnG6hZXcvSFfj9OvEi8dus7rJkhJotSYDGymsZec=;
 b=ZXafWfHCMIfUuy4TEJLwmiVcG/uphrwbP1ZvZZXXPQUpcZgJbRczXXMQnC6KGZONMR
 Ez9LWTcI1MC6/Q0SzaACb90KILqh1bg3DDll0zNXMiUGV0ccSsGLfqHPkEl8Hx0OfC/u
 zDE/lpiBqsG1SUDbbvsU5RT7rL6UMRr/tY0VBIMGQwQ468b6a/FAPDXUWTzYqmhxW1D1
 4ZbEeuvfS8j11LbdFSOhb0wtEWGKeeGUp0OHdnU6AnydqY9M0l+gjEaZ7YlPWzgZDzSW
 agnuEvc4yTr7+Is7myNw9sbNJ3wB8SRHks3DxUCQeaO1ayiceHDYHTpkZbmSFoNLRnHv
 k6CA==
X-Gm-Message-State: APjAAAUw1N/zN36XN+PKTyyHeT/c3m45QFfDQKUhJ7pN12X4YSwao1WZ
 1v6Xi3F6MMVWPk1mhqGSEAIY6yyV4Z64Lg==
X-Google-Smtp-Source: APXvYqzmlQ/oRWNhzIWr753hEp+k9zB5mUWQZyqbFjF0dJ5vW9ef2CcDh1pc05OV7Z7ch6uFM/hKOQ==
X-Received: by 2002:a05:600c:230a:: with SMTP id
 10mr25622523wmo.13.1558960261882; 
 Mon, 27 May 2019 05:31:01 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n3sm7865465wrt.44.2019.05.27.05.31.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:31:01 -0700 (PDT)
Subject: Re: [PATCH 11/14] pwm: meson: read the full hardware state in
 meson_pwm_get_state()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-12-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c80dcb3f-13a6-7b9d-a7c6-a81110dcddda@baylibre.com>
Date: Mon, 27 May 2019 14:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525181133.4875-12-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_053103_832078_772C36EE 
X-CRM114-Status: GOOD (  22.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 25/05/2019 20:11, Martin Blumenstingl wrote:
> Update the meson_pwm_get_state() implementation to take care of all
> information in the registers instead of only reading the "enabled"
> state.
> 
> The PWM output is only enabled if two conditions are met:
> 1. the per-channel clock is enabled
> 2. the PWM output is enabled
> 
> Calculate the PWM period and duty cycle using the reverse formula which
> we already have in meson_pwm_calc() and update struct pwm_state with the
> results.
> 
> As result of this /sys/kernel/debug/pwm now shows the PWM state set by
> the bootloader (or firmware) after booting Linux.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/pwm/pwm-meson.c | 52 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 9afa1e5aaebf..010212166d5d 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -287,19 +287,65 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	return 0;
>  }
>  
> +static unsigned int meson_pwm_cnt_to_ns(struct pwm_chip *chip,
> +					struct pwm_device *pwm, u32 cnt)
> +{
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +	struct meson_pwm_channel *channel;
> +	unsigned long fin_freq;
> +	u32 fin_ns;
> +
> +	/* to_meson_pwm() can only be used after .get_state() is called */
> +	channel = &meson->channels[pwm->hwpwm];
> +
> +	fin_freq = clk_get_rate(channel->clk);
> +	if (fin_freq == 0)
> +		return 0;
> +
> +	fin_ns = div_u64(NSEC_PER_SEC, fin_freq);
> +
> +	return cnt * fin_ns * (channel->pre_div + 1);
> +}
> +
>  static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  				struct pwm_state *state)
>  {
>  	struct meson_pwm *meson = to_meson_pwm(chip);
> -	u32 value, mask;
> +	struct meson_pwm_channel_data *channel_data;
> +	struct meson_pwm_channel *channel;
> +	u32 value, tmp;
>  
>  	if (!state)
>  		return;
>  
> -	mask = meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
> +	channel = &meson->channels[pwm->hwpwm];
> +	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
>  
>  	value = readl(meson->base + REG_MISC_AB);
> -	state->enabled = (value & mask) != 0;
> +
> +	tmp = channel_data->pwm_en_mask | channel_data->clk_en_mask;
> +	state->enabled = (value & tmp) == tmp;
> +
> +	tmp = value >> channel_data->clk_div_shift;
> +	channel->pre_div = FIELD_GET(MISC_CLK_DIV_MASK, tmp);
> +
> +	value = readl(meson->base + channel_data->reg_offset);
> +
> +	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
> +	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
> +
> +	if (channel->lo == 0) {
> +		state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
> +		state->duty_cycle = state->period;
> +	} else if (channel->lo >= channel->hi) {
> +		state->period = meson_pwm_cnt_to_ns(chip, pwm,
> +						    channel->lo + channel->hi);
> +		state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm,
> +							channel->hi);
> +	} else {
> +		state->period = 0;
> +		state->duty_cycle = 0;
> +	}
>  }
>  
>  static const struct pwm_ops meson_pwm_ops = {
> 

Thanks for that !!!

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
