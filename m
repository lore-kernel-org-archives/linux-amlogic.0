Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDD5ECE577
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37CHixfx/1/LqSc16onMlgrgV7wwdbgfqqXujfIdSM4=; b=TnuXstNBWSaZc6
	heiCMnDmPuYt579srHk/cqC1MF20afw3CWFz6O4Xnd8TKloBpGMFgrH6MaBUhHETS5tygC/bs5mT7
	mEBjOWRWG4gbx1rIVX3xMdfZThV0SIrcYqTufm3hKuhNxUX0bJEYEdacGZ2K9WzGWbrBUYo3V6dik
	F+I22TbCcn1Edg+vlWBppJUDvOQxDuPnAunxsMRXrImjzdlxX6WFfdt6cgy3FlFfHU98DYQKiK2CY
	jSxpy4Z3R14bjoqNtAlJhrSO5LTvXk1gJj38PUx/So0iEPFnCKfYAu2H8sbair+7UIPKNHLtKOBAG
	dMQ0Qz0wwRYvfCpWUKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sniFW-00000002qZs-0wvp;
	Mon, 09 Sep 2024 17:32:26 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sniEG-00000002q6Q-2qPj
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 17:31:33 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428e1915e18so39750015e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725903066; x=1726507866; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PiS3BCPtpO9F22HA9pONA15SeMVWRie+tAa6W5csc4=;
        b=v6QXwViyrZs9oiFjdoAfGN5zOZbOOwo74UJO+5Q8/vI8uPFo4islRHxxM4OXMy922P
         PEWWGrssb60/4KUEosfDTntetNsqqMmTzKMEPAzpHaVRi9+/t4VYWDELGjrz36Cr5KGD
         ocEelP2Vhi4KXxa2Yeg+D3sQ4bJOW0J8yrp85569zqQH19wnuf7qkyVY1UGKITbNqpy7
         cbWYpM4APHuBjS3l6o6McocCU3Pz2BEZq3mmIUQ9wD2EC8duwkNcixgbjMoomOHvHwgr
         rKUZh8XclvFLf3QwUOGCGJMLUrJ+S29dQjGaXgnwlI9RhjffX8Mb31Z/QuW6gRhLSh4B
         cRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903066; x=1726507866;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PiS3BCPtpO9F22HA9pONA15SeMVWRie+tAa6W5csc4=;
        b=NO0ZoZ6gSCjqv7jVlN+SQvwpM9IM9ZmfNBIp0LC0DkqCZc6o11hz7QZhSRdssiWqcE
         sgukNrY4ZdJGDwPwIV5JeoGCBTGtfQL4JfvjA46NXhTqdz/R9dilTK4hEcNmKH9gx5Oq
         t81E9NX+NeCvfUw6LPs9eIbCLSBUUyay3SlZVI1JBcKRy5hfvxqLB2g0WtOgVQl9qymm
         UjqlcrynZISIDTtyAmeAgCYI11YT/lH+h7URaRIXAZyrZesXS5hOjVeY/qKXsOQ5swpw
         +7/xQLJ3mTKDCGUKimJHQ5wAVuM1oC8IY6ugy2trmn0C/UUQcUHtOHJ+p2JSgX7LgUU9
         qxRw==
X-Forwarded-Encrypted: i=1; AJvYcCWWd+1bs6P2iJFhtCzJvvXBlT1YZQkmMhd8hZwd2VjXbMQI3juisE0TWWTseqjUI1iqgK30pz9bEmnCpXuk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1xb/xok726Pe/RySerIqRcZgwSkZ/ZA2IHxC39KdjWUsqCmg/
	fDVMgtguFc7fZrYJCTMV2xQirKIO4Sgk5AwYhDZuXKoBKDhfQICJbfLLgo2iyDF7UE2klEX8lad
	H
X-Google-Smtp-Source: AGHT+IG8YCZKd3Jy5v0Ys8OrH5RGLNJOThDfAM6nb3KaRMGZlBu7kgyv93neGwHauSgA7m/I2pKL9w==
X-Received: by 2002:a5d:5e12:0:b0:378:89d8:8242 with SMTP id ffacd0b85a97d-37889d88432mr6208872f8f.26.1725903065445;
        Mon, 09 Sep 2024 10:31:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a340sm6544029f8f.24.2024.09.09.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:31:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  oe-kbuild-all@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
In-Reply-To: <202409100033.EPfBtwfK-lkp@intel.com> (kernel test robot's
	message of "Tue, 10 Sep 2024 00:42:47 +0800")
References: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>
	<202409100033.EPfBtwfK-lkp@intel.com>
Date: Mon, 09 Sep 2024 19:31:04 +0200
Message-ID: <1jcylcu42v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_103108_737430_DE0AC899 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue 10 Sep 2024 at 00:42, kernel test robot <lkp@intel.com> wrote:

> Hi Jerome,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 487b1b32e317b85c2948eb4013f3e089a0433d49]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/reset-amlogic-convert-driver-to-regmap/20240906-213857
> base:   487b1b32e317b85c2948eb4013f3e089a0433d49
> patch link:    https://lore.kernel.org/r/20240906-meson-rst-aux-v4-9-08824c3d108b%40baylibre.com
> patch subject: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
> config: parisc-randconfig-r123-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409100033.EPfBtwfK-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o: in function `meson_reset_aux_probe':
>>> (.text+0xc): undefined reference to `meson_reset_controller_register'
>>> hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x88): undefined reference to `meson_reset_toggle_ops'
>    hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x9c): undefined reference to `meson_reset_toggle_ops'

In the config the COMMON part is built as module while the AUX part is
built-in. Of course, this should not be allowed. The error was
introduced in the last patchset version due to another renaming.
Will be fixed this next one.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
