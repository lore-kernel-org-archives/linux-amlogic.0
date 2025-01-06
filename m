Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFACCE77198
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SOeraQF0lLJzadYHHfOrDRpqvzAz3TQauYrkGYurIss=; b=HGv5/hqwzh+agz
	E4dCIGbwicm8M94mllO4Uv8n9Vt2y5eyhzce63CNhPVEoOxiOZseEeMmcYVVMzzYRLNHoUJf8r8LF
	mPBJHdkGzjDIPr6cWcvmZ8pCfUjlN6jBPPtKA/NF2qqm7fx7V8VwfccBKOmKNKVTRES2kTJJfa7ob
	Esz9jSrmfCj0ZAz5CulKcbUAIdifeUwKO6yQwZ0fe+pTY6fPRj1/adGEV+BjkIhPdBl03QNVxLD/z
	2q9WfMreeKr6MRvGN8m4rTP/WSgGgJmUhcsUeTGOv5rzQfEUq3LOoXWrWxpNpFFx0+XIIeRHDlyB1
	2T4av4rBXPRyXti4MXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo9M-00000001aEn-1Se5;
	Mon, 06 Jan 2025 14:32:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo0f-00000001YPQ-3g6Z
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:23:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso99160645e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173392; x=1736778192; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+ISvG17XlCRUc2+RRHh59wTwYCWMY/Hqwqq505SSb0=;
        b=kAFktXvKk7ebjEqlALzUAUPc0JHKDRRIJhOJMWnoZ7QajCyGd6ZfIYnixpyd0gQQ7U
         BrJoxEObOh5P8F81VZsSqecBLeO1l4XlVWSLQIhFFvdg2JMiHyApcWZMacDfVhr+Cn7u
         3QPTPybFP0hOtJgotC2VdxeO35AiddG1Z3Rfelt1/UfrtVyL1YYg6v+TcQArD4NIu17F
         40ynFmhXmPGwuRdyvOL5Bj0TsOSpUFHGRmQjz6sSsN4eAwWrMYIWayrs12fSHgPsXq0q
         Uq6nf76XWDILw7xPTSPbPLFlM/1nyf/JdrwjUDkWkleJ2S8ad8ZhhOMWtfcjKeURPcY4
         3hVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173392; x=1736778192;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+ISvG17XlCRUc2+RRHh59wTwYCWMY/Hqwqq505SSb0=;
        b=GOQMdyyzs/MRPBdHMTka+0NRRzlVJaWIWccy95j94V1bL1yhqOJu1n/FDgL4uwCk2w
         pfKk5jWQuQR9b2SjVNms9Qh/TGCNdji+8G8ExOgDXmkVZyRoVyZEgyaJrJrrbQKjIswQ
         4HqemDGpZlwUfKVeRobwmb6H723Epz5X0u9BbT58/Yp2Tfhq3fyo7T1BZNAFKQwiwNlC
         FOXP++66Gx+MqMoW/ojIr6Bw44nRpgZ7hJa5O9VY86qdk2ud6ZvwN64NQe/Ox4ftcTfH
         VdIFcbqyhzKsGiOo09aMNWVcBPbX8N18TQH816S0JB+rmp3a/0ozUgZSApIfrSvKh2zL
         EGNw==
X-Gm-Message-State: AOJu0YyiK6b2QMLNi2431fCFdmO2q1PPA+LhxRHsYhQdPDhAefxl6JJz
	MNJ+rbFQKdsuYbPv9xyExtzCzs327Bd5YBNb8p2QASW3yv7Z/NmaJEYjo9NSdss=
X-Gm-Gg: ASbGncu5dz8o1QS5yhIwhBhM5RssliSfZVo2DOjO7ZBRLNSnAT2FDjvhBJ08JWN9bNy
	P+U7w0ROkIyCQd62+BJt0lpuvLxMZExGJYiURn7nzj4T+F4sq4C559yW+SNOZ46ByPlYrkbnA77
	kAxdVL4dhEtHclVNPm5JEBCYpk8pONdltzsXGRJRL2Vjg898w5roF5d/iUeBoAuzvn58B66buyx
	RGF5oTfoh0GPus/iUSy/X8znveQcYbIOfQy0jaUK3WNks+liehofZ9PFHJ837mHqA+qprRoTvzv
	h/iuxn8BZZHjFcnmyXzbseqMj0xz
X-Google-Smtp-Source: AGHT+IFbQVoTEVhEDDdBwsowpTrnhU+0JKPMJ0XbhCvp1qdAqGclVtuhezzIVxR/+KsmGKTLOCnaDw==
X-Received: by 2002:a05:600c:350b:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-43668643203mr623670995e9.10.1736173392034;
        Mon, 06 Jan 2025 06:23:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289d3dsm575723455e9.41.2025.01.06.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:23:11 -0800 (PST)
Message-ID: <72d71d3f-99c3-4767-8c80-8fa7a865c846@linaro.org>
Date: Mon, 6 Jan 2025 15:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.14
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
X-CRM114-CacheID: sfid-20250106_062313_922179_163A6D2E 
X-CRM114-Status: UNSURE (   5.82  )
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

Here's a single change for Amlogic ARM64 DT, removing the broadcom wifi
compatible from the SDIO subnode because the Amlogic GX reference
board can be shipped with different brands of pin compatible SDIO
chips.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.14

for you to fetch changes up to 1ba1964a7f83daae7fdeaf2de584a7ba758c4491:

   arm64: dts: meson: remove broadcom wifi compatible from GX reference boards (2024-12-13 10:36:02 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.13:
- remove broadcom wifi compatible from GX reference boards

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: meson: remove broadcom wifi compatible from GX reference boards

  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi      | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts  | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts  | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts        | 3 +--
  6 files changed, 6 insertions(+), 12 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
