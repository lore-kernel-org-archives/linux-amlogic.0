Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACB3C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 18:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A16B208E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 18:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ayEBoIZg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="o+eqW1QW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A16B208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2drl3ZDsQHnRNCpHGYIABoX4yRB9iTK2+OjG2G41TE=; b=ayEBoIZg0to/Uu
	c8ZsMl4Lt/ANvFLKPfXUJX7GerC23yh/Ns+ZuDknmcxR0V8RiiFOln8Ef1eGrwwwqK0agfDs51vPl
	tPth+zLHK3T71cW8K2nyElhL9HaBYlsPn58LKtZUzdp/LUbOVcTvnYZBWA5tUTABsazcDkmM/jFzH
	+HZiMiziQqCDxMIqCKiUob+rshduiKsGKCw6QiL2lupwGE1P5lNeqeI2ORr0OpwJneE1BQMkeUFzH
	pssdlXgJpGb41wH4dpb3kmxgc6U1+s5RF8OqM/OIVCpj+epHZxnWMQ5My/witxyMkwv4er80Oecub
	PkQABwEibb2yNVGmnkag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8TxQ-0000We-DX; Mon, 25 Mar 2019 18:04:24 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TxL-0000VO-00; Mon, 25 Mar 2019 18:04:22 +0000
Received: by mail-ot1-x344.google.com with SMTP id u15so8888153otq.10;
 Mon, 25 Mar 2019 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GADRvM0xN4bllnd3qZhEh8xI+loEVurWzVmPK/bUGn4=;
 b=o+eqW1QWWrIKtllLpb/54oAYP5Z3yohEpohdPOmIlzfzeapD+tA+fWE8VGMVfq8tTw
 qR2EMrf8jUH/yg0BmaCsZFMoK2RvqaYP79NeC5B2nLHTICkVtzS6IHzEldtJKKQPa67P
 EqgsXQozYW2GAMPu4FL/h/nqTC8CIY/VB6oAVbzqr7xFoqNi3AN1SSE5ykn+ZpjclzUk
 ukvWQaBdKIrWMtqnZr024z4uQfkhEgXgAEsFbWrwXyYG6dkgiS1o3hldhaGEO8v4GeVQ
 LcYQQ31b1We0O4xW5z4fW+gwIeuY6OzURJUVGCH4VP9R/9GWxEyGSKJwBvx3Ssg/O7tj
 9Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GADRvM0xN4bllnd3qZhEh8xI+loEVurWzVmPK/bUGn4=;
 b=P/bRbEoonE+c5oVOADM11Qd6oO5zoKuGWodOm9Wd1Fs91TKsKS8UaczqFlE+xnMNCo
 8gyu/2mq7WfhFvi+v+qPY44xDYik4VXuPVkz4XgOcs8knXqIg9v7ycfUkkkpk1OKA2zt
 89GVlMj8m/HkYRhGRiy8jscLuT/RmMhET9rskzfsgZF6GnNTcoiE6TDriDReJJ8EfxCK
 YGD0maoxNCDOT27kofa5j/UxbDr/fQYHAaZTqrzSMdVH/2QeLIo2h5qCXuAyRNaMezsU
 6b0ID4NiBpkXDBuOmclSU1ypLEy/5Favb4W53iFio3fmIgZ+MMM9up8asJo57SaPQC+w
 IN/g==
X-Gm-Message-State: APjAAAWTe0Q5QaGRxHWjcX1I/woRempDubx/dYD+X2BU9YFFsJBCWf5v
 TVfcDgLTPAW1Uo01YL2bLgxk72Pky9+Dt807B0q1ylaU
X-Google-Smtp-Source: APXvYqypZk6IN2goZkQQ3kCsStNCRpPQUw/Nmnmm1imDszeEB0ThMlAUdtaHCGkJ+7p3NxDX6bNG7VtPb2Y1kWCprNA=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr18256071otk.86.1553537056347; 
 Mon, 25 Mar 2019 11:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <47e944da1c3b0a11cf46fc5ad5678ba961b9f9d3.camel@baylibre.com>
