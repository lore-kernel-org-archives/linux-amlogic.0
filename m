Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AFFC07E96
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 15:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCD8610A7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 15:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCD8610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilmQhMjqqkOKIiuxiH+vG5OoWQUKvj8WZsnmDqom2qA=; b=d+sQmZcdHVNWfe
	xmXT5KhyxgDJOyFm9ByGPtbDIl4SvzZoZU+NvuJTznbLFoEqUdN1lqNYEBRP6DFE/5i33aJZ3mnha
	CHtOYyTCuqyX73j6lvDzjHyeHDIe9zr2bv93Lf3wRWpyvGxDGPJ8KPKtw+r1DPWn5n7WSCoLAzuZn
	skyY8jd703L5VhjDIs3iNqWv5PB1al6/u0HlmoqgSYwbJ6Za/F8RwNV7c2HXOIvx4iH0B3s8P0u34
	Zmm8sogDBXcfxE8OL8fQ2forV4JHbTPANVqPcNAoMFAc+tfI4nPCMuy7LiEE9qHN/ZgEvCI8Oj1lW
	SCYFSfL/NUFS3WlT9FMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3KY4-00AoWi-ME; Tue, 13 Jul 2021 15:42:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3KXZ-00AoEy-C3
 for linux-amlogic@lists.infradead.org; Tue, 13 Jul 2021 15:41:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id go30so15213230ejc.8
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Jul 2021 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LuaJ5GLllG494QxL0EIKGjPAtlb/EVRVBUN3vZg7VvI=;
 b=oDMnob9OubSOKZnnM7j7cGbwuYdGekL6cp4+zcYA7czgRdqTFM7s+0NYNsoyUVMn96
 gRRMIxqidoarM+a2FfdLjKNoGQCtF07ysIqI+x4Nmr/BrGgyU3Qdj8bOkiqsAfA/J11i
 g9Amxl+yd5D2foVkNKjQ39bdXdIO4FkluyIrHZsI+0iC/M+c1lxxBmy0hLw9ItFVBpLm
 orEjU72KfsQV05HZRrOAGGAhxlM/03kOVc1JS1UUJMSNSJNqOzghFfYnhK+3ZhNtVphi
 M4RL5dlg2agwhPEApubUldMCB3/Tzx/oMKRbO3tRLbdIPpPGWIbW6Oddq5QCLlYoaGpj
 P1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LuaJ5GLllG494QxL0EIKGjPAtlb/EVRVBUN3vZg7VvI=;
 b=Ybc7rIbC2in5Jf4sIoIuFHLK2M+MnIQwkmKjqJOzgQb52WOX7v7Qlhgasu/8BDYjxW
 JxtzkA948P4MDAbNzZQ+CCFpKQuBe7t0vuU/xQuQqAs6+28Kvr4ZCFNU29MvjxqnHbgb
 nF0Je95Ks7yPP7rNUuMy2LXjVHeCYeLakBL82SvQATFmJyDujS47SG791elMZbn1JO1H
 WTzO3ZPpNbrtXOFwgADzwACCvo0r4VIvkYkGkJCprMO2fAD5ZvzN3GgRHIaSkwNYx1eL
 /TQ5P7UnzZTgl1OPMlJkoOKNFv/MWw15xNAlpbcc7g1WikuSc6s23hohIFjanGwRKL0G
 z9vg==
X-Gm-Message-State: AOAM532nmfDkW0wIvSukdEyO3cfiGm3tJWqKJfrZlkDTLJNsOu1FCt0U
 9SYqHqYw3r9C36+X2pvnr95MwKk/81mFgv0S0XI=
X-Google-Smtp-Source: ABdhPJypCo7QU++xfY28ypYnSRkDO5ih4AexNdD2LwlDr5e1++4aaurYCcNV1TOkJXT0NB5PgBaceJalvRfLJEVwrwM=
X-Received: by 2002:a17:907:d28:: with SMTP id
 gn40mr6461110ejc.471.1626190903480; 
 Tue, 13 Jul 2021 08:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <20210630003556.GA718579@rowland.harvard.edu>
 <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
 <CAFBinCC0nfrnQGmrXJ4FDTuy3RGX_FC8egjVaxhKaOSi9q+xzA@mail.gmail.com>
 <CANAwSgRPvTyMaQHWFeXcS-r5jdigSbcP0QvaTyJ1GFfUyPpqAg@mail.gmail.com>
 <CAFBinCCFhK9Nx9ub5h3JctfXCnbrwL7XPV5dvPXWcvWqupnHkA@mail.gmail.com>
 <CANAwSgQH6HgFQ+xz15AoKhGUF9G18P-cHOVL2FvS_34FrW=bzQ@mail.gmail.com>
In-Reply-To: <CANAwSgQH6HgFQ+xz15AoKhGUF9G18P-cHOVL2FvS_34FrW=bzQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 13 Jul 2021 17:41:32 +0200
Message-ID: <CAFBinCB_8aFLj2e6aHskbZXmTpe457Z+j9OHo9A5-oAeg9E5MQ@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To: Anand Moon <linux.amoon@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Minas Harutyunyan <hminas@synopsys.com>, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_084145_534719_4EAC4785 
X-CRM114-Status: GOOD (  23.30  )
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

Hi Anand,

On Tue, Jul 13, 2021 at 8:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > If you're interested you can look at one of my earlier emails [0] (not
> > sure if you were Cc'ed then) where I was running the cat command as
> > suggested by Alan three times (each time plugging in different devices
> > at different times) and got three different outputs.
> >
>
> Sorry for the late reply, I have submitted small code changes for this.
> [0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=514467
>
> Yes, I have observed the passing usbcore.autosuspend=-1
> with command line parameter help resolve the hotplug issue with USB
> storage device.
Thanks for reporting back.
I just tried your code changes from the series you mentioned above and
it doesn't seem to have any impact on the issue which is described in
this whole thread. Can you please elaborate which change you have seen
on the issue described here (hotplug not working) with the changes
from your series applied?

> Yes it seems that USB hub is entering into LPM
>
> dwc3 has the following quick property to handle these cases.
Minas' last statement was [1]:
"There are couple of transaction errors and some EP stalled. I want to
understand on which device/ep this happen."
I don't know whether transaction errors and EP stalls are related to
LPM, so I cannot comment on this any further.

[...]
> # usbmon
> Earlier my aim was to capture the USB PHY event via usbmon and wireshark.
> so that we could verify the handshake.
> I am attaching the Wireshark capture log using the following command.
I still don't understand how you are coming to the results which you
have attached to your email:
- the dmesg output starts more than 30 minutes after boot
- it's not clear if you ran any "lsusb -vv" command at some point
- which devices were plugged in during boot?
- ...

From my experience at work (where I also do software development and
support) two things are important when reporting and investigating
problems:
- being as precise as possible to make sure everyone is one the same page
- at the same time focusing on relevant parts

Alan has helped us out in the beginning of this investigation so Matt
and I have been providing him with all the information he needed.
Now Minas is the dwc2 expert helping us solve this issue which is why
I am waiting for further instructions from him on how to proceed.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com/
[1] http://lists.infradead.org/pipermail/linux-amlogic/2021-July/010341.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2021-July/010343.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
