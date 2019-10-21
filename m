Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93137CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 15:42:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6635B20873
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 15:42:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YORtTsds";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwmNb7cX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6635B20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zr2zBVY38c5CyFcRlhxb4lxSFTk9hr6MD1X91IGaXEE=; b=YORtTsdsX3Phak
	NAtHBPCWQFwJl69e5IOfYNVjoG+Q+RBxLmY5psAeEZZo6PsJeuv8l6AUr5F7GGeXHNGv8aIhsC6GY
	DMeRDVxAVKQv3iiVXIQpaGaFQfhrCVPuAx74DqFNcm5L8Aux2vq6efYsamkHS9Kp0/uLgZmsLIS/N
	Z/Cn3YfxTHA5pJtjgb1jcEUR2hEvwozizBkk7wpAee4ic2bX+XOLA7x7/2TtjTkB1aE4EfEMM56Ma
	PkitUYe5uGKgj46YkxI6U71mCVmCliKMWyVaixH4WKEdYr0V46Zp1xAgpj6zcqMQJC1aks9/LjYY5
	AjPJmS+fKVrLmxzThqMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMZou-0004OV-NS; Mon, 21 Oct 2019 15:42:08 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMZoj-0004FO-Kg; Mon, 21 Oct 2019 15:41:59 +0000
Received: by mail-io1-xd44.google.com with SMTP id w12so16427437iol.11;
 Mon, 21 Oct 2019 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrezMpUPTuyBffQXpwXrXBC3vhqskF147L+22Fn98BU=;
 b=EwmNb7cXzst/x89vU6zX83MOOZymhv4R7vncUF7z1tLKjEQC3olmiUnfQla3diTAaY
 CwxGnWNj4NsBN6ZUzZjBq3ozYbikY1usGQPjjJNT2B6tGiIVTS7QPbyrtamOV8SKH2B6
 XvM4vy8QY6L3spvc+y6BPseinBCXbXoxo5IezrWm6zw8bIpeoh87tqkE9cj1BEs2gGVs
 aZGDKqPxfiP4VYqbsGB8dgHSbhD5NDYAIF8tT+X3o3dPr7iF4gr6lCXXFCR5y2eOOMi6
 BlypA8VwHZxFc8HlZYhZEycLpi+Ml42Mz2S9+ief8wwwPHOzEt3YT9lVze8zUoiUqG2P
 PGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrezMpUPTuyBffQXpwXrXBC3vhqskF147L+22Fn98BU=;
 b=YcPHnTFneujnoHgYa689utRlNczYFsPkdUgu2eMa+4ZZEBj56S4aMTxeDQsXcqcn+U
 /TQc2TxTQuDOapeh/+1T3cnrOhSEDa/B1vfPSf+YYVdZ4jOlTVqdRNtEroTlOETpAjJk
 O22CDtGC1zygPVqxW/LmBY0BHtqkK1ciKxuSViCDppftVoHJE2Ao0i5c5PJWRxLgt2NY
 oQsXECNe/41ds6qUvB+8PmIGi32qse8YXBSA/99K5RjhS+O3p9ANqR3M63iCMfDAIsJF
 19ti3AxzD7TCruQ6IQURcPCPDrGU6IO3dOlaDR4ZAE0CELkZJRiVsV3JfeYsLvSr8TCJ
 VTbA==
X-Gm-Message-State: APjAAAXl9/WteqoRcQ5OVHoqp8FgdbCZFFbuF6hHia+BIGKu1glI44IH
 Yu2DbG3wbJwLCMtkM/0gGN2sHLJCMvJ7j8pM6g+dJg==
X-Google-Smtp-Source: APXvYqzSsz0JCUb9Vzflc4VEP6hwCRnJcMI8hMtnlwZ2QZkCnUzhMTr7V+XY5wal8xMfpEGVzAt4PglUUBLaMwmHu0g=
X-Received: by 2002:a6b:7417:: with SMTP id s23mr17364283iog.221.1571672516254; 
 Mon, 21 Oct 2019 08:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
 <7hsgo4cgeg.fsf@baylibre.com>
 <CANAwSgRfcFa6uBNtpqz6y=9Uwsa4gcp_4tDD+Chhg4SynJCq0Q@mail.gmail.com>
 <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com>
 <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
 <1jwode9lba.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgSoK4X3_QbO3YpZRXNTpPJ+zVeid=w93f14Eyk8Dd32EQ@mail.gmail.com>
 <CAFBinCBdwqxA2kLMAA9gtOcXevYK-J4x12odHwpQOAWakgWiEg@mail.gmail.com>
 <CANAwSgRs2DUXwvhJD5qpXg04qEdP_Nt-wQqRbD2FpY2SWnHpAA@mail.gmail.com>
 <1a98c5f0-de8a-53bc-cfb7-c9b3255667c6@baylibre.com>
