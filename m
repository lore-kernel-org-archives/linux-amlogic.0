Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C135C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 05:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eO4MmZEAwgnucmp0F5Ac8vtq1wmO2omUTM+VdCbWVEA=; b=pNMFKPjzS9yUm6
	OOAmmUfgh+RQ6WU1IuLQB6pOr/GRYKJAHeUeEFS8/D3OAI5g9or/Q6gbwXdqWBDBmjSZ3xFsTAHAJ
	bjpRlEZ5GRyrZtqM6jAjXxqyar3NOYPT1bR0F1HJ3Du2E367IfO2CG1ivhr24WA5uPWLFb9/6v8w2
	BHOoCBnyF6iGtm8x1fR1kJam3aC+sEmq6IJmTgmM3WYK1t6s9d8Y2A7iWVxpg7O1EurHRLtPPpfCs
	1+Gt0gwYIQ44hpYJ8Rbv2UVnnGcAQPVwNEekDQnNKMy/WbxhlmiEB3emmtWe1zSQ6wpmAaPw6k7c0
	PsLtVpxRDZ07jLtH7VZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkFy-005IRc-9w; Fri, 21 Oct 2022 05:07:42 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkFm-005IMV-PK; Fri, 21 Oct 2022 05:07:32 +0000
Received: by mail-io1-xd2d.google.com with SMTP id y80so1428156iof.3;
        Thu, 20 Oct 2022 22:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MEwZHem6XE7/ekLP3cDVQiDet0qLNX4/5trFWKq/TK4=;
        b=MhfhmXR8De3QaEZs1GgnopnDHQU/TldUkkJLZfKo8RH91E3wimNUV609GsUonZMXkL
         tOriKFtKty8u0HT3H/hbnzT4Pxr4xp6d2Q4PDgVtULnkAlptMcSngaeqVa3Q/UrMMhpO
         IQZeN0ar8S7WYAkf6HFjP8pacsnxEhBCJypQmyY8Tv22rdlXBSEynIJOlflWSFUN4jNH
         flt31456ja5+HTaQwx9cRyIvmBXJKrk1ncgt9FwND7xVM8TE9aTsfQd72QqProHWSA2d
         qzPq0jbftOVsKmFzYUBufu9KN09YcFD6h7BSmsVcOFCHspzNXBchYSqH8lKTtVbAlUA3
         6PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEwZHem6XE7/ekLP3cDVQiDet0qLNX4/5trFWKq/TK4=;
        b=ArYPh8SfVu3ArdFnI07mQ504uugUJTwHKDz+Ip8FV1/T9K8wDV7cQwsZUUX0AJ5aLi
         9UAJySxWAxa3ZlT1csL5FevUPSxNqxvvzoLBD8DOsL0vrntnUqXRJclt87RWPCAsxS9V
         TO9n0rpno5NMLJKopTu6+tNr9xrqDTwn9S2Pa4zEHtYAdkZnArsWZ1/YqXQfJrPjF6mi
         Y9N+sSoOo4ES8PGA2qEh71+WmLaGqyDoJYVRJp7puJ+E8gI13f1DUJtnoh3dDY4O5rs9
         eZjZ68OSSNlDvUKpYTM+BXZQ2NgN1IpUqFGmJyn+etXhnozWKfUqhkofIyaOgebVEUC/
         uhDw==
X-Gm-Message-State: ACrzQf1b7J6XVoUs3Ak97rVDOsHd/kevOXm+IR+eW0e5bBwBNDqqkD9J
	G445TlCDtq/bqNeqQuBZU1q7bPRFKeIvSKtI3y0=
