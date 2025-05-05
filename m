Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFD6C369C2
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:References:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqnNTTDhvTu/U6haO+FovtL9V0F46dQrM1PU4UwOTEA=; b=nMwd7Bhq2rwGjjElF4XBn8lJD8
	BfEMzBayONyfFBbofG1v8ysR8VM1usQ+9rntKrLxc9F4ZFEF50qp4F420vspczqHjanEet69C9KEU
	81B00n1qInWwIp2ZsBC7fKSHKsYqtxiu/pTCCYrvTnVh/qlN3LruNikmGNTI3WmYYk1AFEIk1NhVb
	b/3SFbYVep9ONP/hAZZ4lprQ0cR7I1Q/cXrBBk0tPQ+B5Ts1NmkvkW2LCDUJ6hKnUlrCVi5XMgtuO
	OBia17s9Z9XiCUnbXo1xn4ubeTmdFhxH8wUcjEi+LqaWpYVsZdjQfFrcyeGJJAgzaXnxxKDJ/4vdJ
	d8X6vfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpyA-00000006bmf-4AM7;
	Mon, 05 May 2025 07:10:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpvG-00000006bQL-3i8B
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 07:07:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso2327322f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 May 2025 00:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746428848; x=1747033648; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:cc
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAcvdE2xY/zpD3KTmU7HwvxmS2gSLmyMDAFLT80zCwA=;
        b=AkBWCkS+IfEzfhlmrccgVkcibIN7449rmFT87IJMlYZaa0WwKnXPvX7lOIEPsBvBDF
         m4lb8B2ttRUNOXao0Yvdpwc1SWJSfKQj4dd52O33Z0ZfQGuHyRnQCoYvamuQJ92HRHap
         9nJh8evrdVdvkcZLWhOBW9N+jQv1QBCsJbgyUF5KGAZoACz2egDBrmKUQgOO+NkK1wZq
         lBz+dkHEZyLbLS58GL2Tu9di/zuIIUXDMzzO81Km8PuIoIUMMUG/pxwkrcZCOgd2H2bB
         Pw/XFkqx6sWoegcG9zLUiYc3YO4Xmxzq1XvjpCpiFH/h8Bd0FgRNh9ppDTp2zUDpU7iO
         vbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746428848; x=1747033648;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:cc
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BAcvdE2xY/zpD3KTmU7HwvxmS2gSLmyMDAFLT80zCwA=;
        b=a5VONZnaPcHeuRK4XHvUjwZyw5LdVthIXbSuAmb9unBd6GB9Ym3FHcqWcpPAZu1+LH
         RYmJho4FoKgqepSIxL/pmttTZ+Hu2dfHASk9kVJFa1BtdqZr8gLtQ9cla0TdtfhbWvol
         2NIhYnyVt0mjqF7XLKbpYV+7O+FIVar7vIf7MdcpVn7SzyS1kZkVIFZnGklI/tVkxI2L
         3FHmwGCyXnjDoPTfoYjnu7unvyw5ycLveIMDtMdr/EBCHcz9QEb3HcJC2Om+U4KbL2Yf
         qXpD2h+PAhrJjL2yen8vAXU0VLlAhaqHjm6lzgkLRHFVUrT+sHTACXyC2VoXrPfZp0Ct
         GKqw==
X-Forwarded-Encrypted: i=1; AJvYcCWWqU395M1QPVGmAGh1vDR68oUfOGEaLtDQwrRs/Q9aE0YOVIz+XPlPoQsQ+onWtfpS0gOhcClkbOPeQuZv@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5usxj0ufyCb3sE/c+M+Rn4q63WwvxjcVSIIRVfVx6rIFduyv
	9Xyyr0KWSLwJERc3+luUKba7iYpapR6K9fFyYNDngRuE9O8sCCpy1xbGKrOlx5lEjD5//B8z7QQ
	U
X-Gm-Gg: ASbGncucG+nvU+SDVhrQGqhMGXzq+JL7KGsxK3xBBDb+iFBdkSXKWPJYRGt+ZsJcQKY
	VKC1s4n+sMZBEwaQK222Nr/wORs9oaqGo6IAmcCYl8mUbt77PtGiU0wheq1yOn2ZnfMpx07xeZ9
	ZS+yM/Y3LNSJY1ymR8HjdnM9bEe9AV/iYHpZ8yc3LBu121T09XsemUdW5Kq046ucz2KON0vnyEo
	tHBs57TvVrAjeWY1Fn4snajAyK9bH9ZHzP0kRsXrgDwBxLQyjzr6ZbkZCO6+kYKAxLiSOSYzwl7
	5iEmwE7C0DY7+zkgMbAEXN+6TwL/mPMbtM/8kxqju2EZte4FcMSndQooVOWM4nK1lpmpol4j7BQ
	E6SGirCZVCq+5k3Y29bubrylOnjMJ
X-Google-Smtp-Source: AGHT+IHydklTwgvkH9q6GqOTfYh+FoH8zbjEJ/ifB4D6ubYun8TosSrDO7fZcpMAINEvL9rzwviU+w==
X-Received: by 2002:a05:6000:400e:b0:39a:ca04:3dff with SMTP id ffacd0b85a97d-3a09fdbb907mr4641524f8f.40.1746428848634;
        Mon, 05 May 2025 00:07:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b16f00sm9251942f8f.84.2025.05.05.00.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:07:28 -0700 (PDT)
Message-ID: <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org>
Date: Mon, 5 May 2025 09:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: Odroid n2+ usb broken on reboot
To: Wayne Schroeder <raz@chewies.net>, u-boot@lists.denx.de
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
Content-Language: en-US, fr
Cc: "u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
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
In-Reply-To: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_000730_941970_B998E357 
X-CRM114-Status: GOOD (  16.51  )
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

+CC u-boot-amlogic@groups.io
+CC linux-amlogic@lists.infradead.org

On 05/05/2025 00:34, Wayne Schroeder wrote:
> Hello.  I am not sure if this is a bug, or even related to u-boot, but I am
> reporting it here because it was easiest to resolve via a u-boot change.
> 
> I am using u-boot-2025.04 (source) with a mainline linux from Arch Linux
> Arm.
> Linux alarm 6.14.4-1-aarch64-ARCH #1 SMP PREEMPT_DYNAMIC Sat Apr 26
> 13:02:01 MDT 2025 aarch64 GNU/Linux
> 
> On my odroid-n2+, the USB ports work on the first boot after power.  If I
> run shutdown -r now, or hit ctl-alt-del and otherwise reboot the system,
> the usb ports do not function at the next or subsequent boot up.

I think it's a very long term issue, USB lacks a proper reset at probe on
warm reset, does USB still work from U-Boot after the reboot ?

> 
> My apologies if this is not applicable to u-boot because it is a linux
> issue--I am not sure what the source of the issue is, but adjusting the
> u-boot .config after make odroid-n2_defconfig resolved the issue entirely.
> 
> I am booting via extlinux/extlinux.conf and have adjusted my
> CONFIG_BOOTCOMMAND before build to execute a usb reset prior to the
> existing run distro_bootcmd.
> 
> CONFIG_BOOTCOMMAND="usb reset; run distro_bootcmd"

I'm pretty sure there's driver callbacks we should implement to do the
same here, I need to check.

> 
> This has allowed me to reboot the system and successfully have access to
> the USB devices such as my keyboard, mouse, and root file system on USB3
> SSD.
> 
> Thanks!
> 
> Wayne


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
