Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD37DC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDIwDf8DLRUT4d/7hBFWDG5xEvKvQEDTTuPucMfo1o4=; b=df3Fb2z8YZUIiD
	Hb6PW04WRvdzs+xTWDT/6yXRJcrSwHmaGu1icaxjTKGiPN6saLWBc19WRl3a9w8tvrzo06WldMLTT
	yF2uY8n1Pm0SnVrnieGwJm15zvFqGI+3bpOFlHf2I/PSFf9paHiS/5OtDEuFy5O0/Ta/9hbjchraV
	Nn3hc4TTFuNObnMjbZf9bJFxOtnc+uWu9JmotBs0FuwZBByeX5fTVpXKE37MgUqxKRbGv8Zty8m5d
	6QLw4M9p6Gu/wMPMj6HtTrkmu/ZAQOnI2Ij0lzJyE5YtiqZA1dEY4OT1qC7ZnYnuvmgY299cpEHId
	TEDqkcx5cxFG6RxXm/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcic-006cqg-O9; Sun, 24 Jul 2022 14:36:30 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFciY-006cnh-Up; Sun, 24 Jul 2022 14:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658673374; bh=0jHGeQ/fsGCQDcfez4v19ebiJgzsG9N9syrolZ1GLTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rek5rdissJ0DQ1ioi3jKZvBjw2I2Mc5+MNsrJnnSK2HWHVBEEnvj57tPCqDuUneRF
	 t00qkZEPj7SgGIOufWHjI+c0DTJOKU0oleI8YzcuycU2fn/Vfx0tNpmP1NT2/GnueX
	 webAlxa8iTZjkEpDZ5K8G8Q5V5gnCst/HE1zzN70=
Received: from TS-551 ([101.229.115.105])
	by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
	id 90BB322D; Sun, 24 Jul 2022 22:36:11 +0800
X-QQ-mid: xmsmtpt1658673371ti491kkw5
Message-ID: <tencent_EB43BF01D785F7587D7BBF8D86F4CA047406@qq.com>
X-QQ-XMAILINFO: M6lqjKFHeg8FaHGkPlEt3K0r8cvPU6vQTOLEiqjmTVTLkGC1SOCsAsFeZuBGa2
	 rHtLzphtRU3i+fHBU79XgwuEDFzYbCWq4cGaE+oHcBBQ0ScaWOkzrdslDZQnBqObkyr4NvV0/epb
	 F2EbB8CMNOboRY9kBgsEaGdyhFEaI+7TlijKC8w3Lwpg7OC3GjU8/+/gXyW9SqgAJywYvTshAtnO
	 S07rlLf/tI7qc5U1rwO4zvjOmFeJIxyuTUPqm3z3DNC/nd7fOc1cp7ovtZdbNcpok5YuRKB2WPHM
	 Dkrs0oeDB+lQ/2DogfTd0kLAhkljg3Rkrp5BFpCNvkWnIPHNBugHkZH6I7EjcUT9wtJI0b+oAdas
	 ttrB6AzehsJtXRSeyBIrpZMw9YRIg+e8PvnN9RaXZW4RILfNmdnc1SxH9WeKD2I8z3yy+pteIMsx
	 OQD3jKEIe8//1dFouyupX3PpFfhpDzkgoQ56b+Mwz2freAKQX3g1be7gT59kAWcanRtikT2OHELr
	 QYIecQAN+DgZK0MRZtSl+Fe1n2TK3JXspkQYlgMZvb9S1p71mVPBqrUYRjst20QdcD3YRzkVFkZ3
	 A+tMh4e88ETQ7GKrxuenPXh+NGDVwAr22YcExwGj9fdm8n016n0piUvjYoYH+8SoidCWlz5AvdWU
	 IGQyoQL8nEFliSjZrfqYuaEfZuq62sj4Mi0tZdHcwbesN0erL0TdS8vWOiXAq1OH92ofkddJtSnG
	 C0/oOqy5vFL2bbV+JADJKS8/PmMBBfITAdMGp9+dWLJKuC4LvwMQYKZ1M8QxR6/mUco7PtqMQ7wi
	 Mij4bquivPWktlJm2aEsOj2/gY18JwVnWZCXCHP0rPD9CWg3uDaQjIKaDbJo2tj23VAHzEOlBlut
	 2+KbNtTH5gO+LzhV3b7191DCPFtidxfQ==
Date: Sun, 24 Jul 2022 22:36:11 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Sean Young <sean@mess.org>
Cc: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] rc/keymap: add keymap for MagicBox M16S
X-OQ-MSGID: <Yt1Y2ykN5O3Qmkkc@TS-551>
References: <20220723155502.127404-1-zhangn1985@qq.com>
 <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
 <Yt1MvOQtRgxYFm7F@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yt1MvOQtRgxYFm7F@gofer.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_073627_320530_ED3A8C1E 