In-Reply-To: <47e944da1c3b0a11cf46fc5ad5678ba961b9f9d3.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 25 Mar 2019 19:04:05 +0100
Message-ID: <CAFBinCCPW8wAoiN4hjj9tAYSqQqChpSB6+urAiXU95VYaZZKGg@mail.gmail.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_110419_064881_1A543977 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Jerome,

On Mon, Mar 25, 2019 at 10:35 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sun, 2019-03-24 at 23:02 +0100, Martin Blumenstingl wrote:
> > Back in January a "BUG: scheduling while atomic" error showed up during
> > boot on my Meson8b Odroid-C1 (which uses a PWM regulator as CPU supply).
> > The call trace comes down to:
> >   __mutex_lock
> >   clk_prepare_lock
> >   clk_core_get_rate
> >   meson_pwm_apply
> >   ..
> >   dev_pm_opp_set_rate
> >   ..
> >
> > Jerome has also seen the same problem but from pwm-leds (instead of a
> > pwm-regulator). He posted a patch which replaces the spinlock with a
> > mutex. That works. I believe we can optimize this by reducing the time
> > where the lock is held - that also allows to keep the spin-lock.
> >
> > Analyzing this issue helped me understand the pwm-meson driver better.
> > My plan is to send some cleanups (with the goal of re-using more of the
> > goodies from the PWM core in the pwm-meson driver) after this single fix
> > is merged (they can be found here: [1]).
>
> Thanks for fixing this Martin.
you're welcome!

> As for the future enhancement, I'd like to know what you have in mind.
> As I have told you previously, I think the clock bindings of this driver are
> not great.
>
> The global name of the input clocks are hard coded in this driver and it
> sucks. CCF is evolving to rely less on these global names.
I fully agree with you on the clock setup, but I'm not sure if we have
to break the dt-bindings for it.

the datasheet notes: "Each PWM is driven by a programmable divider
driven by a 4:1 clock selector".
In my own words this means that each PWM controller has up to 8 clock inputs:
- up to 4 inputs for the first channel (PWM_A)
- up to 4 inputs for the second channel (PWM_B)

the current pwm-meson driver assumes that both the inputs for both
channels are identical.
the "clock trees" section of the public S912 datasheet (page 65)
clearly documents the clock inputs per PWM channel, not per PWM
controller.

Thus I believe we should name our clock-names (the inputs to the PWM
controller) "pwm-a-clkin0", "pwm-a-clkin1", "pwm-b-clkin0", ...
That way we don't have a conflict with the existing bindings (which
already reserve "clkin0" and "clkin1").

> In addition, the 'clock' binding should be used to refer to the clock
> 'consumed' by the device, not to define a setting (as done now). 'assigned-
> clock' binding can be used for that.
using the assigned-clock* properties requires self-referencing the PWM
controller (which I'm not used to), for example:
  &pwm_ab {
      #clock-cells = <1>;
      assigned-clocks = <&pwm_ab 0>, <&pwm_ab 1>; /* references itself */
      assigned-clock-parents = <&xtal>, <&clkc CLKID_FCLK_DIV5>;
  };

if we want to auto-detect the parent clock (like you suggested below)
we need to consider if we can detect whether a .dts-author assigned a
specific parent.
I know that it's easy to detect this when the clock is passed in the
"clocks" property, but I'm not sure if it's easy to parse it from the
assigned-clocks/assigned-clock-parents properties.

[...]
> Last, instead of specifying the parent to be used, I think we should come up
> with some code to let the driver pick the most appropriate parent for the period/duty requested.
that will make it easier for .dts authors.
I would like to postpone this until we have solved the other topics though.


Regards
Martin


[0] https://dl.khadas.com/Hardware/VIM2/Datasheet/S912_Datasheet_V0.220170314publicversion-Wesion.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
