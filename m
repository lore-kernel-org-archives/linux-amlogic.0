Return-Path: <SRS0=jntJ=RA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F03DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Feb 2019 12:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0002120842
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Feb 2019 12:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O05epS5I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P06x8vnZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0002120842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDADLfGT6sRmFPAjvYGqfjGHlKBbWGyOc3Df6NwiFXU=; b=O05epS5ICcu1Yu
	wsfA/GYBIhhEMF6QQ04AgqkGuEgvJ0KbP7uCDpWn8UfYJl48vPOx5a68/F7PuTBHovqXVjJJkqJzz
	kI37Ee7WX81qvvBOH/szYL99c0JmkZrIhlBcLOueKEXMDzN48q2Xzm1p0ibuwWLtgVz4ukQZ7VKaN
	PFctbDGu08VSCN/SwbuTOFrRpPl7eGlEOb7ToF5+yYBDSBZyc9ljpxojKC85Ku/0wSrJv4uhZfoLF
	FFzJ17sKg7yG04ORqPbRuk7NykTXOErHuWa6qQHEPFigrHrjMEVB6HzsuSOtwJ1fGijbBLJin7U47
	+QnJz66n50Ou9KrNz5TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyFEI-0004Yl-7H; Mon, 25 Feb 2019 12:19:30 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyFEE-0004Y7-OR
 for linux-amlogic@lists.infradead.org; Mon, 25 Feb 2019 12:19:28 +0000
Received: by mail-ot1-x341.google.com with SMTP id 32so7578460ota.12
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Feb 2019 04:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HZf5tffB5ujV3ge8VRkE9IURILIcisenO5mHrzKTmn4=;
 b=P06x8vnZHdFP8eNkecCfQpzz+78iCKOBS7P97bV3CqaAT/eCDqoB1CxBBZvjDNlRPR
 5IevhVWF0SJwF6HotUFFptyoYTu15CiX9cRcvX/yXNCaIwfRH10RVOSr4wm58Q1kk3mI
 1EsBwAlBV2HhbNzX2kQ3oU25huCwP/QQ/yj4+jVp+DPkQb09QQ7O+MVfrUla4CDjvrLU
 ZrwCD7cIerFTvlqqk4uY+LvbqTukUdbhgYGlCnpybpxMaAGZs+AjvpIezE+Sjpk/ytUP
 GruiF575i5E/SYNV7CnOuGgg1YlkLeWfUMDsVCN2ZcFUux/4JPTZS6mmAupFdtMvtWE6
 efGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HZf5tffB5ujV3ge8VRkE9IURILIcisenO5mHrzKTmn4=;
 b=BeKdO6o5U8DLjQOZ4vaNc8ak7+NO5OznmjXXwUayh24zKQcV9X6shuurFdclW/bpvH
 qRAX7kMWtne5Cdad8V36q/r/+ER2q/ohY7vbLga3WS0BQtChrn6zCvnTRnci7NkDgxVQ
 n2P10oDLqUj7JSeX+UAFEE7l+VCdlkO+5tetZFkSIjxM9Ihb7Q2qZvKtEVVkmPhoOdjN
 OVSsfu3nyVafIMuWODz2LxH7N8EMovbpJ6wI0H0N7uBjeGTxWr9SwMxw47rm/XqBrybv
 tqhyRid86KGzEbRKjDmngTgvYiU3iamysRBfvHndLrqdzYQaseMDr0e7iARuWuFd5MLW
 s76Q==
X-Gm-Message-State: AHQUAuYl6oiWyWOGMiE8jjOfaAyOM/8J7SwfzuSpsTtcxE6TMpkpPj/D
 mSvun3LdP797mP/TxMs6dHd5YbWo/DNdwkAWPTc=
X-Google-Smtp-Source: AHgI3IbKZEDjH9Tp85W86Y/1FGkfJKp0zk0ufzgXyWBH7Sg8Neq8yahKTMR5z+qBBbINeGi4IjX56698upXQuOaisE0=
X-Received: by 2002:a05:6830:d0:: with SMTP id
 x16mr12007784oto.102.1551097164764; 
 Mon, 25 Feb 2019 04:19:24 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
In-Reply-To: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 25 Feb 2019 17:49:08 +0530
Message-ID: <CANAwSgR=PXtfMJWm_pOLYrV2imKpuw2FQOLT_J73tuu-q7WHww@mail.gmail.com>
Subject: Re: 32-bit Amlogic SoCs: avoid using Ethernet MAC addresses
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_041926_820229_48A2F4F2 
X-CRM114-Status: GOOD (  18.85  )
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

