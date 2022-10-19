Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDA8C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAGb+IhBdScgDd3Yf7bQTFoM832r38GNFBvoN3q4UkI=; b=MBPYG3g80AWDvm
	QX3N+btNAEgZiTX0FMkv+ZEE84uI2WfpAA+qxpIuumiTUtz8K9fgcwVSFeyF48T8repjovnWvQbsJ
	QxNKGUCYanIum47dvNSr4ntmv8JljPFZ6yn10Wzx9lN3OYqQbhCklZusmcCoU1kHgmoJR2zo8pgAV
	JijOOeCZjaeCx6gyEMslFe4BnKJcxLPii7QrvKgrPATZJelq7Aep2pp7Wlo2Yw7ZNy5PtDTuagzxC
	1FAI47ASRuqYFymOvqkeNt6F8bz5v8jdeEPpTnVYbQ1VykFTyNDJY6tYKPRykj61UPuQWXKFqzCDr
	YZOxAhJOjRXLh+sLbHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5hL-00HUSC-WB; Wed, 19 Oct 2022 09:49:16 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5hA-00HUI6-TE; Wed, 19 Oct 2022 09:49:06 +0000
Received: by mail-il1-x12a.google.com with SMTP id q18so8858729ils.12;
        Wed, 19 Oct 2022 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+gH18NMXsLrXdxE5QG5IXpfPb6gpkkgJRS++3hiNtc=;
        b=HaxP/TJIrzOP1fSvUBtD3PbhySohG28AX/Rs413Hoa9jyN0bFl0ofjcLNUcuORn9jw
         9kCoKP872VmdonnjqmLC3pVfnJD02GFt67Ovrq8sO2EtZ9Mcm38NW5K53/4E9Zrzvf/o
         61sVVStnYCeLmbxsI4HyAnP/JB7hg3JGFRi4+HP6Go6aJ6K5LPMIy/Z62caPMuen8Hf4
         NqsvpjZ4ajUcfZQtpwNDxGb9lQInom4CxJFx7KEIblBgLMQmljANIo4F0t8cuTyvk1jf
         0uenQDKuZxEKNKq9lxaOfL5t9OvVhJVuK5eB5xHfFGhxME3eVHeHJCwZwBIB9nPv+4Xx
         3b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+gH18NMXsLrXdxE5QG5IXpfPb6gpkkgJRS++3hiNtc=;
        b=JZUwTVWEZKGNE5mjWqBGQbO7i2mKLMWqaGuqtMNwSmMnf054kjBa2raXhfMEeDWWXM
         Hqgi8HHmsxty2mxU9rkphWC2D7mjptbnBn13rSk+0+TbviHR4IQBrQ/w8LLHGCW4p2R2
         rmcqZx1Odk/98okFsvd2U1E1JK0i3L9lOiQBOpt3ye2BKjZzDUIyJ0HHHZM5M9BJm8TU
         qqXST2n8+RHyOwkVPT+NXtvlNJx3xg1nliBD5uUzqVmF3M2QKeEqT0CkhMlHFKkmQ8AC
         TiiYxEFV9RwoNBmtIS88ccgDrE2MvKFnlwl0mhdL6c1/rQRTPB1mQs0Z7dwxjwOWvk0I
         Im7Q==
X-Gm-Message-State: ACrzQf1ReO2ar5Tr9VjBC5q9mhTuoJP2LBK0fICeOHwrCuQ8u/OwxGSq
	3wwfiwfqhpjZY+sprPuU1ZEviGD/nucuGyilbAE=
X-Google-Smtp-Source: AMsMyM6xArXqSugR0nN9BNdZbtJnY3QAB/sH1iDiacz99SmY/2A38tLRXBMdEsAFJKv7SCu695euSpu3Wg+bztX3Tao=
X-Received: by 2002:a92:da4a:0:b0:2f8:fa94:9dae with SMTP id
 p10-20020a92da4a000000b002f8fa949daemr5074198ilq.80.1666172904631; Wed, 19
 Oct 2022 02:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221018195122.8877-1-linux.amoon@gmail.com> <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
 <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
In-Reply-To: <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 19 Oct 2022 15:18:08 +0530
Message-ID: <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_024904_988265_AE3287D1 
X-CRM114-Status: GOOD (  24.98  )
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

Hi Martin,

On Wed, 19 Oct 2022 at 08:36, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Wed, 19 Oct 2022 at 02:46, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hello Anand,
> >
> > On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > Odroid N2/N2+ support active cooling via gpio-fan controller.
> > > Add fan controls and tip point for cpu and ddr thermal sensor
> > > on this boards.
> > In the schematics for board rev 0.6 [0] I cannot find any information
> > about a fan connector.
> > The schematics for board rev 0.3 [1] on the other hand document a PWM
> > based fan connector on page 16.
> > So now I am not sure whether your patch only applies to certain board
> > revisions, the schematics are incorrect, etc.
> >
> > Can you please provide some details about the fan connector on
> > Odroid-N2/N2+ and which hardware revisions are supported (and which
> > aren't) by your patch?
> >
> >
> Ok I got this wrong the schematics below there is pwm controller, not
> gpio controller
> GPIOAO.BIT10 (PWM)
> I will correct the patch sorry for the mistake I did not look more carefully.
>

As per the schematics GPIOAO_10 is controlled by PWMAO_D
But looking into the datasheet [0] I could not find the relevant
PWMAO_D pmw ip block to link the fan to the PWM controller.

[0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf

I could get the PWM node but is not working for me.

@@ -547,6 +588,14 @@ &pwm_ab {
        status = "okay";
 };

+&pwm_AO_ab {
+       pinctrl-1 = <&pwm_ao_d_10_pins>;
+       pinctrl-names = "default";
+       clocks = <&xtal>;
+       clock-names = "clkin0";
+       status = "okay";
+};
+

Thanks
-Anand


> > Thank you!
> > Martin
> >
> >
> > [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> > [1] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.3_20190117.pdf
> Thanks
> -Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
