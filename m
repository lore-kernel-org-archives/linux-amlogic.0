Return-Path: <SRS0=apJy=LZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C460FC11F67
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BCD6140B
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jul 2021 21:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BCD6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWxlsa8AjPIZtLMmX4Sf1PfsdwkvyWSg7Xny7OJ5mzk=; b=E4CcEh1ozaR9/x
	ph4KDBEtEpD3hCl6sOoNzNET6FsiwqFZawH6bjH9BqbYrSee+km56YDrpOYXCRp/sC1+LpvRZYrww
	m/aVqx+pdJ41K+T9v/8k04r198KdZ04/u4YgOxbv67xZ+bBXb/UuB8w7IuFRdmT5BGZKV9O5ThYUA
	87YQRV7eH9Pl6hyUTdh4wa1EWOSM+7+vOUMAZvhS14fY1yXMHbKnvNwkRVbYDZltA6cV3SDYX7y7r
	2icRoNOTItJm3Cb6ti7GCXGdf0XVoFr1Lyh+f6BlYd/MQ1O/Q+hS5OAEW33Z9H6VEGLAcjhxysaPC
	e/KVZeISIbKsXtYUwKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz45O-001C1M-3A; Thu, 01 Jul 2021 21:19:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz45I-001C0s-LZ
 for linux-amlogic@lists.infradead.org; Thu, 01 Jul 2021 21:19:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gn32so12791985ejc.2
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Jul 2021 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0cXgfhaS3T+6AeXrGti3lI1yzJ85a5zFdUA+jB/hiwU=;
 b=rEam05Z3TTFpU9SVYzbXP6UGWx86WhLZN47CXYFMmMVkwIsrp58nHOAeECMVVscPrX
 FGt+hLjt6JVPKHKAUfaKdu+CweI7eoBbwsDog/l7ysjLEo7rntkwtQP/OQeYyOVWkhgv
 hORmp1+wlgHaOfIK7H+JDbi4MPeQPPPW8SspbxTmEUJcBV2TjVGiOn557KLox6TPEzda
 MvBZJScUP21/uoR4sdpoU4nza7k42Yvmr8CmxR1ncpdooTuyzDZeju36YcrrWdGCEuiM
 yLH8vFdUndtbv+ufvSnUUMs+IeLNm3pmZHFoYsgJaN7SNwNPyuzb6gVcBp2xU8TGc42A
 murQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0cXgfhaS3T+6AeXrGti3lI1yzJ85a5zFdUA+jB/hiwU=;
 b=XNq82iCgLEMQbn7udYDGFzRwee9J4BU2KaLSwscefzZjvqq3es4aSZ1+X1dGiPzthH
 +S06ttpEERM7qq6ZRJu8V6ao6v/MfNxcGjCteLQ80ZgkIxT7kxuzznnKqRlgOH9beQQC
 GfioOVJ/VPLW+5OJLDQaIuSbNRYKuG2hzHgT7yk7R7IBkn4HJBD4FwdIGBDcfAcgP3FC
 pQg+x1F98jG4qr29oe2GWRJoKY6nmoV6RerH9hh5NSOERLc1T7SolPQuUxFu18OBJTjb
 gWk3lsGCW46TI/s301880+4kQ/SqWn6EsMUamEt4yCLDtnveBCj2O1VvH621IB01RiXJ
 BklA==
X-Gm-Message-State: AOAM5334WoufsyRm+5o6jQd+voPEtsSRmp9pV4aX6RKGgLiRR7vWWRl9
 ImMvE3qDazVgbq8OJQi0ru7hQEa9pjiMPfu0VfY=
X-Google-Smtp-Source: ABdhPJw60MN4UpI84csCY2nCthSkx+KwRFteOnlczML7u0gH2Ta/2aIxzy2w1zr6zd6Lpg0rlRxBM7r94hhFxSWj/GM=
X-Received: by 2002:a17:907:d28:: with SMTP id
 gn40mr1973997ejc.471.1625174334943; 
 Thu, 01 Jul 2021 14:18:54 -0700 (PDT)
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
In-Reply-To: <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Jul 2021 23:18:44 +0200
Message-ID: <CAFBinCC0nfrnQGmrXJ4FDTuy3RGX_FC8egjVaxhKaOSi9q+xzA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To: Anand Moon <linux.amoon@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Minas Harutyunyan <hminas@synopsys.com>, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_141856_769029_9CE66692 
X-CRM114-Status: GOOD (  19.49  )
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

On Thu, Jul 1, 2021 at 12:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> I have been trying some reorder code changes with PHY some new DTS
> changes both on C1+ and C2.
> with my changes I got false positve results.
>
> So in my debug investigation, it seems that USB reset is not working.
> I am attaching my latest code changes so that you could verify at your end.
> If we drop the  phy_meson8b_usb2_reset(phy) all the USB PHY get initialized.
> Note:  phy core does not call the .reset callback function on its own
>
> I have tried crazy ideas with reset API and new approaches, but it seems to fail
> and also used the reset-name features, but with no luck at my end.
> I wil try to followup on the suggestion shared in this email thread.
with your patch USB is not working for me at all on my Odroid-C1+.
kernel log extract:
...
[    5.089251] phy phy-c1108800.phy.0: phy poweron failed --> -22
[    5.096456] dwc2: probe of c9040000.usb failed with error -22
[    5.102182] dwc2 c90c0000.usb: supply vusb_d not found, using dummy regulator
[    5.108781] dwc2 c90c0000.usb: supply vusb_a not found, using dummy regulator
[    5.117140] phy phy-c1108820.phy.1: Anand you are calling USB reset1
[    5.121408] phy phy-c1108820.phy.1: Anand you are calling USB reset2
[    5.131197] dwc2 c90c0000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    5.137163] dwc2: probe of c90c0000.usb failed with error -16

and then:
# lsusb
#

With your patch applied (on top of v5.13) the dwc2 driver does not
probe anymore.
I suggest we move the discussion about your patch elsewhere so we can
focus on getting USB devices detected (again) with the help of Minas
and Alan.

> I am attaching my usbmon output on Odroid C2.
Can you please specifically state the testing steps you have used to
obtain that output?
This is important so people who are involved in this discussion don't
get confused about the results.

> On some other note on USB HUB reset. I recollect following series (it
> like *mmc_pwrseq*)
> [0] https://lore.kernel.org/linux-devicetree/1474342607-27512-1-git-send-email-peter.chen@nxp.com/
this is being replaced by "usb: misc: Add onboard_usb_hub driver"
which is currently at version 13: [1]


Best regards,
Martin


[1] https://marc.info/?l=linux-usb&m=162447367404217&w=2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
