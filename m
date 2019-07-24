Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90289C7618B
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 09:00:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B18217D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 09:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fM1n6PX7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR8u7qKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B18217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJ1HseS2C7Cz8X4alANZCC/mb8JgBXb/imf7mojTENI=; b=fM1n6PX78HEy64
	y7hvkBvnv89v6kzTfEvzrFrDUOVdxYY7fURde755TuGsJzu1PfarQIhlYKyYmUCO2eqnC+joS5ePb
	Jn6V02+EEFBWRxMYWgUUrk4ItLHE5TI3e0Qtu5N/Zp7m7ah4M47ejZnlshQt46eH0EqdNYD4acRzt
	OgBBOIEiRE+UWgAjuOGwCMaqwNxqJZM3xIlzi72nQ6Z27NKSL1+D/1Zve8WKyxORqK3nqE0yHOG8I
	NN+Gyy5l1LqMh+K1UcBWfIOBbRV4U6cHpnku8LPLhoMktrf+A/dNm9vL8zzkafnxj/7Jqx9nzYT2a
	pW3ZEScrUkiwHa28VPrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqD8D-00028i-Fc; Wed, 24 Jul 2019 09:00:17 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqD8A-00027s-If; Wed, 24 Jul 2019 09:00:16 +0000
Received: by mail-io1-xd41.google.com with SMTP id o9so88037417iom.3;
 Wed, 24 Jul 2019 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sm/JL+hP+mCoNP+dMciXgNOdiOkppRY7NGRE3pt521E=;
 b=eR8u7qKKHElGFqz/S6XlFGERvnoHQyXbSrTscLhR4cXF5w67QuhmRrX3UBFX+2PzYp
 zue+YvNmVD2e4pHn5m1z278tfusrxNx27FkFVZjnNv4+xPDIqrczT82QqP4+AJ0tp4t4
 wrk962dTC+xYxkgBh4emaRtesxwwsWWarrwPzp+5uP+Zm7wzbX+ZlQMBGU9ujuw6fUGg
 LOKnbLSgSx72h5Y1eoMoJkoamvlLadgaYwaW/UMU/K2pI/+5Rb5D/h0aTjScFVDT/KMA
 oJ1xPeNK/mv6TVaOHTBjrgrd8O6d0fK6U3FJcPi5z8XkRvsVu8bkh28mIH0agUks5NFG
 e6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sm/JL+hP+mCoNP+dMciXgNOdiOkppRY7NGRE3pt521E=;
 b=E0O6d+y4hm3d4q+5Tp70JnBpZlc7oMpf1DLfVcqw+umP8/5uUaimZCepU7HBYLllNR
 NzAKxHiEI0BUANPolO3HlE7hyl8AhlsvFw1KWZjRcisNkKbTtGlV6yUb33MtfihSxxhM
 Le3tfHNIJo1XG4CXw9zXNW5QtFybEJUjTYDr8dPiT0hQjOz2BG781WJynQJHItEoHcxx
 v3SYXrP28KU9X7g5byA/QfFtoA3tf3zFo4vD7mJRZn9hZybbTfasHQo+nzHCSR3k5F+e
 2S8UIDY7f46eJvENvsOMIapVnP8TQJdz3VrA8DuQYMqkFMU4qnAHL2wQwfEqtauhkubH
 Gmow==
X-Gm-Message-State: APjAAAXaf2UqSWmbeg8qxIZHmaTTMN9m/0t3yJGEZgOBJ+uRUfprm7Hb
 OG1F8QzFZwhSl02mIUiEG7Y0z6+cjJpAz73pG7Y=
X-Google-Smtp-Source: APXvYqxYMsXuU0YWjK636od6j6zGxjRLMjCkycvx2+POeKyX+OTzKJCK8ADuJ1tC1FER+CWj81OCoIiFMT/gTgh51pU=
X-Received: by 2002:a5e:9b05:: with SMTP id j5mr12610997iok.75.1563958812549; 
 Wed, 24 Jul 2019 02:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190719192954.26481-1-xruppen@gmail.com>
 <eadcf7ef-4aad-fa4f-3b1b-a5238f394b1e@baylibre.com>
 <CANAwSgTbvQO5qum1K3q8+J=WO4yLjadnZSZYf_AAhbf+CJm92Q@mail.gmail.com>
 <cdb986e9-e905-8001-630a-cf3e3f8c5369@baylibre.com>
