Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2144DC43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M21tqJlv209jxMKzKW7MdKrhj/VoD9zIQPZRtZ1IIEY=; b=E6f3aFI+WYZyeb
	xK9QULNRQh2WcoaGFqknO4NqrEuF/SgY5womZBMbX6XKPclHHKDiGUdIXr5NruB9/+fOhNwCnLQMI
	6G/vrkossPix3I1uvwy1M3HgsNl+Y6NCY37QuEfJrlaSWZXh10xMEk2WKgcA3aVfXtbAjEdJ4b4uy
	9IPBvzvDaIqttnyjzoVNc+7mIkjigLKtBTpYjsflD6l3yMpHkLb26P+8P6jUu75e80ZcBP2Jz+VfV
	ezHGNtbk0D/xwc8G2zA2XVHh4fKr0taIbZ+e/HAkl4YhgmTQkOHK9yDIBpF56nsFEAP+3OG//80z6
	EhCtRy91xokAJV2YrtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFbuP-006Leg-Fx; Sun, 24 Jul 2022 13:44:37 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFbuM-006Lc4-7E; Sun, 24 Jul 2022 13:44:35 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 8165410006F; Sun, 24 Jul 2022 14:44:28 +0100 (BST)
Date: Sun, 24 Jul 2022 14:44:28 +0100
From: Sean Young <sean@mess.org>
To: Zhang Ning <zhangn1985@qq.com>
Cc: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] rc/keymap: add keymap for MagicBox M16S
Message-ID: <Yt1MvOQtRgxYFm7F@gofer.mess.org>
References: <20220723155502.127404-1-zhangn1985@qq.com>
 <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_064434_484308_761ED231 
X-CRM114-Status: GOOD (  19.98  )
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

On Sat, Jul 23, 2022 at 11:55:02PM +0800, Zhang Ning wrote:
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   |  4 ++
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  4 files changed, 61 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> index 464de73d2f0f..69e72687ac9c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> @@ -34,3 +34,7 @@ &ethmac {
>  &sdio_pwrseq {
>  	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
>  };
> +
> +&ir {
> +        linux,rc-map-name = "rc-magicbox";
> +};

As has been pointed out already, this should go a in a different patch.

> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index f513ff5caf4e..02c1c2150f03 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-kworld-plus-tv-analog.o \
>  			rc-leadtek-y04g0051.o \
>  			rc-lme2510.o \
> +			rc-magicbox.o \
>  			rc-manli.o \
>  			rc-mecool-kiii-pro.o \
>  			rc-mecool-kii-pro.o \
> diff --git a/drivers/media/rc/keymaps/rc-magicbox.c b/drivers/media/rc/keymaps/rc-magicbox.c
> new file mode 100644
> index 000000000000..7dd3afd8a42c
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright (C) 2022 Zhang Ning <zhangn1985@qq.com>
> +
> +/*
> + * Keytable for the MagicBox M16S remote control
> + */
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +
> +static struct rc_map_table magicbox[] = {
> +	{ 40791, KEY_POWER },
> +	{ 40842, KEY_MUTE }, // M

This comment needs elaboration. What does M mean?

> +	{ 40771, KEY_UP },
> +	{ 40714, KEY_DOWN },
> +	{ 40710, KEY_LEFT },
> +	{ 40718, KEY_RIGHT },
> +	{ 40706, KEY_OK },
> +
> +	{ 40775, KEY_HOME },
> +	{ 40783, KEY_BACK },
> +	{ 40726, KEY_MENU },
> +
> +	{ 40959, KEY_VOLUMEDOWN },
> +	{ 40797, KEY_VOLUMEUP },

Please use hex values here, they make much more sense for nec protocol.

> +

Remove blank line.

> +};
> +
> +static struct rc_map_list magicbox_map = {
> +	.map = {
> +		.scan     = magicbox,
> +		.size     = ARRAY_SIZE(magicbox),
> +		.rc_proto = RC_PROTO_NEC,
> +		.name     = RC_MAP_MAGICBOX,
> +	}
> +};
> +
> +static int __init init_rc_map_magicbox(void)
> +{
> +	return rc_map_register(&magicbox_map);
> +}
> +
> +static void __exit exit_rc_map_magicbox(void)
> +{
> +	rc_map_unregister(&magicbox_map);
> +}
> +
> +module_init(init_rc_map_magicbox)
> +module_exit(exit_rc_map_magicbox)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Zhang Ning <zhangn1985@qq.com>");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index 793b54342dff..656217b8e91b 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -277,6 +277,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
>  #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
>  #define RC_MAP_LME2510                   "rc-lme2510"
> +#define RC_MAP_MAGICBOX                  "rc-magicbox"
>  #define RC_MAP_MANLI                     "rc-manli"
>  #define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
>  #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"

You should update Documentation/devicetree/bindings/media/rc.yaml as well.

Thanks,

Sean

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
