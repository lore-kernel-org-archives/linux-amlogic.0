Return-Path: <SRS0=8XHu=W2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01572C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2019 09:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F3A23427
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2019 09:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M226cROU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8PUfos1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F3A23427
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4XJsGl3I232vodNNHFBR7bmY7l7X7l5oGxlmkixEq4=; b=M226cROU63N4Te
	DflP5Fsd8lo4zV4RAj89ZWVO7I3O5uurZHeISaXDxjlPjPqVjbxQRM153Zrd1qTyiQSSvNNzSFzq7
	+BjO0tNQoDRTpktsu6Zm/BE8dITczEyhAzuG9Hg3yDXC40olpgCChvB2hLLrb5saq9C6+FaYPDr1d
	rzOc8x1UX5PbMiUKTToqt2Kg3qDT+9T413uhI8wr1JeOWuUIYCOZp+6d0ug5xzE4oZJ1bklxDYwLw
	lapeUU7RbXvGzBcw4P0jtUP9TQpgBsH0LGsi1fBqNJPrJR0Lrtpe049S3d5LW87aYxA/98BiQw32y
	Zs+xH++3M4pV5uAYbmxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3dJ3-0007Fy-G6; Fri, 30 Aug 2019 09:34:57 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3dIr-00075Z-6K; Fri, 30 Aug 2019 09:34:46 +0000
Received: by mail-io1-xd42.google.com with SMTP id n197so10717639iod.9;
 Fri, 30 Aug 2019 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2JeLeivxqp6OMDXYUWqY/YiY9TPlEaIx83182ozRi8=;
 b=Y8PUfos1VtsBsY8T7aJlWgnXtXEp7HZAzL6s99gvoV4MvdjIfeXHQ3CuSaDHr4YSQT
 0ZQa7XxyogYlBTI2ttYSHa2eOFhL78OhDK/Q2uhFLLXjbkDmNGayw+5bw9CF7YzrrJUx
 eAb3DB6RyFu9PhxERH162JB+6rYqhVzpV2CVcvwKxpFNdKFFnb+X+FQJlsCIOn5+Ure8
 ZqeK9q16PqI3WUMvnFZQj/MchE4hFJ64xpiI0AMsRzc2hy+gUG7Ws9yv0xRiZN/09d7j
 DqmkIwffydzZcoHNUEJ/4bnr0LUerLuJIjMY9HwDXD39cBGkv30qZyzohGHKxuYydPxS
 CkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2JeLeivxqp6OMDXYUWqY/YiY9TPlEaIx83182ozRi8=;
 b=M908wQt95z+gkWrJCDcl/vhnnMhmbPjGE1dAXczwHcbb4ibCZLlI0ytul13laUhizX
 eskg7E40ZDDLjBNDMc7Vcc7cJMxt40viA9kpFhEdEEfqPtMW9+d5I1WyMfqWWZgfN6k+
 dGdIuna8Zia/NaO/sWKVfUUqdgQ2qtqUmcK9FvaMPPVRGSqI5QqOP0QqXFiEnlUhJiiY
 bssQuLcmvmmIa9yoppHGt9ES3mPR3k82e8GGDjDgexeRF1HJOb44vESfI7Ic/arqDyzD
 2rIhXtuqLbvW3V/e0z9uFzIMt4/Sj4DhAl31eZghwqpXCewxZn6OO9W314KiAzYA73Zo
 rT2g==
X-Gm-Message-State: APjAAAXqzFUsSpdqGoKzUqGWodyJ1RoVsjtSvcBmIqOe2RWI7n1K8rQQ
 MJtXx1EJkOf5UzrbhhWlIiDWsgIsbqEw9PHU5OZzY+HM
X-Google-Smtp-Source: APXvYqxCE6vm8ZLPoHbRe3ysXeQq3KEt790nzw5aUG+118k8eqggXI4FxSx7HsS2gzCy29kj93jDYlEVZhPv9Xeg1lI=
X-Received: by 2002:a6b:4a01:: with SMTP id w1mr5213121iob.222.1567157684038; 
 Fri, 30 Aug 2019 02:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
 <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
 <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com>
