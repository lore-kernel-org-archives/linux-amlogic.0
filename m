Return-Path: <SRS0=hlvN=RB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78331C4360F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Feb 2019 10:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482E120842
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Feb 2019 10:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDtjvmkf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIqMjvkn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482E120842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E58U928m3P+zLPkrANJgbUJJWnEqPfmCmo1u2L1sUOE=; b=PDtjvmkfjao+45
	mT110wTnzBEpkh2qEvt28QQRoCdEHY2EUhMFJy7yoCR0DbuUIeJZ4x7wDTe0G7VXgFxmBmSKa9gUM
	9Ux9RsHVvYwhBGmi1jeOF21QTWS0pfb2/kUmROV0LCgmn4wHZ3HTosP0fPWwmuuqFA7xpMGT6wPOR
	Fh+zrBF7owsxIOeBOx3n5Os2V/JU4K5GmILCviWHf5Sgx23CfW/pTpk4GWQzfzW8h9B8RtKfSk/dj
	Pu+cMlaXLGp9JDFCm4qjoNqpMWMOX82tTynY+uuRmrBsGWChop8HGS8Nn21cOIx9WLveyY2yO6pFJ
	1khishfImxzW9HJdGO1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyZwM-0001KK-7k; Tue, 26 Feb 2019 10:26:22 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyZwA-000132-D2
 for linux-amlogic@lists.infradead.org; Tue, 26 Feb 2019 10:26:17 +0000
Received: by mail-oi1-x241.google.com with SMTP id i8so9890097oib.10
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Feb 2019 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oJjL7HxLAjOQllg0rIsyxiks669+1ovi6EIa/BxP0b0=;
 b=aIqMjvkncG2M96gihKgyoJNsP8qxyAZ1gaUFRJeW9qrMaNocuYwObv4c43BmP8C5BS
 raxdQbfbhdxMGInDRz0OVFkbq2f9y01JRZi0dlGCINftH2kLvA6q9EanhGZbXDHzL/VS
 qAax2kNBR8o+SLxDWyGOCnxoIlL8HGoB1pkl8Gwb6LjHDgEUuyKk6on5CzUELSUUIRvu
 ILtMUZv2AeWzY17/Zxuxl4XeHlbs/PhBm3irI0cXrpv8JP/DDgDptQSNVFASM77W7lVr
 /pNrCNwDxXJ+nW5OUOcKlAtNtk9STJNJRRcOCb1aP2XztlzqlNbCq7z1N0peVZeoFXj7
 VkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJjL7HxLAjOQllg0rIsyxiks669+1ovi6EIa/BxP0b0=;
 b=WHa227wVlLagGrO9w1ifA6x1lBS8rBuKz3ITeax/z7fKdEZmBJ5Tw3ngCZPjM8QRfB
 LPf+9FRIJfcGCMWxeQY6jlT+SutVw/vvhP/InxplgXwFrYqY7LjyjxUc3tgOwlqV9N1/
 LnTFX5kTo4cDV2lS+cnq0LcSpnMcJVis5gxuuR5kSIIWEWksD/iwsGi2D5BwA7p1OvtM
 K32epNVtVg1mjay7wd+Ujou2ir4mGGGrj3dN9nSaBeGR2R0+9TusPshAk02EqU5kXDpX
 bZbdS4poJnY/JFh1O90bLOcLq2ptEsDWfGBh3lgVJaqv2EGiIf0NqPEbQBigNPoIi0KF
 6/Qw==
X-Gm-Message-State: AHQUAuYM7g2K0KK5bXfV6lmXVjLCM8akfufPisWbd2ktSpPeQ387rwWC
 X6MOBbz1W3s21Fd/jOpeHNMDoNvncKr0gSOiXac=
X-Google-Smtp-Source: AHgI3IY/lI5fc0qhpyTLpXBKBlWIdH31DFy7nGArRHH7QKL+d27OWRgvU5pZcJkoO651MjeLnbGVsaiNVkWX7HzzE6o=
X-Received: by 2002:aca:d4ce:: with SMTP id l197mr1915624oig.81.1551176769329; 
 Tue, 26 Feb 2019 02:26:09 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
 <CANAwSgR=PXtfMJWm_pOLYrV2imKpuw2FQOLT_J73tuu-q7WHww@mail.gmail.com>
