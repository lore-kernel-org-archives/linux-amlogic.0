Return-Path: <SRS0=zyCZ=R5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983B1C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 08:37:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659122084B
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 08:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iIePDrfg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jbtSZaEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659122084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0H7dKASV10McwX7zThx87PYgtXbfGB8Nsy2h1C2/6k=; b=iIePDrfgNXzkMA
	cE6/j7ei3oFpmtM2RYQzBoj1mPQQnVk2zxUp55Hce87Kecgbz1WWoBjCdWVBpsL5FnUpPpWK3EOaJ
	tXb2JUb/pdE5G3YD+wn8D2Ooz7MFPIuwJ34gIUOWtEmAYzP1YCT9WfoSRRR63tZRI3QvkDpqbfyqh
	pPREFkdMBjEpc168BfcZ6/t1q+8F5HPvTq3xdlGi8Auix9hwCSs/IbEAiWBAfdA72xPeMSTNQIdjD
	4/GcAcYE4sNrq6a9oIgVNMGvDLDuVvM4x/95Yd0FYXWN1mR9oi1Ch3rQkpkLfd5CyEgC/ixW3Q8OH
	X85QSnoveLaRtnGW2ZIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8haF-0001Wf-Vx; Tue, 26 Mar 2019 08:37:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8haC-0001Vg-2h
 for linux-amlogic@lists.infradead.org; Tue, 26 Mar 2019 08:37:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id f3so11657489wmj.4
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Mar 2019 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=mWH5TE9ngb/T4SFljDRth3c31ZtSkwBldxnRgk3wmtk=;
 b=jbtSZaEfdEFa/HjT4oKknl08ZaL8XyuvijT0P3HwKBvbNRMvOiYTbE7I/jMCdYeGSd
 zJ2HSVE4J3Pr0zsh05yXt+vx1HQwAvyw9LefX5HaooZa+HCQXzFJ7snWN6knKxWEcmzl
 Gr692g5/UpfiDsdlOlEppVvr5JWwUvkgTTkq1oLOb9sz48to6evj60jSVphaK2x6eDeU
 dngzk1yavdhuwfVbIPzaN3nV+vQJaq81GAra9siG8rbLjJzV819rQxpRtIqvpr6U+3GS
 AqRGE8JLpFFjkzd034YgUwszNS2G9nWvZwXaYRsS/tJp7fYNxyPnDeAfEyrZ/D9dsecG
 MIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=mWH5TE9ngb/T4SFljDRth3c31ZtSkwBldxnRgk3wmtk=;
 b=bNi9dhBj47aXyipMloUudV4RroxxFb33po6r78EJPpTOzngrGR82pbq0h6MzsEBi9J
 iDOaNV3N/rhYoNCfZoEtxutrnG5v1//4OUlUZ3OhjdYpTQWKMNLF06gb5PKRc2QamLxr
 o7/5XMi8LZRetyvwDxk+5JzZm+mMfmNZnV/wYPN67dSl7IEqha+x4ltMeVNnm7HVyCVA
 WpCOhkjHNHvy9KEliP5Fdw9+R9Or94zcZnrKCwRc1DOyqSMXvKo0URNk9r2uug5UW0WQ
 GGXTMT+lbhxVoVobfU4yKTL28CsLhxE/8NACz2PR5d1rrtjW0RkPSLTNwOD67/EmDF9g
 QRxg==
X-Gm-Message-State: APjAAAWZcFyZUlUZzPfyqy0NbSduHIXlMavLaZ7y4IJWHWLNznjsGJ/I
 noUGZscGic/EY5hQHXciA5hCbA==
X-Google-Smtp-Source: APXvYqzZdwTqgaSZfVI3hGKnx5vPu3dG9j8Ca65UUlBfpMDU8YwB5wYJhHVl+n5c8C9EXj4euPY3DA==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr13661182wmb.84.1553589435679; 
 Tue, 26 Mar 2019 01:37:15 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id b134sm37945007wmd.26.2019.03.26.01.37.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 26 Mar 2019 01:37:14 -0700 (PDT)