X-CRM114-Status: GOOD (  25.19  )
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

Hi Sean

thank you for review.

I sent v4 before see your review.



On Sun, Jul 24, 2022 at 02:44:28PM +0100, Sean Young wrote:
> On Sat, Jul 23, 2022 at 11:55:02PM +0800, Zhang Ning wrote:
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > ---
> >  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   |  4 ++
> >  drivers/media/rc/keymaps/Makefile             |  1 +
> >  drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
> >  include/media/rc-map.h                        |  1 +
> >  4 files changed, 61 insertions(+)
> >  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > index 464de73d2f0f..69e72687ac9c 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> > @@ -34,3 +34,7 @@ &ethmac {
> >  &sdio_pwrseq {
> >  	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
> >  };
> > +
> > +&ir {
> > +        linux,rc-map-name = "rc-magicbox";
> > +};
> 
> As has been pointed out already, this should go a in a different patch.
already do it in v4
> 
> > diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> > index f513ff5caf4e..02c1c2150f03 100644
> > --- a/drivers/media/rc/keymaps/Makefile
> > +++ b/drivers/media/rc/keymaps/Makefile
> > @@ -71,6 +71,7 @@ obj-$(CONFIG_RC_MAP) += \
> >  			rc-kworld-plus-tv-analog.o \
> >  			rc-leadtek-y04g0051.o \
> >  			rc-lme2510.o \
> > +			rc-magicbox.o \
> >  			rc-manli.o \
> >  			rc-mecool-kiii-pro.o \
> >  			rc-mecool-kii-pro.o \
> > diff --git a/drivers/media/rc/keymaps/rc-magicbox.c b/drivers/media/rc/keymaps/rc-magicbox.c
> > new file mode 100644
> > index 000000000000..7dd3afd8a42c
> > --- /dev/null
> > +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright (C) 2022 Zhang Ning <zhangn1985@qq.com>
> > +
> > +/*
> > + * Keytable for the MagicBox M16S remote control
> > + */
> > +
> > +#include <media/rc-map.h>
> > +#include <linux/module.h>
> > +
> > +
> > +static struct rc_map_table magicbox[] = {
> > +	{ 40791, KEY_POWER },
> > +	{ 40842, KEY_MUTE }, // M
> 
> This comment needs elaboration. What does M mean?
this is answered in v4. a key labeled with "M" as Magic key in vendor
OS.
> 
> > +	{ 40771, KEY_UP },
> > +	{ 40714, KEY_DOWN },
> > +	{ 40710, KEY_LEFT },
> > +	{ 40718, KEY_RIGHT },
> > +	{ 40706, KEY_OK },
> > +
> > +	{ 40775, KEY_HOME },
> > +	{ 40783, KEY_BACK },
> > +	{ 40726, KEY_MENU },
> > +
> > +	{ 40959, KEY_VOLUMEDOWN },
> > +	{ 40797, KEY_VOLUMEUP },
> 
> Please use hex values here, they make much more sense for nec protocol.
in v4.
> 
> > +
> 
> Remove blank line.
will do it in v5.
> 
> > +};
> > +
> > +static struct rc_map_list magicbox_map = {
> > +	.map = {
> > +		.scan     = magicbox,
> > +		.size     = ARRAY_SIZE(magicbox),
> > +		.rc_proto = RC_PROTO_NEC,
> > +		.name     = RC_MAP_MAGICBOX,
> > +	}
> > +};
> > +
> > +static int __init init_rc_map_magicbox(void)
> > +{
> > +	return rc_map_register(&magicbox_map);
> > +}
> > +
> > +static void __exit exit_rc_map_magicbox(void)
> > +{
> > +	rc_map_unregister(&magicbox_map);
> > +}
> > +
> > +module_init(init_rc_map_magicbox)
> > +module_exit(exit_rc_map_magicbox)
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Zhang Ning <zhangn1985@qq.com>");
> > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > index 793b54342dff..656217b8e91b 100644
> > --- a/include/media/rc-map.h
> > +++ b/include/media/rc-map.h
> > @@ -277,6 +277,7 @@ struct rc_map *rc_map_get(const char *name);
> >  #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
> >  #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
> >  #define RC_MAP_LME2510                   "rc-lme2510"
> > +#define RC_MAP_MAGICBOX                  "rc-magicbox"
> >  #define RC_MAP_MANLI                     "rc-manli"
> >  #define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
> >  #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"
> 
> You should update Documentation/devicetree/bindings/media/rc.yaml as well.
alread do it in v4.
> 
> Thanks,
> 
> Sean

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
