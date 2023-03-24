Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912CBC6FD20
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qKT1hRE3/3EGfDlc7l0QWBtVA6G0147kUdYy+UmFVk=; b=C5GrvvBS7xuTf7
	djlK63bCUQ4edaath2ErzE6PgfTOpYrVsfqfuWUZ8MYgU1dOraHvALhJv3aZZGT3eWmzQnWwdkrOq
	jN9br43BCMxDj5l3TI7B2NLBUdLtv6WlZYYm30xvQTqO3/CQSOl1zfXzc7yRBKAS9yWbLO++K3e8k
	XhJDUU9M1uDVeZS09y/cnQUW5px8Mo9ZbkhwhapUrZ31YZQoz2yZO77T1JEzndFLcOSa1pERarIaU
	qzMfJvYXmOn7j37YKIFKrrRlyjPy6UD87YKqRXpXsXObMSONsn01U6owTjKWJEi29p7eYUGaC8+qr
	36bX/TyZNIIKqQiWaMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgBc-004JNf-2O;
	Fri, 24 Mar 2023 12:06:24 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgBZ-004JMk-14;
	Fri, 24 Mar 2023 12:06:23 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id CA5C05FD6A;
	Fri, 24 Mar 2023 15:06:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679659574;
	bh=k3sf6EC4sogl093QAM9hkykETNle5E2MS3s+d/HgAfM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=IVzxfUcoCuX0vmnekzmfm3f7vnBzYB+tqMrgR7lL+BoEJt+qzQ2tgj4rwSgZ21isJ
	 IxoLErTYPXcQgQjBzi5LiDxdwZWYOQmJVzHBzqpPJRcIVLXAlSlBFU60HynmDMzeP7
	 PFzz3vdXD7Xy9SCMxXUhwQtMmC52L1EB/BDsR3ZasVKKUI8Ga6zNGLyWbvKwhAeHLc
	 Sf3AfTMq68u8k9mTdtEakKqMbjGOFypMcYq6x4HbpnM5hIj3oCqunOPhnFUtsOaxyJ
	 x/kAHL10YLn1UplLktZu1xlV+B9u7ptgEt9jsNMZl7mlY2EslVRpVKY72xoMoy8pK7
	 aDPMPYJKGlWMA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 24 Mar 2023 15:06:13 +0300 (MSK)
Date: Fri, 24 Mar 2023 15:06:12 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>,
	<kernel@sberdevices.ru>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <rockosov@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: meson: a1: place pwrc and secure-monitor
 under /firmware
Message-ID: <20230324120612.tpb3uga56ilz7yqx@CAB-WSD-L081021>
References: <20230323185548.13731-1-ddrokosov@sberdevices.ru>
 <d180c7d5-7db9-a961-e519-cca5ccf6f013@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d180c7d5-7db9-a961-e519-cca5ccf6f013@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/24 06:52:00 #21002836
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_050622_064695_E99E19E5 
X-CRM114-Status: GOOD (  20.99  )
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

Hello Neil,

On Fri, Mar 24, 2023 at 11:11:02AM +0100, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 23/03/2023 19:55, Dmitry Rokosov wrote:
> > Before, meson power secure controller was a child of secure monitor node.
> > But secure monitor isn't the bus in terms of device tree subsystem, so
> > of_platform initialization code doesn't populate its children
> > (of_platform_default_populate() API).
> > 
> > Therefore in the current device tree meson power secure controller isn't
> > probed at all.
> > 
> > If we place meson power secure controller and secure monitor nodes under
> > '/firmware', they will be populated automatically from of_platform
> > initialization.
> > 
> > Fixes: 04dd0b6584cd ("arm64: dts: meson: a1: add secure power domain controller")
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > index 77023a29b6e7..44c651254dc5 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > @@ -72,8 +72,10 @@ linux,cma {
> >   		};
> >   	};
> > -	sm: secure-monitor {
> > -		compatible = "amlogic,meson-gxbb-sm";
> > +	firmware {
> > +		sm: secure-monitor {
> > +			compatible = "amlogic,meson-gxbb-sm";
> > +		};
> >   		pwrc: power-controller {
> >   			compatible = "amlogic,meson-a1-pwrc";
> 
> The amlogic,meson-gxbb-sm bindings says the power-controller node should be
> a subnode of secure-monitor, so instead please fix the sm driver by calling:
> 
> of_platform_populate(dev->of_node, NULL, NULL, dev);

This is second option which I was thinking of. I supposing this API is
used from SoC platform drivers and bus drivers only.
But if this approach is okay, I will rework the patch to
of_platform_populate().

Thank you for pointing out it.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
