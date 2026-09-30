Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D7CA5FBE
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVAS1ZMYP0E+tIPmnQkBHXchLOJfuz2RrAMaMxbLbLg=; b=IUFF5PW7kdWWWvEaM2rhstDsUq
	1xRyiYiqLYjR5RSRYG00LoyO0DxFNLnHL0p+omxPAx0LBmoVQwrXGIT1rMRwUh8hrVeRaZlrO34mm
	JtmRdQuIheLJlonFWW0K6FT6QqA7fghdaQdMaAashYPC5rvuosKb5XmumEecFHRBkEw75EaaSDPt3
	/5uHFK47jTqThgqLCFaxMrnIjTbUVBzPyq1eK2rdN6iTXQZg2uoMGOLf95niJFWm0vvw7E0MAZRsG
	SU98ZSb0XH0HbffUTykGt25CoMesHHIiL7rMLH7WeWSeVw/ux/qObk1fCx1iFd7k1q9zy7JOyHOYH
	6etvNeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuGm-000000067V5-0QPn;
	Wed, 30 Sep 2026 13:22:48 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuGj-000000067UV-0Rep
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Sep 2026 13:22:46 +0000
Received: by mail-qk2-x0e.google.com with SMTP id af79cd13be357-93be29bb454so748866185a.1
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Sep 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790774563; x=1791379363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=z4uv43wuGdIE3Rk1Ij1ZwvbSZYf1ThnhLTBlI66QbKSXQD6Z0jQaXcQRDppePyoTb9
         5D8JDhrz64p3iBThDZcYMOqZr/Ruvl/ccGUJhXbi8c+WsDtg/2+Ys6osopjviB2WnP30
         /V9CKJqrjC0esc8Klb7cpPnG2taovnoWFKjpISwcg0kw9io5qitekAmVfCyHDotZT8ix
         5gRrBXvGV1pGt99TSgtv3bei7bCHs/HLghJwOsre5y8Zvnq7jwJgrRA6T+cwDGQrHhVX
         PB5jAqvVAitjYvn9l/MkjQ2qcKZ39rU4B7tWlztjEot2lYd31mtJF1cuudkj3NE8oQgQ
         KUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774563; x=1791379363;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=GY9CLl0quxtsE8d7jaSWjWpL+ve1xtGBxyYiXrHbVjlppPdJEWvXEvm0bf+0VymALa
         P9vb9uY9km8kOtR7+4Rvt7dvQUzb8NcDZgBN0ginJPsTtcXNQRcLOouDgkq1Nl22dcG5
         Q256cALLFTgP//BtbLOAohEK2gPmIYizg+iCfFEcNK8lszddr7S+wsq56CWZ/yiX0ByB
         jPm4Plp6Y7SdKg0zXi2FexwOXwAs6/LKFIEYhAHa1rIghElheNV4NppBdnnQvlDytQrY
         qQrg4iUiodGnQvQTfZtrXg5I/d7ThwxGo0VjXROIqFSLuVh72HGcLb+/vqkH1HBHrGLD
         Zd8w==
X-Forwarded-Encrypted: i=1; AKwUvBwLtbzThG/qjuj3hbh3hyaE0DilKHrxK6P63nnU2UersDR4Zhbn7nDhExiy2onJJ03nReMJxw8ZnsNNveQQ@lists.infradead.org
X-Gm-Message-State: AFuF++kcyxZpZCdnxper7CzqYVwvZ+VepdNxRDPkLq0RCh7EgR3qGocj
	Y7FHozu70pKDcW8jtldO1EFEVqY7LkN4ohF92uh08VfM9AOYbhcA5fbnvTj5ib30FEUOE8NphT+
	JXVz9AfB04Q==
