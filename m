Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7FAC4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTsIG4bScKZ/QFJ3MrHEVuBWW980l2wVBsP1TOZirmg=; b=C6YfEq2Plij+ta
	366Sf1FoZ2hh7epFGkNT7u2BfRMMnaAUHAyr6GkLNTELcN8f7o/pEdXg1DPApu0xTXptkqvtSJZBW
	5dVy8IIP4J32gAZ81r0AWZgWKSa2ZFdUZ6yUA9P/le+mLwXPEtsv8MRdij5o9RwLZmWqrryboBrrS
	TQMjtO88o9a2WzhOPrlzRXlQ3RVnTQsPM70S9hpSuct6r3n/KN8f+tlMgiLuPt6TJO9HJmflcgEyq
	l9wWxeocxe+0M9T+kf91ppd8SjMozr/OA9HkhXhllIB05UY4y/LvDZF3D/en0HPECIe6l1LMiBhqP
	K7uaXazlp/aTalGFDycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVuQ-004xff-EK; Wed, 28 Dec 2022 12:51:50 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVuM-004xcH-B9; Wed, 28 Dec 2022 12:51:48 +0000
Received: by mail-ej1-x62c.google.com with SMTP id ud5so38183796ejc.4;
        Wed, 28 Dec 2022 04:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bj/ZL2pLmcXfsa7o3GSd/7KGOVFsIvFAmCWaGTxxqbg=;
        b=TJKeuhAUb7ZbCaOdrTkQUd7Z/r49zaO58n0Zv4PflVM5kx/E7dGV7Bc8K1rzlnXGEj
         i5o3LcLDVH1m6fmvJqG0lX7Clr1Cn3YwbUrX7EZxgiXcTAMJgarkvDCjxSjkltL99D9Q
         e4Y8QxpsD/fgWvSA59zanzRiabPEgKbp5bcWE6Gzk2qBM85zIjxTsYnYq6LkZwZvofYE
         BCE3jA11Wb3kiIaaAzEHrfNjmCbsUungBSriRinw3u098ZSp+HznCc88mIRX6XfgJbd0
         WcO0vhFxIFZeMAUuEiMv7hHPcSMCn7Qk/pmWtBgvSPEgC2VybeF1eWfXp12QL1KETVQ8
         D23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bj/ZL2pLmcXfsa7o3GSd/7KGOVFsIvFAmCWaGTxxqbg=;
        b=cAEFXlh1ZBOQaYb3/jHZSH3kI1x3DDzUU22vM9Ei+JZESYoFOOTeQrHlpPJFBkcZy7
         +8Jp3lYtHsdBAW7Qv9x1BMRtTYBqFD2YfOFgEj2charoir9+PuAR/h+kCMf5E9LaDGiA
         /f0BmjqCz5BMFYJ1C6zfrEb+AuZMv2WhHLmYbR+2r6pS7IeySJqJLDyG9jrV9LXiuOK8
         j10gjTyNPK1VUnXGMf1hfNQmGwwQXjH7mepfkdJ4E3SdZGPNsZsRs0iOAuMxyP+Ou+xt
         W0ysAWpgJW20lBsFnpk4QOXQuzSEVG7oivxC2iEEMNnXGSmcRxCE63HSrQFJMIXEB1Xm
         eLkQ==
X-Gm-Message-State: AFqh2kp1eNDy+IVm7gAcVA7OjBSRf68GUOxdQMwiu8wXQ874+gwEzDPz
	5TrdKpozSbPKLKTBmtiOaHmBN5YYX/AvXH+yeFc=
X-Google-Smtp-Source: AMrXdXuldPgrgToRGeOjUGw40QIrUzyl/L/VlUjm7Dv3WJDMBybJwNUKSnb0YjxKfDZiXJU/66WeGLUtchDsNY1LAQs=
X-Received: by 2002:a17:906:e4f:b0:7c0:ae1c:3eb7 with SMTP id
 q15-20020a1709060e4f00b007c0ae1c3eb7mr1575024eji.510.1672231903589; Wed, 28
 Dec 2022 04:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-4-linux.amoon@gmail.com>
In-Reply-To: <20221228100321.15949-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 28 Dec 2022 13:51:32 +0100
Message-ID: <CAFBinCCtJbF6UjG3czQjVy_Zy_B4DO8BkcayOqDirn0OXw3PtQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_045146_445489_93452F3E 
X-CRM114-Status: GOOD (  11.73  )
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

Hi Anand,

thank you for working on this topic!

On Wed, Dec 28, 2022 at 11:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> +       usb {
> +               dr_mode = "host";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               hub@1 {
> +                       /* Genesys Logic GL852G-OHG usb hub */
> +                       compatible = "genesys,usb5e3,610";
> +                       reg = <1>;
> +                       vdd-supply = <&usb_otg_pwr>;
> +                       reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
> +               };
> +       };
My understanding is that the hub@1 node should be part of the
corresponding USB controller node, not a new node.
In this case hub@1 should go into the existing &usb1 node. That way we
describe the way the hardware is set up (meaning: hub@1 is connected
to &usb1).

In case hub@1 is not detected within &usb1 then you may need something
like [0] (not tested for your use-case).
If that helps: feel free to include that patch in your series.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/commit/d8b96e5bc9c20ab2585194e0e59580c3b062c431

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
