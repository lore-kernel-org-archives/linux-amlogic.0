Return-Path: <SRS0=7VJA=EF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FF7C5DF9D
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 07:46:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D99221E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 07:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kTqr0344";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVO09EOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D99221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gp7Le2Ir1jbDthMPZKme9hulXw7vr3arpAYI51kkUlY=; b=kTqr0344FMqRmmcUpzNaa/4bX
	a827eBPMPYQqt6mwYhqOew7Mr1mfkKd/D+eQHX4r3wKQB9s86bjY4jpxEbm++tYo4otZad2Gx+Ieu
	al1X3EM2XH1RiFQ4GfAgQZTTT00QkDrHQx5+wQxE3wpWtRQEcbaJuTcUG9nPgE6+5MraaRR4bVQR6
	nGxNLvfMy7d1p3Yz9qtX8GG9mlYcaxuxJM5Ksau3GoGpviaueJ91mBud/fvWc90Yg7YzyY4Uww5AJ
	FWnPfSvWP2H4R06yCuXgu9dxYRfYhPmBOCB39rCVniBBqN9A1QrlnaR8foynGldG0evvG+HPisf5g
	oQ4/qTwhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYP7I-0005w6-6W; Fri, 30 Oct 2020 07:46:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYP7G-0005vg-H6; Fri, 30 Oct 2020 07:46:31 +0000
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EF0320719;
 Fri, 30 Oct 2020 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604043989;
 bh=XbzJCs+1Vbu1sG68hX1A1BQWrwJAMbx09Z0EixXEc0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVO09EOEVQDhIxqmOhZvn3m9RP1yKZhwB2NqZzP00ErBPlqSxU8VLeGJL+iVw4kbj
 DewkGZl/M3Nti9Ore8fBGWeevRbV3MJC+iGEhas49jvcEG/fLOnj8t5ple5dCiw5BW
 P1ipVg/apt56gRauVDsYN2Vz7SHtae83kdV+RQZ8=
Date: Fri, 30 Oct 2020 15:46:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v7 08/12] ARM: dts: imx: Fix schema warnings for pwm-leds
Message-ID: <20201030074616.GI28755@dragon>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-9-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-9-post@lespocky.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_034630_754450_958ABE81 
X-CRM114-Status: GOOD (  12.58  )
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
 linux-samsung-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Alexander Dahl <ada@thorsis.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05, 2020 at 10:34:47PM +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/imx53-ppd.dt.yaml
>   CHECK   arch/arm/boot/dts/imx53-ppd.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx53-ppd.dt.yaml: leds-brightness: 'alarm-brightness' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6dl-cubox-i-som-v15.dt.yaml: pwmleds: 'front' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
>   DTC     arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
>   CHECK   arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/imx6sx-softing-vining-2000.dt.yaml: pwmleds: 'blue', 'green', 'red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Applied, thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
