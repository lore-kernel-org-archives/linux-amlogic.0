Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895D0C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqdieEMeZAmUO94SZBXAzDfyh90JGPkwuVBqSy+30dA=; b=ZEmjfuj9z0H4U/
	LRo0fObGs9EJ4tiSdeFXABNv0q2MQN24XzZz2VTU3qR+6t7ow6Hxi5WMSfjoxH+3uPFepvHQDSy6+
	L+gmZiwlXBJhIRBpVJZFUj8HB55QMBQB1Dg1SeAgTNTe630LN/1g4XWy3UhycZ6CHcy83JzGg3uRE
	O2pGwbXSVbgm8uF5jsv+wVi5dhiwv6x+P+eRd5AlwWTPz6s2sVopllyC35vHQMW9H9Ta3HGZ48GgZ
	6HJrqlXBiDx2/ekKbs8aKKChipED8Q1qzdK7efr17VtHc3HqF7ykFyZKB3T9Y0pCDwaR/DwzNQMIY
	Pclf74XYYt5ugidf3Gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olCh4-004WWo-9N; Wed, 19 Oct 2022 17:17:26 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olCgr-004WSx-DX; Wed, 19 Oct 2022 17:17:15 +0000
Received: by mail-io1-xd33.google.com with SMTP id n73so15031442iod.13;
        Wed, 19 Oct 2022 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AlUj/QFNV2i9ZGSPJzeC1G6oHQCEl/zD5yljY4F0lQc=;
        b=ZXMyREUu4xIZz3ws/x/a9lf4cPrx/BaKTr/gdL5w0Ks5jzmnGGlQSLpcXbkCnsDmsj
         0d/k/iCDgt1zBII42EAwqtvXA7gFiETu6evdk6a8vXmnPNfUW4JofkfzlT00Ve9Hpu96
         pw8JV1yY4+VlCSR0no8zmlMbPISuQ5P5yye5lIxr7iazG/MulLc1dxiG9xWwMh2+G3ri
         kgSyOXY9hGj5/ANGR/g2EThUpzl/1vxsKDy7IXpKBY24nkZTu4OpSwO+3hy1QlVihv3/
         ulzf38jMGwmGbb9FHvQI52Gy6QPYQ612GH1mZk9UapDc3IwjC53wNm2rMvRshBEhA+PC
         +LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlUj/QFNV2i9ZGSPJzeC1G6oHQCEl/zD5yljY4F0lQc=;
        b=qK3V0Mau6az6mvgILMcBMSztRiuoVDLBIPiCWR3t/ii5UpBcaOFVo/9F9nHbXlEW2q
         z4sjJIwOrfO3cL+gKTnEw5ZI0OYqRh3EoaEh1XqOJzKYBxlOPxgw6gW9zwlsApV34F6x
         D5QyKvRpksQ4KXythZvz5JWLK39MtJA60eBiiHAo359yGxx7wBS3CXETFYwDAOZ0cZ7h
         HpkaPmz5I+lEG5qi1pMheRytGvHS1IoD+N6UlIJiX6tdSsSs+7kSNdbfk3n4FLrGJTqy
         6qYiAZy6gMlomtSJqLwHxDTEUfF+dFBhKEo0IaNfmeZ1TfT0/H41fGu1xksUtKCbKTnd
         NViQ==
X-Gm-Message-State: ACrzQf2+s9UbYEiU2tc3uhqGAnwqjkvf71Ipo7WZUo6BG0mUc/4sWEwe
	pNaNlrw+IkxOH9e1BwmvDttssAjyRYE9aHQtVs8=
X-Google-Smtp-Source: AMsMyM45u5EqgmWIvzSP0ManQlUWYAgNb/OwLrfi0zMCsU3sYDTwOpX5k0YBdlf2jwW9lP9jS+bMvGiCCWkvy96GhDM=
X-Received: by 2002:a02:cf33:0:b0:363:ed19:3a27 with SMTP id
 s19-20020a02cf33000000b00363ed193a27mr7303430jar.179.1666199831400; Wed, 19
 Oct 2022 10:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221018195122.8877-1-linux.amoon@gmail.com> <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
 <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
 <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com> <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org>
In-Reply-To: <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 19 Oct 2022 22:46:55 +0530
Message-ID: <CANAwSgQhWrzeRcpQSSAmfp+i3966dUQdtCLbcWwifQk=1ce=og@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
To: neil.armstrong@linaro.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_101713_521456_A3EA292A 
X-CRM114-Status: GOOD (  25.74  )
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

Hi Neil

On Wed, 19 Oct 2022 at 16:39, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi Anand,
>
> On 19/10/2022 11:48, Anand Moon wrote:
> > Hi Martin,
> >
> > On Wed, 19 Oct 2022 at 08:36, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On Wed, 19 Oct 2022 at 02:46, Martin Blumenstingl
> >> <martin.blumenstingl@googlemail.com> wrote:
> >>>
> >>> Hello Anand,
> >>>
> >>> On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >>>>
> >>>> Odroid N2/N2+ support active cooling via gpio-fan controller.
> >>>> Add fan controls and tip point for cpu and ddr thermal sensor
> >>>> on this boards.
> >>> In the schematics for board rev 0.6 [0] I cannot find any information
> >>> about a fan connector.
> >>> The schematics for board rev 0.3 [1] on the other hand document a PWM
> >>> based fan connector on page 16.
> >>> So now I am not sure whether your patch only applies to certain board
> >>> revisions, the schematics are incorrect, etc.
> >>>
> >>> Can you please provide some details about the fan connector on
> >>> Odroid-N2/N2+ and which hardware revisions are supported (and which
> >>> aren't) by your patch?
> >>>
> >>>
> >> Ok I got this wrong the schematics below there is pwm controller, not
> >> gpio controller
> >> GPIOAO.BIT10 (PWM)
> >> I will correct the patch sorry for the mistake I did not look more carefully.
> >>
> >
> > As per the schematics GPIOAO_10 is controlled by PWMAO_D
> > But looking into the datasheet [0] I could not find the relevant
> > PWMAO_D pmw ip block to link the fan to the PWM controller.
> >
> > [0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf
> >
> > I could get the PWM node but is not working for me.
> >
> > @@ -547,6 +588,14 @@ &pwm_ab {
> >          status = "okay";
> >   };
> >
> > +&pwm_AO_ab {
>
> &pwm_AO_cd not _ab
>
No it has a conflict with CPU_B (vddcpu_b) PWM

I have tried linking all the PWM with pwm-fan but it's not working.

# sudo cat /sys/kernel/debug/pwm
platform/ffd1b000.pwm, 2 PWM devices
 pwm-0   (regulator-vddcpu-a  ): requested enabled period: 1250 ns
duty: 0 ns polarity: normal
 pwm-1   ((null)              ): period: 0 ns duty: 0 ns polarity: normal

platform/ff807000.pwm, 2 PWM devices
 pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
 pwm-1   (pwm-fan             ): requested period: 1250 ns duty: 0 ns
polarity: normal

platform/ff802000.pwm, 2 PWM devices
 pwm-0   ((null)              ): period: 0 ns duty: 0 ns polarity: normal
 pwm-1   (regulator-vddcpu-b  ): requested enabled period: 1250 ns
duty: 88 ns polarity: normal

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
