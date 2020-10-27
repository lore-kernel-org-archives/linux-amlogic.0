Return-Path: <SRS0=N8xU=EC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0267C388F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 07:03:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F90E21655
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2020 07:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YQAwMu6Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F90E21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6UcuH/o7i6how8JBjwhSpoHrhmmFUxWrBv25NqJVyMI=; b=YQAwMu6YxghTWeDqg2F7dpSoF
	NWSNehGqUxh+C2hoewA5wHB1QnORdwkg/JGraK8JrPZWDHRuReeYyoWXdeFfHovO0dUJckcQwB1ar
	YjmIl6wqTKg4lmwurTmMr1cxGsBuSvywpTCegDy9DAeVdxS36maXGCXkbipSWsHfbNbio1gRlEenS
	3foGpOzndm9Uej1uG3vRCnnIPVNxa4DOHEilVQEM4SuKE850AL4hhkFPfeyzlNPBeqyX40g+sPZDU
	I4lB7H1WqSrx7m60ANanr07K2QQf/A/4cwS1ZlN3quXbN3d8xp8F0K2AhAwSGkKkagrdfCCNJivS/
	U15sCbkGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXJ1J-000734-NN; Tue, 27 Oct 2020 07:03:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXJ1H-00072K-52
 for linux-amlogic@lists.infradead.org; Tue, 27 Oct 2020 07:03:48 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kXJ1C-00019L-Kr; Tue, 27 Oct 2020 08:03:42 +0100
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
To: Alexander Dahl <post@lespocky.de>, Pavel Machek <pavel@ucw.cz>,
 Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-11-post@lespocky.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
Date: Tue, 27 Oct 2020 08:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201005203451.9985-11-post@lespocky.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_030347_299034_7FF92086 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Alexander,

On 10/5/20 10:34 PM, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
>   CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

But got two questions below:

> ---
> 
> Notes:
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
> 
>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 5700e6b700d3..25d548cb975b 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -36,34 +36,34 @@
>  		stdout-path = &uart4;
>  	};
>  
> -	led-act {
> +	led-controller-1 {
>  		compatible = "gpio-leds";
>  
> -		led-green {
> +		led-1 {
>  			label = "mc1:green:act";
>  			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  	};
>  
> -	led-rgb {
> +	led-controller-2 {

Is a single RGB LED really a controller?

>  		compatible = "pwm-leds";
>  
> -		led-red {
> +		led-2 {

Shouldn't this have been led-1 as well or is the numbering "global" ?

>  			label = "mc1:red:rgb";
>  			pwms = <&leds_pwm 1 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-green {
> +		led-3 {
>  			label = "mc1:green:rgb";
>  			pwms = <&leds_pwm 2 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-blue {
> +		led-4 {
>  			label = "mc1:blue:rgb";
>  			pwms = <&leds_pwm 3 1000000 0>;
>  			max-brightness = <255>;
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
