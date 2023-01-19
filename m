Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F209CC00A5A
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pMDq8TnJ2B4MTHGWmRrtHZArP0WH//HgOQVKQdCqoE=; b=xgLdJUVvFNA7V4
	RlsXOSLS5xFXil2jMpW3z4VjClSShg7uRaPd3SwZMr95q6MKZnWdEc24z8CW/i+yllShskoHeGoTs
	sojC/I/qU9t+6RWAN8xHDh8za+E6L73KTs7GSJJ+bAua5m1OwHVfNSxIOSYXyQXwIEa4mQcNxHGjn
	6BgAYeqwm49Zmie/V0QqB9svE5sppCbyWWxauo9XTenlvqJnHJ1OacY0da5oXsdcD0wZxSLhVzYcl
	Q2grW1FYfm9RRHN8JIGMvC8KqEJigZYqyx6lHxRtP27qWPcivK8oPnF7w3LbeGcMmwzMBxPrFh2Fd
	RFL6eDJkgzEBdR2c20QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPK9-003qVu-2s; Thu, 19 Jan 2023 07:27:01 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPK5-003qUj-LN; Thu, 19 Jan 2023 07:26:59 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 12so507969vkj.12;
        Wed, 18 Jan 2023 23:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5eBlM9S6kPg63OsVYn1WA2umDAvRg38VWyYh3hm2sLE=;
        b=JpWmIbOb6gGkwcWmUgDpSSEQv1xzP2/Tl2mmQx9xNr4nPJ8p3Bd7lSIDluXGUftiKL
         Dm1DvmGDZIgwZMy8Nx1ZqhpjgP0ArRFW4LU2092czG2wECa/3EoDu22/iXR6nRZnnaXa
         2yUUN9KGbOny7TSpcSMvmM4l4AFUrzNn4syiebiOzyaq3MdDU6HA8lhiMEZpmW8heIGp
         2vDY4aMpBK/dn+qE+7htDMBPYH4aq5ZJ/bc85OZb+OIVzkTHw5ZNNHc1+abyXPkyXBAe
         vdQZTQKOwUGUFyTIJFNM+KQnEg+DYliyXexND5P2GPJBCIoHToc+IEhZPIXZAO/J9j0r
         NgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eBlM9S6kPg63OsVYn1WA2umDAvRg38VWyYh3hm2sLE=;
        b=OSnm5oMQWzCK1ySQPvzjHiQC9k1606wtAIdtkG3T+bIFi+yvtHyN0uVVCCpPM0DWXW
         PiJBSTqZMVnPXKRjN/eGplJPefzz9E+Ae/lvlaMnuuBaGO3McCG5VfmXz+zgGffYtfRD
         7GItVAm1eukQ2ll+eNCsbok8gcgLfnmp46/u5Us+LjNmaY/ROjy3Tnc/dxau+j564WS8
         0qfsoKh/iaIK+48Po3f+fyIRJrjtkV8PnRsOTjJRI/C5HuXvudsNGfOCx6+2s6mXlCVs
         ZBc0Aht3fQ/3xZqcVg9VDh8gXvtwhIvsTZDizOvvCDNE4Y2ai1pXzItzfQ68bbWiingK
         YRaQ==
X-Gm-Message-State: AFqh2kqAaCLxNr7A4sJB7FMa+VCWgoyXOgPW90kR7thZnqmjdSa2MtwF
	Xffux6ETBHCRazA/dxg8RB+1Nsyb6jUOWmdS4rM=
X-Google-Smtp-Source: AMrXdXuSvgPxqgmv5vUfpRjUazPZC3WTcKs4WtJls/xAktAXsSGvHC5Wi7Qhm1/UVmUM73HjQTo8e3s3Dv9BMhuUjUk=
X-Received: by 2002:ac5:c917:0:b0:3d5:542b:7857 with SMTP id
 t23-20020ac5c917000000b003d5542b7857mr1385848vkl.29.1674113213928; Wed, 18
 Jan 2023 23:26:53 -0800 (PST)