In-Reply-To: <cdb986e9-e905-8001-630a-cf3e3f8c5369@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 24 Jul 2019 14:30:01 +0530
Message-ID: <CANAwSgSwDQdT60N87GrOWNDP0_ZvKnYsKg5QPVP0jJvQ8rKzpg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: odroid-n2: keep SD card regulator
 always on
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_020014_647372_649A3A04 
X-CRM114-Status: GOOD (  22.05  )
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

Hi Neil,

On Wed, 24 Jul 2019 at 12:19, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> On 24/07/2019 07:30, Anand Moon wrote:
> > Hi All,
> >
> > On Mon, 22 Jul 2019 at 12:51, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 19/07/2019 21:29, Xavier Ruppen wrote:
> >>> When powering off the Odroid N2, the tflash_vdd regulator is
> >>> automatically turned off by the kernel. This is a problem
> >>> when issuing the "reboot" command while using an SD card.
> >>> The boot ROM does not power this regulator back on, blocking
> >>> the reboot process at the boot ROM stage, preventing the
> >>> SD card from being detected.
> >>>
> >>> Adding the "regulator-always-on" property fixes the problem.
> >>>
> >>> Signed-off-by: Xavier Ruppen <xruppen@gmail.com>
> >>> ---
> >>>
> >>> Here is what the boot ROM output looks like without this patch:
> >>>
> >>>     [root@alarm ~]# reboot
> >>>     [...]
> >>>     [   24.275860] shutdown[1]: All loop devices detached.
> >>>     [   24.278864] shutdown[1]: Detaching DM devices.
> >>>     [   24.287105] kvm: exiting hardware virtualization
> >>>     [   24.318776] reboot: Restarting system
> >>>     bl31 reboot reason: 0xd
> >>>     bl31 reboot reason: 0x0
> >>>     system cmd  1.
> >>>     G12B:BL:6e7c85:7898ac;FEAT:E0F83180:2000;POC:F;RCY:0;
> >>>     EMMC:800;NAND:81;SD?:0;SD:400;USB:8;LOOP:1;EMMC:800;
> >>>     NAND:81;SD?:0;SD:400;USB:8;LOOP:2;EMMC:800;NAND:81;
> >>>     SD?:0;SD:400;USB:8;LOOP:3; [...]
> >>>
> >>> Other people can be seen having this problem on the odroid
> >>> forum [1].
> >>>
> >>> The cause of the problem was found by Martin Blumenstingl
> >>> on #linux-amlogic. We may want to add his Suggested-by tag
> >>> if he agrees.
> >>>
> >>> [1] https://forum.odroid.com/viewtopic.php?f=176&t=33993
> >>>
> >>>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>> index 81780ffcc7f0..4e916e1f71f7 100644
> >>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>> @@ -53,6 +53,7 @@
> >>>
> >>>               gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
> >>>               enable-active-high;
> >>> +             regulator-always-on;
> >>>       };
> >>>
> >>>       tf_io: gpio-regulator-tf_io {
> >>>
> >>
> >> Surely solves the situation, thanks !
> >>
> >> please add a comment on top of "regulator-always-on" to explain why we always enable it,
> >> note we should always enable it in case of watchdog reboot or other uncontrolled reset,
> >> this regulator must never be disabled.
> >>
> >> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> >>
> >> Thanks,
> >> Neil
> >>
> >
> > I am afraid this did not fix the issue I was also facing with
> > Archlinux on Odroid N2 using mainline u-boot.
>
> Seems to be a separate issue, could we start a separate thread with all your
> setup (branch, git SHAa, configs, board setup, ...) for this ?
>
> Thanks,
> Neil
>

Ok sorry for the noise.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
