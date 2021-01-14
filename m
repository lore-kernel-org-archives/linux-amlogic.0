Return-Path: <SRS0=+M4W=GR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9F0C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jan 2021 16:08:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C88623B27
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Jan 2021 16:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C88623B27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ELHrSxQ0Wgv8h0pQ+kYrh78jZ407R+d3eGp2mGOytLk=; b=k/2hywMOAiqB+nA1dC0A7CBd1
	nJ9ioylQHidMy97zdMzuzllbwuD9By3n2QGqVoEBKqu+1b+r6KR+BiltWS/aLVDx4JdmXvWi1MrCL
	Kt45B60/Inf7JXLm8naIEzSxr9U6LgxIWeIk5jL+JiHGe2uybaGVGcQYNZ1CLM15OomfHkM59IRwb
	FJTksACr8ue8B6az6m2uQuQtqUHR5P9GvR8pGfhx12AhG0074uhTsS8JfgpBgOODz0QqUvjjdS6YK
	K22P0I2EGj5E5v/3S9LwYLi3Oi2/gL8nHy3m+XqhHZ1yCGbix6g3zNGaT9bUgT1rpzVTRUrd6QA+x
	q0mUfwfzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l05AE-0007Hx-HY; Thu, 14 Jan 2021 16:07:58 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l05AA-0007HL-Tm; Thu, 14 Jan 2021 16:07:55 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EG2FYd022831; Thu, 14 Jan 2021 17:07:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0JgJHsNz7hWotQHqsv9MMXYM5L07hf3AqCxxBPFoW4Q=;
 b=h8mvkBIrZsVp552w8KbS9voQPbwMg9AQvXWDx5P+FlbZI9gzuga/OhxbY5RiAPunuUUy
 eiO23uCDtWANMLrfBsmjDTEE3CcH4uguKFNpazXIIAKGBLUqxy8LoTtYOYmB/8XON+Yb
 zES/86Fp6UrHKoluozSCQGAjKjt5cA2u8qhvP6EawJwcHSPlzMtnJL8oai+rBqTnNRmc
 AeaLaFAApILwKkBHv1kUZWK3FrJFkPGKpneLTV5/NXwSVw+Pt+tQwUaMVxKrG6v3jhWO
 F/QCF/QeC/RNy4pXKxbWFNuL4jWhBGGPRAr4FJWfEWTS86eIKT12kc7YjW6Vrx/h5ZOj bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxdyeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:07:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1F3C10002A;
 Thu, 14 Jan 2021 17:07:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8FEF2ADA18;
 Thu, 14 Jan 2021 17:07:42 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 17:07:41 +0100
Subject: Re: [PATCH v9 3/4] ARM: dts: stm32: Fix schema warnings for pwm-leds
To: Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-4-post@lespocky.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <f9277cd5-9898-ab6f-20bd-a0476068ea12@foss.st.com>
Date: Thu, 14 Jan 2021 17:07:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201228163217.32520-4-post@lespocky.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_05:2021-01-14,
 2021-01-14 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_110755_234687_3E7CEF96 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: devicetree@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Alexander

On 12/28/20 5:32 PM, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>    DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
>    CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>          From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied on stm32-next.

Thanks.
Alex

> ---
> 
> Notes:
>      v8 -> v9:
>        * added Acked-by (Ahmad Fatoum)
>        * rebased on v5.11-rc1
>      
>      v7 -> v8:
>        * rebased on recent pavel/for-next (post v5.10-rc1)
>        * updated indexes and added comment (Ahmad Fatoum)
>      
>      v6 -> v7:
>        * split up patch (one per sub arch)
>        * added actual warnings to commit message
> 
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index cda8e871f999..1e9bf7eea0f1 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -36,34 +36,35 @@
>   		stdout-path = &uart4;
>   	};
>   
> -	led-act {
> +	led-controller-0 {
>   		compatible = "gpio-leds";
>   
> -		led-green {
> +		led-0 {
>   			label = "mc1:green:act";
>   			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>   			linux,default-trigger = "heartbeat";
>   		};
>   	};
>   
> -	led-rgb {
> +	led-controller-1 {
>   		compatible = "pwm-leds";
>   
> -		led-red {
> +		/* led-1 to led-3 are part of a single RGB led */
> +		led-1 {
>   			label = "mc1:red:rgb";
>   			pwms = <&leds_pwm 1 1000000 0>;
>   			max-brightness = <255>;
>   			active-low;
>   		};
>   
> -		led-green {
> +		led-2 {
>   			label = "mc1:green:rgb";
>   			pwms = <&leds_pwm 2 1000000 0>;
>   			max-brightness = <255>;
>   			active-low;
>   		};
>   
> -		led-blue {
> +		led-3 {
>   			label = "mc1:blue:rgb";
>   			pwms = <&leds_pwm 3 1000000 0>;
>   			max-brightness = <255>;
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
