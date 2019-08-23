Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C3BC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 15:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8765820870
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 15:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mggiTHj5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="siISpHlf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8765820870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vk4jg/ExFD7AjMl+jPojpXJVLy4BAzvXdSEzhLEGCU=; b=mggiTHj5UMdR8U
	2uQo9LhvypWBVEWv6B5YaK1j6EHMdHj9TjKJw6dJKxe0/hpEzSqhlH5Wj/fzuz1B7T/UsNuIctxRW
	sjU0eugACkLtIYVykaTmY8qxcLVi3aG652j9kOuOpspwMEZYLaYBJeMhYzlVQRf0gCw4PeYRH13Eq
	Z8A06NtLucXgFX4VNfPKk1FhDDTPUCd4+aYby7ho1+Bakkz0Dr/+jgXoY22Gr+3eaXYUCPBMZCv+I
	dZB+fl52mKSQq9PUpcyMH+zHkenqKN2zEKdu8hD39hgzQX9NV/ySgvbQimWRz5bP9+H9c4Sx1L1ZQ
	QbCHXtXOGlEId1pB+OgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1B96-0001QY-OX; Fri, 23 Aug 2019 15:06:32 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1B93-0001Pr-Kh
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 15:06:31 +0000
Received: by mail-pf1-x442.google.com with SMTP id y9so6270821pfl.4
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=br2IEBdfnW2qlqV7gg30Z/xwOIaLVKl9bGEeCZKa9NU=;
 b=siISpHlfibAjTzKXmzvMvdMERCB8h0biNAphsfX2uljz+Okx2iR9rML7xRX4aOLa45
 G2Hej+2b3/xvgrJGt6vMT5MM5nsOSJlENKdRtjHjvUJYWQAlFT+/8pulaatvnRMmo79z
 0vukJARO++UdwvA5MaHWvvNNJIPqDVj0WCKJPkAR+5MH3mym60HW3KXHiGIHzkv05VCZ
 0NxHuTPkQs6KXJ3UTB1TiigWz2Ng1xU/GS8zTf5yLSmcpn+KulnVCOObrJ61y9nmhV9L
 c4l+BHt6kJeYQPHrpEbAmDFvHFLQG3KJB8Tkyo6KKDqpKlSLiWT6xNYcDeeOa/3qsrCT
 BepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=br2IEBdfnW2qlqV7gg30Z/xwOIaLVKl9bGEeCZKa9NU=;
 b=MDx29hlEJLvPnIUvEe2Zv63+XIL/BYZgay1fmadBexHuVJGZa5dulEA6eVw9g7Jjeu
 pip1fx/xp0nBsnuoDTyXzQl1R4dD93bTngC2wQDY2EdM0hl6H/nTRC3A80eiJOSfNpd8
 hh6w+Dh/LEfs0/8p5aMAC9OMGqcbCG3YJIZkZnVRxoS11HYqJGwieCK/pMOKzN1qHgdH
 C0F4a/+MG0Igy7VPdMaLuT6gFZK6pRG7B/C7tMegF4BCko6bPU2vPSzEWPf3xcwOqiDO
 rpMDUxXrVRjsn27iIpED4nxMdSZ7m05h10oxkeyC2IQ4C4CTJCoqv1MS8UKptsGXdK/g
 t0iQ==
X-Gm-Message-State: APjAAAWAQMFz1NCOzfwdFVGFWOvdYIzlyhLyunNzl/X6uLYrl5BgL3aL
 PMCW1OKJ9rgZ3pVFe3alKv90qQ==
X-Google-Smtp-Source: APXvYqzhBqSLYP5ApPK5mE0oG+RMyTUh1JqA9ZAmyyVrzxAloBECYA84RJ5XVFzKAvGUUyuOwLrT5w==
X-Received: by 2002:a17:90a:be07:: with SMTP id
 a7mr5731477pjs.88.1566572788803; 
 Fri, 23 Aug 2019 08:06:28 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
 by smtp.gmail.com with ESMTPSA id fa14sm2699525pjb.12.2019.08.23.08.06.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Aug 2019 08:06:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, ulf.hansson@linaro.org
Subject: Re: [PATCH 2/5] soc: amlogic: Add support for Everything-Else power
 domains controller
In-Reply-To: <0ac1cf30-1796-a549-e195-0f94c4a85993@baylibre.com>
References: <20190821114121.10430-1-narmstrong@baylibre.com>
 <20190821114121.10430-3-narmstrong@baylibre.com>
 <7hzhk25ct3.fsf@baylibre.com>
 <b6cfb770-76eb-00b1-e088-1a73b7978f33@baylibre.com>
 <7hzhk12b6m.fsf@baylibre.com>
 <0ac1cf30-1796-a549-e195-0f94c4a85993@baylibre.com>
Date: Fri, 23 Aug 2019 08:06:26 -0700
Message-ID: <7h36hr2a6l.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_080629_822269_23F49D69 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

[...]

>>> It's for legacy when VPU is initialized from vendor U-Boot, look at commit :
>>> 339cd0ea082287ea8e2b7e7159a5a33665a2cbe3 "soc: amlogic: meson-gx-pwrc-vpu: fix power-off when powered by bootloader"
>>>
>>>     In the case the VPU power domain has been powered on by the bootloader
>>>     and no driver are attached to this power domain, the genpd will power it
>>>     off after a certain amount of time, but the clocks hasn't been enabled
>>>     by the kernel itself and the power-off will trigger some faults.
>>>     This patch enable the clocks to have a coherent state for an eventual
>>>     poweroff and switches to the pm_domain_always_on_gov governor.
>> 
>> The key phrase there being "and no driver is attached".  Now that we
>> have a driver, it claims this domain so I don't think it will be
>> powered off:
>> 
>> # cat /sys/kernel/debug/pm_genpd/pm_genpd_summary 
>> domain                          status          slaves
>>     /device                                             runtime status
>> ----------------------------------------------------------------------
>> ETH                             on              
>>     /devices/platform/soc/ff3f0000.ethernet             unsupported
>> AUDIO                           off-0           
>> GE2D                            off-0           
>> PCI                             off-0           
>> USB                             on              
>>     /devices/platform/soc/ffe09000.usb                  active
>> NNA                             off-0           
>> VPU                             on              
>>     /devices/platform/soc/ff900000.vpu                  unsupported
>> 
>> In my tests with a framebuffer console (over HDMI), I don't see the
>> display being powered off.
>
> It's in the case where the driver is a module loaded by the post-initramfs
> system after the genpd timeout, or if the display driver is disabled.
>
> In the later I had some system failures when vendor u-boot enabled the
> display and genpd disabled the power domain later on.

OK, thanks for the explanation.  I get it now.

>> 
>>> I could set always-on governor only if the domain was already enabled,
>>> what do you think ?
>> 
>> I don't think that's necessary now that we have a driver.  We really
>> want to be able to power-down this domain when the display is not in
>> use, and if you use always_on, that will never happen.
>> 
>>> And seems I'm also missing the "This patch enable the clocks".
>> 
>> I'm not sure what patch you're referring to.
>
> It's also added in 339cd0ea082287ea8e2b7e7159a5a33665a2cbe3 "soc: amlogic: meson-gx-pwrc-vpu: fix power-off when powered by bootloader"
>
> I would like to keep the same behavior as meson-gx-pwrc-vpu, since it works fine
> and we debugged all the issues we got.

OK, that's fine with me.

We'll have to revist when we start using runtime PM enabled drviers and
want to power down the display IPs on idle, but that's fine to do later.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
