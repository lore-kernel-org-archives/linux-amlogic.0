Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C2FC43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE+A78ELA0y1gFEbfgoEH9wE3czkYdAL+wJ3HyBAbug=; b=K8UPnwdAZ6R4Bp
	pCmk/YCaKEc4IZ+CXaNYTY7PXKpATBBMcI/7S7W1ci70/4j86bEKFY4fnv1OzW5ZbH/485IV1Jv8i
	tQD6eubWkOPO8dA/7rch21rhV2N4lOZwVhy4/DM0A++v01FqVSdx355Jo/qSSvb409IrOO6U348kh
	YNz+D0GeuF6jy0tTmZnNlnfzHYgGxIi7oxfVe1dMOMo+zBguGp3pBBzW+mB4hGbB81EYcJRhYsrJr
	fKDSXJhayejMSQrCh0BzAGjSpde2D+RQh/EUlI4KsY3QHY27+dskHiUiyHB4buo61NJY7jUZMMp5S
	slQHrwdAO2BVSUJreofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGJm-00AZzL-CR; Tue, 26 Jul 2022 08:53:30 +0000
Received: from out203-205-251-82.mail.qq.com ([203.205.251.82])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGJj-00AZpf-4V
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 08:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658825603; bh=UPsAvLKjIA0iTd3YHFTa44thv5OaxZeMADEORRmrp8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KEfZz25CElLRvnBafNZtmsahNwFN+5J1eGPKTBgLQAspfkPPQ796FOLADTyWoSRme
	 rnRa5UpPLOyy9ZmNXisUHkhCZThhLb5UaNFz2DUK5OP2c9Z9C23jcm+WpYjU/7JvYi
	 0rQDtZBFL0DWIbv9JZ5uh+ZujY8+UzETvmI9WP2A=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrszb7.qq.com (NewEsmtp) with SMTP
	id D53004B4; Tue, 26 Jul 2022 16:53:19 +0800
X-QQ-mid: xmsmtpt1658825599t2g61z63d
Message-ID: <tencent_065AA44D26CC1AC20DC62EB2C620DA736D09@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCD0AoyOq9A4mpcwhrQtkESwsVatRkAs0flKKjwKLc5ASzjy/TER
	 Oel8NeNZZGbnErjAhXtoXpvKEKtRgheG9OlsL0VMZZmY149JScUIhukvVHId/r+0p2GUsLhBKHDL
	 HEfSmOcaCgUtPEfdjfVx9wi4R1dnv4Wdza7omQCN5212O9IYTRRZK7qOzDzMKKve/282Y3cD/0j7
	 4ZFUnLPGGzBzV35KpfenixfPaOF/Gd8goHv85TWAcWYEY9sPrU7xAKNQF2tyZWLSsbjMaWlc8eJo
	 kDX8ER7CEaU53P8zKeBJEK79dKOXaS4+ME9mnaRhDmL+qXAx6qHRZaFCTMto0BflUSDyvGwvW6KP
	 2Q0XABMlCX+tYW/oOVA0gccstqDN1vQf7kNy5btLOG50yZkY5u/TTZWQVuJbjKp/s4mErM8rhmT6
	 UfKPNe/MR/9oDNpRkzF/NhZDjhwxKOVy95QaU3xu3CG6RVEg9HNQr2cv/b4uWXtDmEvDnNtFRP3F
	 nPrIFCgVVGOzrbmgEfE/AZKI9QkPjg3jkK4gx71H+ele3G44iMsSJW/sAfHb90LVwuNnUGHkKQPk
	 kmK7dzpNM7l3tLsgYoHPZiVqJDLk04DzMYWuvKCV1r/ku3y4SdrRUEd+1YbZIu9erGzyq/yDQCCR
	 xNADt208bgx+kHy1OYprBiEpdmS1KCNtEGjYgJVMenCiaATH37UQMsGh1qmHSgETufIxXcXMxV0T
	 fK7ZMXpn+SAbhadQJw8gYutuXjqStI3H9b+7r1gtVkIIprT6I4PxkaZkWsOnKjnWxbtCdkqWMjnh
	 wJxnaf/aYKl8QtQJwTSmphNP8IUrpAYorYa3/waQ+C0ydfda7G2xQfE0ic+rgpwxSmuTFMDXXXGr
	 nwGJx3hwEmlUxJV4VOdSTj4PX8ZBWzKLUQZXUJ916TOe3R5/481EnHP0IPsGwdYmVlbmPZFio9
Date: Tue, 26 Jul 2022 16:53:19 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Sean Young <sean@mess.org>
Cc: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [v5 2/4] media: rc: add keymap for MagicBox M16S remote
X-OQ-MSGID: <Yt+rf207b7eTevcM@TS-551>
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_5AC39B81CB85E258763BA8CD8774E9045806@qq.com>
 <Yt+a+N1BJ+AZqPRt@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yt+a+N1BJ+AZqPRt@gofer.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_015327_509237_51604AF8 
X-CRM114-Status: GOOD (  24.28  )
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

On Tue, Jul 26, 2022 at 08:42:48AM +0100, Sean Young wrote:
> On Mon, Jul 25, 2022 at 07:17:02AM +0800, Zhang Ning wrote:
> > MagicBox M16S Tv box shipped with a simple NEC remote.
> > it has a key labeled "M", used as Magic key in vendor OS.
> > This has mapped to KEY_MUTE.
> 
> Please put this commit in the source code next to the key definition.
> This doesn't belong in the commit message.

OK, I will also remove it from dt-bindings patch, they have some commit
message.
> 
> Thanks
> Sean
> 
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > ---
> >  drivers/media/rc/keymaps/Makefile      |  1 +
> >  drivers/media/rc/keymaps/rc-magicbox.c | 53 ++++++++++++++++++++++++++
> >  include/media/rc-map.h                 |  1 +
> >  3 files changed, 55 insertions(+)
> >  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> > 
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
> > index 000000000000..b4fc1856a9e7
> > --- /dev/null
> > +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> > @@ -0,0 +1,53 @@
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
> > +static struct rc_map_table magicbox[] = {
> > +	{ 0x9f57, KEY_POWER },
> > +	{ 0x9f8a, KEY_MUTE }, // M
> > +
> > +	{ 0x9f43, KEY_UP },
> > +	{ 0x9f0a, KEY_DOWN },
> > +	{ 0x9f06, KEY_LEFT },
> > +	{ 0x9f0e, KEY_RIGHT },
> > +	{ 0x9f02, KEY_OK },
> > +
> > +	{ 0x9f47, KEY_HOME },
> > +	{ 0x9f4f, KEY_BACK },
> > +	{ 0x9f16, KEY_MENU },
> > +
> > +	{ 0x9fff, KEY_VOLUMEDOWN },
> > +	{ 0x9f5d, KEY_VOLUMEUP },
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
> > -- 
> > 2.35.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
