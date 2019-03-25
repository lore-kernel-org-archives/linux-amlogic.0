Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB0AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:22:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC3B20870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeUtqY4k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UkLtuJqK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC3B20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nPmWnGTwyL5jE3Ja9e9MgxqfyV/C6Kgs3TXPUQIi/4=; b=oeUtqY4kE9Mgkt
	EKYpUZjQr8psAV+opb1WLK8pCHurTXyQE6RPqgHSVNd1AM03ysZUJhFXWqBbpVSQPIbWGXuqF3myp
	a40Nq1PSIpYIlvgtkSJMMpGT5ZsFSaYMH2Hw/3RGIsmieVdaZXxGhOoeJ48Ibu5RHSKVUwTiI9RmS
	ymTUkX+apaiWPonYXIiEWpM3CZD9Ic8Q+oh/+SGuxHgEZjLFlIPSNnkGyUeOptGGr0lKT/BZvzK/A
	eDbhsW8KegVHux3f/NhBvgQd8niMLKKZoCD5wxZXtFmxyMj2g9y+sZq4vfxNyiTiZ+C4dgHVXLDOM
	dDlrBRzUQNI9ZcnCSRvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mkj-0007S9-Bn; Mon, 25 Mar 2019 10:22:49 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Mkb-0007Qk-QC
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:22:47 +0000
Received: by mail-wr1-x442.google.com with SMTP id y13so9447513wrd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tHA7tV9asEvjrWcZfPQYwPMquyudhnWUuWlK5p2/1NQ=;
 b=UkLtuJqKIawhW1lT6MbfkPZPY2KqSkJYCFM0VcbbEZNIOg4wXnqnfcbM9IruKP9oDD
 v52ykYsnb7IhwglDzuaMRxT4rZDffphKUwqVkawbVYi0jsULS73TiY8Fo/XPSfFY5YB0
 SfPeGbkdTUR7ByNReFaWUFL0ubIavJMKrgDoMU/rS/wXZQ3klJvtK0ayHQxwe8TsTqu3
 NfzQmoYp6OnyPZZ4pkUi93ex+fbn5+Yi2/upTkAwCWPZuKszfZvF5Rn4OQESBvdm2vJe
 rjAeqaNIy8iyJ0uoXDcbGa3+RzCctRTeMC2eUbhANRy7kedRUVOkdvTdcOytXYhiy4Ez
 2bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tHA7tV9asEvjrWcZfPQYwPMquyudhnWUuWlK5p2/1NQ=;
 b=hDajXTxTguufb+XHQWNxa3acERA2gsGvZFW+JKZPn3xQimz1eyHFgolKJftlEu0bkX
 tuVLYsTzezKsTYBaR0bF/RbKtvXDpweWnzedQZnnKyPLeBo5YXt5rflcqLpNyrVzlWLp
 595eItCw7YOF9rVCoHmAWfHFVD+zf1vuw2nw2pwpx02MYOo1Lbd/O6bYZx9a0COF2ybK
 ZjBPdcXaYYjmqPPTNafsVyF6i+59hjgrlgvWdnryxJTOtTmczqaL8A3IbL3Wid2NQCfp
 ngljmmBHgmGlIKjpzqoI3JeYOdXiaQZB1U8v3fd3Ny4tqhqKpLF/bg5huznjl2X7Nu2M
 +aNw==
X-Gm-Message-State: APjAAAVX13AwU6XeZs09grPfz9q5MTtDe8Lbh5ZK7uMXoXyuM6MJkdH3
 LJCLpLh35p3L5wbIMNFFx0DuAA==
X-Google-Smtp-Source: APXvYqyJHAeUrSXstycbF3liIzwkOTMhLfWDvtzVBK5bnmXBc/od3wPG8J6VmXrroG9NbBex2Qa4ag==
X-Received: by 2002:a5d:6a87:: with SMTP id s7mr16006798wru.81.1553509360128; 
 Mon, 25 Mar 2019 03:22:40 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r9sm3309956wrv.82.2019.03.25.03.22.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 03:22:39 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: disable SCDC configuration for
 invalid setups
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, heiko@sntech.de,
 robh@kernel.org
References: <20190315095414.28520-1-narmstrong@baylibre.com>
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
Message-ID: <c4032279-3cc5-aeb8-a255-2715bc130e11@baylibre.com>
Date: Mon, 25 Mar 2019 11:22:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190315095414.28520-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_032241_904927_2E37F10A 
X-CRM114-Status: GOOD (  25.46  )
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
Cc: linux-amlogic@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrzej, Laurent,

Gentle ping,
Did you have time to review this fix ?

Thanks !
Neil

On 15/03/2019 10:54, Neil Armstrong wrote:
> This patch is an attempt to limit HDMI 2.0 SCDC setup when :
> - the SoC embeds an HDMI 1.4 only controller
> - the EDID supports SCDC but not scrambling
> - the EDID supports SCDC scrambling but not for low TMDS bit rates,
>   while only supporting low TMDS bit rates
> 
> This to avoid communicating with the SCDC DDC slave uncessary, and
> setting the DW-HDMI TMDS Scrambler setup when not supported by the
> underlying hardware.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: 264fce6cc2c1 ("drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> 
> Rob,
> 
> this patch should also solve your issue with your 11' display, could you
> test it ?
> If this works, I will focus on the underlying issue where the RK3399 SoC
> freezes in your setup.
> 
> Thanks,
> Neil
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a63e5f0dae56..db761329a1e3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1037,6 +1037,31 @@ void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
>  }
>  EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
>  
> +/* Filter out invalid setups to avoid configuring SCDC and scrambling */
> +static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi)
> +{
> +	struct drm_display_info *display = &hdmi->connector.display_info;
> +
> +	/* Completely disable SCDC support for older controllers */
> +	if (hdmi->version < 0x200a)
> +		return false;
> +
> +	/* Disable if SCDC is not supported, or if an HF-VSDB block is absent */
> +	if (!display->hdmi.scdc.supported ||
> +	    !display->hdmi.scdc.scrambling.supported)
> +		return false;
> +
> +	/*
> +	 * Disable if display only support low TMDS rates and scrambling
> +	 * for low rates is not supported either
> +	 */
> +	if (!display->hdmi.scdc.scrambling.low_rates &&
> +	    display->max_tmds_clock <= 340000)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * HDMI2.0 Specifies the following procedure for High TMDS Bit Rates:
>   * - The Source shall suspend transmission of the TMDS clock and data
> @@ -1055,7 +1080,7 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi)
>  	unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mtmdsclock;
>  
>  	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
> -	if (hdmi->connector.display_info.hdmi.scdc.supported) {
> +	if (dw_hdmi_support_scdc(hdmi)) {
>  		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
>  			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
>  		else
> @@ -1579,8 +1604,9 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  
>  	/* Set up HDMI_FC_INVIDCONF */
>  	inv_val = (hdmi->hdmi_data.hdcp_enable ||
> -		   vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
> -		   hdmi_info->scdc.scrambling.low_rates ?
> +		   (dw_hdmi_support_scdc(hdmi) &&
> +		    (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
> +		     hdmi_info->scdc.scrambling.low_rates)) ?
>  		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE :
>  		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_INACTIVE);
>  
> @@ -1646,7 +1672,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  	}
>  
>  	/* Scrambling Control */
> -	if (hdmi_info->scdc.supported) {
> +	if (dw_hdmi_support_scdc(hdmi)) {
>  		if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
>  		    hdmi_info->scdc.scrambling.low_rates) {
>  			/*
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
