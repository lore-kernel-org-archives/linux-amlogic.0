Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BC5C4363C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 06:26:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E92206F0
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 06:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vPeiy5IU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjP10fip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9E92206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qI81razgI+9b5qt5RLIIiHEMn3BafixGcU796I5m7Zk=; b=vPeiy5IUkfiCqbeyGsMOD2Qlp
	qHvkApCmmpKfSOS09+NQjg/e6+M/nyKI62X2fKTj3h6I7mHtT7iB3amIa3o+/fUr8KnwvQDIhK7ID
	L0ei9LPHxFgt7AQsfBaZgju6ldMQoQR4vQ0AQNQjfTVQu2nRl/6Hjw6Hg4FXuZlZZc1DLqo0eO6+Q
	lXik6y//gYi3aq4ZlSAdod3V1Xv9SpNj3CW4FNU/mkJilPcGbmqM/beYVRL9pm3ZONrhBGhUcH7Kv
	FARjKymQeEvjvqnZWdPboy4hZ3nIGsdYkaraQoHyYsykUQeID36ARUL6fMCoTAyotASCvIW9ver02
	OUuZGfHSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ2tr-0007j0-8o; Wed, 07 Oct 2020 06:26:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ2tm-0007iB-UY; Wed, 07 Oct 2020 06:26:05 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2616206F0;
 Wed,  7 Oct 2020 06:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602051961;
 bh=9J6pd4Urt8nLaYajtW0xX9CVZZNmrwIcH02wFm6GCzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cjP10fipeHTdrU/XdlnBVJ7nEBd1DP/mHTZ4wefjHHoLp9lxNvYU9bP5xkqznMJxe
 wdl3FjyjprNsFoIgfs4MvjUw8+2mX9yOGKdDx/q7PdKmPRqW4i18tmFXSJXv87xb/w
 jYTrYjlyVbMDlYgJfvP/m4NxZ5TcwBYezWVwQrWs=
Received: by mail-ed1-f52.google.com with SMTP id l16so935952eds.3;
 Tue, 06 Oct 2020 23:26:00 -0700 (PDT)
X-Gm-Message-State: AOAM5315kcCAAj7kC5luagV7xsGMxpBlYXXat5jhlI2r5XeOxjza01ak
 0LA0PIZKaUkUwJAXxNrG94b3QK2YKPogCunmPvc=
X-Google-Smtp-Source: ABdhPJzlgSjYiE8Nro65NAUBEhu5or+8YJ/UtMdDrVp9y+cPmyFnaghXEP0Rg3rNv4h1igGfmvWPgDizOURlpLSk7PM=
X-Received: by 2002:a50:a452:: with SMTP id v18mr1834674edb.143.1602051959063; 
 Tue, 06 Oct 2020 23:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-8-post@lespocky.de>
In-Reply-To: <20201005203451.9985-8-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 7 Oct 2020 08:25:47 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcGXpbJDxLZ1ygi+4c==Lbxt_QA+HZ0Kn7Aq3jjh2YHDg@mail.gmail.com>
Message-ID: <CAJKOXPcGXpbJDxLZ1ygi+4c==Lbxt_QA+HZ0Kn7Aq3jjh2YHDg@mail.gmail.com>
Subject: Re: [PATCH v7 07/12] ARM: dts: exynos: Fix schema warnings for
 pwm-leds
To: Alexander Dahl <post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_022603_154441_844CF7BE 
X-CRM114-Status: GOOD (  16.68  )
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
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 at 22:36, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>
>   DTC     arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu3-lite.dt.yaml: pwmleds: 'blueled', 'greenled' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
>   CHECK   arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml: pwmleds: 'blueled' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>
> Notes:
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
>
>  arch/arm/boot/dts/exynos5422-odroidhc1.dts      |  4 ++--
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts      |  4 ++--
>  arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 11 ++++++-----
>  3 files changed, 10 insertions(+), 9 deletions(-)

Looks OK but it is too late for this cycle. I'll pick it up after merge window.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
