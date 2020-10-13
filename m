Return-Path: <SRS0=MZ2k=DU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFC1C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 12:42:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EBA722464
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2020 12:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rfs1LwRv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EBA722464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eGO8oBeMdazwl0nUjPwdLGe2UXGs/xwE5nenHVH4bE8=; b=Rfs1LwRvV/RwYgNZFuMM9APMX
	Wz/04w0sRe4HSt5/OoyJjwR1d7DBn09o3TWkMsPcTBDE7FPncO+CKoDELVIrt8WMGjYsblCv3PUeu
	VUWP7saQ9lkBvxOpjD3EUEEjCWNxfOd3T4Y+kRt0KKJMnoqo+gc8C5LSB7cHxF1zNSMBqjGRU76fF
	SSgfqToNoBJme2QZj73v9DNYyuLCWfsWGNuifkmwPaCjSChqK9cT6Y6UGKFjyTtv8oQWjpSSbryzV
	DMthqnpLQ92HVCktugc8WzgWhfhTT7jqoN3NCdQ5S2iaeyUduPnYv4Pm+Crb7zKPOy3pHIkgtJZw4
	NwaWGFe5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJd5-00072Q-HL; Tue, 13 Oct 2020 12:42:11 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJd1-00070z-CP; Tue, 13 Oct 2020 12:42:08 +0000
Received: by mail-oi1-f194.google.com with SMTP id 16so22282612oix.9;
 Tue, 13 Oct 2020 05:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9a9S8jqFI1z/da5IKYstSGsQ5P0heyKtA+nDpAbWxis=;
 b=gXa3GpSlutM79z3wFDpr7PVWq9npXDlpERgtatk5dq7CpIyhAB5Sq2B0ONnLlGJXFa
 AFv9+KTf4eBvNIMWBcxF2hw3mqez0IogX7WNWZWyNfal19CzFfygSJt067W/Y7hp1iX3
 Mk8iaAp1AxCD+KEBlDYa1cvGpo5x1skhvSVPavllnwX9zYexkZpBtoIYdGofE1UejN8T
 xnAZgFAbJMvUKYtRhxpUaj5YZDk7GOAKA6r3ZTydET/z6ZOSJpecEnh4LnozloPJ1iZQ
 mayQwa++0VAOzXwIHUiY6+ik3QQP3blEVr1GfeKqjQmG/o7/Wc4V7K+i7N8J+S507Bnx
 7DvQ==
X-Gm-Message-State: AOAM5307W4P4QIFk7OdlAEEWmXFZdeUEfOWS5qsm9adYqa7tFHhUzcB8
 vduhWY3fOoIKvsZjpmC/4g==
X-Google-Smtp-Source: ABdhPJzik5HzirfRUO8Rt3aNEPIrxservslx8BbKUyJWQUJ9c+zphQ1dJb0v+CV4goeTVMBvVtFbNg==
X-Received: by 2002:aca:fc85:: with SMTP id
 a127mr14056058oii.125.1602592925132; 
 Tue, 13 Oct 2020 05:42:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o15sm10002746otj.3.2020.10.13.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:42:04 -0700 (PDT)
Received: (nullmailer pid 3312154 invoked by uid 1000);
 Tue, 13 Oct 2020 12:42:03 -0000
Date: Tue, 13 Oct 2020 07:42:03 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 16/18] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
Message-ID: <20201013124203.GE3269269@bogus>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-17-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201010224121.12672-17-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_084207_433328_1426FB2D 
X-CRM114-Status: GOOD (  15.70  )
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

On Sun, Oct 11, 2020 at 01:41:19AM +0300, Serge Semin wrote:
> Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> both of the later IP cores let's make sure that the Amlogic G12A USB
> DT nodes are fully evaluated including the DWC sub-nodes.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> index 88184d7e26cc..3e8ac0ff90de 100644
> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> @@ -78,7 +78,20 @@ properties:
>  
>  patternProperties:
>    "^usb@[0-9a-f]+$":
> -    type: object
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: snps,dwc2
> +        then:
> +          $ref: dwc2.yaml#
> +      - if:
> +          properties:
> +            compatible:
> +              const: snps,dwc3
> +        then:
> +          $ref: snps,dwc3.yaml#

It should be enough to do just:

oneOf:
  - $ref: dwc2.yaml#
  - $ref: snps,dwc3.yaml#

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
