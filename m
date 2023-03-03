Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F972C64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4is9Kb8r8zMr5xQPxzz4eRL/WLxwV45rANeBS/sLFfw=; b=27nHdIKr2UL4Th
	H8P81J3LGU31ZNC3klXqS9oqinL4422ul3XqGiOXhqnGEog3bxhJgB8It8uwZ+giyDmXVSSvVPnJ3
	Ae3mOWhfdEesODIrKmrhV2lFqhhDBiZHG34+14jyjT2zOmiSNBkJ8dO7FuIdKDIZDXJxMMPjvdeae
	Wi+2bzTnTUVlEN4go8qpjxJce0JcnMRSYIm1Bubx/8kkjsMyW6RSzlLPwJ+HwixmfioLUh6fgNP22
	r2xkCEl09hdpKDrVks/nxOFFWZhhHP2OIqX8UFoMoLljulzx+ugeoZ5urLs9fVoTeQ2xIolq6W+5n
	baXU+XJgEatsB9W0uftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bc-006TTr-14; Fri, 03 Mar 2023 13:37:52 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bY-006TNU-5a
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 13:37:50 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 765345FD18;
	Fri,  3 Mar 2023 16:37:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677850664;
	bh=CqMSC40Z3PURd10dg5jU4/U4KMRUcGQu6m5kz6z7Wrc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=grNROTOFQXTksDTniGbooW7nwgziZM++M5uIVaEu2JG/16wAh0YdEmfhYBeyiYmTt
	 Ls8iOfVCf7Vz8A2E4LKLZtJ8+ML2ps9EhgEm5BSTTq7PKO3yUEbbQ9TlSDhiiI9PZN
	 HVuxAj8SRNS8V172jBZYHNnG7JxAFCBuM0rVgWZ0WzWMf++KyPFjScLQtkhSEgLC93
	 2G4aI+vf/oq+/TyBRFufI5AEX1TGUWO+0p/Nca0cs9xwMOd4OEMIEb5hLZKvGhk9AZ
	 NcqQkO+T2u5rpif7p1FqayKEz4EfGywvDJZNy3LfaJ+OhgHKa9a761/9LuIBEnrxUj
	 fBJhE0O9GKqqQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  3 Mar 2023 16:37:44 +0300 (MSK)
Date: Fri, 3 Mar 2023 16:37:43 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: zelong dong <zelong.dong@amlogic.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
Message-ID: <20230303133743.djyp3vj7jdukqfye@CAB-WSD-L081021>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-2-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302063402.42708-2-zelong.dong@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/03 09:42:00 #20911747
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053748_607211_822A0ABB 
X-CRM114-Status: GOOD (  29.76  )
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

Hello Zelong,

On Thu, Mar 02, 2023 at 02:34:00PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Meson IR Controller supports hardware decoder in Meson-8B and later
> SoC. So far, protocol NEC/RC-6/XMP could be decoded in hardware.
> DTS property 'amlogic,ir-support-hw-decode' can enable this feature.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  drivers/media/rc/meson-ir.c | 713 ++++++++++++++++++++++++++++++++----
>  1 file changed, 632 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
> index 4b769111f78e..1bfdce1c1864 100644
> --- a/drivers/media/rc/meson-ir.c
> +++ b/drivers/media/rc/meson-ir.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>  #include <linux/bitfield.h>
> +#include <linux/regmap.h>
>  
>  #include <media/rc-core.h>
>  
> @@ -21,87 +22,598 @@
>  
>  /* valid on all Meson platforms */
>  #define IR_DEC_LDR_ACTIVE	0x00
> +	#define	IR_DEC_LDR_ACTIVE_MAX		GENMASK(28, 16)
> +	#define	IR_DEC_LDR_ACTIVE_MIN		GENMASK(12, 0)

Extra tabs before #define statement. The same problem is located in
the whole patchset.

[...]

> +#define MESON_IR_TIMINGS(proto, r_cnt, r_chk, r_comp, b1_e, hc, cnt_tick, ori, \
> +			 flt, len, f_max, la_max, la_min, li_max, li_min,      \
> +			 rl_max, rl_min, b0_max, b0_min, b1_max, b1_min,       \
> +			 d2_max, d2_min, d3_max, d3_min)		\
> +	{								\
> +		.hw_protocol =			proto,			\
> +		.repeat_counter_enable =	r_cnt,			\
> +		.repeat_check_enable =		r_chk,			\
> +		.repeat_compare_enable =	r_comp,			\
> +		.bit1_match_enable =		b1_e,			\
> +		.hold_code_enable =		hc,			\
> +		.count_tick_mode =		cnt_tick,		\
> +		.bit_order =			ori,			\
> +		.filter_cnt =			flt,			\
> +		.code_length =			len,			\
> +		.frame_time_max =		f_max,			\
> +		.leader_active_max =		la_max,			\
> +		.leader_active_min =		la_min,			\
> +		.leader_idle_max =		li_max,			\
> +		.leader_idle_min =		li_min,			\
> +		.repeat_leader_max =		rl_max,			\
> +		.repeat_leader_min =		rl_min,			\
> +		.bit0_max =			b0_max,			\
> +		.bit0_min =			b0_min,			\
> +		.bit1_max =			b1_max,			\
> +		.bit1_min =			b1_min,			\
> +		.duration2_max =		d2_max,			\
> +		.duration2_min =		d2_min,			\
> +		.duration3_max =		d3_max,			\
> +		.duration3_min =		d3_min,			\
> +	}								\

Extra tabs for back slash alignment