MIME-Version: 1.0
References: <20230118044418.875-1-linux.amoon@gmail.com> <20230118044418.875-8-linux.amoon@gmail.com>
 <b112ee8e-93ab-2c30-ced3-82ff858884b4@linaro.org> <CANAwSgQ1b8vj+HCBS0ARnNqOwKHU8VzzsB7htL3L4Sr_v6Y=VQ@mail.gmail.com>
 <0dbefaec-e1de-fc3f-54f2-c5fe75a28c7c@linaro.org>
In-Reply-To: <0dbefaec-e1de-fc3f-54f2-c5fe75a28c7c@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Jan 2023 12:56:37 +0530
Message-ID: <CANAwSgRFGrVePVVWRQHHt_HvanBTVGfhej9MbNHh84+6eqypUA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c4
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	Matthias Kaehlcke <mka@chromium.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_232657_743722_EA922950 
X-CRM114-Status: GOOD (  31.16  )
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

Hi Neil,

On Wed, 18 Jan 2023 at 18:54, <neil.armstrong@linaro.org> wrote:
>
> On 18/01/2023 12:55, Anand Moon wrote:
> > Hi Neil,
> >
> > Thanks for your review comments.
> >
> > On Wed, 18 Jan 2023 at 13:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> On 18/01/2023 05:44, Anand Moon wrote:
> >>> On Odroid c4 previously use gpio-hog to reset the usb hub,
> >>> switch to used on-board usb hub reset to enable the usb hub
> >>> and enable power to hub.
> >>>
> >>> USB hub is combination of USB 2.0 and USB 3.0 root hub so
> >>> use peer-hub node to link then.
> >>>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>> ---
> >>> v2: - fix the compatible string.
> >>>       - Fix the hub node to use peer-hub to link the usb 2.0 and usb 3.0.
> >>> ---
> >>>    .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 36 ++++++++++++-------
> >>>    1 file changed, 23 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> >>> index 8c30ce63686e..d04768a66bfe 100644
> >>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> >>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> >>> @@ -26,20 +26,30 @@ led-blue {
> >>>        sound {
> >>>                model = "ODROID-C4";
> >>>        };
> >>> -};
> >>>
> >>> -&gpio {
> >>> -     /*
> >>> -      * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
> >>> -      * to be turned high in order to be detected by the USB Controller
> >>> -      * This signal should be handled by a USB specific power sequence
> >>> -      * in order to reset the Hub when USB bus is powered down.
> >>> -      */
> >>> -     hog-0 {
> >>> -             gpio-hog;
> >>> -             gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> >>> -             output-high;
> >>> -             line-name = "usb-hub-reset";
> >>> +     /* USB hub supports both USB 2.0 and USB 3.0 root hub */
> >>> +     usb-hub {
> >>> +             dr_mode = "host";
> >>
> >> Is this really needed ?
> >>
> > I got carried forward from the other device tree binding,
> > If not needed I will drop this.
> >
> >>> +             #address-cells = <1>;
> >>> +             #size-cells = <0>;
> >>> +
> >>> +             /* 2.0 hub on port 1 */
> >>> +             hub_2_0: hub@1 {
> >>> +                     compatible = "usb2109,2817";
> >>> +                     reg = <1>;
> >>> +                     peer-hub = <&hub_3_0>;
> >>> +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> >>> +                     vdd-supply = <&vcc_5v>;
> >>> +             };
> >>> +
> >>> +             /* 3.1 hub on port 4 */
> >>> +             hub_3_0: hub@2 {
> >>> +                     compatible = "usb2109,817";
> >>> +                     reg = <2>;
> >>> +                     peer-hub = <&hub_2_0>;
> >>> +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> >>> +                     vdd-supply = <&vcc_5v>;
> >>> +             };
> >>
> >> The final discussion in v1 was to drop this /usb-hub node and move the
> >> hub_2_0 & hub_3_0 node under the dwc3 node.
> >>
> >
> > Yes, but It did not work back then, since these are two different events
> > USB node will try to bring the PHY and dwc2 and dwc2 nodes up.
> > USB hub supports the reset of the USB hub and links the power supply
> > to the ports.
> > This works on this board.
>
> Forget the dwc2 node, the dwc2 since GXL is device mode only, so you need to put both
> nodes in the dwc3 node which is host-only.
>
> Neil
>
Ok, I will move this node under dwc3 node, in the next version.

> >
> >> Neil

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
