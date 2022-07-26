Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8440C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0SYY3o21ZrJLgzjSpc+CCsPwRPQPAoSMZ1FSccDow0=; b=TIAgJxPG4Mpd3u
	c7cZ6zfodlSCSjKDfZmoh4xA9tloaCtA48PsVEymWzuOCRyWAO6NbuNHNqJ3KEVlnY+GtHwS4V3Wh
	liK6EyFK/fVi5fDta9vqG3bB38o8dKbG6HPqRsg0PaHCT3dD5lHgJiJpo9udGwJmWw8Tpfajk2jf+
	DkLKvQfkwp/xtOcgzJZOQPY8/T3fbyjtLXKVSxMbahGwu/WBW/eZgQsti+fI8x5JQ6Dlvj6vT8oO3
	uztHzdJs6I3tBKCvODy4WGTUyUkMT+OKjDwlhd4kkY5HHsMUvu4S6zEaDzwE+KYno5sWxg4h8EjZJ
	iQz0B9rdU++OxZr0wcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGHs-00AXkp-8q; Tue, 26 Jul 2022 08:51:32 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGHp-00AXey-Op
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 08:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658825483; bh=HUlF4q5Ebo8KXPl8eHyhpYElMmyBxU+tBq4Nhzw6x+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6t2K9vZ4tdYZt7JtEiwC/JTwcFdrFMuhHXUDfJp1ukGZhDMjlduKHOd2FMGVcbSh
	 HOVDMK3Rbzc109nmhAdnj0gtFlida0LndvQlIaNpP2HH7ir9LOJL01rJSakJkCLj+h
	 Vn41pIcqE3deSuS3GyzZULXER+chCGVzlOI1P9GQ=
Received: from TS-551 ([101.229.115.99])
	by newxmesmtplogicsvrsza30.qq.com (NewEsmtp) with SMTP
	id CD41E8CB; Tue, 26 Jul 2022 16:51:20 +0800
X-QQ-mid: xmsmtpt1658825480tx084lu5x
Message-ID: <tencent_A4721B2869C4099E065D03E78BCC31937607@qq.com>
X-QQ-XMAILINFO: NioaTWkRhWwarFF6rDVbi0H1m0axP8TeTYTSCu/D/xDB+DTTsEONskXCpFrDmS
	 WsgbXHPBOIGB7JsO4zuq8wrq/dMr3Lijw7sCSBw38mQwmtfPqrZZJWzj1BlxyU8mt5XefU6Ji9UH
	 AWR87uzXuAIG8eTn0yMmzKyYv6Vh34N4OgSyM5PVXQSTF7X3z0tcZ2A8WQDJDYAJGyJ5rC2JDTNa
	 OlV7o6bDB4kCs4HF0RUI+Wdz4RFJoNka7B/IS0Uu5vaHu2bwYeZuc816A2oHnd4uDzpibflS5owd
	 y/PQD8xgD8Mdg6iE622Gi+J6k6wkyuEeRs9d2AVI6lV3O7fEasDNpNeUGgUp7M/hDJeAJWVpGygC
	 53ailkHOJI+Hg06q3cx0mTL4eE+8Nfg3ulUrWO1AHsfXRRGB1wAWyBMoZ7jh5XlWokAcyc3exAi2
	 SezQokL8zv222Pp366ReOxWbjyARWZHyF3u58ThqOVxAZ30Vla/sWLagA+J2od2i23xZF+ndXK5I
	 N4gI5QbyJBWsdu/N/v8ywL1JJJCdWKmT0tejjfgMMVn+sZKBNJrg+StjLkT6GsVXwr7UINilbN81
	 NsPOygLZMtBItqUIDVzMFyzmOZVAOcqkoG35tqgfoBgQbavfM4JBk8J5eie0RzKGYRt4yK545XxF
	 vgRbNK9+icCIWniw4DV1zk7A/m8ivTw2LOaew260gAxVpMCLcn02kn38bFsqHaFLuz9lgFamHyxm
	 HOMhBfLrNbV7WOdF0slpEaWdyTGO/7kOE6dZiEVDoITW3+IBnqbIFXIy6xyOv/d1jLpQBikjA60v
	 lBoC6CVAVpgSHWTigJcA/a6F7uG4N2tKMc5gStAerD7MO3UkfSOvDLC3NfMRZi8UaQW3SepGMOEz
	 njAjC0BFFRBD0gDUFtA58blHUSCw/i6FddGKfa6cHcFRTCtMbA4lge07zqyKjVsCZ0owoOojwG
Date: Tue, 26 Jul 2022 16:51:20 +0800
From: Zhang Ning <zhangn1985@qq.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
X-OQ-MSGID: <Yt+rCDxwRXEtYFFt@TS-551>
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
 <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
 <tencent_1B5B069917D86370ED4136BDD2C413240D08@qq.com>
 <62334f55-df8a-936a-ec88-2db469aede21@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62334f55-df8a-936a-ec88-2db469aede21@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_015130_149363_B14EA090 
X-CRM114-Status: GOOD (  11.08  )
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

On Tue, Jul 26, 2022 at 08:48:45AM +0200, Krzysztof Kozlowski wrote:
> On 26/07/2022 02:04, Zhang Ning wrote:
> 
> >>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> >>> @@ -0,0 +1,40 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>> +/*
> >>> + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +
> >>> +#include "meson-gxm.dtsi"
> >>> +#include "meson-gx-p23x-q20x.dtsi"
> >>> +#include <dt-bindings/input/input.h>
> >>> +
> >>> +/ {
> >>> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
> >>> +	model = "MagicBox M16S";
> >>> +
> >>> +	gpio-keys-polled {
> >>
> >> Just gpio-keys (or even "keys").
> > I see all dts for amlogic platform are using gpio-keys-polled, could I
> > keep current name?
> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
thank you let me know this, I will update in next version.
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