X-Gm-Gg: AYBFou2I8ba+pazbGj8DH4Kvegf5F6IQ+v6iAhjpACoV/RNfPGfykxsq1KKeUmYWhX7
	HV1y1SGOI4lM+U+jKj3qbY2J+4cShRKO+0TekP9gFunv2LoU8HOHBWUkYEiiubC7j8w10D3YJEH
	AgPoQvf7YVcZGzc+wNQXMquhxGYIQRcPe8Ejq+4KQRF1FEenUCuBW2MUnUh8YSKGRurzlgo3PHV
	tIJq/IK76ej68NGmKXo0LPrE4UbQJC4qBUFKRO4pwsoda7Vx2dDYVou0UjBPYiJ7VYIm1n1QDEx
	XTXWS6YTmBl0ywLdoxna3VqYOzoSAMLVO5fp/uxM5L9aAZh+BDmU/GrY5zhcttJt/U5I9PI/gp0
	0aOMaxY74eOhs5QHnzW5jaG3hUwmAZALQp5tvA8Stbh5KG59GR5eWnJ1V/0hPKnLQjS4/JNyA8C
	3hMs1h8MdjkB9lW+i0PBFrqiU3YYE85CeyabnC9gdsBvpZZPNBhw7XqaVz8p34Q5chxONU8nuzR
	xqBcbfdJdC/X/vdZGVMTyOPAKjN4ah8r9Cwl+M5nyKUUf00OXwCOE8P81SfGQc2opgqW6plsqY3
	wOIoqaM=
X-Received: by 2002:a05:620a:2717:b0:939:97bc:5645 with SMTP id af79cd13be357-93ca96b53e8mr222317685a.31.1790774562686;
        Wed, 30 Sep 2026 06:22:42 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82a87f4sm114784985a.20.2026.09.30.06.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:22:41 -0700 (PDT)
Message-ID: <a51f9814-fe65-4a2c-92df-cbc3f00036fc@linaro.org>
Date: Wed, 30 Sep 2026 15:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/12] soc: amlogic: clk-measure: Add support for more
 SoCs
To: chuan.liu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
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
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_062245_174712_2469EC4C 
X-CRM114-Status: GOOD (  21.10  )
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

On 9/20/26 12:25, Chuan Liu via B4 Relay wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> This patchset also includes an additional patch to optimize memory usage:
>    - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
> 
> To avoid requiring everyone to spend additional effort on a separate
> patchset, I have included it in this series. Please feel free to point
> out if this is not appropriate for this series.
> 
> To improve maintainability, this patchset also includes a patch to reorder
> the dt-binding and the compatible entries in the driver.
> 
> To minimize unrelated changes, the existing clk-measure channel tables in
> the driver are left in their original order. The tables for the newly
> supported SoCs are ordered alphabetically.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v2:
> - Reorder the dt-binding and the compatible entries in the driver
>    alphabetically.
> - Order the clk-measure channel tables for the newly supported SoCs
>    alphabetically.
> - Add the const qualifier to the A9 clk-measure channel table.
> - Rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN" in the A9 clk-measure
>    channel table.
> - Link to v1: https://lore.kernel.org/r/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com
> 
> ---
> Chuan Liu (12):
>        dt-bindings: soc: amlogic: Reordering compatible of clk-measure
>        dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
>        soc: amlogic: clk-measure: Support more measurement channels
>        soc: amlogic: clk-measure: Align compatible entries with DT bindings
>        soc: amlogic: clk-measure: Add support for more SoCs
>        soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
>        arm64: dts: amlogic: a5: Add clk-measure controller node
>        arm64: dts: amlogic: a4: Add clk-measure controller node
>        arm64: dts: amlogic: s7: Add clk-measure controller node
>        arm64: dts: amlogic: s7d: Add clk-measure controller node
>        arm64: dts: amlogic: s6: Add clk-measure controller node
>        arm64: dts: amlogic: a9: Add clk-measure controller node
> 
>   .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
>   drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
>   8 files changed, 953 insertions(+), 20 deletions(-)
> ---
> base-commit: a2530c83c458a503e55219966217dfd1c36a385e
> change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68
> 
> Best regards,

For the whole serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
