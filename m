Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D815C46467
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yms0R6YC56nVVmBpnJXM7KJvs/1m7s3MoKIH2akdnAU=; b=rrMuMnAsrLIb1y
	HlhpzGYYie8r+8AD3W+3SyeykkU9rhxsAQNySTWfAJaFIA6gpBgE+FeeTQ0JU5zPcNK8HaP5OTFWa
	308rIl0fGuhWrEQnpU+ZtP0wTHZOiwa4NuLfqhBlY+fcpwVdVJQcPJ+TZZpfB8gnM7WpGwiloufKX
	eaaN8Vhpt5rgCxy60bf0i0ixYPT9tl2uhR50J3xA7eEJOldodJIXzPeP0t4w1+TCNqrR0RNaKx760
	WtIYToXkSHjkxdrcfcav2E0qFtlsDtvWUjKIXFdxGSC5DSkAs3cxKXgN+E1tD4FMN9dUptmSjYBiL
	IZnSJn+eBu1CkA3iB6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAh7-007RmN-L0; Sat, 07 Jan 2023 15:01:13 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAh4-007RkN-2d
	for linux-amlogic@lists.infradead.org; Sat, 07 Jan 2023 15:01:11 +0000
Received: by mail-vs1-xe32.google.com with SMTP id h27so4346124vsq.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Jan 2023 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gN0b8GLZtqDqOVLUZ6Zz+XrKDlju/yDUolOd415APRo=;
        b=QU7bsGI/KUKdsezLj8gIOhr4SscvGbhYdFzS79Pyqja+wu9tVXdvVc5yaA9WLbuXOV
         7BLBouWGgQpp4/74pQRgtaHQiGD2vO9lIBPa2hw9shS06mbo4+am2+neXxovqRiP4zeX
         atlXX5lM+jxxuRsmW2NnCPx91U/dZl4Cqe8dEz+1aTnShXdVypKoMXUZ54foEEmRbXMJ
         O6HMz6X9u43TLQ1W6rsJi9civabMPlADgrR9hXD0TYQb+nqKOQCnkuOnIboJNwIro/mg
         2zqWpu3q4LDGYl0Uyj/Epu+c7sXDrdg2cVNhLus7IR8m3A+OJqkk71TMbYLYoSSwJgWo
         ZCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gN0b8GLZtqDqOVLUZ6Zz+XrKDlju/yDUolOd415APRo=;
        b=fee/L2u7fYvZcEYC5mzlbkG1r+hgG0O83XmuGVcEGPdyiHLsj1MWq5e25nL5G7JhwM
         cOuGYEoIU2GApz3cWKSYjN0D8cnNk0FHi+P+pz2q3DWcO6eOTTxB7Nvsl7E2hs9sHrqc
         ZkgX8DQmCGaulebpF/dpHjnUsgGhRr81UxR143GhtW7k9ZWsptDS9Et+FiAMBrTZgSJs
         Fq6oYzcW8fcja9x4z2zVBx5BZXkz7sjLngpDQ4Z+dHYtFBKGfZtUscnMUhnVnMVnB5X7
         SA47uGyQ9RGdwUGWpG1eW6nsnfJcL5pDsW8fJlTSCZLcTG0gs55wwqKsnylHyhA/wzfo
         86Nw==
X-Gm-Message-State: AFqh2kpYocjcp20YXF+yLPAPIt1Ebh+GxzoPBZ6a0zhSS0aXXL67R5MI
	P2ZDuiHThQr1y4E8Ry8O+NsHXYiRZ792kt5JjQg=
X-Google-Smtp-Source: AMrXdXvWo3inc/U3YtP6hG72GMVCNJmeyWlS6d5m4UwsQ7/lePrxejZKskx/Z3RdHRkyL7EpoGcdGP+p4OV7hupKci0=
X-Received: by 2002:a67:d991:0:b0:3ce:8b8f:b8f4 with SMTP id
 u17-20020a67d991000000b003ce8b8fb8f4mr3297389vsj.46.1673103668099; Sat, 07
 Jan 2023 07:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-9-linux.amoon@gmail.com>
 <Y7X/xadXIA2f9lHz@google.com>
In-Reply-To: <Y7X/xadXIA2f9lHz@google.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:30:51 +0530
Message-ID: <CANAwSgSMrQ7v=7-CmnXC0VCerFB0nroDPHuWuCDWZD6Oct15TA@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab
 VL817Q7 hub controller
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_070110_204404_DB054BA0 
X-CRM114-Status: GOOD (  26.56  )
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

Hi Matthias,

On Thu, 5 Jan 2023 at 04:07, Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Wed, Dec 28, 2022 at 10:03:17AM +0000, Anand Moon wrote:
> > The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
> > features 4 downstream ports, an internal 5V regulator and has
> > external reset pin.
> >
> > Add a device tree binding for its USB protocol part.
> > The internal LDO is not covered by this and can just be modelled
> > as a fixed regulator.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> > new file mode 100644
> > index 000000000000..4ae995160fd5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Via labs VL817Q7 USB 3.1 hub controller
>
> nit: VIA Labs VL817-Q7
>
Ok
> > +
> > +maintainers:
> > +  - Anand Moon <linux.amoon@gmail.com>
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - vialab,usb2109
>
> This is not a valid compatible string as Johan already noted.
>
> Besides that the VL817-Q7 provides both a 3.1 and a 2.0 USB hub, which
> are enumerated separately. Please also add a compatible string for the
> 2.0 hub (assuming 0x2109 is the 3.1 hub).
>
Yes, correct,
actually, I would like to rename this file to vialab,vl817.yaml
since vialab,vl817-q7 is used for USB 3.1 hub and vialab,vl817-q5 is
used for USB 2.0 hub.

[0] https://datasheet.lcsc.com/lcsc/1808111624_VIA-Tech-VL817-Q7-B0_C209756.pdf

> > +
> > +  reg: true
> > +
> > +  reset-gpios:
> > +    description: GPIO controlling the RESET# pin.
> > +
> > +  vdd-supply:
> > +    description:
> > +      the regulator that provides 5.0V core power to the hub.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    usb {
> > +        dr_mode = "host";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        hub: hub@1 {
> > +            compatible = "vialab,usb2109"
> > +            reg = <1>;
> > +            reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > +        };
>
> Please also add a node for the other hub and link the two nodes with
> each other through the 'peer-hub' property. See realtek,rts5411.yaml
> for reference.

Ok, I will update the example according,

Thanks

-Anand.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
