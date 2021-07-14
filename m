Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5728C1B08C
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 00:22:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CAF613C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 00:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CAF613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2WH35ueP90evVev6qJIMzvLw74KYC4f79nohNWGduo=; b=c39pYS4qDrMqSLIozH4GNxwip8
	Tj0sYtHmEhFCKwrocJOu0rItaxYkCfLwCN75ibIJn/APQirWjE5SvbMVm3lxHyvgjCy98agdTzsWB
	YE6OmA2X9AoP9bxKt7VaeeIL0qa96MXYelsa1cATXiKL3rtwwSzkKI0sMD16/kvQX81KqRnogNZH0
	NhcS1JnAEvuPAphQ24IR3qD/4Nk53MlBUwqgXqlaN6jKvdnYiOtUYEWzBjJRyK3BodDjPsIBOiDMx
	2DDkX8MP+GHCxHXe6m1oxrEAJtThrJCPHVHE43YgaeaPpGG8nxmJrtJBkhU/1plbxWnTyQE6WLKU9
	jxWdYVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3p8f-00Gdkt-W8; Thu, 15 Jul 2021 00:22:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3o7d-00GCfp-Eh
 for linux-amlogic@lists.infradead.org; Wed, 14 Jul 2021 23:16:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id qb4so5945159ejc.11
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Jul 2021 16:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mrbFKckMMKNYGKvvcOWxG9c8XzlVvQUpQ/4fdIwwFzs=;
 b=A23ih7BXmZQ1TpIJ17SZjd4DSS/TT9b5L2N04RLkrxg0enJL/KsU44sd862Fvtrm8k
 8kKj3gJvauJo0I6VeRBCrou7HkAArdH70EfbYHxV8ql0rfS6zWlZ9C41KRWq9EPnpnza
 xvHurpX0FLi8zQZjompHAeGJBJWL5IVsXybmBwYi/CK90MuIvWL9HxAmF4G1ubL9CFaA
 Xlt7jLr/YQsERUbryC6Eq/0Jzs5LyVw7deSZB6MWuOcC2Y5KEVD8QfkthnVvGnQqM5R3
 ySOSxNa0IDw5lKGHfenccWaBQ29Hpx85uk84HmWRWYvBuCdWThVe2TukLmJBNok1m3ZJ
 dZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mrbFKckMMKNYGKvvcOWxG9c8XzlVvQUpQ/4fdIwwFzs=;
 b=X7UxkeM+Kp/emhXnZ4GR/f0quLXpstymGxhCFMUZtGxaO8UKROulfahKJZbSm5nPB8
 Q+Z1GidrcL67cBTyz2yQQqGYv8fzpUH4+Vh3KgdiAWgnwRqua17AAd7KhZLYFxz8/XGV
 0+mJ5BJ5kQFYNbghEhkjU8ygsGf92JqLoVx2psqSL60jK1ybUb/M/nSSDS1kHSvwXunu
 /9oO97L80glcmvPuE6xafpF9yq9GKo/6n8bjJBLQCCdGyEZswqgbvBgjMpSBJvkRo4Nh
 /UaVzaVDZmBDVU1UaWDuadKY371SNoJMbGFTMnMRqeUtFBrEFGom6pm0t8Z9oPgsGzmW
 c3ZQ==
X-Gm-Message-State: AOAM532CbHDk5Cbs0UWi/aeTNIHIil8zLul8B61GQaiX5D+W5U166sWT
 CYCwy5Efs+1kPNLjGlg/rW+kD9WjSWze6sa9SV8=
X-Google-Smtp-Source: ABdhPJxdZi3UwL5moLhXQLEuo08EYBumbkJsU+OsqFjxInAKI9LtqwE4vCin2np1L5SYjXv+AqxhIhZzonmHPcvaxZQ=
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr667189eje.527.1626304615708; 
 Wed, 14 Jul 2021 16:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
