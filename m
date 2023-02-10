Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE690C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/38zGSp0hTzkbUngqrjAH1fRcRBqLoAqJlx9D5oNn00=; b=RKLEELwzhSEE2c
	5wH4kQ1FMQ4Q74nWGWtyemXBR9lFILGk3/RH0pLGJbPhhOC/qJt/28qGPMWq5lOitUECuxR2oGAyj
	18cNLjzRAi0xbcR6ZeC/Z8D0ipbcQgFyp+TAjoJHfByjerKleFGz09QH+wkYIm6gj6gN1VFF2gHLm
	TNdiIxmiE2DtzDccIji4uq6CStfWPe2h8ajELrQC6xnmlNcTfTtRG58rvwwzAbhKjXReAGZkO7jX9
	YvcVTAQFUFIw8WgqdtmTUxuhlQNBzrLvLx2BzEPFxM0EVofw7Ob3oPj5/RcQuZTyUXyya2rsgxvtk
	tgGVHYGqOxKIB5GRgMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPuC-0057Lf-HR; Fri, 10 Feb 2023 09:41:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPtx-0057Hk-NA
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 09:41:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so3640344wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 01:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXtJIM3du57xUfV949O/wulNn8qW+AxKoWuOnlA8Zs8=;
        b=Q4I+nSXtzNQtYSSBlK1tnkNWOBobkj//fQnII73nliusIFWbS4CyMXwv790TWVzaIR
         XeJFKMr09KxD6VEIwh0GADzS0KBeXwSd/Z2PuYcBx5wrwvwYKnpwCDcrhxRlRw1DIemu
         MShr1vbHI1OaKEdj393Dhbfx1croPFoH/IAHV4O1JI2sVfq1pnRj8CyYMXARz/VHSfkB
         +G0O6Aj1djeAFoK6kGfSCNq92z0a1Be0RoRQsmFaFkAFFZi/8jacKoA+8TQepXSM+Kfj
         3xzyBztnswh5ZMW2uGJwfNW1lkjNA2TL5EfxLYmohtuFUIh9ADwLNXuqvunAKu5Ksdr8
         LJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXtJIM3du57xUfV949O/wulNn8qW+AxKoWuOnlA8Zs8=;
        b=gjXPvN7MHeNioGtBzwCWMH13o7yXGToXF/OG15+dbGcuHFFjJNH4IHq8m2l5gvZXsC
         M3XORgFBzi/IRY6pW7qCgXalPk3eF/jF/0LMmuPCemBpU9sEKIM0TJlnoEhH+7t+KLCr
         qqGHWTTfyOgmhlQ2FUgaAjUPAi29BBPsDkvoIBqEr70aAlyWiYo1q+7Y0QkHTRJdYVd7
         1RwDzB6hgPgX6/A6EfrwXn4/TPAvXyGlLDOUPumhnFpYdF0OJlC9V1kxJZ1eQbTXmGq3
         yHdbLgvxHXuw6cwr9kHSxA/soiNSicwgzvqU32u7Mg4TbxQXMcS0pONFR7V5hyQ/I2Ty
         nWoQ==
X-Gm-Message-State: AO0yUKUl5LIzWWlOLWXe7yECgqjL8A/8r6F3jx8HlYbZP3FeIpueAvrS
	h8CfFO5gKfTKbVwmClfM6n8HJQ==
X-Google-Smtp-Source: AK7set9g8UOPh4E6E2LgZ5q7toZT7ywT9NslTSP9dH/BzqJlUMVqwQWZGYqb6Lx8fO9DrtqztHmmEQ==
X-Received: by 2002:a05:600c:3317:b0:3e0:111:28a9 with SMTP id q23-20020a05600c331700b003e0011128a9mr12224837wmp.22.1676022063255;
        Fri, 10 Feb 2023 01:41:03 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.gmail.com with ESMTPSA id f3-20020a056000128300b002c3e600d1a8sm3208693wrx.95.2023.02.10.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 01:41:02 -0800 (PST)
Date: Fri, 10 Feb 2023 10:40:56 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael.j.wysocki@intel.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Haowen Bai <baihaowen@meizu.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Message-ID: <20230210094056.GC175687@linaro.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_014105_842108_3228AD4A 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUmFmYWVsLAoKT24gTW9uLCBGZWIgMDYsIDIwMjMgYXQgMDQ6MzQ6MjlQTSArMDEwMCwgRGFu
aWVsIExlemNhbm8gd3JvdGU6Cj4gQXMgdGhlIG5hbWUgc3RhdGVzICJ0aGVybWFsX2NvcmUuaCIg
aXMgdGhlIGhlYWRlciBmaWxlIGZvciB0aGUgY29yZQo+IGNvbXBvbmVudHMgb2YgdGhlIHRoZXJt
YWwgZnJhbWV3b3JrLgo+IAo+IFRvbyBtYW55IGRyaXZlcnMgYXJlIGluY2x1ZGluZyBpdC4gSG9w
ZWZ1bGx5IHRoZSByZWNlbnQgY2xlYW51cHMKPiBoZWxwZWQgdG8gc2VsZiBlbmNhcHN1bGF0ZSB0
aGUgY29kZSBhIGJpdCBtb3JlIGFuZCBwcmV2ZW50ZWQgdGhlCj4gZHJpdmVycyB0byBuZWVkIHRo
aXMgaGVhZGVyLgo+IAo+IFJlbW92ZSB0aGlzIGluY2x1c2lvbiBpbiBldmVyeSBwbGFjZSB3aGVy
ZSBpdCBpcyBwb3NzaWJsZS4KPiAKPiBTb21lIG90aGVyIGRyaXZlcnMgZGlkIGEgY29uZnVzaW9u
IHdpdGggdGhlIGNvcmUgaGVhZGVyIGFuZCB0aGUgb25lCj4gZXhwb3J0ZWQgaW4gbGludXgvdGhl
cm1hbC5oLiBUaGV5IGluY2x1ZGUgdGhlIGZvcm1lciBpbnN0ZWFkIG9mIHRoZQo+IGxhdHRlci4g
VGhlIGNoYW5nZXMgYWxzbyBmaXggdGhpcy4KPiAKPiBUaGUgdGVncmEvc29jdGhlcm0gZHJpdmVy
IHN0aWxsIHJlbWFpbnMgYXMgaXQgdXNlcyBhbiBpbnRlcm5hbAo+IGZ1bmN0aW9uIHdoaWNoIG5l
ZWQgdG8gYmUgcmVwbGFjZWQuCj4gCj4gVGhlIEludGVsIEhGSSBkcml2ZXIgdXNlcyB0aGUgbmV0
bGluayBpbnRlcm5hbCBmcmFtZXdvcmsgY29yZSBhbmQKPiBzaG91bGQgYmUgY2hhbmdlZCB0byBw
cmV2ZW50IHRvIGRlYWwgd2l0aCB0aGUgaW50ZXJuYWxzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcwoKQXJlIHlvdSBvayBpZiBJIHRha2UgdGhpcyBwYXRjaCA/CgpUaGFua3MKCiAgLS0gRGFu
aWVsCgoKLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3
LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNv
bS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1i
bG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
