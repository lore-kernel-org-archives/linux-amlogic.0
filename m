Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832B1C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 12:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E83A20657
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 12:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ujKuLEZP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCdBZEWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E83A20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdC3L8Hmz0QZ8BdKBJFG6MU18MU9PS8QoMn1mdJmJI8=; b=ujKuLEZP3PITQ7
	PRjlvOFOZMMGM51HMdszIbpRRVwFRjIJkHh/pocAwlMQRO3YCK8k2kdUr2EaLtcYS1Qy8sn2XopXO
	xRFPldYlAB0dXq5dqvhxnr58gl9hwCMJQd0EyZom4zXg6d5Br3nsDj6bV1/A2MTpv2U1Qk1ml2b0K
	h+hkNIXqKDGSXiwWjin94n+c1uEax0dF7HcELcLUAA9z+Pu+2OUOgXpSRRs/RaN830wcgDLzzDJNU
	6aI+xMMa0FGEh0CJLw8POJXjBHD5KyjAXxES9Xl7iNbzBklytogSqvgbESzIpwPxiA06JCkb+0DR4
	z4bQqTPnVaMdKC7Io/qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk6tQ-0002DR-P6; Thu, 17 Jan 2019 12:35:32 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk6tN-0002Cd-L1
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 12:35:31 +0000
Received: by mail-oi1-x241.google.com with SMTP id i6so6005858oia.6
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQ8+BP77Osco0XH6mSksMZd8BGxrr3AZI6HfqCXrT20=;
 b=aCdBZEWGlWt6dUlK04jIRRZDTg2J4AxyWKpqnAzW9N8EoV/tjVdbG6z5G59pYakfKz
 rLANCsJFr1gLKj5JVqJa+2GQAr+xArdpR/T46ewsaMuTtu58CG3F7+kWiX6PijzOtbOG
 UBxnkMWqsMvSp58RED7qGgC47pmAeUr+UprMdtRh4nyrxCK7nIJvYf6u58Y/JlRwxcE4
 c3/1VQWk6hmO9Hd67Yj+Z2hH59/odklEHGP++f9Hrs6jA2SCu0IuFZCGfeIp4ZBF9SdT
 9V7/TiL1Ea+segpTbpiR2D6UiPu/bOaBLOILt4qrPXLGveBsb68oLiLAL0a/X2VkSxCO
 p3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQ8+BP77Osco0XH6mSksMZd8BGxrr3AZI6HfqCXrT20=;
 b=ecNMLkFfpuo8ANE+rfTIeqzCel4G5tm4tP4EaQ58BKlNuxawKPqMfyp7kE/ffIoLYh
 NQOzJj3bgfUPVQ8EEnwTcIQeYJN46KqJ+OdXWD6ASttk6rQYBTiirC4U6MAneHiA9JVS
 Uk85xQeetze2wurVuB7j6nIQ8X/+3avURPPmEsP3+1mQLKuZ9RJCLUegy7TabauHuo87
 8FvTJvfRjQw4dkXyaMzw7MWknBLoq69AoysvZs4YSs5PVxqI2AJsJIBVoMk+A8K1+Pd6
 +AAoWpuKrrAZLHXFAhAEShILDDJeKMUeFblQgEnTjFXiZGkEHanktIJvNC/3LIhTuqxO
 jSFg==
X-Gm-Message-State: AJcUukeyEr/qQftQqrlYAmaq+DAmcuiX3wf56rJjYelDsGIxRblCz/wy
 To0zYET0jHkIF4niIU75O0Xe9dOEhAs7gyXv2D4=
X-Google-Smtp-Source: ALg8bN59eNhSp+1z1sKBOtkcwFczfMOqcdKEDEZxcVkYPp2ILB4nTo07+P95BnrWm9k4uhwQd9VXDPo1l4rFWkB18dM=
X-Received: by 2002:aca:48d1:: with SMTP id v200mr3623641oia.69.1547728525656; 
 Thu, 17 Jan 2019 04:35:25 -0800 (PST)
MIME-Version: 1.0
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
In-Reply-To: <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
From: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 13:35:13 +0100
Message-ID: <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_043529_696371_0A366732 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 krzysztof.michonski@digitalstrom.com, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome
> There an actual s905x p212 in kernelci which is not showing any issue, AFAIK.
>
> https://kernelci.org/boot/meson-gxl-s905x-p212/
>
> Have a look a this recent boot of mainline/arm64:
> https://storage.kernelci.org/mainline/master/v5.0-rc2-36-gfe76fc6aaf53/arm64/defconfig/lab-baylibre-seattle/boot-meson-gxl-s905x-p212.txt

thanks, great way to compare with my local output messages

already wondered about this:
[    1.195173] meson_vid_pll_div_recalc_rate: Invalid config value for
vid_pll_div

> Has the p212 is ref design of the s905x, we often see the related DT used on
> other device.
>
> Is your board actually a p212 ?
> If yes, could you tell us about any of the marking on PCB, such as the board
> revision ?
> If not, could you tell us more about your device ?

it's a "BeeLink Mini M8 SII"

pasted the output here
https://pastebin.com/UCnR25mK

should I try with another dtb?

> We proposing this series, I flagged that this patch and the other one (on
> phase settings) needed broader testing. It could possibly cause regression for
> tunning and high speed modes ... this typically show with error -5 (tunning
> failed)
>
> Here your eMMC timedout during init, so even before an attempt is made to tune
> which is odd. Could you try to enable signal resampling only when going forhigh speed modes ?

huh, need to look into how to do that.

/Andi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