In-Reply-To: <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 15 Jul 2021 01:16:44 +0200
Message-ID: <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Content-Type: multipart/mixed; boundary="000000000000ea91c205c71d8c45"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_161657_582173_F29D47CA 
X-CRM114-Status: GOOD (  31.64  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--000000000000ea91c205c71d8c45
Content-Type: text/plain; charset="UTF-8"

Hi Minas,

On Wed, Jul 14, 2021 at 5:27 PM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
>
> Hi Martin,
>
> On 7/12/2021 3:35 PM, Martin Blumenstingl wrote:
> > Hi Minas,
> >
> > On Mon, Jul 12, 2021 at 8:42 AM Minas Harutyunyan
> > <Minas.Harutyunyan@synopsys.com> wrote:
> > [...]
> >>> 3. unplugging the Corsair Voyager and plugging in a USB 3.0 card
> >>> reader (nothing automatically happened), then running lsusb -vv and
> >>> lsusb -t
> >> Could you please set verbose debugging:
> >> CONFIG_USB_DWC2_VERBOSE=y
> >>
> >> and repeat test 3. There are couple of transaction errors and some EP
> >> stalled. I want to understand on which device/ep this happen.
> > sure, I attached the dmesg output (gzipped, since it's uncompressed
> > size is 1.5M) with CONFIG_USB_DWC2_VERBOSE=y
> > The lsusb -vv and lsusb -t outputs are the same so I did not attach them again.
> >
> >
> > Best regards,
> > Martin
> >
>
> Per our understanding this issue is because of power budget and
> autosuspend functionality.
Many thanks for doing this investigation!

> Autosuspend. Please review this patch: "usb: core: hub: Disable
> autosuspend for Cypress CY7C65632"
>
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=a7d8d1c7a7f73e780aa9ae74926ae5985b2f895f
>
> It's very similar to your case. Actually you already tested
> usbcore.autosuspend=-1 and it's helped you.
> Could you please develop same patch for your soldered hub and test it.
I found that drivers/usb/core/hub.c already has an entry for Genesys
Logic USB hubs.
It uses HUB_QUIRK_CHECK_PORT_AUTOSUSPEND instead of
HUB_QUIRK_DISABLE_AUTOSUSPEND though.
So I wrote a patch to change that (I attached it to this mail for
reference, I will submit it as a proper patch one I understand enough
about this).

With this patch applied all USB devices I have are auto-detected when
hot-plugged.

My doubt with this is that my desktop PC (using an ASUS B550-F
motherboard) comes with a few of these USB hubs soldered down as well
- and there the behavior is different.
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
   ID 1d6b:0002 Linux Foundation 2.0 root hub
   /sys/bus/usb/devices/usb1  /dev/bus/usb/001/001
   |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
       ID 05e3:0610 Genesys Logic, Inc. Hub
       /sys/bus/usb/devices/1-3  /dev/bus/usb/001/002
[...]
   |__ Port 7: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
       ID 05e3:0610 Genesys Logic, Inc. Hub
       /sys/bus/usb/devices/1-7  /dev/bus/usb/001/005

I plugged in the Corsair Voyager USB 3.0 drive which is not being
detected on my Odroid-C1+ and instantly this shows up in my kernel
log:
  usb 1-7.3: new high-speed USB device number 46 using xhci_hcd
  usb 1-7.3: New USB device found, idVendor=1b1c, idProduct=1a03,
bcdDevice= a.00
  usb 1-7.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 1-7.3: Product: Voyager 3.0
  usb 1-7.3: Manufacturer: Corsair

So I am wondering why it works there but not on my Odroid-C1, with the
(only known) difference being the host controller (xhci_hcd vs dwc2)
which is being used.

> Power budget. Old, cheap flash disks required about 200-300ma, but most
> of USB3 devices require 500ma. It could be serious issue to explore this
> devices with USB2 hubs. Even if this type of devices will successfully
> enumerated on EP0 without power problems, after set_interface when
> enabling multiple EP's (i.e. BULK IN and OUT for mass storage) power
> requirements should be increased which can violate USB2 hub port rules.
With your hint from above (thanks again!) I found commit
1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in
SMSC hub").
The message of that commit says: [...] Board is [...] not able to
detect the USB3.0 mass storage devices
Using HUB_QUIRK_DISABLE_AUTOSUSPEND makes all of my USB 3.0 devices
show up as well during hot-plug (no lsusb trickery needed).
So while there may be some power budget issue, I think the main
problem for me is the hub suspend.


Best regards,
Martin

--000000000000ea91c205c71d8c45
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="genesys-logic-use-disable-autosuspend-quirk.diff"
Content-Disposition: attachment; 
	filename="genesys-logic-use-disable-autosuspend-quirk.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kr439mzk0>
X-Attachment-Id: f_kr439mzk0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2h1
Yi5jCmluZGV4IGQxZWZjNzE0MTMzMy4uYWMzOWQxNWFmNmJhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9jb3JlL2h1Yi5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKQEAgLTU3MzAsNyAr
NTczMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBodWJfaWRfdGFibGVb
XSA9IHsKIAkJCXwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfQ0xBU1MsCiAgICAgICAuaWRWZW5k
b3IgPSBVU0JfVkVORE9SX0dFTkVTWVNfTE9HSUMsCiAgICAgICAuYkludGVyZmFjZUNsYXNzID0g
VVNCX0NMQVNTX0hVQiwKLSAgICAgIC5kcml2ZXJfaW5mbyA9IEhVQl9RVUlSS19DSEVDS19QT1JU
X0FVVE9TVVNQRU5EfSwKKyAgICAgIC5kcml2ZXJfaW5mbyA9IEhVQl9RVUlSS19ESVNBQkxFX0FV
VE9TVVNQRU5EfSwKICAgICB7IC5tYXRjaF9mbGFncyA9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVW
X0NMQVNTLAogICAgICAgLmJEZXZpY2VDbGFzcyA9IFVTQl9DTEFTU19IVUJ9LAogICAgIHsgLm1h
dGNoX2ZsYWdzID0gVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRfQ0xBU1MsCg==
--000000000000ea91c205c71d8c45
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--000000000000ea91c205c71d8c45--

