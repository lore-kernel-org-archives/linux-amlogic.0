Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCDAE77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rK5ZDmnDPHF/fZWOJKHOqtB2sgG4EnyH5JzmyWnvWCY=; b=WJ7XD5GwKjUsbw
	xlX7fhESAmvLh9iWRhS8ZdpCMkEz4phAxLpWIWqnW4q8sjPwCtKAlggsfBmy4EI2gbm2NTBjZ72l0
	5BPRs+d7wddm0h+EIiI5IAxzmG93K3uwmRRMVWY7CBrEFfwTZs2+1wdAgrlHYXAtpZv8P8beQr+Wr
	v9P53eRVGl67Zi7Rg3bBI9h0Kqbe4p3NJMGm0nCGfEXDkZygEEDM1o8+ynO7fFgKREktRJ8RvL8IZ
	whHY9o2eXjxpvM9+zCi4HQwD3BCl3pnEcExSKAzssRaaUcv1N4K9LeL2cmDUzJepCUnVbuPrkNDq0
	L0pIRG/1/3nktjgb0AtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnyv-00000001Xs3-3O6C;
	Mon, 06 Jan 2025 14:21:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnyg-00000001Xo1-430n
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:21:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436a03197b2so51048195e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173269; x=1736778069; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeHiTUaspxw3YHA9Av4He8MumgYB5Gh2jqQAtY0KVLI=;
        b=u60DTBnAYtcN8EhBQR9URMnMLRWgDnJ+vzIecPfJbJOhJnlDW0voO+9gL+3ZkuCxku
         WrWvu4dpG2iy/Egdcp5zzk8BA/Q1n9S0ikL8RYpiU7Ce2RIC0uiKnlKXPZ6KUh+kv3wK
         /PUJrmFQ/tSPh4CPp6TM/fPiyOEIpl6gHSCVAkzx+r6cEfJINgT0OKIfCKk0Wi+TpFL6
         KW3uRfbI5qnERYuN0FJTqmTqquhH/NtnSm6KdgT6ZyJ/1zLNaKOQS/NVf8reseTjojr0
         sd43Qwfh/dk7TnCwjE1btcQrjS6ji2eCP4QHs3Oem86Se4b5CQGbagugXqnfL7oxYgNW
         Jrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173269; x=1736778069;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeHiTUaspxw3YHA9Av4He8MumgYB5Gh2jqQAtY0KVLI=;
        b=SVJVUXDLO6FiTvcswl/vGnWHxazqbfCFWcB8JiIniTOdGiRAqtHoCN9p//FfjS0uCW
         yGtdTieGWCTH0CqUUNTB6mEfmAheRZU+sDnqFWTSHQijKUg/6uB5jk2KxN9KUKKolbm8
         tEJMvy0Up0/myIoRj9a2kzyxlzzD9LnJbW8ckoVJ0d5janKRekCUR9b2kbmz3iB9TV3g
         lA3HzETkzUECKB5DAbSzP9Tm6/daacQkwVKKDDCwol5RZBHb246zvaMiO5SqFdV4Tsay
         pWCKV7bqyDGExu57YNlXjPFP+ax9xpkhw+QZZI+o9A0xyQvsTJcEjc/RvX+49tZ8GE0x
         PCQQ==
X-Gm-Message-State: AOJu0Yxw2yF+hlPNUjTckfDfshOE4lAKw7h2GUrhydgmmFjpzDQWiRvh
	Hqz+wort0LS/4YPhcHU1hpWzIAqW5eTHrm4ylJteTfAmvd2MJoIzN2JZPtQ2fp8=
X-Gm-Gg: ASbGncsM4T3Bg0rj8fjCIrjz6GpjEL529xFy4gI0bSO/la55fAO2I+unQqSEhdqhDvi
	5HmWHPrvZSYbXeHWlT+SDv0yIFtOnz1Tpj+0pK2Grtsbm9rXOby9Ad7G2bCqv43Gj9VN4Z6H/bp
	k3Dg4OW/7hJjVLjyFByQshJ/uq6nXOBnrX7biEH+eYjWQq5N6vWBgxmKgjz9McSLwAWXC62m7bi
	Nxvl7QQ/01qTnzdX0siGfNX6lIQ8lJGJ7tbJI4/NoauLw1O/tYyPCAZ5E4Ar/SAvkVSZA1G0NRs
	elEyA6BvAIXVazax829uuEOVutdh
X-Google-Smtp-Source: AGHT+IF5Lh+oWFRck0Vw/8+lvOoj6CBwPIpbpPWwc94r3tUU4OIFk9lTAnr5Rp6BiofrhtN1DtywvQ==
X-Received: by 2002:a05:600c:548e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436686431a0mr463290275e9.8.1736173268595;
        Mon, 06 Jan 2025 06:21:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm601987765e9.23.2025.01.06.06.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:21:08 -0800 (PST)
Message-ID: <77c645b3-0cdf-49f4-84e9-11c74074b9a8@linaro.org>
Date: Mon, 6 Jan 2025 15:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.14
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
X-CRM114-CacheID: sfid-20250106_062111_000554_5A897840 
X-CRM114-Status: UNSURE (   5.50  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a single change for Amlogic ARM DT, simply removing size and address cells
from USB nodes when not needed.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.14

for you to fetch changes up to 3a4bb81850662bebab74f1ad27071652b1825d58:

   ARM: dts: amlogic: meson: remove size and address cells from USB nodes (2024-12-30 11:00:12 +0100)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.14:
- remove size and address cells from USB nodes

----------------------------------------------------------------
Martin Blumenstingl (1):
       ARM: dts: amlogic: meson: remove size and address cells from USB nodes

  arch/arm/boot/dts/amlogic/meson.dtsi | 4 ----
  1 file changed, 4 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