In-Reply-To: <CANAwSgR=PXtfMJWm_pOLYrV2imKpuw2FQOLT_J73tuu-q7WHww@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 26 Feb 2019 15:55:56 +0530
Message-ID: <CANAwSgSw4dCQnHv0cMSxDs7S=83NUh5B6M8m_-ooFQKv02=v_g@mail.gmail.com>
Subject: Re: 32-bit Amlogic SoCs: avoid using Ethernet MAC addresses
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_022610_959148_FA2FD3E4 
X-CRM114-Status: GOOD (  23.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Mon, 25 Feb 2019 at 17:49, Anand Moon <linux.amoon@gmail.com> wrote:
>
> hi Martin,
>
> +Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> On Mon, 25 Feb 2019 at 02:25, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > I have seen Anand's your question in [0]:
> > > only issue is I have is the each time their is random MAC address so I
> > > get new IP from dhcp server.
> > > How can I avoid this. I have tried to enable eFuse driver but with no success.
> >
> > u-boot on the 64-bit SoCs can read the MAC address from the eFuse and
> > pass it (via the .dtb) to the kernel.
> > This requires an ethernet0 alias in the mainline .dts though, see [1]
> > for and example.
> >
> > I'm not sure if this also works with the older u-boot on the 32-bit SoCs.
> > if it doesn't then there's a nvmem-cells binding for all Ethernet
> > controllers: [2] (please note that the function implementing this
> > binding was recently renamed: [3])
> > as far as I can tell the stmmac driver doesn't support the nvmem-cells
> > based binding yet
> >
> > Anand, if you want to work on this: feel free to do so!
> > I have the SDHC MMC driver and a discussion about the power-domain
> > drivers on my TODO-list, so I'm pretty busy at the moment.
> >
> >
> > Regards
> > Martin
> >
>
> Thanks for your inputs :) 8)
>
> After enable CONFIG_MESON_MX_EFUSE and added the alias
>

As far as I can tell this nvmem consist of field.
 Board ID
 MAC address
 Serial Number
 UID

I feel efues value in nvmem are read with following offset just for testing.
but it also need some driver changes to read from secure memory
by enable CONFIG_MESON_SM and get the mac address to be set in ethernet driver.
> On Odroid C1+
> # hexdump /sys/devices/platform/soc/da000000.secbus/da000000.nvmem/meson8b-efuse0/nvmem
> 0000000 1143 0000 4b48 3143 3131 3232 3346 4537
> 0000010 3942 4432 0000 0000 0000 0000 0000 0000
> 0000020 0000 0000 0000 0000 0000 0000 0000 0000
> *
> 00001b0 0000 0000 1e00 1006 addc 0000 0000 0000    *00:1e:06:10:dc:ad*
> mac address from nvmem
> 00001c0 0000 0000 0000 4b48 3143 3133 3631 3131
> 00001d0 3732 3130 6237 6537 3165 6437 3034 3764
> 00001e0 02ad ec24 ff7f acfb d692 5300 0047 0000
> 00001f0 0000 0000 0000 aff6 a000 0000 1400 c100
> 0000200
>
arch/arm/boot/dts/meson8b.dtsi
@@ -360,6 +360,18 @@
        compatible = "amlogic,meson8b-efuse";
        clocks = <&clkc CLKID_EFUSE>;
        clock-names = "core";
+
+       board_sn: board-sn@0000000 {
+               reg = <0x0000000 0x10>;
+       };
+
+       eth_mac: eth-mac@00001b4 {
+               reg = <0x00001b4 0x6>;
+       };
+
+       board_sno: board-sno@00001c0 {
+               reg = <0x00001c0 0x30>;
+       };

This is what I am looking into.
If you have some input please share.

>
> Odroid C2:
> I could clearly observe the same.
>
> [root@archl-c2l alarm]# hexdump /sys/devices/platform/efuse/efuse0/nvmem
> 0000000 0000 0000 0000 0000 0000 0000 0000 0000
> 0000010 0000 0000 4b48 3243 3331 3532 4434 4346
> 0000020 4145 4146 0000 0000 0000 0000 0000 0000
> 0000030 0000 0000 1e00 3306 7a37 0000 0000 0000     *00:1e:06:33:37:7a*
> 0000040 0000 0000 0000 4b48 3243 3132 3631 3430
> 0000050 3834 3932 3631 3837 3937 3466 6233 6366
> 0000060 357c c7ec cc98 0f6d 65b7 92cf 000b 0a00
> 0000070 0000 0000 0000 0000 0000 0000 0000 0000
> 0000080 0014 0000 0000 0000 0000 0000 0000 0000
> 0000090 0000 0000 0000 0000 0000 0000 0000 0000
> *
       efuse: efuse {
                compatible = "amlogic,meson-gx-efuse",
"amlogic,meson-gxbb-efuse";
                #address-cells = <1>;
                #size-cells = <1>;
                read-only;

                sn: sn@14 {
                        reg = <0x14 0x10>;
                };

                eth_mac: eth_mac@34 {
                        reg = <0x34 0x10>;
                };

                bid: bid@46 {
                        reg = <0x46 0x30>;
                };
        };

> >
> > [0] http://lists.infradead.org/pipermail/linux-amlogic/2019-February/010464.html
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7c36209c46c4d162202b65eed2e66962ad8c3c1
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9217e566bdee4583d0a9ea4879c8f5e004886eac
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=afa64a72b862a7a9d04f8d07fba632eaf06b23f8
>
> Yes thanks for the inputs.
>
> I see c85efcc60a892210aa10688d5de1f997d5cad799 ("ARM: davinci:
> da830-evm: use cell nvmem lookup for mac address")
> I do not know what this changes will help get the mac address from nvmem region.
>
> If some body could share some inputs it will be better for me to debug.
>
> Best Regards
> -Anand

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
