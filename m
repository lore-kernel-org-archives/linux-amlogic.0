Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379AEC05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 22:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+Q40AdRqOCl7gi0p8mK1urGRqGLwosQEqY9XsjrjJ8=; b=JwHG+TxL83ORIS
	tmvtfGl2q/poNRWL1PPyE+2rRgHyaLpFPHKzQxWBT9vX/tYil7+LHYu7gxxqDhAZ7oE/x3EzUuPlx
	rubiXpcnvZR4vpV+4PJPnmGR2ApPX+RlCeWgNU7419h4hzl9KWHqwETdNc3XJxOPy2oit2zNY7TeE
	EBOlLaN9IMQJgMW0Enzh7O7B9cqavmdpbarCcjeIQcEMlpNTrqX5JtxA/p+8iRkwu6UjkMuPtwojN
	ZZ8sK6f8d/bVFDMMR5ZNExRTQ007TkJmLnJ7Dkbbyo9jcZxSAEAF6YUGOCpRXI2/FnbWK42tHNGmG
	jUN4PjLP0fTc8vB4JNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPA5c-00A4Wu-G0; Mon, 06 Feb 2023 22:35:56 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPA5X-00A4Ve-S4; Mon, 06 Feb 2023 22:35:54 +0000
Received: by mail-qt1-x836.google.com with SMTP id m12so14795797qth.4;
        Mon, 06 Feb 2023 14:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmjD169NoXW3IkhaYFwz0SB6QUlkP+qjUZED7C6ZRTc=;
        b=ckgvtNbLHKE7zGp1hQQH2crONIjnVmrKh4uTLOwFVE59nzmNDXe2hY25Vy/SdS2hxO
         Dcps1DCCnhUR6uMUpbZAgd3e8d74QAybhTkzqbpGiY5KlAx4PxrkThbrKvdJQ9X6eFLI
         kYsBUj99TpNEuneLGJ33lau5G8cp9/7SsRvgWGqTGoFXEUGKo5+YBpVCCQROO1xtG8u+
         IoFe7ysj9JZNW2YtseYYgAOdEL5ZywEYqUMstLjxqHmT9iCp6KwTE5cTR2LZ6ZJxFCca
         sEIMEsh7SzKMoJb7WcrXJsAGFp3TzRG35VTOXk4ujeNHnd5JE2e3IbbQn8hYhVvvZmss
         dC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmjD169NoXW3IkhaYFwz0SB6QUlkP+qjUZED7C6ZRTc=;
        b=CXOGPRh2fFoiVU3N4DYGKgmGjKvQ42KkBNvBoDsB88vdY1S5D48iNGZr4AGna2mI+A
         vtgtUgpkQfCSk6FrPmy+qtyaoRa+OilyK/+vaMGXnFOpCB0V2YOwPrMFTvvuXg4j5OB9
         FIxEzRTS9XLnKxWJ7UaVoys7LczkZvMnx2mSl8ev6zi/rihUpnd3fzQ3GTFt1ko3acoh
         Zri/ZVe7NJLAdWv0TFOpmmm7QkbyfBwxJ0+50ClMyaelochTXUN5CwFkfNVDq2dTeW2B
         7UYPMvFwcly64EXQBmpGwnGfezQwrpRGZvt9fr9NJMrgXlJb68UllxfE5US3X2SIQJeH
         fj5g==
X-Gm-Message-State: AO0yUKUA+/9gxTdNWQRnKfoUaDSKkT5FP2czvAIleaVymQ26SYwt/qMs
	ngVKQcZ+Xz1SCC8cNnZ/Ceg=
X-Google-Smtp-Source: AK7set+ds+mN/qWC4EpstrsfpJCHNe3e6+CXlaF5Nlwbm9/55WoErDc4Bw+yRg3MwF1VPLdJ7uZRmQ==
X-Received: by 2002:a05:622a:1753:b0:3b6:43ae:d5a3 with SMTP id l19-20020a05622a175300b003b643aed5a3mr1958776qtk.26.1675722949351;
        Mon, 06 Feb 2023 14:35:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 16-20020a05620a041000b007201df7ff47sm8274920qkp.45.2023.02.06.14.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 14:35:48 -0800 (PST)
Message-ID: <6f276332-54fb-b814-1b64-4e8aa7960eb6@gmail.com>
Date: Mon, 6 Feb 2023 14:35:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael.j.wysocki@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, ye xingchen
 <ye.xingchen@zte.com.cn>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_143551_940293_2DEB5447 
X-CRM114-Status: GOOD (  16.29  )
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

On 2/6/23 07:34, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
> 
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
> 
> Remove this inclusion in every place where it is possible.
> 
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
> 
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
> 
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
> 
> No functional changes
> 
> [ Applies to thermal/linux-next or linux-pm/linux-next ]
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

>   drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -

Acked-by: Florian Fainelli <f.fainelli@gmail.com> # bcm2835_thermal.c
-- 
Florian


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
