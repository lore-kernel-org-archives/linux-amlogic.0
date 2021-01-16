Return-Path: <SRS0=uniX=GT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296CCC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Jan 2021 19:56:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCED022DBF
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Jan 2021 19:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCED022DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocBD6ofFjKj8ryg0tbk4byLs3llTNJgsTucXf/yzr3g=; b=oeA/9mivd6Li4gUIi7RsooIKI
	1kLV4rRTaKWLTj7KSY7RT3/yDtXb+TEqYYGFtxD0iY71s4eNUsGunePphjvZAHSYZ8u6ScjTyRdwT
	Gbm0LciE04FAUJgeDgACLHOOMJLcyyezCEpXK7XfKwFe5+M8nUETU3rbctBE333YRSxahzQEP4hOH
	YJvmqZY+chEufeEJ3olL4SYAswZ8UL4dwH0oCcxALrokhElM6fwqQNIJOk4XakhtdaTbc5yOw0YcS
	YM04ZdZCDeznH1dvO4Q8XS4N2ZDp0UfahDBOvoPuHzKx5ZbKxTS+qcbstg7b6jbVDr081no6/xcHt
	CMvvoVuDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0rgJ-0000u0-D9; Sat, 16 Jan 2021 19:56:19 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0rgG-0000s2-LE; Sat, 16 Jan 2021 19:56:17 +0000
Received: by mail-ej1-x634.google.com with SMTP id by1so11770600ejc.0;
 Sat, 16 Jan 2021 11:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zY/UqYiOJTtqfP4SAklIRYFyL3PGcAPq/2TpsQet41c=;
 b=ujqrxLMXcZQgISfIV0ZkcFTG30dvbam09aRWJ5mMUE9dgu7TwqA65qLfYgk+Edt6nL
 nNNbzJfhsOu4KCR5RVZJkl9b+X2uhFU8Eo7Vwx2S/BBuSIaMWYtAS2JQf9Ue4G8l3YjR
 Yy5RHW0wHQs1qWLsLzmZ6IelbsGsNLPpaZhPYsc6eETr+VvvyigPhd6oNK2s0QGLiLke
 ZQEFbWqFHQGAFa7Lq56H6LxGVDl+guix7nrVjyBEefv/QF579jOPfuzf/RfH9MqGV2AX
 VLt+3GO2TwDUbROBI0HyWTx3gQujORFaTnAdIzPRpbxx2yzRuLTLwhzuOucntOHpHyE0
 14vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zY/UqYiOJTtqfP4SAklIRYFyL3PGcAPq/2TpsQet41c=;
 b=VIpFCDpx4xvKQHQq2xrfDk+qYQ5t06F44GxQ9k+kx/8UQtrxH6DPaFJzrCracRQlQ6
 2X+ZN1SGuFfiNILh0ugU3bodaR3TWXsB9ApLVO2cYhQbrpd8hhOjUvp8LCVWqfWhpdlE
 PANxDLeJ55hLNwC63OKqVyJpDA2ndSr9dfnSYJSQt1k5iuZEKFQsHsvXXsfnA+jyLh+W
 cwhLhggSfyEzG/iLyO59LECSK10RdJoLIEwSVhzfL4qx2Tvyws8UaswVLnu2C6Z8RJN/
 WEnmFBXcfej9WW+zn2dYUahHs75hoF5akeYbRW7IbVNMyeb/QJdSen7m83p5f9x0efRp
 ztAw==
X-Gm-Message-State: AOAM5304fm4uiJpB53GdGBQUgz+pCOznmVvzvYCcK5rzyv1lbGTOPrJF
 3VeLF3oG0YSeTH+cOQih8GvMs0dmBLZCIowUgdqVYQyayl0=
