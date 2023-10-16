Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7EFCDB465
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNY5NlZZKr2yu+V2XMniLsNyuKeh1oQpoxEIzF5umFE=; b=sGW/dxdaGMdyDV
	A8xlyUomLOJCrQtBO0MK4K9ZDA+2oUq+Mi/k7i7PGe+QWoEBwU+Vqo9MYVc3laKsfloG/m6LV54Eq
	kc/oc/G14MxFe70/oT2OIt3oVEiC9FssIDW00QcOKXOn7OBpajV7ms2tnU+xvD123YXedOgikww5H
	Dcy3Q9xAo1Xry5Dt2ZJyOkk3LWeb3F7kZu89dmZC1CWhFL1W/tvMqNhKS4WcweZw22q0KoqiyjEnY
	kgJVieJ3RlMCSVQFDWMl/pXB1v3pbLZql8UxnSlUZQB8Qgyxd2DQSVo1zSWty9E9g06Y9Omgg4rQF
	7vkjFbgt0/uH1o4v7wiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJ6d-008rTS-0H;
	Mon, 16 Oct 2023 08:37:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJ6Z-008rSa-2f
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Oct 2023 08:37:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4066692ad35so43559365e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Oct 2023 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445458; x=1698050258; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTcYqYafZKh61MOwbQxVbQ/Lja6In1E83xTrWheBRJc=;
        b=LXF2iGDYiK6qhmyyv+ET2dpWoYV/1s89vDS17kgYNsU/iRCeisfZI0+8Hg3usuyDfc
         PRuc2vP5NzCEZ7vc1nxbknq2W25lRD29oLTecXCRttaOO43HYiRpUyqQKeEImJ917/Dw
         exmRUwASEp5WUyk9iZXtfY8fb93kbsS+xnINYinJyRIKAQ+qIMWg3tGtaLqnEloW9eVV
         Wib8KPM4jFdexrYfOuH7BomfFOhGU3vIKn3izcuF0vd86uKSaWye/wcWuN0DIDcg+KwW
         bgcoDw9e61Hxc/p0lFR/D04PrFJqYqC+eY+v7jrhgY6tnu+8eN5x2RqfSRhdmXogH/Dy
         rbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445458; x=1698050258;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTcYqYafZKh61MOwbQxVbQ/Lja6In1E83xTrWheBRJc=;
        b=mILLRUwQTGf2Aq8h3p36/i9nuSXaZVT/Xz7Tw057nUQQGSmWk1kGPAP7UA9Isge7vv
         jhIKFOdiFE0e0TSO1vP9brH1R1nf9Z3QR793KbOmMK+mFvLHG3LEpBklWgKs08C7fSdR
         /PvFErkejv7xkni3n0X5vZIv9WVBNpxLlopsRotBQcR7oAujCYNzczB9QF12szNPulj1
         YWVuQdgxeXpkaGTUauVcM973wk3vr+Ci2PKKI18lb4mmvzXAHuDUpK/YaHjx3oFl49O3
         e4Dzm/GLLEd5kRZCT6GDXqXBBD4WwpL6Pt41j6q9HC0jL9kJ3UpMdapXxtgkQj9ofjl4
         ByJA==
X-Gm-Message-State: AOJu0YycgOW79rZVCvqfcV1V8w5Wvw3BGcSBkPOXZyz+ZW1Yak2SxIMm
	4qAFVeTdNxdGpraiPUb8wcIIEQ==
X-Google-Smtp-Source: AGHT+IHsEMQ8SCTS8ZorNLkIIvReNSc630e0ztnD1QL89wKHDLcTVq16AdmilglEKYOkydPvSU9ppQ==
X-Received: by 2002:a05:600c:b4b:b0:405:3b1f:968b with SMTP id k11-20020a05600c0b4b00b004053b1f968bmr29498842wmr.21.1697445458392;
        Mon, 16 Oct 2023 01:37:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130? ([2a01:e0a:982:cbb0:b5ab:4a16:fd45:8130])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004075d5664basm6629320wmq.8.2023.10.16.01.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:37:38 -0700 (PDT)
Message-ID: <00ef6ab3-59c1-484a-9d70-50f16e4cc584@linaro.org>
Date: Mon, 16 Oct 2023 10:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.7
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
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_013739_869668_6B57B0F0 
X-CRM114-Status: UNSURE (   5.53  )
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

Here's an Amlogic Drivers changeset for v6.7, with only a couple of
low priority fixes concerning the meson_sm driver.

Neil

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.7

for you to fetch changes up to 5d59b6a49bb8f6841acf53affc0c4720fe7450e5:

   firmware: meson: Use device_get_match_data() (2023-10-09 10:48:15 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.7:
- correct meson_sm_* API retval handling
- Use device_get_match_data() in meson SM

----------------------------------------------------------------
Alexey Romanov (1):
       drivers: meson: sm: correct meson_sm_* API retval handling

Rob Herring (1):
       firmware: meson: Use device_get_match_data()

  drivers/firmware/meson/meson_sm.c       | 25 ++++++++++++++++---------
  include/linux/firmware/meson/meson_sm.h |  2 +-
  2 files changed, 17 insertions(+), 10 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