> +
> +/**
> + * struct meson_ir_param - describe IR Protocol parameter
> + * @hw_protocol: select IR Protocol from IR Controller.
> + * @repeat_counter_enable: enable frame-to-frame time counter, it should work
> + *	with @repeat_compare_enable to detect the repeat frame.
> + * @repeat_check_enable: enable repeat time check for repeat detection.
> + * @repeat_compare_enable: enable to compare frame for repeat frame detection.
> + *	Some IR Protocol send the same data as repeat frame. In this case,
> + *	it should work with @repeat_counter_enable to detect the repeat frame.
> + * @bit_order: bit order, LSB or MSB.
> + * @bit1_match_enable: enable to check bit 1.
> + * @hold_code_enable: hold frame code in register IR_DEC_FRAME1, the new one
> + *	frame code will not be store in IR_DEC_FRAME1. until IR_DEC_FRAME1
> + *	has been read.
> + * @count_tick_mode: increasing time unit of frame-to-frame time counter.
> + *	0 = 100us, 1 = 10us.
> + * @filter_cnt: input filter, to filter burr
> + * @code_length: length (N-1) of frame's data part.
> + * @frame_time_max: max time for whole frame. Unit: MESON_HW_TRATE
> + * @leader_active_max: max time for NEC/RC6 leader active part. Unit: MESON_HW_TRATE.
> + * @leader_active_min: min time for NEC/RC6 leader active part. Unit: MESON_HW_TRATE.
> + * @leader_idle_max: max time for NEC/RC6 leader idle part. Unit: MESON_HW_TRATE.
> + * @leader_idle_min: min time for NEC/RC6 leader idle part. Unit: MESON_HW_TRATE.
> + * @repeat_leader_max: max time for NEC repeat leader idle part. Unit: MESON_HW_TRATE.
> + * @repeat_leader_min: min time for NEC repeat leader idle part. Unit: MESON_HW_TRATE.
> + * @bit0_max: max time for NEC Logic '0', half of RC6 trailer bit, XMP Logic '00'
> + * @bit0_min: min time for NEC Logic '0', half of RC6 trailer bit, XMP Logic '00'
> + * @bit1_max: max time for NEC Logic '1', whole of RC6 trailer bit, XMP Logic '01'
> + * @bit1_min: min time for NEC Logic '1', whole of RC6 trailer bit, XMP Logic '01'
> + * @duration2_max: max time for half of RC6 normal bit, XMP Logic '10'.
> + * @duration2_min: min time for half of RC6 normal bit, XMP Logic '10'.
> + * @duration3_max: max time for whole of RC6 normal bit, XMP Logic '11'.
> + * @duration3_min: min time for whole of RC6 normal bit, XMP Logic '11'.
> + */
>  

Did you run checkpatch and kernel-doc checker for above struct
documentation?

> -#define REG0_RATE_MASK		GENMASK(11, 0)
> +struct meson_ir_param {
> +	u8		hw_protocol;
> +	bool		repeat_counter_enable;
> +	bool		repeat_check_enable;
> +	bool		repeat_compare_enable;
> +	bool		bit_order;
> +	bool		bit1_match_enable;
> +	bool		hold_code_enable;
> +	bool		count_tick_mode;
> +	u8		filter_cnt;
> +	u8		code_length;
> +	u16		frame_time_max;
> +	u16		leader_active_max;
> +	u16		leader_active_min;
> +	u16		leader_idle_max;
> +	u16		leader_idle_min;
> +	u16		repeat_leader_max;
> +	u16		repeat_leader_min;
> +	u16		bit0_max;
> +	u16		bit0_min;
> +	u16		bit1_max;
> +	u16		bit1_min;
> +	u16		duration2_max;
> +	u16		duration2_min;
> +	u16		duration3_max;
> +	u16		duration3_min;
> +};

Why do you need tab alignment between type and variable?

[...]

> +#ifdef CONFIG_PM
> +static int meson_ir_resume(struct device *dev)
> +{
> +	struct meson_ir *ir = dev_get_drvdata(dev);
> +
> +	if (ir->support_hw_dec)
> +		meson_ir_change_protocol(ir->rc, &ir->rc->enabled_protocols);
> +	else
> +		meson_ir_sw_decoder_init(ir->rc);
> +
> +	return 0;
> +}
> +
> +static int meson_ir_suspend(struct device *dev)
> +{
> +	struct meson_ir *ir = dev_get_drvdata(dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ir->lock, flags);
> +	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
> +	spin_unlock_irqrestore(&ir->lock, flags);
> +
> +	return 0;
> +}
> +#endif
> +
>  static const struct of_device_id meson_ir_match[] = {
>  	{ .compatible = "amlogic,meson6-ir" },
>  	{ .compatible = "amlogic,meson8b-ir" },
>  	{ .compatible = "amlogic,meson-gxbb-ir" },
> +	{ .compatible = "amlogic,meson-s4-ir" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_ir_match);
>  
> +#ifdef CONFIG_PM
> +static const struct dev_pm_ops meson_ir_pm_ops = {
> +	.suspend_late = meson_ir_suspend,
> +	.resume_early = meson_ir_resume,
> +};
> +#endif
> +
>  static struct platform_driver meson_ir_driver = {
>  	.probe		= meson_ir_probe,
>  	.remove		= meson_ir_remove,
> @@ -231,6 +779,9 @@ static struct platform_driver meson_ir_driver = {
>  	.driver = {
>  		.name		= DRIVER_NAME,
>  		.of_match_table	= meson_ir_match,
> +#ifdef CONFIG_PM
> +		.pm = &meson_ir_pm_ops,
> +#endif

You can use pm_ptr() and DEFINE_SIMPLE_DEV_PM_OPS instead of checking of
CONFIG_PM definition.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