X-Google-Smtp-Source: ABdhPJwR+ln0N6g5lDyOzVbAhFnaMKLLOgStUS6Bp5XVxUFc2+az84vxO26pGkhc5pjLZM74dGIf4LUs1br/Z0FYbwA=
X-Received: by 2002:a17:906:1b41:: with SMTP id
 p1mr10080257ejg.162.1610826973382; 
 Sat, 16 Jan 2021 11:56:13 -0800 (PST)
MIME-Version: 1.0
References: <3b5d2496-9be6-fdef-5e12-27def85aeb5b@gmx.de>
In-Reply-To: <3b5d2496-9be6-fdef-5e12-27def85aeb5b@gmx.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Jan 2021 20:56:02 +0100
Message-ID: <CAFBinCBpn3q5EUvLps=uvvB4QeUP3mx9Hfi+LZvuh1_KdoEbNA@mail.gmail.com>
Subject: Re: Delay recognizing USB-Drive with Kernel 5.9.12
To: thilo <thibau@gmx.de>
Content-Type: multipart/mixed; boundary="0000000000008cc91405b909e1a4"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_145616_803987_F8028446 
X-CRM114-Status: GOOD (  19.27  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--0000000000008cc91405b909e1a4
Content-Type: text/plain; charset="UTF-8"

Hello Thilo,

On Fri, Jan 15, 2021 at 4:28 PM thilo <thibau@gmx.de> wrote:
>
> Hello!
> I am new to linux, please excuse false statements :-)).
> I think there is a USB_PWR_EN-problem in the kernel (UAS-driver???)
to verify if USB_PWR_EN is really the cause of this problem you can
add the "regulator-always-on" property to
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi (and then
re-build the kernel)
see the attached patch (not tested as I don't have an Odroid-N2 myself)

[...]
> https://forum.armbian.com/topic/11741-boot-from-ssd-with-n2/page/3/
> with:
> 'None ... delay was necessary when using kernel 4.9.x so ... seems ...
> problem with the 5.x kernel series, presumably around the UAS driver ...'
that link mentions:
> Edit /boot/boot.ini and add "usb_storage.quirks=0bc2:3321:" to the linux command line parameters.
this could mean that we're not looking at a problem with the Odroid-N2
but something specific to the USB controller on this Seagate device
involving the people on the Linux USB mailing ist
(linux-usb@vger.kernel.org) is probably a good thing to do

> With Armbian-config, changed
> Kernel 5.9.12 to 4.9.247 (gladly very easy with that!)
> After that recognition of USB-SSD was fast.
The 4.9 kernel is probably using patches (and various hacks) from
Amlogic which may or may not be part of the newer upstream Linux
kernel versions (for example 5.9).
Sometimes differences can be spotted by comparing the "dmesg" (kernel
log) output of both kernels.


Best regards,
Martin

--0000000000008cc91405b909e1a4
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="meson-g12b-odroid-n2-usb-pwr-en-always-on.patch"
Content-Disposition: attachment; 
	filename="meson-g12b-odroid-n2-usb-pwr-en-always-on.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kk04iytp0>
X-Attachment-Id: f_kk04iytp0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9p
ZC1uMi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lk
LW4yLmR0c2kKaW5kZXggMzlhMDk2NjFjNWY2Li4xNjBjNzJjZDc2MmYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpCkBA
IC0xNzgsNiArMTc4LDcgQEAgdXNiX3B3cl9lbjogcmVndWxhdG9yLXVzYl9wd3JfZW4gewogCQkv
KiBDb25uZWN0ZWQgdG8gdGhlIG1pY3JvVVNCIHBvcnQgcG93ZXIgZW5hYmxlICovCiAJCWdwaW8g
PSA8JmdwaW8gR1BJT0hfNiBHUElPX0FDVElWRV9ISUdIPjsKIAkJZW5hYmxlLWFjdGl2ZS1oaWdo
OworCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwogCX07CiAKIAl2ZGRhb18xdjg6IHJlZ3VsYXRvci12
ZGRhb18xdjggewo=
--0000000000008cc91405b909e1a4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--0000000000008cc91405b909e1a4--

