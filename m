Return-Path: <SRS0=jj7Z=DT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0977C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2020 15:13:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A63320878
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2020 15:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lu/g/2DK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A63320878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ia7trnXkuFz1pd1EcFPptY7NOclO1HeRIAsW4GSZR60=; b=lu/g/2DK2OpVqx62f1TvpSlGa
	pI4rLpulGnODcAJY++VQeRPXEfVnxyCQ1z/IfDEjr/U8sOxsZ3l8STYVrYTV9ydQBOiWMxwt1xpJg
	lu6stJp4T/tuU+iHnyPJGl/hgOZY6G2C4gBzLydYmW7+PwneHOLQTLMS7R4TT3wS5ZoqGofXSdsY0
	XgX8VR7Fj1df2KM92cSrv8bjIjjOrGxYeWfRheS0e0VaK7Y9Ex7dafcNVvWxb8U650wGz4Mrb2XeZ
	aReDEMOPl9Co9QVfV/FR1ac9o9jLepeZET0C5TbQMn3Wo0l0wu4swNjo6ZrHsrJaL3LWVwq04o8nK
	SGFo83nGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRzW1-0006Hw-7h; Mon, 12 Oct 2020 15:13:33 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRzVy-0006HV-6N; Mon, 12 Oct 2020 15:13:31 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 68C5F8030865;
 Mon, 12 Oct 2020 15:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18g_bu0glQOE; Mon, 12 Oct 2020 18:13:28 +0300 (MSK)
Date: Mon, 12 Oct 2020 18:13:26 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 15/18] dt-bindings: usb: meson-g12a-usb: Discard FL-adj
 property
Message-ID: <20201012151326.peu4yq6fhmi5utnb@mobilestation>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru>
 <329129ac-ff44-4928-bca4-805297a8c456@baylibre.com>
 <20201012142201.7fr2n5xwvei23yog@mobilestation>
 <f6e38330-146c-eb7c-5a99-7e156454e90b@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6e38330-146c-eb7c-5a99-7e156454e90b@baylibre.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_111330_487798_0C60D512 
X-CRM114-Status: GOOD (  22.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Roger Quadros <rogerq@ti.com>, Mathias Nyman <mathias.nyman@intel.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-usb@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 12, 2020 at 05:01:43PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 12/10/2020 16:22, Serge Semin wrote:
> > On Mon, Oct 12, 2020 at 09:54:25AM +0200, Neil Armstrong wrote:
> >> Hi,
> >>
> >> On 11/10/2020 00:41, Serge Semin wrote:
> >>> An empty snps,quirk-frame-length-adjustment won't cause any change
> >>> performed by the driver. Moreover the DT schema validation will fail,
> >>> since it expects the property being assigned with some value. So just
> >>> discard the property declaration then from the example.
> >>>
> >>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >>>
> >>> ---
> >>>
> >>> Note the same problem is in the DT source file
> >>> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
> >>> ---
> >>>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml     | 1 -
> >>>  1 file changed, 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> >>> index 5b04a7dfa018..88184d7e26cc 100644
> >>> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> >>> @@ -209,6 +209,5 @@ examples:
> >>>                interrupts = <30>;
> >>>                dr_mode = "host";
> >>>                snps,dis_u2_susphy_quirk;
> >>> -              snps,quirk-frame-length-adjustment;
> >>>            };
> >>>      };
> >>>
> >>
> > 
> >> Thanks for reporting this, actually the fladj must be 0x20 on this hw,
> >> but we do set this on the PHY side, so we can let the dwc3 side 0 here.
> > 
> > I can convert this patch to initializing the "snps,quirk-frame-length-adjustment"
> > property with 0x20 value instead. Since most likely I'll have to send a v2/v3/etc
> > of this patchset, that modification won't be too much work to do. What do you think?
> 

> Yes, do this please,

Ok. Shall I preserve your Acked-by tag in the new patch or you'd prefer to
review it first?

> anyway it's only an example so it's ok.

Actually examples are also validated by "make dt_binding_check". That's why I
had to fix the amlogic,meson-g12a-usb-ctrl example for at least so the new
snps,dwc3.yaml DT schema wouldn't break that full DT bindings
validation procedure.)

-Sergey

> 
> > 
> > Anyway please note, that I've fixed the improper property usage in the DT schema
> > example only. "snps,quirk-frame-length-adjustment" defined as boolean still
> > persists in the DTS file: arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi .
> > So if you ever try to validate that dts file with "make dtbs_check" scenario, it
> > will fail.
> 
> Yes, I'll push a fix to pass the dtbs_check when this is merged.
> 
> Thanks,
> Neil
> 
> > 
> > -Sergey
> > 
> >>
> >> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> >>
> >> Neil
> >>
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