Message-ID: <88a731b0f1c2ce18d2cf7aff6e2ffc24a395a067.camel@baylibre.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>
Date: Tue, 26 Mar 2019 09:37:12 +0100
In-Reply-To: <CAFBinCCPW8wAoiN4hjj9tAYSqQqChpSB6+urAiXU95VYaZZKGg@mail.gmail.com>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <47e944da1c3b0a11cf46fc5ad5678ba961b9f9d3.camel@baylibre.com>
 <CAFBinCCPW8wAoiN4hjj9tAYSqQqChpSB6+urAiXU95VYaZZKGg@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_013720_117263_F7DA964C 
X-CRM114-Status: GOOD (  28.02  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 19:04 +0100, Martin Blumenstingl wrote:
> > Thanks for fixing this Martin.
> you're welcome!
> 
> > As for the future enhancement, I'd like to know what you have in mind.
> > As I have told you previously, I think the clock bindings of this driver are
> > not great.
> > 
> > The global name of the input clocks are hard coded in this driver and it
> > sucks. CCF is evolving to rely less on these global names.
> I fully agree with you on the clock setup, but I'm not sure if we have
> to break the dt-bindings for it.
> 
> the datasheet notes: "Each PWM is driven by a programmable divider
> driven by a 4:1 clock selector".
> In my own words this means that each PWM controller has up to 8 clock inputs:
> - up to 4 inputs for the first channel (PWM_A)
> - up to 4 inputs for the second channel (PWM_B)

Not from the pwm device POV. there is one device (PWM_AB) with 4 (max) input
clocks. Those are consumed by two internal muxes. There would be 8 if the
input was different between path A and B.

> 
> the current pwm-meson driver assumes that both the inputs for both
> channels are identical.
> the "clock trees" section of the public S912 datasheet (page 65)
> clearly documents the clock inputs per PWM channel, not per PWM
> controller.
> 
> Thus I believe we should name our clock-names (the inputs to the PWM
> controller) "pwm-a-clkin0", "pwm-a-clkin1", "pwm-b-clkin0", ...
> That way we don't have a conflict with the existing bindings (which
> already reserve "clkin0" and "clkin1").

I think this is overkill an inaccurate. The experience of all the soc we have
seen so far (meson8, gxbb, gxl, gxm, axg and g12) confirms the sources the are
the same input clock for both path.

The documentation just shows the clock src of each pwm. That just how the the
table is presented. That does not change the fact the pwms are organized in
modules (pairs) and the that the clock source are the same for each pwm of the
module. IOW, there is only 4 lines of clocks getting to the IP, not 8. Feel
free to ask amlogic if you want to make sure.

The name clash is not really my point. The purpose of the clock binding would
be different (from stating a setting to describing hw connection)

> 
> > In addition, the 'clock' binding should be used to refer to the clock
> > 'consumed' by the device, not to define a setting (as done now). 'assigned-
> > clock' binding can be used for that.
> using the assigned-clock* properties requires self-referencing the PWM
> controller (which I'm not used to), for example:
>   &pwm_ab {
>       #clock-cells = <1>;
>       assigned-clocks = <&pwm_ab 0>, <&pwm_ab 1>; /* references itself */
>       assigned-clock-parents = <&xtal>, <&clkc CLKID_FCLK_DIV5>;
>   };
> 
> if we want to auto-detect the parent clock (like you suggested below)
> we need to consider if we can detect whether a .dts-author assigned a
> specific parent.

I (personally) don't want to keep supporting the manual assignment of the
parent. If the driver can guarantee than it will pick the most appropriate
parent, there is no reason to have that.

> I know that it's easy to detect this when the clock is passed in the
> "clocks" property, but I'm not sure if it's easy to parse it from the
> assigned-clocks/assigned-clock-parents properties.

Assigned parent is the poor man solution and not necessarily easier to
implement (the pwm device would have to export its own clocks) ... I have just
mentioned it to make  the point that current method is not ideal

> 
> [...]
> > Last, instead of specifying the parent to be used, I think we should come up
> > with some code to let the driver pick the most appropriate parent for the period/duty requested.
> that will make it easier for .dts authors.
> I would like to postpone this until we have solved the other topics though.

I much prefer this last solution. Since the algorithm and the bindings would
change, I think it would be easier (in DT) to just make v2 driver with a new
compatible, progressively transition dts to it and finally remove the old
driver.




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
