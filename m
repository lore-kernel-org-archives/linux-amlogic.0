Return-Path: <SRS0=ZD2b=GW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F369AC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 01:37:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CB8205CB
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 01:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CB8205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=02WcB/VfagpVV1O9JDiTlSo6BCNm2Y2jjM9nHCjQ9eQ=; b=rGkp2GZzX/xZDAs6H75PEtvcT
	N9OTvve0WBrSLSbBDr0hhtQM6w2DscCAPVf0WQ6iNEkW6uAvmlNfxp9eYCPvAFUaiTgzsGsVuLI4F
	OHmTBHapvOiDdPzIk+pmTIIHCtvJCyVTvV5JZPh44MjXnBXGEF+0lAoGU047t2bfIhSVDvS04n2EX
	K1Wuz7trwXFEB/I/6g2IN5k572JLWwEo2D54gsnbMnt48+2ioyR8bhdKojckQnnQj0Cg7T57QNLeM
	F7UVfP1rSVwnXMxCiYS/zwcgkvsQXLhsPUunvKtlyUns/4cm62wtzY7oJETWhQlAmiOgjaTdpAnBV
	ljV3do4eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1fxf-0001no-Kc; Tue, 19 Jan 2021 01:37:35 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1fxd-0001nH-DA
 for linux-amlogic@lists.infradead.org; Tue, 19 Jan 2021 01:37:34 +0000
IronPort-SDR: 1S5nihbBmPkBHvRTQFpGg1ovzG5qxI05aRroKKvMKVwpCBoijFSV+mpKH2qjcQceCqa06FjMx4
 xJpOqWzziFTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="165956077"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; d="scan'208";a="165956077"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 17:37:29 -0800
IronPort-SDR: IMpdu4T63VIM+bChb5MYAewAOXgHALm0u+c7vuT9WUL14I53PJrMyd3+He/PiceT1Gl45+nd4p
 fGu69FRltqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; d="scan'208";a="347022832"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2021 17:37:29 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Jan 2021 17:37:28 -0800
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 19 Jan 2021 09:37:27 +0800
Received: from shsmsx603.ccr.corp.intel.com ([10.109.6.143]) by
 SHSMSX603.ccr.corp.intel.com ([10.109.6.143]) with mapi id 15.01.1713.004;
 Tue, 19 Jan 2021 09:37:27 +0800
From: "Zhang, Rui" <rui.zhang@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: RE: [PATCH v2] thermal/core: Make cooling device state change private
Thread-Topic: [PATCH v2] thermal/core: Make cooling device state change private
Thread-Index: AQHW7cDP1uLeJF14xUSIfMisXKv/LaouK6iQ
Date: Tue, 19 Jan 2021 01:37:27 +0000
Message-ID: <2514d8a204c04b4695da7b73bd2ff848@intel.com>
References: <20210118173824.9970-1-daniel.lezcano@linaro.org>
In-Reply-To: <20210118173824.9970-1-daniel.lezcano@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_203733_657877_21BDE1B5 
X-CRM114-Status: GOOD (  18.95  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:PWM FAN DRIVER" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Kamil Debski <kamil@wypas.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "open list:KHADAS MCU MFD DRIVER" <linux-amlogic@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Daniel Lezcano <daniel.lezcano@linaro.org>
> Sent: Tuesday, January 19, 2021 1:38 AM
> To: daniel.lezcano@linaro.org; Zhang, Rui <rui.zhang@intel.com>
> Cc: Guenter Roeck <linux@roeck-us.net>; Kamil Debski <kamil@wypas.org>;
> Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>; Jean Delvare
> <jdelvare@suse.com>; Neil Armstrong <narmstrong@baylibre.com>; Amit
> Kucheria <amitk@kernel.org>; open list:PWM FAN DRIVER <linux-
> hwmon@vger.kernel.org>; open list <linux-kernel@vger.kernel.org>; open
> list:KHADAS MCU MFD DRIVER <linux-amlogic@lists.infradead.org>; open
> list:THERMAL <linux-pm@vger.kernel.org>
> Subject: [PATCH v2] thermal/core: Make cooling device state change private
> Importance: High
> 
> The change of the cooling device state should be used by the governor or at
> least by the core code, not by the drivers themselves.
> 
> Remove the API usage and move the function declaration to the internal
> headers.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Zhang Rui <rui.zhang@intel.com>

Thanks,
rui
> ---
>  drivers/hwmon/pwm-fan.c          | 1 -
>  drivers/thermal/khadas_mcu_fan.c | 1 -
>  drivers/thermal/thermal_core.h   | 2 ++
>  include/linux/thermal.h          | 3 ---
>  4 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c index
> bdba2143021a..0b1159ceac9b 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -378,7 +378,6 @@ static int pwm_fan_probe(struct platform_device
> *pdev)
>  			return ret;
>  		}
>  		ctx->cdev = cdev;
> -		thermal_cdev_update(cdev);
>  	}
> 
>  	return 0;
> diff --git a/drivers/thermal/khadas_mcu_fan.c
> b/drivers/thermal/khadas_mcu_fan.c
> index 9eadd2d6413e..d35e5313bea4 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -100,7 +100,6 @@ static int khadas_mcu_fan_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  	ctx->cdev = cdev;
> -	thermal_cdev_update(cdev);
> 
>  	return 0;
>  }
> diff --git a/drivers/thermal/thermal_core.h
> b/drivers/thermal/thermal_core.h index 90f9a80c8b23..86b8cef7310e 100644
> --- a/drivers/thermal/thermal_core.h
> +++ b/drivers/thermal/thermal_core.h
> @@ -65,6 +65,8 @@ static inline bool cdev_is_power_actor(struct
> thermal_cooling_device *cdev)
>  		cdev->ops->power2state;
>  }
> 
> +void thermal_cdev_update(struct thermal_cooling_device *);
> +
>  /**
>   * struct thermal_trip - representation of a point in temperature domain
>   * @np: pointer to struct device_node that this trip point was created from
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h index
> 1e686404951b..6ac7bb1d2b1f 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -390,7 +390,6 @@ int thermal_zone_get_temp(struct
> thermal_zone_device *tz, int *temp);  int thermal_zone_get_slope(struct
> thermal_zone_device *tz);  int thermal_zone_get_offset(struct
> thermal_zone_device *tz);
> 
> -void thermal_cdev_update(struct thermal_cooling_device *);  void
> thermal_notify_framework(struct thermal_zone_device *, int);  int
> thermal_zone_device_enable(struct thermal_zone_device *tz);  int
> thermal_zone_device_disable(struct thermal_zone_device *tz); @@ -437,8
> +436,6 @@ static inline int thermal_zone_get_offset(
>  		struct thermal_zone_device *tz)
>  { return -ENODEV; }
> 
> -static inline void thermal_cdev_update(struct thermal_cooling_device
> *cdev) -{ }  static inline void thermal_notify_framework(struct
> thermal_zone_device *tz,
>  	int trip)
>  { }
> --
> 2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
