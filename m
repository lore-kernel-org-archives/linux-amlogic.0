Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6924C3DA7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ukw2yZo5iUjij0BwFbmZs6PukPHDQpNkDvc6wBVGge8=; b=z1XTBW1URNMMNK
	SVlPU3ApeoE8qjHEpu1RM+Wdq6+pzUwRQ3ovMKftzGIUsKJzPlZGFJtGLS8KWr+3Cd+vL0LFOrKAM
	9IbZDLlOTjDUX73nk8npg8MCS2V0UUDOqK0zZlu8iZta6V/RQoDWaxBM0zd9zlbpODnHpkrJA9mNi
	nrwjUgmWDrEZ451MuOCDtFLhdfHHkbP5EuW0Msyt+iTfSnaFQoSvC7WUM8MrzN4hC4JgFRz6Epy9R
	DM+MAXxYFpKH7bSr3Ph+SS4OWIsqYyUxMOpwqeQojegDatkApEszhBCAgtzse8RD9JA3iLAEYMSr5
	WSi3PAOveEeo/KIHUKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAYCT-005t90-Sl; Wed, 28 Dec 2022 15:18:37 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAYCQ-005t5l-7r
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 15:18:35 +0000
Received: by mail-vk1-xa35.google.com with SMTP id bi24so276825vkb.6
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 07:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lkaAG2YOajQYFJDJM0i4sGT7QKIFbLQrj4z1FPIpfyU=;
        b=GzmHM6smAHp5ldKDKJlC8ic+MWAvqfbXRTL1wMlO/CfghIxbb8H/HXDZO7Lhgg3/3S
         frOyEKhQJ4KfhNbX4Lzp15tOVGSWO9rcTyhipEiTobRnAkMTKNIBS1u4f1bNb4vJHAnY
         +U3dWEMtyGHTX24tbr0KDEFw2rH73lBFA/sDdpG+JPzQLcqE1Pxv1zdvFK5o/RYjDnM5
         WHApMN1UQJCOZG9KcdLwJVwj3NnPRO0nDmXNhwRt+woMVRxRJ9aIb+mwHMZ7YU9OtSdk
         tWjVi7skhMy2t4qa5BzfLGQecEOuNxHctPmpcACjYBbofMr9Hq7rzuWwsvfXKl6OG81s
         8wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkaAG2YOajQYFJDJM0i4sGT7QKIFbLQrj4z1FPIpfyU=;
        b=Ef01DRrar/4b+PWFf0AMNUMMkK7gEwXJcQHw18YrvL4RvvdaC4rwkn4CY/a23fNdyq
         q3cWMw8m0IsCi4pdLMxPNAqgbsiF/AeNns3NQ0N+sMRYgD5mpgk5Pw5nzmsUXle3/uDm
         ACucgbEzxdrwQUTwWaeaZyMAG/y2ia1Y8HYyWYRNC1MlisZk5GnHhGQ04Dkark2mPLnN
         JJGzkR/apWKqz+Sod4S4LHnVtLoioRUkfwtOiSGAxFlPkbEU14AK6JrgJQwGP+hI5xKl
         1+aiqu5hS3VjwEkFS/bh4zaZldJBLUZLr5NtEkG4xB440YFrH48jaOk7L1/tSqUmC69A
         wrjA==
X-Gm-Message-State: AFqh2kpeYUzk8DSWpGgMbkWMHpj2Gn1BeBbsUJmV7sSV7PHZLdB75Gkt
	Usru0qwOEax3sFXh9MhnRkevb3U+sX28s9Dnts0=
X-Google-Smtp-Source: AMrXdXux0yInKtn4v33xY2OSIkdigLnD4DPsiOKVxemqi8YoaAUVw2IQPco2RqhN0ev+9q2aSW3n/JSRZ8Se1oJX4Wo=
X-Received: by 2002:a05:6122:1689:b0:3c5:db35:9288 with SMTP id
 9-20020a056122168900b003c5db359288mr2701335vkl.32.1672240711908; Wed, 28 Dec
 2022 07:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-2-linux.amoon@gmail.com>
 <d0127811-6be1-4f1c-c138-1e8b0c69aaeb@linaro.org>
In-Reply-To: <d0127811-6be1-4f1c-c138-1e8b0c69aaeb@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 Dec 2022 20:48:15 +0530
Message-ID: <CANAwSgSD_zTmPTJQ7PMDqQeagppv2SsaO9+H2h4XVJdYJAg1Qw@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <uwu@icenowy.me>, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_071834_308550_96E06167 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Krzysztof,

Thanks for your review comments.

On Wed, 28 Dec 2022 at 20:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/12/2022 11:03, Anand Moon wrote:
> > Add usb hub device id for Genesys Logic, Inc. GL852G-OHG Hub USB 2.0
> > root hub and Genesys Logic, Inc. GL3523-QFN76 USB 3.1 root hub.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > index a9f831448cca..db009f3ef438 100644
> > --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> > @@ -16,6 +16,8 @@ properties:
> >    compatible:
> >      enum:
> >        - usb5e3,608
> > +      - genesys,usb5e3,610
> > +      - genesys,usb5e3,620
>
> This does not look like correct compatible. Did you test the bindings
> and DTS? This should fail.
>

Yes, I have done and it did not report any error.

make ARCH=arm64 mrproper
make ARCH=arm64 defconfig
make ARCH=arm64 -j$(nproc) dtbs
make CHECK_DTBS=y amlogic/meson-gxbb-odroidc2.dtb
make CHECK_DTBS=y amlogic/meson-g12b-odroid-n2.dtb
make CHECK_DTBS=y amlogic/meson-sm1-odroid-c4.dtb

Ok I will update this in the next version for all the patches.

> Best regards,
> Krzysztof
>

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
