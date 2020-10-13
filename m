Return-Path: <SRS0=MZ2k=DU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D9EC433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 15:50:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE31625204
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 15:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0yWWj1kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE31625204
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QVPSDhDF5rz5q2ZGiJ0ikcgwwUEWFPl4ett2qRO98RM=; b=0yWWj1kCCXzXdCoGT3bUe7DUv
	UoqBJF6vdx0/v2QfS+P4RiQzBrD6Ve8vF+Pz6KCLkwNfecAjvCr/Bo09OR3ONeeddYHdtTtOKxbsL
	79eT2DXtWFWF9VxEOOLHUtaMaZxrtDyiBpulIfO3WUq27ttJQ3jjeHcjNspkV1QiEXpTrC2syQYJ9
	Zg353W0kEP56xXjXUV+KZKrzDRthc32c1QvdDGHywVn9IRjpU7KpQ6QpCcozTLcFSobsx+I20Iu39
	hlFR0cSbzQeV/OjeNveXY1MnJwAYN17xk3ipMl2bHX75ZJFik+cuNnm+8OQ1PuKRdnsrPi3uCWQRk
	VtBDOW6GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSMZN-0005me-VX; Tue, 13 Oct 2020 15:50:34 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSMZK-0005lX-R7; Tue, 13 Oct 2020 15:50:31 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id BDADD8030865;
 Tue, 13 Oct 2020 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSgFyl4htUsp; Tue, 13 Oct 2020 18:50:21 +0300 (MSK)
Date: Tue, 13 Oct 2020 18:50:20 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 16/18] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
Message-ID: <20201013155020.l7uqti25kk3mhdmy@mobilestation>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-17-Sergey.Semin@baikalelectronics.ru>
 <20201013124203.GE3269269@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013124203.GE3269269@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_115031_009772_48DC5479 
X-CRM114-Status: GOOD (  14.40  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, devicetree@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 07:42:03AM -0500, Rob Herring wrote:
> On Sun, Oct 11, 2020 at 01:41:19AM +0300, Serge Semin wrote:
> > Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> > generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> > both of the later IP cores let's make sure that the Amlogic G12A USB
> > DT nodes are fully evaluated including the DWC sub-nodes.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> > index 88184d7e26cc..3e8ac0ff90de 100644
> > --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> > @@ -78,7 +78,20 @@ properties:
> >  
> >  patternProperties:
> >    "^usb@[0-9a-f]+$":
> > -    type: object
> > +    allOf:
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              contains:
> > +                const: snps,dwc2
> > +        then:
> > +          $ref: dwc2.yaml#
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              const: snps,dwc3
> > +        then:
> > +          $ref: snps,dwc3.yaml#
> 

> It should be enough to do just:
> 
> oneOf:
>   - $ref: dwc2.yaml#
>   - $ref: snps,dwc3.yaml#

Ah, good point! Thanks.

-Sergey


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
