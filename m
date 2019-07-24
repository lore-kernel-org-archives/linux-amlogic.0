Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C54C7618B
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 05:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5F321BF6
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 05:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lmZIhEsJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdIyqFjV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5F321BF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wd8SAcHqAOonGlX3hggBQU9j3Ec+W/RQIqih6CLNbbQ=; b=lmZIhEsJDzhiCu
	Z9SRd3YFZcbj3VDvuR2c8Tc1kNUQDKJynvc7SWM4NYzi6iGyX4oHPYRl3EEcDX7/quu9/cJFfNDeh
	+yb27pILRot2eHMbSyrFyt5KS/bYGvnmnX/wHlysoQtBRYzWo+fvFk2Dmq4VmsOfcZU7T6yhCIwks
	ZRBPXK9CS9QrI9BOfiXCYhoxoNUzykOrq7ewwpiJdajKfnuE1BbJKQJ18eOE/ZZ41EHsWYDdGYDeA
	Fhj4fiCMGJjUV3kBZN+jZIOh9iCYyObDX1H4r6CwN7jUk5YwYFHnj9fuDgoVpDQ8jEgkL+Dm+NH/e
	lmuLxi+wXwunKECDxyWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hq9rN-00066k-7N; Wed, 24 Jul 2019 05:30:41 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hq9rJ-00065s-Iu; Wed, 24 Jul 2019 05:30:39 +0000
Received: by mail-io1-xd41.google.com with SMTP id f4so86949272ioh.6;
 Tue, 23 Jul 2019 22:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kubOS61ez6ZomGEn8kQ+ad+KQnTEWtQ4GxGH5GmoMk=;
 b=cdIyqFjVDDrRF63bqALekSTT5OjyL7XIsnWLFVmj1XgcCDUuppfwlcsMYgTi+8cUNe
 2AFeG45rNURQesHoh8zmhMEgz9+efNw+DU+XEiHzLPB/ASUJ/UyPMQfU/ve61X1O1T5M
 QzAwooVVgpUOqW4WDAVtM+NJyaxn3dIkF7Y0O5RdEcbBoM9lEM31hlOVkgzxN28XB3kN
 iVN90fEsT3jf4sCkpaXPfzhIHN76xYi1eXK3NLnX/101IolJqjh93cSz3iA87f6yFX+v
 J13WKHWALKhQronpNU/aCyKIhzbUurA5zh0ktb4Y/WuyMvZe8uoFYKhg28UVQxTiYxdb
 ngpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kubOS61ez6ZomGEn8kQ+ad+KQnTEWtQ4GxGH5GmoMk=;
 b=hNV69p2OzTs4FSlXWQZWUMxFGXhjpdXzesaUD04WI4RLnJcqT8vK9FzA0R+EAZWg45
 tRdtzREF5NI398Klj0mcwAD8WkJal9XDL1PrEyFblz8zf/fJZAREag6AvrjSbhQajleM
 sdHR6ODCiAudSGPsOcmL10ig/3M5rMIRkQpo+7ZsJhJsfKjt9eLwKpbEfZztjEo9MFqv
 tvwamTex6XPecSBMyZQbxATi+56KDtnVldqziFdGCsg/FZbHESIQ/pMP+0C7KRHJ87Mc
 AlatStEfsIKxCwWMz/K7nbtomFa/jPNsbEcK4jLq1cHpZivqNUf/i2VAtVLFrRHRLFOk
 xDmQ==
X-Gm-Message-State: APjAAAWK5TCkDWPhsFhQdeY4CcWle/UOWnrKYxMMsUuxZFFj22UREEC8
 V0Sly28RX9JsUNdz9KvxzYbuA/tvtwyiOZQ+By4=
X-Google-Smtp-Source: APXvYqzOM9+wcNZhy/7rxqS/I3B8uoFqXE/bGQHHKdVI/O7zXCpXs+r5B5GEYEWmWdZl52xHHfvY7lLlJ3P4XXjQYrE=
X-Received: by 2002:a5d:9f4a:: with SMTP id u10mr47611856iot.243.1563946236324; 
 Tue, 23 Jul 2019 22:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190719192954.26481-1-xruppen@gmail.com>
 <eadcf7ef-4aad-fa4f-3b1b-a5238f394b1e@baylibre.com>
In-Reply-To: <eadcf7ef-4aad-fa4f-3b1b-a5238f394b1e@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 24 Jul 2019 11:00:26 +0530
Message-ID: <CANAwSgTbvQO5qum1K3q8+J=WO4yLjadnZSZYf_AAhbf+CJm92Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: odroid-n2: keep SD card regulator
 always on
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190723_223037_625479_094C9EB5 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Xavier Ruppen <xruppen@gmail.com>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi All,

On Mon, 22 Jul 2019 at 12:51, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 19/07/2019 21:29, Xavier Ruppen wrote:
> > When powering off the Odroid N2, the tflash_vdd regulator is
> > automatically turned off by the kernel. This is a problem
> > when issuing the "reboot" command while using an SD card.
> > The boot ROM does not power this regulator back on, blocking
> > the reboot process at the boot ROM stage, preventing the
> > SD card from being detected.
> >
> > Adding the "regulator-always-on" property fixes the problem.
> >
> > Signed-off-by: Xavier Ruppen <xruppen@gmail.com>
> > ---
> >
> > Here is what the boot ROM output looks like without this patch:
> >
> >     [root@alarm ~]# reboot
> >     [...]
> >     [   24.275860] shutdown[1]: All loop devices detached.
> >     [   24.278864] shutdown[1]: Detaching DM devices.
> >     [   24.287105] kvm: exiting hardware virtualization
> >     [   24.318776] reboot: Restarting system
> >     bl31 reboot reason: 0xd
> >     bl31 reboot reason: 0x0
> >     system cmd  1.
> >     G12B:BL:6e7c85:7898ac;FEAT:E0F83180:2000;POC:F;RCY:0;
> >     EMMC:800;NAND:81;SD?:0;SD:400;USB:8;LOOP:1;EMMC:800;
> >     NAND:81;SD?:0;SD:400;USB:8;LOOP:2;EMMC:800;NAND:81;
> >     SD?:0;SD:400;USB:8;LOOP:3; [...]
> >
> > Other people can be seen having this problem on the odroid
> > forum [1].
> >
> > The cause of the problem was found by Martin Blumenstingl
> > on #linux-amlogic. We may want to add his Suggested-by tag
> > if he agrees.
> >
> > [1] https://forum.odroid.com/viewtopic.php?f=176&t=33993
> >
> >  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 81780ffcc7f0..4e916e1f71f7 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -53,6 +53,7 @@
> >
> >               gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> > +             regulator-always-on;
> >       };
> >
> >       tf_io: gpio-regulator-tf_io {
> >
>
> Surely solves the situation, thanks !
>
> please add a comment on top of "regulator-always-on" to explain why we always enable it,
> note we should always enable it in case of watchdog reboot or other uncontrolled reset,
> this regulator must never be disabled.
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Thanks,
> Neil
>

I am afraid this did not fix the issue I was also facing with
Archlinux on Odroid N2 using mainline u-boot.
Here is the log of at my end using latest mainline u-boot with Neil's patches.

[0] https://pastebin.com/HNmeY5uF

Well this issue also persist with eMMC not getting detected after reboot
If I try to change the dts to fix the sdcard.

I am checking this should we enable regulator-boot-on option but still no luck.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