In-Reply-To: <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 30 Aug 2019 15:04:31 +0530
Message-ID: <CANAwSgQwZg_AXAnAY4KwDzHpwcSA9up7SrR6jyv5Bem24wtaJg@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_023445_231006_07AD04D9 
X-CRM114-Status: GOOD (  20.93  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, 30 Aug 2019 at 13:01, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 29/08/2019 20:35, Anand Moon wrote:
> > Hi Neil,
> >
> > On Thu, 29 Aug 2019 at 13:58, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 28/08/2019 22:27, Anand Moon wrote:
> >>> Below small changes help re-configure or fix missing inter linking
> >>> of regulator node.
> >>>
> >>> Changes based top on my prevoius series.
> >>
> >> For the serie:
> >> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >>
> >
> > Thanks for your review.
> >
> >>>
> >>> [0] https://patchwork.kernel.org/cover/11113091/
> >>>
> >>> TOOD: Add support for DVFS GXBB odroid board in next series.
> >>
> >> I'm curious how you will do this !
> >
> > I was just studying you previous series on how you have implemented
> > this feature for C1, N2 and VIM3 boards.
> >
> > [0] https://patchwork.kernel.org/cover/11114125/
> >
> > I started gathering key inputs needed for this ie *clk / pwm*
> > like VDDCPU and VDDE clk changes.
> >
> > But it looks like of the complex clk framework needed, so I leave this to the
> > expert like your team of developers to do this much quick and efficiently.
>
> On GXBB, GXL, GXM and AXG SoCs, CPU Frequency setting and PWM Regulator setup is
> done by the SCPI Co-processor via the SCPI protocol.
>
> Thus, we should not handle it from Linux, and even if we could, we don't have the
> registers documentation of the CPU clusters clock tree.
>

Ok thanks.

> SCPI works fine on all tested devices, except Odroid-C2, because Hardkernel left
> the > 1.5GHz freq in the initial SCPI tables loaded by the BL2, i.e. packed with U-Boot.
> Nowadays they have removed the bad frequencies, but still some devices uses the old
> bootloader.
>
> But in the SCPI case we trust the table returned by the firmware and use it as-in,
> and there is no (simple ?) way to override the table and set a max frequency.
>
> This is why we disabled SCPI.
>
> See https://patchwork.kernel.org/patch/9500175/

I have quickly enable this on my board and here the cpufreq info

[alarm@alarm ~]$  cpupower frequency-info
analyzing CPU 0:
  driver: scpi-cpufreq
  CPUs which run at the same hardware frequency: 0 1 2 3
  CPUs which need to have their frequency coordinated by software: 0 1 2 3
  maximum transition latency: 200 us
  hardware limits: 100.0 MHz - 1.54 GHz
  available frequency steps:  100.0 MHz, 250 MHz, 500 MHz, 1000 MHz,
1.30 GHz, 1.54 GHz
  available cpufreq governors: conservative ondemand userspace
powersave performance schedutil
  current policy: frequency should be within 100.0 MHz and 1.54 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 250 MHz (asserted by call to kernel)

I did some simple stress testing and observed the freq scaling is
working fine when cpufreq governor is set to ondemand.

Powertop output.
            Package |            CPU 0
 100 MHz     5.2%   |  100 MHz     1.6%
 250 MHz     4.4%   |  250 MHz     4.3%
 500 MHz     2.6%   |  500 MHz     2.4%
1000 MHz     0.5%   | 1000 MHz     0.3%
1296 MHz     0.2%   | 1296 MHz     0.1%
1.54 GHz     0.2%   | 1.54 GHz     0.1%
Idle        86.9%   | Idle        91.2%

Here the output on the linaro's pm-qa testing for cpufreq.

[1] https://pastebin.com/h880WATn
Almost all the test case pass with this one as off now.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
