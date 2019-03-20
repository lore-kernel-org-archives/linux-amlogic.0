Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0A0C10F05
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC10C20657
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NiLP6RjM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="A7Ge8vwS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC10C20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5aV/Gyj0m7RU7Rdizi7SQs63VBLQceQnq8JkurZ2xc=; b=NiLP6RjMo7cNhH
	yDCnU+v6L48I600RQi/dnhxzdmpSpx+LhkeigBxlzqHDu8oXmnX9T+PLi+gy+pQLyFN29BfrpRxvT
	d7qbnYb2GRYhf8U2Jj2AOhAdh+eySFmb2p9fw+HeOEKvraCKvflNFvaB7YXniqjDQ1xCUm3mXFm8a
	kyeWRnY0IfO7CfXLdNAwxIi9wG0YpPmUK+9QUUnWU5/r7vsaLC6VegjQgJjDg1SUMTg8bjezKCCTM
	36DOu7QoKqozmJlzqRCO4oQhxWk+J7N6mT7Xla9iTMwVlLkKeTzjB2ASW9uBQQE4B+MBB2GBFKjJP
	3KtHlrs0CkVf0Ckf9G/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6WT0-000246-De; Wed, 20 Mar 2019 08:20:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6WSx-00023N-9T
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 08:20:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id w10so181782wrm.4
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 01:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ss0lhRJN38b/9VaJ1xppUrPWedW8enOovTvOIu/CZ8c=;
 b=A7Ge8vwSLUvKgISftOLXIuDal8GO2GTflwtda5T6FbLJz8xGfZ9K4/uM6JINHPKq6X
 yOm6qNZ+Z4P7AJ5SBX3JtjSj2ga5p/sKhY0U89rAru/xYbISulC7QY0JaImm+H4+RD5Q
 8klp3RkC+51jSwR9GGWCAU8nuGML72oyy/c0gFadPPg9XOf3wD1rBEW2HVtJlP5ZtWdS
 hbHcgb03LvwS601ZNtdmpwVQYFaMysi6hCdIHk4pXKqfZulqjLwkaquVN5y1kYs7b3Mj
 Cs78GVsHRjrsLvbDQx1odTMtYegVaJ112+1dGQE19V4YjAsvchYtbJLtjP8tL7WW6Zbq
 DLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ss0lhRJN38b/9VaJ1xppUrPWedW8enOovTvOIu/CZ8c=;
 b=lsFRKEjjetR906E1PSTa735bFbsNQGy8Id7vygIDr2tVJZ8YIxRqfYN0cuC4UtCKxY
 giH6uO2PT2NEIPkMVwb1+1Q74jO5fOH8znu+NI0dMrItaggCKQ4AdohO2uAedhZPt5XG
 eXZUFmSvZuP3UYL3rctshoIJ0drFdnN0Zay/lqplvGxVotfjS9kzfipHVl7q+NT7rB/r
 dfDJLugyjJMjI+tHEu4mgDiOD7py8AxfYl5m9FxDEgtrep9vq6dKeraEGfyy7o1F75R1
 E8yNVOfo0sY2e5b/AW+L4txDDzvsmznIMXPz77a8M3Z1YTSYBi72I/lxh/prq3x/bVuR
 eC9w==
X-Gm-Message-State: APjAAAUns0/Qo1BvTiiWhRDd9XVE3hDy8kbxqe6DcRMdXFiYLEwlqbvP
 8hzCrWaPYYDTXpQCTDkWKsTAiw==
