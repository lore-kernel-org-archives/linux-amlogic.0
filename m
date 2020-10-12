Return-Path: <SRS0=jj7Z=DT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D0FC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2020 15:02:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1978020870
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2020 15:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmnNL48y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EMEqBzU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1978020870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zQ9Lmlz+y55CBWiSHiCJTtGWIIwhIaUPyjqaMsTHq1g=; b=YmnNL48ysDaJzOjDuOdxct7Cl
	yAMrnDT4ZKaRrUkv9wzRfgH8Y6nSulVGev0mPql2RswQob3ekzCvJGUneFeEGk30kl9yasJLtSfYV
	IFcRHMwyHAfGRQ131CgCjtCzJw5LOQS6TymWqhyTg2p8W74D4KUFV22I2YpCbdzbgOIKB6iTB31bI
	tpPEqcbpigQkNEXdbsyfEoN+kuSAVLBZwcJoqvztwcpuJUdyRcTqHVKEfZF0Wt+5VwO816NsaluRS
	s9p6THxF3ryH+y1be5je5h5TKpLFyIbSUm76QytHiUYxMfypJcwpYM6GZ5ZocCpcXtWcednHP9WQt
	EEny7W8Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRzKi-0005eg-VZ; Mon, 12 Oct 2020 15:01:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRzKe-0005dj-RK
 for linux-amlogic@lists.infradead.org; Mon, 12 Oct 2020 15:01:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id j136so17850914wmj.2
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2020 08:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=smv4foCdAqL2XoII58ApwYmWI8xu702A6XYgKKesQdY=;
 b=EMEqBzU2HSkOw0v0RmD/R4KFdjw7VG8lJIbGwXpWEbRh4GUvtC9dNcSi8UR55bZl67
 gbbbD3TF/D3yHR7CGqB06kdvNlALUcHHZfTOz1aJSMbOkAYLnqq1lYftuJoOL41rouw1
 wHyoMmRrBmmqJILnKq+AsMy5DUDy1jEBMEQdar5tZLTJVMfbAkGO7Y+0BmcvqTkyDgOE
 vNDb4sbTPIoF14OxOvbZ/CRxLN3ct/aGmyH6McX6bxb/AjkcunM+MrSTTHnpAno/Pgwg
 gq9c36aCMa/ubXiyHykxXNV5/lQHoaOzxezpF6Dg/gKTjPbs9K3H3cO1N0tLUXtTVCKm
 CIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=smv4foCdAqL2XoII58ApwYmWI8xu702A6XYgKKesQdY=;
 b=CVTuN6np9GuULBKyUKV1reHDj6OzFRLWSfVdA+guSBBFKCSOs5fR6eZp5KuX7tSXCX
 WcLFYyKujGO9PJHnQ4fbsRZVLeW9T1V8Q8fPGDNfrRKNdpU6KzUldUj4tCMJDilLXR/I
 9gDm9YosOsI2Dw2uglP5us/9lgJ+W8Xg1uDMUt8nJruLahS/sGsZKGbra3jvDoJW1Vx6
 vpjq1/ejWcEhCL6Q4/kxd5yjmXYRwj+ax3Ehefmj/tRh7CHZREqV94jAgt9FZEI+OwMH
 PPzJsGWxgy8TtWisN1xcbyLhJcx3YhB0wHucZhdBGWr1ijFTNJJtsryu+tnupl0K2Ykt
 M2Fg==
X-Gm-Message-State: AOAM530ZZMeKQcBw56QvCWompWy/3OGQNvL2BO/p1JcAm5k/5L+kUIEZ
 GuN//G6YVquDadJOjKCgUIARncOnWgPhjmGr
X-Google-Smtp-Source: ABdhPJxRiBDdyA9QD/MluPgxjMt31OFOynrGNM0/5hC2bJMaXkouDgXsgtrptHrbejGW6/MjYwCxwg==
X-Received: by 2002:a1c:1d89:: with SMTP id
 d131mr10099690wmd.188.1602514907105; 
 Mon, 12 Oct 2020 08:01:47 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:35de:80a8:f551:6aa3?
 ([2a01:e35:2ec0:82b0:35de:80a8:f551:6aa3])
 by smtp.gmail.com with ESMTPSA id b5sm2994492wrs.97.2020.10.12.08.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 08:01:46 -0700 (PDT)
Subject: Re: [PATCH 15/18] dt-bindings: usb: meson-g12a-usb: Discard FL-adj
 property
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru>
 <329129ac-ff44-4928-bca4-805297a8c456@baylibre.com>
 <20201012142201.7fr2n5xwvei23yog@mobilestation>
From: Neil Armstrong <narmstrong@baylibre.com>
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
Message-ID: <f6e38330-146c-eb7c-5a99-7e156454e90b@baylibre.com>
Date: Mon, 12 Oct 2020 17:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012142201.7fr2n5xwvei23yog@mobilestation>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_110148_928525_79CDDC89 
X-CRM114-Status: GOOD (  23.23  )
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
Cc: linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Roger Quadros <rogerq@ti.com>, Mathias Nyman <mathias.nyman@intel.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-usb@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 12/10/2020 16:22, Serge Semin wrote:
> On Mon, Oct 12, 2020 at 09:54:25AM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 11/10/2020 00:41, Serge Semin wrote:
>>> An empty snps,quirk-frame-length-adjustment won't cause any change
>>> performed by the driver. Moreover the DT schema validation will fail,
>>> since it expects the property being assigned with some value. So just
>>> discard the property declaration then from the example.
>>>
>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>>
>>> ---
>>>
>>> Note the same problem is in the DT source file
>>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
>>> ---
>>>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml     | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>>> index 5b04a7dfa018..88184d7e26cc 100644
>>> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>>> @@ -209,6 +209,5 @@ examples:
>>>                interrupts = <30>;
>>>                dr_mode = "host";
>>>                snps,dis_u2_susphy_quirk;
>>> -              snps,quirk-frame-length-adjustment;
>>>            };
>>>      };
>>>
>>
> 
>> Thanks for reporting this, actually the fladj must be 0x20 on this hw,
>> but we do set this on the PHY side, so we can let the dwc3 side 0 here.
> 
> I can convert this patch to initializing the "snps,quirk-frame-length-adjustment"
> property with 0x20 value instead. Since most likely I'll have to send a v2/v3/etc
> of this patchset, that modification won't be too much work to do. What do you think?

Yes, do this please, anyway it's only an example so it's ok.

> 
> Anyway please note, that I've fixed the improper property usage in the DT schema
> example only. "snps,quirk-frame-length-adjustment" defined as boolean still
> persists in the DTS file: arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
> So if you ever try to validate that dts file with "make dtbs_check" scenario, it
> will fail.

Yes, I'll push a fix to pass the dtbs_check when this is merged.

Thanks,
Neil

> 
> -Sergey
> 
>>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>>
>> Neil
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
