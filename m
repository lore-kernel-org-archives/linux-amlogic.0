Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B55D3EE66
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jan 2026 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+9EgFtCfu8KZRoJOpOLdbt2ATGH6+/0VBlwUOwH5/k=; b=Mq8iutRvdv5BwV
	u+iojpwIJA4o/p9E7QrZPG7XkpDEexPntODJX2TGScG9Dl9B9bBEgIYsOK5wessCqd1ujZpLJgLux
	eEiNPYP+d1877EepNHCS3V5owWa3cKdHJAss3MjAC54Rb+SYKxmg16P6NAZceVOlLfui7GIRBQt+9
	SNUCcOfZX7JHju2mWYoxJF+Mg8iN7AHLDqZr6DGfO+6O/ckSwRZA40+f2EmjqaiWX4NPGUiuXv2hO
	0gKneMhoUaFX5mQtmCDMOxEkqChDZhgVmONi8mDA8Rrh7LT5s72N8ndFK0WgFaWRKKeF9g2176yXs
	tdIC6Ppm+zSLAYyjmw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw7R-00000007H58-1qVX;
	Thu, 22 Jan 2026 14:57:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw7O-00000007H4P-3wIP
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jan 2026 14:57:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso15481225e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jan 2026 06:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093824; x=1769698624; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvvcAfpGr9iCX/eT3iVRIT3kqag1uOnz1TuyzDgPzzU=;
        b=wyqj2mzqbzPUoOg237OLNeKp1S++IveD4KrJoB8n2NOOZYX5QlRI83PUnC6xHp9eqe
         Mhd/KRG6/GMnM268/txxCiJjfWIX2GEgHTPlxwbg7cAnecWDY8h7Q6Y3GoizySmU/vC9
         lao0Eowlgl7gs3/EZ/Jt+/LZl378rXs4uyKeT5MaWU8kgVq+75ni/epAWTGRxvf7eYfA
         yjLmHZuNzxDI8A6QOhM6k3ceIv/ccTVZO2W2amhKY/kc0Op9CRBVp9Ej1Fe+ZU5XR7o1
         lWEJMzQECN6ExcowkEFLe5N+Zqf7nd2xxYUJ4jfBiAN7wFkJ9Oi26R5Gn6UfhtuduMrK
         CGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093824; x=1769698624;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvvcAfpGr9iCX/eT3iVRIT3kqag1uOnz1TuyzDgPzzU=;
        b=cGL5JqA2UThyquQFaEJSUP7MLMNs9mZmcxQQ3Esq4vkYT5TxNiJDWRUszsEl+VsAky
         mWmXlokHRKE4FscoOSj7C6m32BDOmJ4+zOidKI0VkbxpNAlkRSg75Msha1loX5dn6W/b
         kXm6Uig5WZjfIsGYW+4jio9Sa3NjOEcnM8Id2dYD0q1NoFscRrpMcZKj6yqG3EcpNM4p
         NtKc5dxL9ZhaaZ+2awqF05Sdpuq61deS+UbzY4cEF/h3vZdsvrIhTSDLA6NyqTwUQ1cS
         gnfpMLnpSPBG0Y2DcJBQU9HE6Yg2aIcnUjxg9P4zwfDyHUamM52TdyF88M0ccT/BSaMo
         G0Dw==
X-Gm-Message-State: AOJu0YzKAKwyFFqpXpPQsgN6m2+ZciTJKYG8+pwqYrCLr4GXxKu3brGD
	MBJ3ozUdCzIb7BU9t1So5JHYSj8qtAHKR+/Ta/chBP/IX+7lijLD9r4WkcQE81GfnDGcbQJvukh
	RX+mdgXNd8Q==
X-Gm-Gg: AZuq6aIsRnbiesfTcHzYBOVpVG+Dr3lNX79sAio8RiOHskMf0wdZht7N2C6h5lLps0j
	miWosj99tyWhsrmruySY4vyWSmg5jvbAKWfOOoAcd3QB/EqCz7QGN3u1FtTYsECt97PUGZZX0x5
	aCoQo7n4r+ADNVfsZlnCDpNrq2whf1x2f37GmFTiHYPhnT5LOPHwEA+Yh9bclURHRf9PBmjUxbn
	q93sJtS23QD9pitsbHJyl0Ik4zyGNYoFWgZswxswLeHYhDaKbp40XnPBM/G/vHcljVAg0fXG8/9
	yxbIkRS7Hle5xT7p6rdflWTVZf5hsV7Xd1Km7W+1S3/HgmsA+ldDzjJDr+SeOnw0uVwEh0gRenn
	OKz2qn9Tr0fW+zc6Mw9uL16CFp3j35Nu/GxVhf/tbXYX42pEA7d29W3qpSd8RCQfv/qv0AYnjI4
	1DSF+UrfyYhruHMwWVLNKr/gy2F6hvbOAbOPn+9Ks48mxSRlvlWueU9phW45cKooU=
X-Received: by 2002:a05:600c:3e06:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48047073a08mr53424985e9.8.1769093824222;
        Thu, 22 Jan 2026 06:57:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b712sm70427265e9.8.2026.01.22.06.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:57:03 -0800 (PST)
Message-ID: <1ded64e9-2154-4f4b-a9b3-3435a8f24078@linaro.org>
Date: Thu, 22 Jan 2026 15:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.20
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_065707_011930_0F5B9844 
X-CRM114-Status: UNSURE (   4.43  )
X-CRM114-Notice: Please train this message.
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

Hi,

Here's the Amlogic ARM DT changes for v6.20, with a single change dropping
usage of iio-hwmon in favour of generic-adc-thermal.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.20

for you to fetch changes up to 5ea75722eaec226c60472dc578a302aae1d1fa3e:

   ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal (2026-01-07 15:02:40 +0100)

----------------------------------------------------------------
Amlogic ARM DT for v6.20:
- drop iio-hwmon in favour of generic-adc-thermal

----------------------------------------------------------------
Martin Blumenstingl (1):
       ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal

  arch/arm/boot/dts/amlogic/meson.dtsi | 5 -----
  1 file changed, 5 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