X-Google-Smtp-Source: APXvYqyV0aHFb5weB8r1WY6BPmn2zOiv4mN3fskSTi+t+pMTTWgBqRKlQGCrnlu1ztBrCZTA2cbnyw==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr15304763wrp.197.1553070049481; 
 Wed, 20 Mar 2019 01:20:49 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 n189sm1798671wmb.28.2019.03.20.01.20.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 01:20:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: meson: meson8b: add the video decoder clock trees
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 mjourdan@baylibre.com
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
 <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
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
Message-ID: <343a0e9d-b25c-ff4d-d3b8-c08ee89e09fe@baylibre.com>
Date: Wed, 20 Mar 2019 09:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_012051_340620_BDB7C5CC 
X-CRM114-Status: GOOD (  21.83  )
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/03/2019 23:00, Martin Blumenstingl wrote:
> This adds the four video decoder clock trees.
> 
> VDEC_1 is split into two paths on Meson8b and Meson8m2:
> - input mux called "vdec_1_sel"
> - two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
>   and "vdec_1_2")
> - and an output mux (probably glitch-free) called "vdec_1"
> On Meson8 the VDEC_1 tree is simpler because there's only one path:
> - input mux called "vdec_1_sel"
> - divider ("vdec_1_1_div") and gate ("vdec_1_1")
> - (the gate is used as output directly, there's no mux)

Interesting to see they kept all the dual clocks designs since Meson8b.

> 
> The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
> consisting of an input mux, divider and a gate.
> 
> The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
> However, the register offsets of the second clock path is not known.
> Amlogic's 3.10 kernel (which is used as reference) sets
> HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
> to 0 afterwards. For now, leave a TODO comment and only add the first
> path.

The second path is maybe broken, who knows !

> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 312 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h |  17 +-
>  2 files changed, 328 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8e091c2d10e6..37cf0f01bb5d 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1902,6 +1902,257 @@ static struct clk_regmap meson8b_vpu = {
>  	},
>  };
>  
> +static const char * const meson8b_vdec_parent_names[] = {
> +	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "mpll2", "mpll1"
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 9,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_1_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = meson8b_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_1_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_1_1_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_1_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_1 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_1_1",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_1_1_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_2_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC3_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_1_2_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_1_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_2 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC3_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_1_2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_1_2_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_1 = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC3_CLK_CNTL,
> +		.mask = 0x1,
> +		.shift = 15,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_1",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = (const char *[]){ "vdec_1_1", "vdec_1_2" },
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hcodec_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 25,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hcodec_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = meson8b_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hcodec_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.shift = 16,
> +		.width = 7,
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hcodec_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_hcodec_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hcodec = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC_CLK_CNTL,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_hcodec",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_hcodec_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_2_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 9,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_2_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = meson8b_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_2_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_2_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_2_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_2 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_2_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.mask = 0x3,
> +		.shift = 25,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevc_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_names = meson8b_vdec_parent_names,
> +		.num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.shift = 16,
> +		.width = 7,
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevc_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_names = (const char *[]){ "vdec_hevc_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc_en = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.bit_idx = 24,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vdec_hevc_en",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_names = (const char *[]){ "vdec_hevc_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_VDEC2_CLK_CNTL,
> +		.mask = 0x1,
> +		.shift = 31,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vdec_hevc",
> +		.ops = &clk_regmap_mux_ops,
> +		/* TODO: The second parent is currently unknown */
> +		.parent_names = (const char *[]){ "vdec_hevc_en" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  /* Everything Else (EE) domain gates */
>  
>  static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
> @@ -2168,6 +2419,19 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
>  		[CLKID_VPU_0_SEL]	    = &meson8b_vpu_0_sel.hw,
>  		[CLKID_VPU_0_DIV]	    = &meson8b_vpu_0_div.hw,
>  		[CLKID_VPU]		    = &meson8b_vpu_0.hw,
> +		[CLKID_VDEC_1_SEL]	    = &meson8b_vdec_1_sel.hw,
> +		[CLKID_VDEC_1_1_DIV]	    = &meson8b_vdec_1_1_div.hw,
> +		[CLKID_VDEC_1]	   	    = &meson8b_vdec_1_1.hw,
> +		[CLKID_VDEC_HCODEC_SEL]	    = &meson8b_vdec_hcodec_sel.hw,
> +		[CLKID_VDEC_HCODEC_DIV]	    = &meson8b_vdec_hcodec_div.hw,
> +		[CLKID_VDEC_HCODEC]	    = &meson8b_vdec_hcodec.hw,
> +		[CLKID_VDEC_2_SEL]	    = &meson8b_vdec_2_sel.hw,
> +		[CLKID_VDEC_2_DIV]	    = &meson8b_vdec_2_div.hw,
> +		[CLKID_VDEC_2]	    	    = &meson8b_vdec_2.hw,
> +		[CLKID_VDEC_HEVC_SEL]	    = &meson8b_vdec_hevc_sel.hw,
> +		[CLKID_VDEC_HEVC_DIV]	    = &meson8b_vdec_hevc_div.hw,
> +		[CLKID_VDEC_HEVC_EN]	    = &meson8b_vdec_hevc_en.hw,
> +		[CLKID_VDEC_HEVC]	    = &meson8b_vdec_hevc.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2361,6 +2625,22 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
>  		[CLKID_VPU_1_DIV]	    = &meson8b_vpu_1_div.hw,
>  		[CLKID_VPU_1]		    = &meson8b_vpu_1.hw,
>  		[CLKID_VPU]		    = &meson8b_vpu.hw,
> +		[CLKID_VDEC_1_SEL]	    = &meson8b_vdec_1_sel.hw,
> +		[CLKID_VDEC_1_1_DIV]	    = &meson8b_vdec_1_1_div.hw,
> +		[CLKID_VDEC_1_1]	    = &meson8b_vdec_1_1.hw,
> +		[CLKID_VDEC_1_2_DIV]	    = &meson8b_vdec_1_2_div.hw,
> +		[CLKID_VDEC_1_2]	    = &meson8b_vdec_1_2.hw,
> +		[CLKID_VDEC_1]	    	    = &meson8b_vdec_1.hw,
> +		[CLKID_VDEC_HCODEC_SEL]	    = &meson8b_vdec_hcodec_sel.hw,
> +		[CLKID_VDEC_HCODEC_DIV]	    = &meson8b_vdec_hcodec_div.hw,
> +		[CLKID_VDEC_HCODEC]	    = &meson8b_vdec_hcodec.hw,
> +		[CLKID_VDEC_2_SEL]	    = &meson8b_vdec_2_sel.hw,
> +		[CLKID_VDEC_2_DIV]	    = &meson8b_vdec_2_div.hw,
> +		[CLKID_VDEC_2]	    	    = &meson8b_vdec_2.hw,
> +		[CLKID_VDEC_HEVC_SEL]	    = &meson8b_vdec_hevc_sel.hw,
> +		[CLKID_VDEC_HEVC_DIV]	    = &meson8b_vdec_hevc_div.hw,
> +		[CLKID_VDEC_HEVC_EN]	    = &meson8b_vdec_hevc_en.hw,
> +		[CLKID_VDEC_HEVC]	    = &meson8b_vdec_hevc.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2556,6 +2836,22 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
>  		[CLKID_VPU_1_DIV]	    = &meson8b_vpu_1_div.hw,
>  		[CLKID_VPU_1]		    = &meson8b_vpu_1.hw,
>  		[CLKID_VPU]		    = &meson8b_vpu.hw,
> +		[CLKID_VDEC_1_SEL]	    = &meson8b_vdec_1_sel.hw,
> +		[CLKID_VDEC_1_1_DIV]	    = &meson8b_vdec_1_1_div.hw,
> +		[CLKID_VDEC_1_1]	    = &meson8b_vdec_1_1.hw,
> +		[CLKID_VDEC_1_2_DIV]	    = &meson8b_vdec_1_2_div.hw,
> +		[CLKID_VDEC_1_2]	    = &meson8b_vdec_1_2.hw,
> +		[CLKID_VDEC_1]	    	    = &meson8b_vdec_1.hw,
> +		[CLKID_VDEC_HCODEC_SEL]	    = &meson8b_vdec_hcodec_sel.hw,
> +		[CLKID_VDEC_HCODEC_DIV]	    = &meson8b_vdec_hcodec_div.hw,
> +		[CLKID_VDEC_HCODEC]	    = &meson8b_vdec_hcodec.hw,
> +		[CLKID_VDEC_2_SEL]	    = &meson8b_vdec_2_sel.hw,
> +		[CLKID_VDEC_2_DIV]	    = &meson8b_vdec_2_div.hw,
> +		[CLKID_VDEC_2]	    	    = &meson8b_vdec_2.hw,
> +		[CLKID_VDEC_HEVC_SEL]	    = &meson8b_vdec_hevc_sel.hw,
> +		[CLKID_VDEC_HEVC_DIV]	    = &meson8b_vdec_hevc_div.hw,
> +		[CLKID_VDEC_HEVC_EN]	    = &meson8b_vdec_hevc_en.hw,
> +		[CLKID_VDEC_HEVC]	    = &meson8b_vdec_hevc.hw,
>  		[CLK_NR_CLKS]		    = NULL,
>  	},
>  	.num = CLK_NR_CLKS,
> @@ -2729,6 +3025,22 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
>  	&meson8b_vpu_1_div,
>  	&meson8b_vpu_1,
>  	&meson8b_vpu,
> +	&meson8b_vdec_1_sel,
> +	&meson8b_vdec_1_1_div,
> +	&meson8b_vdec_1_1,
> +	&meson8b_vdec_1_2_div,
> +	&meson8b_vdec_1_2,
> +	&meson8b_vdec_1,
> +	&meson8b_vdec_hcodec_sel,
> +	&meson8b_vdec_hcodec_div,
> +	&meson8b_vdec_hcodec,
> +	&meson8b_vdec_2_sel,
> +	&meson8b_vdec_2_div,
> +	&meson8b_vdec_2,
> +	&meson8b_vdec_hevc_sel,
> +	&meson8b_vdec_hevc_div,
> +	&meson8b_vdec_hevc_en,
> +	&meson8b_vdec_hevc,
>  };
>  
>  static const struct meson8b_clk_reset_line {
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index e775f91ccce9..ed37196187e6 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -37,6 +37,9 @@
>  #define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
>  #define HHI_VPU_CLK_CNTL		0x1bc /* 0x6f offset in data sheet */
>  #define HHI_HDMI_CLK_CNTL		0x1cc /* 0x73 offset in data sheet */
> +#define HHI_VDEC_CLK_CNTL		0x1e0 /* 0x78 offset in data sheet */
> +#define HHI_VDEC2_CLK_CNTL		0x1e4 /* 0x79 offset in data sheet */
> +#define HHI_VDEC3_CLK_CNTL		0x1e8 /* 0x7a offset in data sheet */
>  #define HHI_NAND_CLK_CNTL		0x25c /* 0x97 offset in data sheet */
>  #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
>  #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
> @@ -156,8 +159,20 @@
>  #define CLKID_VPU_1_SEL		186
>  #define CLKID_VPU_1_DIV		187
>  #define CLKID_VPU_1		189
> +#define CLKID_VDEC_1_SEL	191
> +#define CLKID_VDEC_1_1_DIV	192
> +#define CLKID_VDEC_1_1		193
> +#define CLKID_VDEC_1_2_DIV	194
> +#define CLKID_VDEC_1_2		195
> +#define CLKID_VDEC_HCODEC_SEL	197
> +#define CLKID_VDEC_HCODEC_DIV	198
> +#define CLKID_VDEC_2_SEL	200
> +#define CLKID_VDEC_2_DIV	201
> +#define CLKID_VDEC_HEVC_SEL	203
> +#define CLKID_VDEC_HEVC_DIV	204
> +#define CLKID_VDEC_HEVC_EN	205
>  
> -#define CLK_NR_CLKS		191
> +#define CLK_NR_CLKS		207
>  
>  /*
>   * include the CLKID and RESETID that have
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
