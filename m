Return-Path: <SRS0=kh+7=FX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5714C4361B
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 13:58:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE922336F
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 13:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE922336F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aKA2UL5z1XFZyjRkhGpWQ9J4LZY4szluxxBiy5zWhNs=; b=xGZvCjBWG3ifXQ/xD+AFWuyq0
	7W996FSFbv4OgLzzHHrhEOK2BdH309cp7vI+nAO9SJJLnZKqQ/Si4s6y3wxyf3m4SLON8xDYvyPtJ
	Rdcb0qi7kjwsWh/NSusfQpHnVUw3gAsa7+abX7JydZIax/4EheG46ZcqUavp9zcJNG12EXtrRVVN9
	fV2Ma4a1o5j4e6wu9MS7VMEufwZ4etrJz7DAVrlaZ+REYy8IUDzyjJTO3a5PosVkd6U0ewkK+Eroh
	LvC+vbBUvbvyU3jGN/NyxbBp97vAIwOg64SeuuhrzfL/TE+OfCsoMKMEDOsPPOOX20oo+FPruGxdg
	clntNbGPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqcl3-00063W-CG; Sat, 19 Dec 2020 13:58:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqcl0-00062s-FQ
 for linux-amlogic@lists.infradead.org; Sat, 19 Dec 2020 13:58:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id c7so5232591edv.6
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Dec 2020 05:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D0Wj3hTLe7QvwO5Tkm/aGsAdbvIGY4dIAULLk39tR4k=;
 b=fqL7dlK4vwrfsFGdZV5K6lmeJpmgtiCLdE1mlj5hOdo12X7uwGUSvuE1A7S1+/NIGP
 LhYtnd3PjQ93dFQ33Msv1X50EwoDmr+I5I+POHgNRg1Tj92wqjOZ8xBdQgRbth4TxKfm
 1oO8DJyYct0puFfSZOw2ltuyJEvj7gKa/+wf/xe/LAAFUHcYMaDfXecst8UGpSoH7HqP
 nAjyzY3LY1fU/+KWgwAFXxQsBSmba/ywtkCB4UG7C+7R6mdQIqBdNsPu3a7ac9KK0qv9
 cI+O1DOnULKlpknCljIrK8fPoHbSA+45Hnt1Q3uIY9oh6FoDiqe6fa96kCBsqZry112k
 ncuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D0Wj3hTLe7QvwO5Tkm/aGsAdbvIGY4dIAULLk39tR4k=;
 b=d/lhE9L5Lrkjeca4f1/TZksr54PrELnZn/mm4kFlH88ehQd/NxO1x7kGwa4tTajdB5
 O7i7uyN6AAjlVic+yMssC3KmSfQZPDYfzp04sSZ0aFD7aCL4q/XP/aVqOCerTjVF1ymY
 HKn+B1ln5cx1T9aB1t1tGrvLCaVcT39p4ej2B4TD8/d6t22wv7BVxgWp/DLainE0i/7F
 rW4UO0lah3eZYOKmzwA6YlHQMMDejnbhcpCmrKrfmV8nZMOcRG5bjnXox2CHEVQe7hVv
 HneO3H463S3AyMmhTXDMsQy1cV72Rbmfg0mMegLIEVbXDstXkTRJe9J0xoCQoHXK0EHB
 UVkA==
X-Gm-Message-State: AOAM530w/7LmX0qXxGR8XF0zeo2CdMYosc3+U6DyVGk5xGfXe7CSYaGi
 kIh7L4te2xC3kgRrWtbRkWJnVThj8kf/soiDcCo=
X-Google-Smtp-Source: ABdhPJztvt0P+xChN/VLyZRdWtke4WHwOdVWZGlr4XMRdihgED3261aNUG3zchAd0H6LIFd1+oXNVINzf6OCAWJskQw=
X-Received: by 2002:a05:6402:3074:: with SMTP id
 bs20mr8817906edb.365.1608386328627; 
 Sat, 19 Dec 2020 05:58:48 -0800 (PST)
MIME-Version: 1.0
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
 <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
 <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
In-Reply-To: <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Dec 2020 14:58:37 +0100
Message-ID: <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Otto Meier <gf435@gmx.net>, Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_085850_601469_87F43D7D 
X-CRM114-Status: GOOD (  19.49  )
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
Cc: linux-amlogic@lists.infradead.org, u-boot-amlogic@groups.io,
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Otto,

On Mon, Dec 14, 2020 at 8:34 PM Otto Meier <gf435@gmx.net> wrote:
>
> Hi Martin,
>
> Am 13.12.20 um 19:46 schrieb Martin Blumenstingl:
> > Hi Otto,
> >
> > On Mon, Dec 7, 2020 at 1:43 PM Otto Meier <gf435@gmx.net> wrote:
> > [...]
> >>>> So with the latest u-boot and the kernel from https://github.com/chewitt/linux/tree/amlogic-5.10.y
> >>>> commit 725fc8df7898102f9031ba2075f763884ffa3ee8 everything is working again.
> >>>> USB does hotplugging as expected.
> >>> So, this fixes USB under Linux ?? It's not clear
> > if you have time it would be great if you could figure out which of
> > the patches from Christian's tree fixes USB hotplugging for you.
> > Or is it fixed in Linux 5.10-rcX even without any patches?
> >
> The new mainline kernel 5.10.0 from Linus, without any other patches
> does detect USB hotpluging,
> when using u-boot DMI: Hardkernel Co., Ltd. ODROID-C2/ODROID-C2, BIOS
> 2021.01-rc3-00039-gec79f5ce22-dirty 12/08/2020
> and the following u-boot patch:
[...]
> When i use the last unpatched emmc bootable u-boot 2020.04 the kernel
> boots, but usb hotplugging
> does not work.
Thank you for testing this!

> Hope this describes my findings. If i can help further, please give me a
> note.
to be honest: I am a bit lost here. I don't understand how the BOOT_*
pins interfere with USB.
I also don't have any Odroid-C2 board myself so I cannot do any
experiments myself.
Neil, please let me know if you have any idea here.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
