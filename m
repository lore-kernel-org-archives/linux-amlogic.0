Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9459DC00140
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iNIg2OD9vXkGn4fxcIJcI7oRdbUKnP5pRDzVyyu25g=; b=p+Mcpdhk4pRW7E
	hSwmBxHLEFjVFp8/V+JX1fWESA7bI7igEwH168z1L+kKnoHRfu0xYuaOfxwxhOt5R65/+5u8I23Tm
	0cyENpV1H7Ug3obQYGJP8BlDucUzlbhMoi1tcFpDVvxosCG00T1Cx6H7d3Gw9NFJR8aIAAydD5zK0
	an8FFDFBnbnC78LLSuT14gRbRlBiOgWhLWCDJwgHSo3kRJAp9Zms/yie6OtBGkgSTQyI/2+sQonuD
	QdAK0OASdhoMWyBYqt3+rKITq6J+KpgrcMyTaCcajNV7ZRkNN2btaxctCVIfFEdXkssxkGBCoYRJj
	++0UffQw/fZNkrsgUtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLQT-0009Nf-I3; Tue, 26 Jul 2022 14:20:45 +0000
Received: from out203-205-251-36.mail.qq.com ([203.205.251.36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLPc-0008hv-De
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 14:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658845187; bh=fyffNgSZxaenqPob46YSohjDgtHW4n+hRD37HwROLgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wy3RpilwHY6M0Pw+ac38/ljhIZ9CgN32pvVJOWohjjkUvE7NStQrhgmyhNuVpMl2e
	 IiMmBfI+CxdGKMZwFWtgKHiJ2W6G5iXoPsdO3ABmoOJRaOxvsI/gH9zKdK53bKXV0x
	 7FYDjsoq9AfEAe6DrMp6AW8ZW6RqEwLMAIgfX32c=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza31.qq.com (NewEsmtp) with SMTP
	id 4EC0760F; Tue, 26 Jul 2022 22:19:44 +0800
X-QQ-mid: xmsmtpt1658845184tw01r7f3f
Message-ID: <tencent_5A438741DF85C6D84B7BB60D8E74F1047506@qq.com>
X-QQ-XMAILINFO: NonMLXQbqcUbiJ2FVmCpkPDXsufWdq2WRtwzjVYkq5IHxJviMtxwd99LS73U8d
	 bNmZguWd9H/Y0FSWG/et3a5v/x+xdL2WnN9haTgsOGfXZT+wzlQHxL5oNmSr00O9CmYvs4SX1nBH
	 b2Kg6HlTeOiRGofYktdgizfOIF0N89lcF3kVHRW4f8z78mcxHm4rYOhuriMCncexM5jTcvOH6oeF
	 qaXbyWIM6TMdCFjZltJ95VrUAACmvl74MB8FMHb+fYDEaJVlb+MUq2WOYD7hTeeVu5q2nD7iwf6P
	 lS9yFqMwdy4rwLtN+ZqVc3kWsrJZvPhZFdIAwuDwyn52VZhAncI9br/Z71zIXLgCuMYJwdJhe/Dx
	 dHBsLSlUspsQPe+Qm9LmK4YQMo+vo5/Drfn13EQc0yYQjLU4SCJllUX6weIB+NoNYeTyIBeyyiT6
	 5dB6ZybbAAUgLPySbjdwBMsq8oYbSpjkv77i+KckLgSBiftx7R0A4OCBpfFoKoz2GLX3meWTt8eo
	 utYoMjt2QldGVLQIUOaBebMscVYKxW0zLXoz27fyFPIHVilWyqoaZxzguOuF/cT8V1mLNLi2sVDz
	 uBVJ5MZOTkVQ36usO4n4gf2HehF3pYpXe7KjJiPjtfl/4qaE1lfa7BvdNXpWZ6IVR22MlnfDy5sw
	 6zaguntGbqdTuQXTqg4qWBsiZNd/H0qFpXSQUOIAeoCDAGoTBJkeeLhG2eqCZSX9HT4J7hEbhXUG
	 S+aVmXNmSC+CveqkwAuVOfKUlo07GucK6vcA6wemqQyrhT+UU4PePVrVQCol4ZnVJ6q/PUh4t2Up
	 5bSo7xOmju5Y96MsZMtOnPxs5w1y3T0AXi5YQMW8HPEA0Agl7s9kZ3J/28Wx1++3Sq5w2f5w9zAq
	 JgbU6nPPcqRTqwsml6CMLX3yPHQkZ0ojizeC6J3x1YsrtyAE+DWhD/mF95Osw+veOstl1Q81yLwu
	 /FJKw952pbUvIUlmXv/w==
Date: Tue, 26 Jul 2022 22:19:44 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Sean Young <sean@mess.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [v6 2/4] media: rc: add keymap for MagicBox M16S remote
X-OQ-MSGID: <Yt/4ALC8Q1mvMnw2@TS-551>
References: <20220726131523.140581-1-zhangn1985@qq.com>
 <tencent_7941C3ADC1F805DF58467BADCD88F4C0C406@qq.com>
 <tencent_DAA1CCC0ECA273CCA2DDC726455A73C2B705@qq.com>
 <Yt/zRoDbEMiMT6qj@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yt/zRoDbEMiMT6qj@gofer.mess.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_071952_892297_5F315A05 
X-CRM114-Status: GOOD (  22.38  )
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

On Tue, Jul 26, 2022 at 02:59:34PM +0100, Sean Young wrote:
> On Tue, Jul 26, 2022 at 09:39:46PM +0800, Zhang Ning wrote:
> > On Tue, Jul 26, 2022 at 09:15:21PM +0800, Zhang Ning wrote:
> > > MagicBox M16S Tv box shipped with a simple NEC remote.
> > > 
> > > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > > ---
> > >  drivers/media/rc/keymaps/Makefile      |  1 +
> > >  drivers/media/rc/keymaps/rc-magicbox.c | 58 ++++++++++++++++++++++++++
> > >  include/media/rc-map.h                 |  1 +
> > >  3 files changed, 60 insertions(+)
> > >  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> > > 
> > > diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> > > index f513ff5caf4e..02c1c2150f03 100644
> > > --- a/drivers/media/rc/keymaps/Makefile
> > > +++ b/drivers/media/rc/keymaps/Makefile
> > > @@ -71,6 +71,7 @@ obj-$(CONFIG_RC_MAP) += \
> > >  			rc-kworld-plus-tv-analog.o \
> > >  			rc-leadtek-y04g0051.o \
> > >  			rc-lme2510.o \
> > > +			rc-magicbox.o \
> > >  			rc-manli.o \
> > >  			rc-mecool-kiii-pro.o \
> > >  			rc-mecool-kii-pro.o \
> > > diff --git a/drivers/media/rc/keymaps/rc-magicbox.c b/drivers/media/rc/keymaps/rc-magicbox.c
> > > new file mode 100644
> > > index 000000000000..015767429028
> > > --- /dev/null
> > > +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> > > @@ -0,0 +1,58 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +//
> > > +// Copyright (C) 2022 Zhang Ning <zhangn1985@qq.com>
> > > +
> > > +/*
> > > + * Keytable for the MagicBox M16S remote control
> > > + */
> > > +
> > > +#include <media/rc-map.h>
> > > +#include <linux/module.h>
> > > +
> > > +static struct rc_map_table magicbox[] = {
> > > +	{ 0x9f57, KEY_POWER },
> > > +
> > > +	/*
> > > +	 * This key labeled "M" is used as magic key in vendor OS,
> > > +         * and mapped to KEY_MUTE.
> > oh no, mixed tab and space. I will fix it next version.
> 
> That's something minor that can be fixed when merging.
> 
> Looks good to me, thank you for dealing with all the pedantic reviews.
> 
> Signed-off-by: Sean Young <sean@mess.org>

I want to send v7, due to checkpatch error.
I will add your Signed-off-by in next version.

thank you.

> 
> > 
> > > +	 */
> > > +	{ 0x9f8a, KEY_MUTE },
> > > +
> > > +	{ 0x9f43, KEY_UP },
> > > +	{ 0x9f0a, KEY_DOWN },
> > > +	{ 0x9f06, KEY_LEFT },
> > > +	{ 0x9f0e, KEY_RIGHT },
> > > +	{ 0x9f02, KEY_OK },
> > > +
> > > +	{ 0x9f47, KEY_HOME },
> > > +	{ 0x9f4f, KEY_BACK },
> > > +	{ 0x9f16, KEY_MENU },
> > > +
> > > +	{ 0x9fff, KEY_VOLUMEUP },
> > > +	{ 0x9f5d, KEY_VOLUMEDOWN },
> > > +};
> > > +
> > > +static struct rc_map_list magicbox_map = {
> > > +	.map = {
> > > +		.scan     = magicbox,
> > > +		.size     = ARRAY_SIZE(magicbox),
> > > +		.rc_proto = RC_PROTO_NEC,
> > > +		.name     = RC_MAP_MAGICBOX,
> > > +	}
> > > +};
> > > +
> > > +static int __init init_rc_map_magicbox(void)
> > > +{
> > > +	return rc_map_register(&magicbox_map);
> > > +}
> > > +
> > > +static void __exit exit_rc_map_magicbox(void)
> > > +{
> > > +	rc_map_unregister(&magicbox_map);
> > > +}
> > > +
> > > +module_init(init_rc_map_magicbox)
> > > +module_exit(exit_rc_map_magicbox)
> > > +
> > > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Zhang Ning <zhangn1985@qq.com>");
> > > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > > index 793b54342dff..656217b8e91b 100644
> > > --- a/include/media/rc-map.h
> > > +++ b/include/media/rc-map.h
> > > @@ -277,6 +277,7 @@ struct rc_map *rc_map_get(const char *name);
> > >  #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
> > >  #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
> > >  #define RC_MAP_LME2510                   "rc-lme2510"
> > > +#define RC_MAP_MAGICBOX                  "rc-magicbox"
> > >  #define RC_MAP_MANLI                     "rc-manli"
> > >  #define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
> > >  #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"
> > > -- 
> > > 2.35.1
> > > 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