In-Reply-To: <1a98c5f0-de8a-53bc-cfb7-c9b3255667c6@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Oct 2019 21:11:45 +0530
Message-ID: <CANAwSgRD-Vd-D1H5cDYMyTLRMfzdkrFuiy4KfXYt6S+0goF-2w@mail.gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_084157_680352_E6494B6E 
X-CRM114-Status: GOOD (  27.41  )
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
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 21 Oct 2019 at 19:55, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> On 21/10/2019 16:11, Anand Moon wrote:
> > Hi Martin,
> >
> > On Fri, 18 Oct 2019 at 23:40, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> Hi Anand,
> >>
> >> On Fri, Oct 18, 2019 at 4:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >> [...]
> >>>> Next step it to try narrow down the clock causing the issue.
> >>>> Remove clk_ignore_unused from the command line and add CLK_INGORE_UNUSED
> >>>> to the flag of some clocks your clock controller (g12a I think) until
> >>>>
> >>>> The peripheral clock gates already have this flag (something we should
> >>>> fix someday) so don't bother looking there.
> >>>>
> >>>> Most likely the source of the pwm is getting disabled between the
> >>>> late_init call and the probe of the PWM module. Since the pwm is already
> >>>> active (w/o a driver), gating the clock source shuts dowm the power to
> >>>> the cores.
> >>>>
> >>>> Looking a the possible inputs in pwm driver, I'd bet on fdiv4.
> >>>>
> >>>
> >>> I had give this above steps a try but with little success.
> >>> I am still looking into this much close.
> >> it's not clear to me if you have only tested with the PWM and/or
> >> FCLK_DIV4 clocks. can you please describe what you have tested so far?
> >>
> > Sorry for delayed response.
> >
> > I had just looked into clk related to SD_EMMC_A/B/C,
> > with adding CLK_IGNORE/CRITICAL.
> > Also looked into clk_summary for eMMC and microSD card,
> > to identify the root cause, but I failed to move ahead.
> >
> >> for reference - my way of debugging this in the past was:
> >> 1. add some printks to clk_disable_unused_subtree (right after the
> >> clk_core_is_enabled check) to see which clocks are being disabled
> >> 2. add CLK_IGNORE_UNUSED or CLK_IS_CRITICAL to the clocks which are
> >> being disabled based on the information from step #1
> >> 3. (at some point I had a working kernel with lots of clocks with
> >> CLK_IGNORE_UNUSED/CLK_IS_CRITICAL)
> >> 4. start dropping the CLK_IGNORE_UNUSED/CLK_IS_CRITICAL flags again
> >> until you have traced it down to the clocks that are the actual issue
> >> (so far I always had only one clock which caused issues, but it may be
> >> multiple)
> >> 5. investigate (and/or ask on the mailing list, Amlogic developers are
> >> reading the mails here as well) for the few clocks from step #4
> >>
> >
> > Thanks for you valuable suggestion. I have your patch to debug this
> > [0]  https://patchwork.kernel.org/patch/9725921/mbox/
> >
> > So from the fist step I could identify that all the clk were getting closed
> > after some core cpu clk was failing. Here is the log.
> >
> > step1: [1] https://pastebin.com/p13F9HGG
> >
> > so I marked these clk as CLK_IGNORE_UNUSED and finally
> > I made it to boot using microSD card.
> >
> > After this just I converted these CLK to CLK_IS_CRITICAL
> > as mostly these are used the CPU clk for now.
> > Here is boot log successful for as of now.
> >
> > Finally: [2]  https://pastebin.com/qB6pMyGQ
> >
> > I know clk maintainer are against marking flags as *CLK_IS_CRITICAL*
> > But this is just the step to move ahead.
>
> Thanks for the extensive debug.
>
> >
> > Attach is my local clk and dts patch.Just for testing.
> > [3] clk_critical.patch
>
>
> Could you test with only the following changes:
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index ea4c791f106d..f49f5463363e 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
>                         &g12a_fclk_div2_div.hw
>                 },
>                 .num_parents = 1,
> +               .flags = CLK_IS_CRITICAL,
>         },
>  };
>
> @@ -672,7 +673,7 @@ static struct clk_regmap g12b_cpub_clk = {
>                         &g12a_sys_pll.hw
>                 },
>                 .num_parents = 2,
> -               .flags = CLK_SET_RATE_PARENT,
> +               .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>         },
>  };
>

Yes these changes work at my end,
I want to narrow down my changes, this looks pretty good.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
