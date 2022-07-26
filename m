Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F11C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThCCXIMlGkd8RNBZQLUZ5g3rcF/DJhhiPNzMaVK6Cy4=; b=kUPk7QEUMFTR0R
	Z7ihDef9QmGVOFN78CKZIqOaBfHi8JiWuc6oT65EPgVonu4q4/I3U13RQv9WTOb6wZOC3VDPWs6kI
	TIBqyI5JdO4H3gzlFjP+4uzdFbq8L9k1V/MQi/Y5NEKkzNifqN+t3380gaRwXstCLnFeHUI5LwSKT
	px1drAozyV+y83p15pg/V9Y3VTw1cX8OizqpC/qT6zAAtL01ViCkBgm1vm4Ur0GctbEZ87dzkCF/7
	U9tSCgHb7+RHY0KiPPytmCHAgS6ca2dM1uX4UDnhLzmnH7bOhdppUwr2LwZifz/B5AQV/2d+Bcvfb
	Ue4zKToVCM+JX3HxBXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKn0-00HQu2-7l; Tue, 26 Jul 2022 13:39:58 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKmw-00HQro-M4
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 13:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658842789; bh=NX5jxS584yyEE3pGC2p+PHoJeFd+WA4TRFyQe7dbG4o=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=b7luViPYRFKmh7AyHvUMqxdNtPmJg063eIGuZGzXlmJpDsyeOoyvbiIBeRM39Yrh6
	 o5EK/TNT7+URuTkGHz26Uu0Im5iX0ThcDMPbB4S4GkWv3zMN2eCMWPvzdIAAsi7sxA
	 shbvNfuNhSSFUDZ0ZQREH1XXiWi00Hh/A0t1k/a0=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
	id 9EE272AE; Tue, 26 Jul 2022 21:39:46 +0800
X-QQ-mid: xmsmtpt1658842786t4bv8b6iy
Message-ID: <tencent_DAA1CCC0ECA273CCA2DDC726455A73C2B705@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCtaCm0KMjrHDp4lkkbxZ0Ul4/U/rg2MEYtlF4PShhrbamPeette
	 AUHfZRP9QbcHVrngoCpCGRpaYVaDrudM4Y5liNyz5rvALWWRhEWKMXULj1xPDlUqLwlCHv8Vc8qa
	 sJZr1G2y2BjNQuG7HgstiKKkFCRx+mNf6Ab4njqUbOGy3RClvciR0o4uljzsLYiS/hkikw4W4H01
	 tDYYHdo8QLzt8io/keFymQu87n1n7pByUcuymPg/iWZJMu4enhYa5mGnorSWZJBOC4Il4RH1NqeN
	 s2Lhdy2QRMspVzE5ZuDQ0Xnhzg/UdijNh9ZgQrNHbdukYf0dNBANEctaZ9Vbi61gZ0YvMsh8REY+
	 Oi2/ZR9Zyc5mTHkCFthN+pyvX50xaHcTQ8E3r8U7rWAYdXHpbww/bsJeUra5fdmrcMxC8V+PvGe4
	 O813AF85msrCbCMNPo3NGi91c6f1F4CsArH07Up6mdBjHx4tOiYV7RdQ9Khd0rByln8cmju5uqnh
	 SM3mGjMrXiTehGcLAc6lACCEtAwOK7XAZeMXUzlrJU817qkmhRvWL5NxX4YHjfOlWpU1oWgY+y0R
	 POZNoTNIOq7xKGHgB7oSTjfjF/1wicq13+TpLbFsYPTFD20Npl8sZaKmoF6KPP7QmOn5akQgrCDK
	 oNLmkinWpnyScCHjCyErNhFQWXqW7jgX2TU4PN4xnrNn0zW9xQXw+lVVwKXXEbYi88jDu/mFNND+
	 eRZ68xxZaxfe94xaWmgs6kWZBEQdVAyIGH1isfvAOcYftMR+xlN7bzX7xCwD2a4ZxKSjHWRHxSg5
	 64Nx++Y1SfKj9yxCRz/T9GE94p0dko+YvehAyAnQylBKqxEjloSpYtJLioQGpNsd510n7IfWWmiG
	 muXLty25irnhWAaz+pgoNjrE3DGn+lmBO9RVEhqArlUBXUQYo5zIXJoQO7pygAxg==
Date: Tue, 26 Jul 2022 21:39:46 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
	sean@mess.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [v6 2/4] media: rc: add keymap for MagicBox M16S remote
X-OQ-MSGID: <Yt/uoiQYjJLPojZ5@TS-551>
References: <20220726131523.140581-1-zhangn1985@qq.com>
 <tencent_7941C3ADC1F805DF58467BADCD88F4C0C406@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_7941C3ADC1F805DF58467BADCD88F4C0C406@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_063955_065690_0F518D33 
X-CRM114-Status: GOOD (  18.26  )
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

On Tue, Jul 26, 2022 at 09:15:21PM +0800, Zhang Ning wrote:
> MagicBox M16S Tv box shipped with a simple NEC remote.
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  drivers/media/rc/keymaps/Makefile      |  1 +
>  drivers/media/rc/keymaps/rc-magicbox.c | 58 ++++++++++++++++++++++++++
>  include/media/rc-map.h                 |  1 +
>  3 files changed, 60 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> 
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
> index 000000000000..015767429028
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> @@ -0,0 +1,58 @@
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
> +static struct rc_map_table magicbox[] = {
> +	{ 0x9f57, KEY_POWER },
> +
> +	/*
> +	 * This key labeled "M" is used as magic key in vendor OS,
> +         * and mapped to KEY_MUTE.
oh no, mixed tab and space. I will fix it next version.

> +	 */
> +	{ 0x9f8a, KEY_MUTE },
> +
> +	{ 0x9f43, KEY_UP },
> +	{ 0x9f0a, KEY_DOWN },
> +	{ 0x9f06, KEY_LEFT },
> +	{ 0x9f0e, KEY_RIGHT },
> +	{ 0x9f02, KEY_OK },
> +
> +	{ 0x9f47, KEY_HOME },
> +	{ 0x9f4f, KEY_BACK },
> +	{ 0x9f16, KEY_MENU },
> +
> +	{ 0x9fff, KEY_VOLUMEUP },
> +	{ 0x9f5d, KEY_VOLUMEDOWN },
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
> -- 
> 2.35.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
