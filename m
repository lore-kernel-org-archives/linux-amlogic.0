Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F84C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 14:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058472146E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 14:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C9EVS/Ch";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MktSmkQR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058472146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7FS7rIRCqgdwCjDrmr3SsYhFGCa8RLIYRYT9GPDl22s=; b=C9EVS/ChQk+UTZ
	SAxyejGRXeuEecjOoXRnnHDBRe+02fR53bQ94mRQHrjGjrn/YPCkuFyBoThKZsDYkT1wqYUIRJzHf
	oiMRlwi3+673PAe7JNscVEqpPFS6A0pR9M1C/lpyozNQYMPGuCs8PGj4zyUa97WJl8uYLSXVUHTAY
	T9EoSK5n0fvmDgbtO54eQVzc8hfva1o0L45BfpY9nWbGpJzuhn6ZDkN5u07Neqqw1TolBBCyGEhR/
	KMqXFzX6VI3n8MDIIBNhjB5KcYK2CGbPh/ZzWbFBcduJL5tckbcDbQ7QIzVgsyPqLtRpkpQeJkWw9
	+AJM0lf+Ht2W4HbOuM6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDquS-0007O0-3m; Fri, 27 Sep 2019 14:07:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDquP-0007M2-LR
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 14:07:47 +0000
Received: by mail-wr1-x443.google.com with SMTP id n14so2880649wrw.9
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VN7mlSEBpAu4FNFLFjzBFIbdgntaI+YfIV2E3pbQ8HE=;
 b=MktSmkQRrc3hxl1/UUxAHZEtdM2ieHvjozG1Fgh4yytUHQ5RTi3C8VSbwH61ZkpWa4
 rC/Qs8e19O2Git5hi+NsuOqg+JfK9XiMklgR6XAPUXCgN/qcgK6Rimv0yL37ZB7ZaroP
 w5hzakj7QB6XtmXyA0DcBqjjE1Qrwq9K8ZShia01mb39rdimWBCCz8tlntGWMnSVx78C
 RBUVfpVw2AzcLdhcce98ebYfBHnjCFeOnTy3S9msB2ZH4r2SbX9LwQwECuPUgxMuRVtn
 6in4tYXt7ipKfc2nFbROblEYGAnnhk+wRbYNEgfmquDnZFt2XhrhLsMZj2DfUf5nxRQz
 MGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VN7mlSEBpAu4FNFLFjzBFIbdgntaI+YfIV2E3pbQ8HE=;
 b=mXB9qVUbATQwJw4gs4/C21tNI8icaWHyWZSxtNfn1BEWPpd9jTk9Hc/p93iT/znnZn
 poOZakM8k0QH/GWkOpPMJadKkjIlnDRClBsbSUmyxTgCu6BHZmhwWgkgVosRnGyL6s/S
 IELtJ/SUMQJahrkN1xnWWsFNCWvrNQB1TIfUTrgriG01HKxVWGrkuW7iK18zTiBdqFll
 GWACuXncpNlTaRKlB/yhFmKeTVlxx85ELRAyRnixaEl9MtIve7H5tnMEaGJJQ0fxczvq
 ZBAlpwFi3EVJiGg2wxVA6V1Q0259SYeh8SKeCoZHc0xnG+PHsoSxBtq6+Euh06NEFiNS
 Un2Q==
X-Gm-Message-State: APjAAAWR3F2UnR2tL+RWyAspndNUNPQ98uN3hvAxU7NaO7kn5+27R/6A
 qnlAVht33x1RM0qY7iLtouhFew==
X-Google-Smtp-Source: APXvYqzbsJu1vvKQV14p/admrkqLd85nOe8sg6IPpXD54jQhxbM9Nw25iW5G38WDETF0RTx6K76bnA==
X-Received: by 2002:a5d:6306:: with SMTP id i6mr3369228wru.323.1569593263411; 
 Fri, 27 Sep 2019 07:07:43 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 z1sm5567086wre.40.2019.09.27.07.07.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 07:07:42 -0700 (PDT)
Subject: Re: [PATCH 6/7] clk: meson: axg-audio: provide clk top signal name
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20190924153356.24103-1-jbrunet@baylibre.com>
 <20190924153356.24103-7-jbrunet@baylibre.com>
 <b328b0c7-9449-172d-a1ed-7449023ff516@baylibre.com>
 <1cd21d60-5ded-2f70-3c99-02b70f996870@baylibre.com>
 <1jh84x2642.fsf@starbuckisacylon.baylibre.com>
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
Message-ID: <fcf94d1d-0fb4-3fb3-846a-57afcbac41a3@baylibre.com>
Date: Fri, 27 Sep 2019 16:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1jh84x2642.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_070745_706296_10345097 
X-CRM114-Status: GOOD (  15.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/09/2019 15:58, Jerome Brunet wrote:
> 
> On Fri 27 Sep 2019 at 11:37, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> On 27/09/2019 11:14, Neil Armstrong wrote:
>>> On 24/09/2019 17:33, Jerome Brunet wrote:
>>>
> 
> [...]
> 
>>> AUD_CLKID_TOP seems to be missing here
>>
>> Oh, yes it was exposed, do you need to it to be exposed since it's
>> dummy for G12A ?
> 
> It is a bypass clock on g12a and axg yes, but on the sm1.
> It is the leaf of a block on sm1, for all I know it could be used
> outside the clock controller.
> 
> Of course, I could wait this until there is an actual need for it if that is
> what you mean ?

Yes, but it's a valid clock on sm1, so leave it as it is.

Neil

> 
>>
>> Neil
>>
>>>
>>>
>>>>  /* include the CLKIDs which are part of the DT bindings */
>>>>  #include <dt-bindings/clock/axg-audio-clkc.h>
>>>>  
>>>> -#define NR_CLKS	163
>>>> +#define NR_CLKS	164
>>>>  
>>>>  #endif /*__AXG_AUDIO_CLKC_H */
>>>>
>>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
