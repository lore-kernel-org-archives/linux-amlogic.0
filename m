Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3B8C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VArMH7TRiGrzQITX9z3xoDtlgsEfZy/ccpm8+ZZM5DU=; b=XO2S5P9JlMKU24
	bj5KobYVxU4QKT6DtqPTzrEPRIV1yMVKrLq0bZU+WKhlFVv1ug3b1NXpWmyjZItPfRXUp4TEgT9Re
	LiV/MIfEe5tnmyaDELFVr7wPivFQ+pVkEShcaqrojN58TUdl/k3BeLYN9w+p4EvNlEw50Qnfhg0fD
	DbiKpltVcY1wj+ADvmPlRzfdvhpAovkv2BIoYhhKzMWcCdhxtjnJnbJMBYYqhHI7nzAe/O5fjTsMa
	gwFJq0zoM3u5smWQg8tiiUw9vgnTJf3beCXBugGcgx9aKcWZ3flcp8PDOjIpokmVnPCA34WhQCLmR
	AjKsmQnVQtrCIH2O/yTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaua-00FF1P-2l; Mon, 13 Feb 2023 15:38:36 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRauW-00FExu-Kh; Mon, 13 Feb 2023 15:38:33 +0000
Received: by mail-ed1-f54.google.com with SMTP id dz21so1436680edb.13;
        Mon, 13 Feb 2023 07:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/87Mt+OfWS54SLniYHSHhoF1OzMVcQInuz6lOAm1ITI=;
        b=DQLrLK0Xo3ebDLSYE34emfULWvkVOT+fpt39SXd/1ylNrFQaiDoF7WLCibJlNRztWz
         sUAUJg24rSN9K2Vl4IQMwqzvOhMPKWxFiMzbV0YAxyoZo/L4lonycaihNx2IR3qqoXV6
         6bg/qjqBJOQSl6Zm7y2Rj5iDLvZ/4BWHPMIEDlc+TJX+Pg3k/0rTWUZuj4a7y3hxmCHf
         fvR8lQcCojW/vKuu7tLgF1r7dePxe2qz5DGN3EOIMZSZdJcSn0wWWIgLAI0XGDIeKLZh
         3Q/Y4zUYLlIpnZDWabhH9aM7yXe5orFcKvijcKObJwGbccVO/Kq41a7ZLqU/w5P4VVau
         yvzg==
X-Gm-Message-State: AO0yUKV99oyZtQUxE8b0aH8UkutQrO3yMHmo5kemxBexpjXJSD50uTj3
	umeYAUkIv0svA3awLWArV1xNW6TIFnYOkCDojN0=
X-Google-Smtp-Source: AK7set/gPlIC2eOAY2XqGE6GdihDj9jHSedBktD5q34/c7R5wMsZ0nx0m0yQIbiWvGC7F0L1/Il/JyPSJjgkmU9F/oY=
X-Received: by 2002:a50:baab:0:b0:4ac:cdd9:1c97 with SMTP id
 x40-20020a50baab000000b004accdd91c97mr1078170ede.6.1676302708989; Mon, 13 Feb
 2023 07:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org> <20230210094056.GC175687@linaro.org>
In-Reply-To: <20230210094056.GC175687@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Feb 2023 16:38:17 +0100
Message-ID: <CAJZ5v0iEYtFJAh94w+K-T90PXLRDzyUgvb_OPL9aOvphTH2CGg@mail.gmail.com>
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, ye xingchen <ye.xingchen@zte.com.cn>, 
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Haowen Bai <baihaowen@meizu.com>, 
	Minghao Chi <chi.minghao@zte.com.cn>, 
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_073832_703482_53D09F50 
X-CRM114-Status: GOOD (  18.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Feb 10, 2023 at 10:41 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> Hi Rafael,
>
> On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> > As the name states "thermal_core.h" is the header file for the core
> > components of the thermal framework.
> >
> > Too many drivers are including it. Hopefully the recent cleanups
> > helped to self encapsulate the code a bit more and prevented the
> > drivers to need this header.
> >
> > Remove this inclusion in every place where it is possible.
> >
> > Some other drivers did a confusion with the core header and the one
> > exported in linux/thermal.h. They include the former instead of the
> > latter. The changes also fix this.
> >
> > The tegra/soctherm driver still remains as it uses an internal
> > function which need to be replaced.
> >
> > The Intel HFI driver uses the netlink internal framework core and
> > should be changed to prevent to deal with the internals.
> >
> > No functional changes
>
> Are you ok if I take this patch ?

Well, you've already done that.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
