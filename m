Return-Path: <SRS0=kcVe=53=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A1EC2BA19
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 22:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8615020769
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 22:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxo2ZxoP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JpZPZ5IJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8615020769
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3lbN6UfhKjCv/BXQwwFfmXxmmKLMh2zy5ad3OESrdVM=; b=uxo2ZxoPzCS1cLSetfqXN822WW
	+4r9mb1ReX3vznX6ncatK5etyhUkP1KOTkEd2Clp58qc3Uj2oM6jMJ2jMwWId4CMVcEqZCvLrXUp/
	X7gCa4snzhQM7QPMU3t15hSd2O4Ahm7mQ1EQOFP+g9BjXrRlW0uDCv/Ygfce1WI1ugdlYKdKGk+zT
	VsVpIVVyneaARke8OW13jq/TZnIvO6kGfyTkJf2p/46HWysXew6MbhPyS+c7OdlKNu6EytfShHch1
	MA1vCmA6ifhZpYqqv8ZVNliMwwPo16tOkzDHVWUmYmyR0BLk407/55o1FH68ILBk+jBFleOpVK9P9
	ZAuSjKNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNOia-0007UX-FW; Sat, 11 Apr 2020 22:35:16 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNOiK-0004xq-2x
 for linux-amlogic@lists.infradead.org; Sat, 11 Apr 2020 22:35:02 +0000
Received: by mail-wm1-x344.google.com with SMTP id a201so5899386wme.1
 for <linux-amlogic@lists.infradead.org>; Sat, 11 Apr 2020 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=XTdhg+Xlf5WPZXZz0XSsY6zvLdLYzEpOReg3X3kD96s=;
 b=JpZPZ5IJaM6K9R8SqSPXG0qjQfqrwlkbzbZZRg+FRlF+C+xU5GZNWXJIuJjaMVjvsH
 WOmjPIa1UTU0gYkdITU0E91PWY2iqfSD3OCc0sRJOH53X6dgyk/nnS+ubn5oMIkBP4Ef
 wjRUmkDWldZPFhHGJw++v2MKpYpolwfx3SDEL75DY9Sg9zCmG8ITuKyvcWyDOo6w+TbB
 uEOIm9N59Kp5eueUtfhc/c085zbWjQP9uLYQeqM7tBG6cULZx5EE56zjVVROlWNxzjNt
 X54RVEx/HGh3owKuNAoLOU0ihXq7+DyCkriblVSHtjjS1RD8Uev1Eyz6FLns7U34cZcI
 vEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=XTdhg+Xlf5WPZXZz0XSsY6zvLdLYzEpOReg3X3kD96s=;
 b=VyrusZKHGh1u29LIKFdOXc7Ln0iOW7JexQ8FgL/wgrw9APN/XOmE49jjc6W5YtxNDJ
 7Tiu2Fu8yCasB3q7rKCRP00OO5FTLL+v0rv0xxrmjLT8riOb2t+Pl+7TaYhDSDVHnhLh
 XRBl9NLSdjONNm4lWXEqX5UKZ/+C44nTopEgL0xvJnJfetqnog2J3oQ84cHurPCyZ8ul
 ZP12ASL1aiR07CL5dKq+zvLikbpPBtnxyo+nYjehUHM7jPJpgoXFC10x7rGXIQYjMp97
 6JqGoOrp5owkgDOb39a9t4soDBB6BsOUmgxkDPL8HIgsi86l3H2FUdgdhBOAFrYJaGUQ
 Z8Rw==
X-Gm-Message-State: AGi0PubMLpLGgL/FN3Ovxe/hZqEB57p1A2bb3FA1FJuX69EIncwTZXhH
 3dIrBVWHYXNdPMQO5G1hhmXpsg==
X-Google-Smtp-Source: APiQypLX5XnwJtkOI7FJ21vIuZMoYF8VfN0lscJ3iVpl8y6O/opkC8sIkWHHFQs0s3CaoWUAM16DZQ==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr12144840wmb.31.1586644498242; 
 Sat, 11 Apr 2020 15:34:58 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id s24sm7127097wmj.28.2020.04.11.15.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 15:34:57 -0700 (PDT)
References: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
 <20200411170356.1578031-3-martin.blumenstingl@googlemail.com>
 <1jlfn2szqp.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCDut=qY9f8BTwRrHC6zKMGK4DEqXFnd8BxN6S2OatXrWg@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 2/2] pinctrl: meson: wire up the gpio_chip's
 set_config callback
In-reply-to: <CAFBinCDut=qY9f8BTwRrHC6zKMGK4DEqXFnd8BxN6S2OatXrWg@mail.gmail.com>
Date: Sun, 12 Apr 2020 00:34:56 +0200
Message-ID: <1jk12ltzvz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_153500_173957_1938EBF2 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 11 Apr 2020 at 22:53, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

>
>> There is an example of that in meson-gx-libretech-pc.dtsi with the phy
>> irq pin.
> I'm still hoping that pinctrl-meson will gain interrupt support one
> day, then the driver will (hopefully) take care of that :-)

I don't see why it should. If the meson gpio driver was able to provide
an irq related to gpio, I don't think it should do more than that.

In most case the gpio will be an input, yes, but nothing says it must.

>
>
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
