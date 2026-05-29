Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628C4CD6E50
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7euSiwkmVA4W7ixL/7lNEVJoWgFAGVleYjxHXDQbNsA=; b=bJclrEK6/qO5BY
	3M6hysS9XkGxT0ohzZ5AIR1/izn4Hoo2TlZoOsakshZzkMpqYaxyIwj1RzPUwbC+MHLBH9eqW84CU
	flxVAw4cwOggxhFL7n5RJtAkG/dNW/Mu1e4t2Khw3Zo55sKm+i9kVG2xIc6+pf7kc30XtWATOpckm
	zMLCDGV9daMyCbwOc1jh8E55TFSFo91OCJdb9X4FRSb6u7Bz2RR8CbrZonA1S3fi4PkstK0xtPEdR
	wAIycPJ/AP3oX2oHb4rxcwzzQQs5JDEAo8bc5MJIsCpHe45YDM22oxPBsAfiGMD7XQYmt6WlBUK+v
	mqmV/HwTvC41GnFdXD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyy8-00000007eYd-1EJo;
	Fri, 29 May 2026 15:17:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyy5-00000007eYC-26L4;
	Fri, 29 May 2026 15:17:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D29DD1C00;
	Fri, 29 May 2026 08:17:41 -0700 (PDT)
Received: from [10.57.26.238] (unknown [10.57.26.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8093B3F632;
	Fri, 29 May 2026 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780067866; bh=i14utAyWVag4qxanxiMOSsLoacp5PlK9awjdPrY0Lt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E/Y8OmFzjPPiFlVn4wlpigbZpVnBOLe/nvmQB9aWj85QNMT7/qwPvsbPCBXgoTSUY
	 ILoZRm/Zx+YVmLnnnjl6SbY9FgvOkUu3spSzSN72QzgqEzBR85lxu8q43Fz/aKK1vx
	 t17fO/GqqvBY0+f/5OA/Bl8CQBWaofzEEz9yntmI=
Message-ID: <c99085e5-cf1f-479d-bef0-b6a4161482e5@arm.com>
Date: Fri, 29 May 2026 16:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] thermal/of: Rename the
 devm_thermal_of_cooling_device_register() function
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org,
 daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:KHADAS MCU MFD DRIVER" <linux-amlogic@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
 <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_081749_633524_B1185F18 
X-CRM114-Status: GOOD (  13.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 5/26/26 15:08, Daniel Lezcano wrote:
> To clarify that the function operates on child nodes, rename:
> 
>            devm_thermal_of_cooling_device_register()
> 	                     |
> 			     v
>         devm_thermal_of_child_cooling_device_register()
> 
> Used the command:
> 
>       	 find . -type f -name '*.[ch]' -exec \
> 	 sed -i 's/devm_thermal_of_cooling_device_register/\
> 	 devm_thermal_of_child_cooling_device_register/g' {} \;
> 
> Did not used clang-format-diff because it does not indent correctly
> and checkpatch complained. Manually reindented to make checkpatch
> happy
> 
> This prepares for upcoming support of cooling devices identified by
> an ID rather than device tree child nodes.
> 
> No functional change.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/hwmon/amc6821.c                  |  2 +-
>   drivers/hwmon/aspeed-pwm-tacho.c         |  5 +++--
>   drivers/hwmon/emc2305.c                  |  6 +++---
>   drivers/hwmon/gpio-fan.c                 |  6 ++++--
>   drivers/hwmon/max6650.c                  |  6 +++---
>   drivers/hwmon/npcm750-pwm-fan.c          |  6 ++++--
>   drivers/hwmon/pwm-fan.c                  |  5 +++--
>   drivers/hwmon/qnap-mcu-hwmon.c           |  6 +++---
>   drivers/hwmon/tc654.c                    |  5 +++--
>   drivers/memory/tegra/tegra210-emc-core.c |  4 ++--
>   drivers/soc/qcom/qcom_aoss.c             |  2 +-
>   drivers/thermal/khadas_mcu_fan.c         |  7 ++++---
>   drivers/thermal/tegra/soctherm.c         |  6 +++---
>   drivers/thermal/thermal_of.c             | 15 +++++++++------
>   include/linux/thermal.h                  | 16 ++++++++--------
>   15 files changed, 54 insertions(+), 43 deletions(-)
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
