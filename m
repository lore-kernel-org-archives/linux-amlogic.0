Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C46C46467
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeS3+zGSLp01J3AVQdQqRzJ7GbzXLUAAL5tzTB82FSw=; b=ffa9Ky3bDAVbqi
	xVBLm6UBPj70mgbYgQschxFSD5pZA2RviM2x02Fl4TljEEkVYj9dMx31PKPLhXoA7l/CdsOQtCWaa
	I8WTdu2Ta22J6SEqD7z6ylxhpepxWQMzG0R/BGorXVDWNYlTFvuYvcZ/HACX26TtwFItlyViLjO8V
	Bq/j41vNqdUmZOLYShKqbiT4pFEBkJVfzDuPTAyz77TN2kvt+6J6V26BWdNiM5bHg9oBndSmuZYfn
	05arKZZdczzdglhcQWTClWpLQ9zQtJ7eWPwQI04m/vWgHa52C2tTPwGMEV40RqYXqBhbI0MecrTJq
	+FbSfdDA+/GnUFjkxdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCzz-00DNo0-CS; Wed, 04 Jan 2023 23:16:43 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCOV-00CjKd-K5
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 22:38:01 +0000
Received: by mail-il1-x12b.google.com with SMTP id bp26so5611150ilb.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 14:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcNoql4sxZAAG0Z9x382x27f16j/NJH8gvjDj7DBfeY=;
        b=ohe7m4zraaZuCG6StlOr3NDElGbtNTt/AgB57cgRJ7fR/62RRKlU/4Kkq1hw+ths9X
         H+IwFo9T4WLorbzXH15hXAuWYP0qA7UDgvG6zA0vgTCHsVQaPXB9tzFAp3rNEU/pjGFP
         Aj6X4ML3gX7K7csd049yNiopXlnTHatPghoj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcNoql4sxZAAG0Z9x382x27f16j/NJH8gvjDj7DBfeY=;
        b=0+yxbjRJN4AY670J+zjXdoeoHfNWwkpc2ftAa5+dJ/WIS0YhjZl+ni1VP2R0fzgH+c
         a/vbggk0xQtJqSuw6QYZirXYS9DPf1rlmNvax9LOMoUHkeeWHXs0oEATaczFWRnUiBML
         diW91MLZiPF/A0DRvxQD5X4PDAchNn+a/KWd34Xbo4iZzOopIqNcATN5QGZck5FZbMXE
         SDOnleJ98CW70y/2pZZq4Ud+IFCae3kSoXlP5MVd2BPUkFSu0VYO5/J0UgaufyRX7MKD
         SbzXlOP1/O+TWkxCtfdpnsvoRdVCXPYugHGQwtJvPkncO1/g1Z1yAyuO5W/YYGEn0kEo
         U6DQ==
X-Gm-Message-State: AFqh2kp7lSal7h6QViPO0aYGdq52E7TGKz1J2+IJw2ejS+kVgGTPNCQk
	7ksF4EfP3qPODnI4RB6tl1jBpw==
X-Google-Smtp-Source: AMrXdXsnV5WKBO3y2D9jF6L7JkTbhKxnOGOhp02IPb09JTYoS/rGNOwzeyl6ujdBGNOViFzaAqfhkA==
X-Received: by 2002:a05:6e02:b2c:b0:304:c95e:8c36 with SMTP id e12-20020a056e020b2c00b00304c95e8c36mr39114239ilu.14.1672871878123;
        Wed, 04 Jan 2023 14:37:58 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id r22-20020a02b116000000b00363ec4dcaacsm11304062jah.22.2023.01.04.14.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:37:57 -0800 (PST)
Date: Wed, 4 Jan 2023 22:37:57 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab
 VL817Q7 hub controller
Message-ID: <Y7X/xadXIA2f9lHz@google.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-9-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221228100321.15949-9-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_143759_926007_39820154 
X-CRM114-Status: GOOD (  21.11  )
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

On Wed, Dec 28, 2022 at 10:03:17AM +0000, Anand Moon wrote:
> The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
> features 4 downstream ports, an internal 5V regulator and has
> external reset pin.
> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> new file mode 100644
> index 000000000000..4ae995160fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Via labs VL817Q7 USB 3.1 hub controller

nit: VIA Labs VL817-Q7

> +
> +maintainers:
> +  - Anand Moon <linux.amoon@gmail.com>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - vialab,usb2109

This is not a valid compatible string as Johan already noted.

Besides that the VL817-Q7 provides both a 3.1 and a 2.0 USB hub, which
are enumerated separately. Please also add a compatible string for the
2.0 hub (assuming 0x2109 is the 3.1 hub).

> +
> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO controlling the RESET# pin.
> +
> +  vdd-supply:
> +    description:
> +      the regulator that provides 5.0V core power to the hub.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub: hub@1 {
> +            compatible = "vialab,usb2109"
> +            reg = <1>;
> +            reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +        };

Please also add a node for the other hub and link the two nodes with
each other through the 'peer-hub' property. See realtek,rts5411.yaml
for reference.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
