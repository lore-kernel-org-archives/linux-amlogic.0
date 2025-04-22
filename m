Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62B8C369D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1ost0g2CUccUglSoFOkQ7GGHxsk4VK/itkwJr8xDYM=; b=TRkv88sNO+H1CIHiyokd50AUsT
	lgHrB01FjKD0r2sQfiDAccxBEeOaKUtVfgyGUvVDEra0j5TGz5mjw+VjJZ9dJGaG13X7hE0BZqSEN
	zjjkHL4h9UzuC2m3Dzz9laimlv1W8IhAN0eOm0yqaGjEB9HZU7+Ct7XCji0hiRRCeq0evbqWg6cEp
	VFsXsAela+3xzvwJbMSifMDNXBCv7/fZUKk3Q/JE/oa97jDI5IhrdQgfn38mSKELYzJFrVztsz/u/
	dXyoZbvk0/R1oBv6QSnF6Q+tOCP9lYgwoixtZ5rv1Z5dsGNSs63MJfY8lPw0vYL5+Kah71j++aVMg
	yWnpKHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78Eu-000000069gQ-23Mm;
	Tue, 22 Apr 2025 07:40:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77ew-000000063Zm-1i8g
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 07:03:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4162656f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305389; x=1745910189; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
        b=KUVMmote8VRrPOk4KL7d02syplwajQc0p+BqADKguXqI1JvbhGyM+3kBSYHkChiX05
         Pmyy8idXT2tKl/n5Wfm7D2cZjN5LfVujqUMF/eA5lSt4hDTR24E/ujNhNwnkMYifBzmC
         nyAmstq0vFTCK/ZFKA/bAot144vnEzh5do+SSS9VxIGpCRjQlhhRZo3r8k/Atg4MY3ez
         i2+LzUZNRG3hAeTgGVJdaEF1xNL9149GaTpgs5ocfj4t/7LCRRo1FHBZNKDZO+j4jXu9
         kzZO4nPP6M+jzcDVIfTNhCg5aZ2c2a7BE5ShifffOyCf2ZaWgo73TKzKBMv09g6XKsyW
         9tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305389; x=1745910189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
        b=W32qW9MiDi/rLZ/A0Oj7n648MmznB4r3RRQUV0qxCWgE5ZCCrpwUKMQXpt4xgWIJ1U
         r075+Mj7ioQRJYAm/5lmjPcDWDyfo4UjLC9cpsMNfqL6PtbgB0feq1ApCVHSfL4Ydkk4
         4BSwBwZvhJI9WMw0JTc4+0rfQ+6OUOTcd4zlDcj6rXFE9GLTlAhUWAl+qHjaO9z9XV64
         rVnz/uLyCZcQ+Z8J44wXlo/duldHCR4xlJnOehOV+u6SZWkq4KecEYRiGsX7JXqZqJHt
         S7DrCJaBAnTssTKrauBlPUvK8PxB6C7ZOa4LXC/mZ31YEu8lF93hwqVXzQekHa4DUVHp
         5eHg==
X-Forwarded-Encrypted: i=1; AJvYcCUOIHJ+lWOArSMZsPdLL0Fcce/Dqq5G7FMWKMjPfdqQtrDDMP/uH3+B9NR1n3XChlX3Hv0JduKOJjp+sYbA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5WWeKTnPYPsVe6iFREH7UTmgphNl1mD/P3L9Erxi+MS1YI4Qu
	hySOpUDzpBU16gmA8WX21RjiCZpkdu5q17EenZtdiPi73inoJO5KAVORCDa8PJ4=
X-Gm-Gg: ASbGncvv0JExsPqwJKlZ75rRsHsQ9skG1yld5Ye43gkFm9+omXYmVwFweZOjqv8qRm7
	OFFwYcbUZn9qioyCRqUaVfiLLlhynRobHd2AkkchlSds5JCnReOPD7YuoR0gXy/Zmckuj7VBMfk
	efgRlstPdWK3hHf+a3enlflNigHmTSeVoQQA9s2B7rX+2ela0cg9xZ3BbKCWLXoRHgI1en5C9DY
	K+K5+4vHh9kKZO+DyjEzhiHyFyUbD9RWnCvSEcqdMChy5Li+BODd3Gkw5HfsKSB7G7mfyTxhS8E
	ag4bAU/9csmnBSUYNQNzsYoZkNrzsSPK1fFim0mFsP81EQhGxhV7LkywShPVwhwoMAnSHVnLTdc
	DQRYGE8551gWvasF8DA==
X-Google-Smtp-Source: AGHT+IE3A44CHRZT4LFqIN9Z4MWfOqywDl3gBVdthcSxAs8gC51/XERlOdOoQsF0+0M1L1XTm+SLEQ==
X-Received: by 2002:a5d:6da6:0:b0:39e:cbd2:9129 with SMTP id ffacd0b85a97d-39efba2acd7mr10294748f8f.10.1745305388778;
        Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c37sm14496017f8f.98.2025.04.22.00.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Message-ID: <b88bfe5a-9256-4de0-822b-b22d74dfdec0@linaro.org>
Date: Tue, 22 Apr 2025 09:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_000310_466635_7FE9A84C 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/04/2025 22:12, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> Neil, I'd like to hear your feedback on this approach.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/
> 
> 
> Christian Hewitt (1):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
> 
> Martin Blumenstingl (1):
>    drm/meson: use unsigned long long / Hz for frequency types
> 
>   drivers/gpu/drm/meson/meson_drv.c          |   2 +-
>   drivers/gpu/drm/meson/meson_drv.h          |   2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
>   drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
>   drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
>   5 files changed, 126 insertions(+), 115 deletions(-)
> 

Thanks for re-spinning, will apply.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks !

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
