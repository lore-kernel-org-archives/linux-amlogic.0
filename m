Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C130C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnnLcmed0Bs4EG4FVL5ZoGKbI5b/A11+r0hczMpV9Ps=; b=zK6GHLS4qBdIo7
	jq4V8NciQHCSpgZ/4dy+h8l0CYt8oaahGDl+z9hlvb9JenySlwEwnugw8+4dTZfu06IvLgPXGlEWV
	SyRDKc47AdFfqV6mJwgqt1kl3eLQwyjf+wYBhVSv5o3pyAYNrnUCuxgqbvY9nQtri/LDLFHqxdJk3
	8sllRW7UHKXOJ1nZcVpADlS7+F4I5ft3dKe+QKnd2yGGnI4X6Vzu4J9d5EWDtRt7z0y3EFspVHjdz
	5xSZJ9uG77kwbqvlUBcbrhj7pltwNDojBQ90cROZthejuksPeeVD8HARHjf7EWHzk4jKf7cnwooJX
	exSfQucdVBQQCvKs9Zww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8O1o-009SlF-71; Fri, 14 Jan 2022 14:58:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8O1l-009SjM-NB
 for linux-amlogic@lists.infradead.org; Fri, 14 Jan 2022 14:58:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id h10so16082800wrb.1
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jan 2022 06:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=6vf0U5q3YvBeFSP6ko6F5Omy2TYNCgDxRvUcHVhEYQ0=;
 b=pd/Sc/ymoFhHtUDJbKUIFmJbTZs7ISdAwc/Z/4CtN3v9WiV8GkRuofTlTWTc4KHk2f
 RsnhyOCpwHcLsYotx9lqgV3q8OoB+Q9ycRNBt4VSUGccMCFGDv0z9G+We8al2dwQQDLY
 wAkC6KTN26MeXtT+8vldnrpnHKJjalrGcvh0SVSZFT6Qj3vFeyDyI1bNW+0QfxKRhXKy
 XYWQvHxG3sTil6A5HJqTC6d8DaycxwcfNWzvReiJj+0yHWD3hnLJjCcvtdA8LuZcJxG/
 BrN7DiuqrBCe2HqxYg8lDDPbJJ/6Kkpfey2aWeXcJ6YUTbftXFpgTG5OUMaAT+nMiTxZ
 mykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=6vf0U5q3YvBeFSP6ko6F5Omy2TYNCgDxRvUcHVhEYQ0=;
 b=sb+d0t3KzC9HWhhIi+LP8qHJ5BOHupWQfxbLHAmLssdlnBOFV7URwwgXozAXayyAzR
 dB4EOle83JJg15UOSFR71EtbSCawUQjRBQuLAcMmQ4fY6z5/V1cVJLxHryS+Fs/HHX5J
 FR/8rtJ8Po7oEN7Yu81MeCqkWAG7GWXHeEhX77RppSI621hft5k67CYuoDjNBt+hbRvN
 izVUwFQ2K+kyeQQfdETeV2w0xjo0N9aWS+C1J02GujGIqB8jn5oeKZZgKB333y7IzPC7
 gqET75+wNVmgwJIwRfTi/2kCHk1rWGxWIcO+QIqHUDSjRQNDjBXHlNRupekOlI1tU0Ya
 od5A==
X-Gm-Message-State: AOAM530FhZqbaZgGKJPSG+C5+z/+SmSP3Q50AcCfsaH+2kNu1X1ZhIxX
 76jfAr4M8viDBeHmFHSlpEVlnQ==
X-Google-Smtp-Source: ABdhPJwaCzxyfoZDVfCEAjJ6QGAdsVMhSBHArLgqdn2cWeUg0VmXCTSfPWbGVZ4NDt21+LmaYPHROg==
X-Received: by 2002:a05:6000:1686:: with SMTP id
 y6mr2609775wrd.320.1642172283314; 
 Fri, 14 Jan 2022 06:58:03 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 9sm2380504wrb.77.2022.01.14.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 06:58:02 -0800 (PST)
References: <20220114090753.34873-1-Jiayi.Zhou@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiayi.Zhou@amlogic.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: meson: external clock configuration for s4
Date: Fri, 14 Jan 2022 15:53:58 +0100
In-reply-to: <20220114090753.34873-1-Jiayi.Zhou@amlogic.com>
Message-ID: <1jmtjybc05.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_065805_809276_B55BF178 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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


On Fri 14 Jan 2022 at 17:07, <Jiayi.Zhou@amlogic.com> wrote:

> From: "Jiayi.zhou" <jiayi.zhou@amlogic.com>
>
> For PWM controller in the Meson-S4 SoC,
> PWM needs to obtain an external clock source.
> This patch tries to describe them in the DT compatible data.
>

I'm sorry but I have already commented on v1 that all the mess in here
don't seem necessary. For Reference:

"""
 You trying to bypass the input selection mux. There is no reason to do
 so.

 Your input clocks should be
 * OSC
 * vid_pll
 * fdiv3
 * fdiv4

 While the pwm driver could welcome a rework around how it deal with DT
 and the clocks, this S4 chip does not warrant any change compared to
 previous generation (AFAICT)

 All the stuff around "extern_clk" should go away IMO.
"""

Unless you can *really* justify why this approach is required, it is
firm Nack.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
