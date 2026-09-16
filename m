Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D47C88E5C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y7SQenuE6x9Cnl05tNYyjH0jkKL2Kk61+OlKT8/Gjcs=; b=SF0WhX2PFu+3RU
	KkJQuWLsgYJG3PKS6OLmUeMuthLB4y0th1csVtjhSOyuQo0xD775f5meX56kQEpBeIVADutk9ryOI
	eFgazxvf9JuYoUJOw10alyHdqkAJD2sCcBU5Ll+D3BqlBt5+XON0ddkWvceMqKV+8xJoZ84MfEZOr
	jAuGL6RBQ8VQ1wkR9uhVKklEitlRrVqZ/1er4U3eiXeEZtOzUERV+gP8oVFOqlOeZje/mJBzrIl/u
	//yjWkQYgVXZUy5Ccyay/G3JKRC/Chj/ML3fB/7/r/nsA2rCNtSp3k9wZQeaBO2JraXLGiRH6fPT/
	J4ZGW3UEufQ/9OjLBXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ma0-00000008wFr-0oPd;
	Wed, 16 Sep 2026 10:09:28 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mZw-00000008wEJ-497f
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 10:09:26 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633ecdeso533144f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553363; x=1790158163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
        b=NqWAuwHS0C5n20f/BUK2hSHCLYloU+wLGx0r9KUutdmCd/D84iNXODbB7rxtuty8CY
         Xv0yqSg2OK9hCbuP9/gWif5ZZP2RKPbpMY2n4tnNuTqpYxABjwL7aS1kn2GvevEECiub
         QoAwQ/gsvf6Qm6pqAEtdz/D7Uboyw0SgABmMrLEuHNlvjVjyl4TwOnTwCghHjKg3Llwm
         HLPOXFxa3w/ziCIuft1kGBt6SzQVx3WeqrmMokLTIgXvopOIVcJ8OLuJHrWZ0nMvf6BM
         YnUETXcmtzAKp7HnRhSi5UT/zze+rIpZkOkxKoVqVFR8g/Zk/XuhMi6aN9s8C+ZkyzUJ
         DrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553363; x=1790158163;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
        b=eveYLTc3ZFrFhsDiA1aV6D0bWmiaDcNiNzjIsskkd7Ikp8QHDBUSvBxP/If0csR9JE
         lLwMW6KNQYrymhWigWg0NVcd5NdFZHy+aA9pPLyihMg13Ol4lQt2GOHZa50ikn5/kH8x
         ntBaQdqNUFkqttR9iVo1ClqeG1Et14P7bEyzU3h1bUw0qOnslPZZCeonh0e0s0f1zYMr
         3f32sa9btqp1UKZKRjW1z27rtNrQ2khq3+yYu7VJAlBkAerjkPBOdRIsoHvggNJIR0ei
         sy3sOFvRKSdsQSSO6mxv/pMPyfEn91EU4elWkFA5fWEfXJwAmBCIT9TQ6cmU3tt3oIvf
         9IDQ==
X-Gm-Message-State: AFuF++lBy6vX+junGuXli/iZABCDaaDF93Y+fvHn86ZmCPXRQkn/z1ba
	6u/jxuA2T/toQWVkPGFwbb3QmXRoUxf4INeULiE4VXCQ8+NsRd56z/UeCEZ2dlQ4FaE=
X-Gm-Gg: AYBFou3LKfKBeImCaVYT9wsglRjpoRiu8APLpgI4LwBynS2sE1tmwoKZ/4aKUU7VkyM
	7s8cw6Uvd2DcXBdc62NnhfLJEOXHBagXPtwdnQlWwNBFSGaGwra1eOU6aWVbYZQ3AZ0htBi5J1o
	zcuIA3JVEkcrmSNINxH3A9Ugco+1Y6+fUTPIh6eTbIa+sFli7PtL5YlonygfSU02NPDTZe3ApRm
	y1+uQRlZZHRgC2yXDOzrbSAk7hxT9h20iQHlxRJy1wJS6GT4HOiFhIXCgU9NKj/0Q8H9SEK+LYT
	KovjwNEX1mcL/WHyLatWQuW8eY/CKM3dJ7AEdtiNtFfo7I+QbV4XouQUZO58yNJpAol9eUekDYl
	bjx2FYdPE86OyB8IaJOmxq6Yghdg9lEyzWTcPzCQ2paWTW8aeEOZDxfNZWT6RxiYdK4XPvkGcsV
	1xZZp+inNL1RM8NTFNxtUO3TOOGDA9gVHjQA7lrUUvTLTZGo869fnWzaFOemIt+7WR4SN78gPlv
	cB8Op2hBoZCu57ML8kxFkDhN7zx1K52grbMvPFe+Csioc3jPSiesxSkn/U64opS7A==
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr2502387f8f.22.1789553362827;
        Wed, 16 Sep 2026 03:09:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e? ([2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm4832517f8f.30.2026.09.16.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:09:22 -0700 (PDT)
Message-ID: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
Date: Wed, 16 Sep 2026 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT fixes for v7.3-rc
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_030925_038359_C9848450 
X-CRM114-Status: UNSURE (   8.01  )
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

Here's the Amlogic ARM64 DT fixes for v7.3-rc, including a bunch of fixes
for the Amlogic T7/Khadas VIM4.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v7.3-rc

for you to fetch changes up to 406292fd75f95aa3010fec95b5beb5a8b7e3ba3a:

   arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM (2026-08-31 14:42:59 +0200)

----------------------------------------------------------------
Amlogic DT Fixes for v7.3:
- Set of fixes for Amlogic T7:
  - use the real UART pclk
  - allow the SD card to be power cycled by dropping regulator-always-on
  - fix the pin groups of two PWM outputs
  - add the CPU cores PWM-driven supplies to fix runtime crashes
  - fix the pin groups of the vsync PWM using non-existing pin group

----------------------------------------------------------------
Lucas Tanure (5):
       arm64: dts: amlogic: t7: use the real UART pclk
       arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
       arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
       arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
       arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 113 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  44 ++++++--
  3 files changed, 149 insertions(+), 10 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