hi Martin,

+Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Mon, 25 Feb 2019 at 02:25, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> I have seen Anand's your question in [0]:
> > only issue is I have is the each time their is random MAC address so I
> > get new IP from dhcp server.
> > How can I avoid this. I have tried to enable eFuse driver but with no success.
>
> u-boot on the 64-bit SoCs can read the MAC address from the eFuse and
> pass it (via the .dtb) to the kernel.
> This requires an ethernet0 alias in the mainline .dts though, see [1]
> for and example.
>
> I'm not sure if this also works with the older u-boot on the 32-bit SoCs.
> if it doesn't then there's a nvmem-cells binding for all Ethernet
> controllers: [2] (please note that the function implementing this
> binding was recently renamed: [3])
> as far as I can tell the stmmac driver doesn't support the nvmem-cells
> based binding yet
>
> Anand, if you want to work on this: feel free to do so!
> I have the SDHC MMC driver and a discussion about the power-domain
> drivers on my TODO-list, so I'm pretty busy at the moment.
>
>
> Regards
> Martin
>

Thanks for your inputs :) 8)

After enable CONFIG_MESON_MX_EFUSE and added the alias

On Odroid C1+
# hexdump /sys/devices/platform/soc/da000000.secbus/da000000.nvmem/meson8b-efuse0/nvmem
0000000 1143 0000 4b48 3143 3131 3232 3346 4537
0000010 3942 4432 0000 0000 0000 0000 0000 0000
0000020 0000 0000 0000 0000 0000 0000 0000 0000
*
00001b0 0000 0000 1e00 1006 addc 0000 0000 0000    *00:1e:06:10:dc:ad*
mac address from nvmem
00001c0 0000 0000 0000 4b48 3143 3133 3631 3131
00001d0 3732 3130 6237 6537 3165 6437 3034 3764
00001e0 02ad ec24 ff7f acfb d692 5300 0047 0000
00001f0 0000 0000 0000 aff6 a000 0000 1400 c100
0000200

as per my understating on 3.10.x the mac address is also set in the u-boot env.

odroidc#printenv ethaddr
ethaddr=00:1e:06:10:dc:ad

Which is equal to above nvmem setting above.

* But sill I am getting new mac address on every reboot. :p *

Odroid C2:
I could clearly observe the same.

[root@archl-c2l alarm]# hexdump /sys/devices/platform/efuse/efuse0/nvmem
0000000 0000 0000 0000 0000 0000 0000 0000 0000
0000010 0000 0000 4b48 3243 3331 3532 4434 4346
0000020 4145 4146 0000 0000 0000 0000 0000 0000
0000030 0000 0000 1e00 3306 7a37 0000 0000 0000     *00:1e:06:33:37:7a*
0000040 0000 0000 0000 4b48 3243 3132 3631 3430
0000050 3834 3932 3631 3837 3937 3466 6233 6366
0000060 357c c7ec cc98 0f6d 65b7 92cf 000b 0a00
0000070 0000 0000 0000 0000 0000 0000 0000 0000
0000080 0014 0000 0000 0000 0000 0000 0000 0000
0000090 0000 0000 0000 0000 0000 0000 0000 0000
*
00000c0
[root@archl-c2l alarm]# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.140  netmask 255.255.255.0  broadcast 10.0.0.255
        inet6 2002:ac10:e303:e472:21e:6ff:fe33:377a  prefixlen 64
scopeid 0x0<global>
        inet6 fe80::21e:6ff:fe33:377a  prefixlen 64  scopeid 0x20<link>
        ether 00:1e:06:33:37:7a  txqueuelen 1000  (Ethernet)
        RX packets 70485  bytes 4390622 (4.1 MiB)
        RX errors 0  dropped 28  overruns 0  frame 0
        TX packets 6159  bytes 766939 (748.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 18

How can we read the mac address from given offset in nvmem.
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2019-February/010464.html
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7c36209c46c4d162202b65eed2e66962ad8c3c1
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9217e566bdee4583d0a9ea4879c8f5e004886eac
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=afa64a72b862a7a9d04f8d07fba632eaf06b23f8

Yes thanks for the inputs.

I see c85efcc60a892210aa10688d5de1f997d5cad799 ("ARM: davinci:
da830-evm: use cell nvmem lookup for mac address")
I do not know what this changes will help get the mac address from nvmem region.

If some body could share some inputs it will be better for me to debug.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
