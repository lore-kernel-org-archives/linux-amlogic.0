Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D2EC43334
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Jul 2022 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H26HQyYD9344gogMW4cijGXpWLItmGQbmNHGWfvQnUg=; b=DFXX3ruMMxWM5x
	xqZtnEhPFLSBS7SE8TrBZqh8Q7tALu4fc9x2aKsFUtzpaDjkbvrLheJVic3cE0203drXD5aOiKWKT
	glIQQRidVO+A/4d5EMeizNf8cSqSU3N8rPG+0Hf+qD89ezJnTzO0S4HZ3DRhzKBQkUq6xboP0OOCs
	rnQZV1+J3gsAPt0DqbOuFQ9hciSpFIVyLPpjU0mIUlhjKqIYUV0m3OfeMh1Saw+j3cVJVnXV70GVm
	xNKeGTj5s3hLivEiS0sxnttT73zZivMLSBLXwKmVcgbii2sUGQKVUEv8fLcamNCKZg/Wuan7/apGI
	MykRtrC3kgeyAkz7eSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLWb-006xuJ-S5; Sat, 23 Jul 2022 20:14:57 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFLWZ-006xt2-3C; Sat, 23 Jul 2022 20:14:57 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31e7ca45091so76678277b3.3;
        Sat, 23 Jul 2022 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+X4NC7HMEsTyJEUED99GQac+kPMykk+7iU8zBxRDHGE=;
        b=qD6L0rW129uoghdib0Q9G8iCt4MzIIQDmVLjpfPnLKnsgSTawoDyQnO4okooE5aDjH
         PGyO/dom29KqMpZq6j9xuMMKm4sFvG7xFUIut4S6oljflTY6nl0klEzIv3OPziSgjjeY
         xOCgneGTnmhLdFMK+tLfXMiDUKQQhRjEoXqqTaiMABTY13yeGmidN5pYuMvYpx1w1lsa
         ZmzNxjoBPOWarqC3zEb9fIUw0apPm2cUcD/EoIp8p8LoVRocNRD3o8nnQfWsMofTP42Y
         3CaodP2cejEzVTdjpwqaazlGNow3ql4budzQnfmVvhVnI80//oyi/HZxaFXMcoLlw4EK
         TNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+X4NC7HMEsTyJEUED99GQac+kPMykk+7iU8zBxRDHGE=;
        b=v8BDha5q/PXedmdLgRa06yWG2o9KlB1g1+C1veipIzpgzphBclGVJmY6SzuuMEesj7
         oTUhj8+NY/U0oJSVbdIzTv8vz0lR3mBUug9SHGD9nCWGH6oAaVN8juCafMVkEkRnn1QX
         4+drTg3COGLTIkqE7XcPhE5BP33n5ccKc2rpc29YEZXaMj1VTJH40on2DQvEE03kP0qz
         yBIhsYv2qctk0hNkGdAQ8FmjJ46H/oRqM2inKjkRS1pSNtfMbrdB9cfc3HbTDGXiyz/H
         zey6KWQ1JBfhpUkymxPq8steJiyFrMszBNMtwqKg0PByighgHDlU0YQMaF6GqzUht/89
         wiFA==
X-Gm-Message-State: AJIora9wT6eFTXquhPlkmM0VodHsz9VGfzS+HWTBx3pMi1YqiIlrcZ0P
	5/lD488MQjbPymHav8qpwcqGqn0sItuhHPwQLo8=
X-Google-Smtp-Source: AGRyM1vYUDN9oKNsaAI7c8kYvWmQj0BBWJCpkzl4DX+pkFMOU9ldvjWrh5p69OoFaMiovfrVTmJhy0XPqJxntCk4UyI=
X-Received: by 2002:a81:6503:0:b0:31d:6463:bf1a with SMTP id
 z3-20020a816503000000b0031d6463bf1amr4481917ywb.178.1658607291516; Sat, 23
 Jul 2022 13:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220723155502.127404-1-zhangn1985@qq.com> <tencent_686082BF01D2C0E8027D8CB05DC1C649DA05@qq.com>
In-Reply-To: <tencent_686082BF01D2C0E8027D8CB05DC1C649DA05@qq.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 23 Jul 2022 22:14:40 +0200
Message-ID: <CAFBinCBr=LvMywLJMeSY3bgNPF1tV-Fs4_kFb4jXUm_F20eGng@mail.gmail.com>
Subject: Re: [PATCH 1/2] dts/amlogic: Add MagicBox M16S support
To: Zhang Ning <zhangn1985@qq.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, sean@mess.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media <linux-media@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_131455_351133_5297501D 
X-CRM114-Status: GOOD (  16.45  )
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

Hello,

great to see this patch!

On Sat, Jul 23, 2022 at 5:56 PM Zhang Ning <zhangn1985@qq.com> wrote:
>
> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
>
> it's q201_v1 according u-boot log.
> and it's almost same as Q201 reference design.
>
> add a simple dts to support this Tv box.
It would be great if you could add the hardware specs from the
cover-letter here.

[...]
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 61a6cabb375b..3eac16a4de68 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -123,6 +123,7 @@ properties:
>                - khadas,vim2
>                - kingnovel,r-box-pro
>                - libretech,aml-s912-pc
> +              - magicbox,m16s
>                - minix,neo-u9h
>                - nexbox,a1
>                - tronsmart,vega-s96
The change itself is fine (entries are sorted alphabetically). It
should go into a separate dt-binding patch though.
See commit 3f7dbd336f360a ("dt-bindings: arm: amlogic: add Vero 4K+
bindings") for an example with the correct title and commit message.

[...]
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
#address-cells and #size-cells will be dropped in Linux 5.20 in all
existing .dts files, see [0]
Please do the same.

> +               button-power {
Button/Key node labels are updated in 5.20 as well (see [1], but
button-power does match the recommended naming so no change is needed.


Thank you and best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commit/?h=v5.20/arm64-dt&id=4956be9944d1fb23107f27bad8a2cca0fa167443
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commit/?h=v5.20/arm64-dt&id=4fd9afd894ebe5831dbd737e6ca7b6de14da7fda

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
