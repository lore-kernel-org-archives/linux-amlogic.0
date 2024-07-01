Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB13C30653
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kD4eb4G+6TgOcZrDhXFC2Zq9Rh6S7YYZHDOnEVADiRQ=; b=oSbT0e1jLGnDHC
	yexWbTXmdssXy5rPLjjnQakM/tjOoQhM7z9zrglJthj8Oy/KZAT6KGFyQ6UaZgaQoGitb+L/Pp64d
	4CN07Xss6yXqH97akTU4dfTT9jw790LPmrB0LKXeOxwZvI6IiLz9zTqLD4kSDuPKat5qfsRjEpb+7
	XxdweJTINn1607QZ2/fN3zfzZIq6nXQXAAI9F6EowRG0e5c2aiQ9U6Q851xpjlGJ2oi06ka3zEH4v
	j1ijSki4iV3KLTjG5W5/fL8GcD8/OSwDMUtBvT1X04JEf49gxyhs4F6rqjbcJNCPJA+xhUlArHHrK
	7zoJ1V2nH2Ack8KKUBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCYE-00000002G2D-2t7R;
	Mon, 01 Jul 2024 08:38:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCY2-00000002Fxq-3maj
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jul 2024 08:38:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-367339bd00aso2087290f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2024 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719823085; x=1720427885; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxVs/aFlSL+ewuyexawKywQPxcZUDdKkKdHaRAPiuwY=;
        b=qef7qTTDfcCZ0wUpLDf3qkbe1xiYuD/rc/rG7sBFcz5PQWcWD6e0A9N719FTnHAEMr
         a0FQYKmVchh8LtzKLuzrWF/rqn/KNtcSNrcV3+yjozTtiK6GYgvJ+6EQfSuyDmMh374X
         awIRkmkEnLgIe+mCSDaud0kerKvxkfK1kIlZG5ZpxF0kcVmtmTaozG+yiY9yqjacA+sT
         BZSxYDS4llT51Y/VDxarPgB9CHEzecX1s6o9Zmd1fehoY5j6YgngRKha+tIzZcQzDkOv
         dU4xbdm5UR/9XEVFoBsBQniFbfNaJIB3lh9yhkkmmHiNZ9wkp+KVLINSKeCWJ5kuscV/
         v1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823085; x=1720427885;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxVs/aFlSL+ewuyexawKywQPxcZUDdKkKdHaRAPiuwY=;
        b=wbdUpXE3wnBP0X9RdIC1KJyeSq8coLjNF5wQjiwjAfKn2VYGbY+dkks9vIu1GFLcyB
         Lyp38E0J7M2qhLO1Z9ggdsst5jgFrOghuHyQhVcIyOz0dOuRYUdEM6UFl5hBSTL1YQYw
         JLWPonH9Ug+x7RxdsaPqzYomWI2UMHy/epdDrQa2XpKuuqNc6zDeMhEyDPNIWcHxSvoF
         cbhmbnOQaFkaFS5h/kDUVvchUMw4lEhvnd56SmslCrdKMkMtDQPQjjer5b+9Afjvmz6t
         k/0CXjuxF8/cm81uyQMlHfACDH8ryk0VtnYlyRyVou6zZe9TNqQg2M0arimYUE1ffVax
         gxvA==
X-Gm-Message-State: AOJu0Yyer1On2ITetbijs4MjWH/2U9BW2Mh5wzGLZ8114O0mRc0RE9K8
	56CCLnHluFUwQ5HS730R0rC6c9IJwBbdZV84W8S14jIuGWZTjrG5ILgMd9QvW0rIGQG/1GuxG0z
	M8wokWQ==
X-Google-Smtp-Source: AGHT+IEC+y0QGzsFdQF98bWxNSJQWWcmdbLYujB9UH+gGS0CAQK2LeEtDTr24X4WKIbxypVU1ZvcTQ==
X-Received: by 2002:a5d:5301:0:b0:367:40e6:46bd with SMTP id ffacd0b85a97d-3677572985bmr2724924f8f.61.1719823084737;
        Mon, 01 Jul 2024 01:38:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4719:99ea:652b:10d0? ([2a01:e0a:982:cbb0:4719:99ea:652b:10d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8cd8sm9347934f8f.27.2024.07.01.01.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:38:04 -0700 (PDT)
Message-ID: <35093904-c4a8-432d-b010-a994fc1ee536@linaro.org>
Date: Mon, 1 Jul 2024 10:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic drivers updates for v6.11
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
X-CRM114-CacheID: sfid-20240701_013806_982680_D80582A7 
X-CRM114-Status: UNSURE (   6.13  )
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

Here's a couple of new SoC IDs and MODULE_DESCRIPTION() fixuo for meson_sm.

Thanks,
Neil

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.11

for you to fetch changes up to 5375986e16207e573c0493009d25b0c01f44e01d:

   firmware: meson_sm: add missing MODULE_DESCRIPTION() macro (2024-06-24 10:08:53 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.11:
- Add S905L & A113X SoC IDs
- add missing MODULE_DESCRIPTION() macro for meson_sm driver

----------------------------------------------------------------
Christian Hewitt (1):
       soc: amlogic: meson-gx-socinfo: Add S905L ID

Jeff Johnson (1):
       firmware: meson_sm: add missing MODULE_DESCRIPTION() macro

Viacheslav Bocharov (1):
       soc: amlogic: meson-gx-socinfo: add new A113X SoC id

  drivers/firmware/meson/meson_sm.c      | 1 +
  drivers/soc/amlogic/meson-gx-socinfo.c | 2 ++
  2 files changed, 3 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