X-Google-Smtp-Source: AMsMyM6U2t/J1APaVQvh2XiaYqqrQH23meYzMdt+B6vkVCvpey5BQkHlr4XgLl/VZwV7wx93EPq7cUKl2q/VRyvhQwA=
X-Received: by 2002:a05:6602:2742:b0:6bb:a95d:7e3a with SMTP id
 b2-20020a056602274200b006bba95d7e3amr11993607ioe.16.1666328847336; Thu, 20
 Oct 2022 22:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221018195122.8877-1-linux.amoon@gmail.com> <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
 <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
 <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com>
 <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org> <CANAwSgQhWrzeRcpQSSAmfp+i3966dUQdtCLbcWwifQk=1ce=og@mail.gmail.com>
 <CAFBinCCyEVbc4N7TUEi=sbLFv7Rc-L=y-h8xBuZK446x1oLc2g@mail.gmail.com>
In-Reply-To: <CAFBinCCyEVbc4N7TUEi=sbLFv7Rc-L=y-h8xBuZK446x1oLc2g@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 21 Oct 2022 10:37:11 +0530
Message-ID: <CANAwSgQ9gJvtdr_r1K0xxrDxQ6aBh5v=pR9aJSxRytia2PSbrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_220730_869634_D4735F3A 
X-CRM114-Status: GOOD (  20.27  )
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

Hi Martin / Neil,

On Thu, 20 Oct 2022 at 02:10, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Wed, Oct 19, 2022 at 7:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > > +&pwm_AO_ab {
> > >
> > > &pwm_AO_cd not _ab
> > >
> > No it has a conflict with CPU_B (vddcpu_b) PWM
> Uh, you're right. That's probably why the Hardkernel team uses a
> software based PWM implementation: [0]
> In hindsight they should have used a different pad either for VDDCPU_B
> or the fan.
>
> I think the most pragmatic approach (since the "GPIO PWM" driver is
> not upstream and I don't know if something like that would be accepted
> upstream) is to use a GPIO based fan as you did in your initial patch.
> Not sure what others think though.
>

When I use gpio-fan  I get the following output with gpioinfo
Feature it woks as expected.

$ .sudo gpioinfo
....
gpiochip1 - 15 lines:
        line   0:      unnamed       unused   input  active-high
        line   1:      unnamed       unused   input  active-high
        line   2:      unnamed     "enable"  output  active-high [used]
        line   3:      unnamed       unused   input  active-high
        line   4:      unnamed       unused  output  active-high
        line   5:      unnamed       unused   input  active-high
        line   6:      unnamed       unused   input  active-high
        line   7:      unnamed       unused   input  active-high
        line   8:      unnamed "regulator-tflash_vdd" output active-high [used]
        line   9:      unnamed      "TF_IO"  output  active-high [used]
        line  10:      unnamed   "gpio-fan"  output  active-high [used]
        line  11:      unnamed    "n2:blue"  output  active-high [used]
        line  12:      unnamed       unused   input  active-high
        line  13:      unnamed       unused   input  active-high
        line  14:      unnamed       unused   input  active-high

When I am using pwm-fan using *pwm_ao_d_10_pins* pin is not getting
registered below hence it is not working on my end.

$ .sudo gpioinfo
....
gpiochip1 - 15 lines:
        line   0:      unnamed       unused   input  active-high
        line   1:      unnamed       unused   input  active-high
        line   2:      unnamed     "enable"  output  active-high [used]
        line   3:      unnamed       unused   input  active-high
        line   4:      unnamed       unused  output  active-high
        line   5:      unnamed       unused   input  active-high
        line   6:      unnamed       unused   input  active-high
        line   7:      unnamed       unused   input  active-high
        line   8:      unnamed "regulator-tflash_vdd" output active-high [used]
        line   9:      unnamed      "TF_IO"  output  active-high [used]
        line  10:      unnamed       unused  output  active-high
        line  11:      unnamed    "n2:blue"  output  active-high [used]
        line  12:      unnamed       unused   input  active-high
        line  13:      unnamed       unused   input  active-high
        line  14:      unnamed       unused   input  active-high

Thanks
-Anand




>
> Best regards,
> Martin
>
>
> [0] https://github.com/hardkernel/linux/blob/c109dec94e7e819554830acfac4b6ed96e230179/arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi#L356-L359

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
