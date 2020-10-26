Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C96CC388F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 18:45:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B673A20732
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 18:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYMo5KnE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B673A20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vMpapKkArL8sedGGWRXgBng3Y2vzsERtF48ReRkYmr4=; b=uYMo5KnEcn3Yc1hmUaPbU70oV
	uQrInpyCwdZyKMKEGdI65vU4GsjHbGOOYPmIq2F5bxkV2Bu+vxlDMbDlIDHBYewGshzdmYYxFrf8G
	yFL5uAjYBLt4HO+BQT91eZYnKB//Yk4xxcmqD/B1yRDAW9wLOqhVrotkO8ugM6XNwriSDJgD1fJ9Y
	zCSoPbkyblqrLaciZ4EUR1sDqfc5gWmnwo014aqQTgqCSn10sj5Fu7ThaZLyqsw1pHOvVeweFa5no
	KrPjNIwWGxA74H4cyLYxGk7lKolR3/i/B6nNa4a7fw+gwDCIYD9UlDQoHy+e8/dqYujRd9b1Fzwzb
	LUOJvks/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX7Uu-0005X0-NU; Mon, 26 Oct 2020 18:45:36 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX7Uq-0005Vt-P5; Mon, 26 Oct 2020 18:45:33 +0000
Received: by mail-ej1-f66.google.com with SMTP id c15so15197797ejs.0;
 Mon, 26 Oct 2020 11:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gz0y0Kg1cNPHrgAtv63xzsEjT/xY3FlDGvII1tKwfUQ=;
 b=BqlQWAIY5JIhEaM0mB+PW+/xN0mQ19R7DW7gDXi3K4YWOunMJEWaS2dm1e/DKFh2qn
 huFAAywj7A40iSOhwq0+AOuP7EjhWuxDIkgma0jGvOPc4YP5S5evGa+qRQwnzBXY+oh7
 5H8gUGaEatn5+d5cicJnpiIAd14apouHECVIp8/ahn4eeN3J44DqPEBlSP0Oth19PS56
 cY3xjoGpPpFfkHoQ7wfE/En+sNWRJd/N41mykcy3U8604tRg2veEPLTMTt8rI4ZYLLJ9
 dO1TXEP9rVXOz90F92Yu2Wc8JRxhpdEYSSi8ORq8Guy84tBYbI4M8bBCeYV9dlEhuNSa
 O8mQ==
X-Gm-Message-State: AOAM531uYOROTvsSHtmmkbGRAn9DS6L1N/n7261oNi6453ag5bKtXBO2
 WEneSgOtnQDa9410NtcHjps=
X-Google-Smtp-Source: ABdhPJwbHdC4xSeWIGeRgEm2uDYFTmmY8iCHzyomd4336nfeex1zjqBAeuLflDpHoOwgQbTXL2PdDQ==
X-Received: by 2002:a17:906:4803:: with SMTP id
 w3mr11735021ejq.406.1603737931324; 
 Mon, 26 Oct 2020 11:45:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id p14sm5615176eds.35.2020.10.26.11.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:45:29 -0700 (PDT)
Date: Mon, 26 Oct 2020 19:45:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v7 07/12] ARM: dts: exynos: Fix schema warnings for
 pwm-leds
Message-ID: <20201026184527.GA165725@kozik-lap>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-8-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-8-post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_144532_848287_FB0BB120 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05, 2020 at 10:34:46PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Please trim the error logs in the future. No need to paste all warnings,
just one or two from the same type of error.  Also your local path
leading to Linux repo should be removed.

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
