Return-Path: <SRS0=4hoi=NT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F619C432BE
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E2E6054E
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 15:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02E2E6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAseInAG9QcdzgIQ7lVzkfcHqcu8Qp8RZkLj9EdHXkE=; b=QwOzW7grgr8jjg
	ZyqRnvpbzBNM7b/1co6CXsgXSsI6dE9Ko6oDBGOYHKNd8rBdUCRvq0Ju2ql+H6Pi0yCFbN4xiIT2y
	4vJT8sp88ekjoLnfnTWVIo10t8XQudhg8eW2cPSJqxCpPnfGQvWzyeawKdYSZyKWbEsgXfNidBhtS
	HgNSlwVYo3bX0jtZzRPdc2D38nBm626de9FpiZ7c/3/qpAFgaVbvUaOggdwOGufk5LzGpZrirQA77
	ZjYJOMD2FE8xoD7K265sumuh9PEGGamPwIvbX+ksdr5jI8vmFi6eTd4qyPym77NWXPH07oxi83sW2
	h7NTxSZURkOK3GgkJe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK0f7-00ERPh-G2; Sat, 28 Aug 2021 15:54:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK0er-00ERNV-U3; Sat, 28 Aug 2021 15:54:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id z19so14532875edi.9;
 Sat, 28 Aug 2021 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/FoITeBxXzYPYRycaXkbD+65bcxuT4OKmmdeFd0Jlo=;
 b=tf1iMB33IgOI69bWgXQProMFN2EETh3i67dsiFkKRxA9NLeh6/9xl9K6M9XrcT0iWy
 ZFmsotmZKl1z/y+aAEirsUT/PDgeEu+8hHkFNzANECFnmGiW+0JmHcbPc11mynjxEMic
 lNJs5eFdIb++dxvldt7ZZffeIIO+sfoUnEiMdH3ya0AdwMdLKbjGoioHQnPksF8rWGy+
 83Sqr5K2gOgs3X4dcCKS3G0SJb9Gqf0l3d2+xcFQbTi1S+hji3XJEbTYGmfhe8Ijqz20
 L5bTfjfw96ZWjA53QnbUO3kfIBZIuW0kIJar0qXdpTEof5ekF1uolgO8nAqtZSW8Mi2r
 LeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/FoITeBxXzYPYRycaXkbD+65bcxuT4OKmmdeFd0Jlo=;
 b=RnDniSFe82+mc3f6Kdmqjs9EOFFehfkE6sAg0qCtwxQabZM193xkERYgvOr1ZkzQgC
 4xFIPWDhYeTyAHz4sttyoyjYotRpKejauDvt4Oqg3UzSWrloZUuZ+roW37mP88SIm2Sv
 t4FG/uoiD4NvYDmnpuRJT8+73z7qIcw2usygKiDtj1yGRDpd/TYonisR6evACIcMzutH
 W/tD/WF5YzvYJvqQ/IXco0WUtYyNNRa6EDXloWWfyD81uPz90+/2yM5BnygZu2jbMXix
 tjLv9qCmnnZ8hpx7p0woVrq6DxtV2Ltmvw176CPLwM9jmz23NZAPGiWWSq79ld+6Co+L
 JaEQ==
X-Gm-Message-State: AOAM530TK7C2w8oM8gqrwQkzIe172aSVIj/5pJZg600ny1kw+r1ImPYE
 ksvvO/3FzateQwS3kL7iSWyfP106lHjJbyVJj7SRBNE5rDI=
X-Google-Smtp-Source: ABdhPJytLQmCtHspjMyHBMTX4NFKx0mMPjNdfQW3zHxrQS2RLqSasQmOR6hdIPX9F0PdpYCg0LBEGk6dpFFYaYQFU7M=
X-Received: by 2002:a50:e699:: with SMTP id z25mr15370730edm.130.1630166044946; 
 Sat, 28 Aug 2021 08:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
In-Reply-To: <20210817041548.1276-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 28 Aug 2021 17:53:54 +0200
Message-ID: <CAFBinCBnH1UqaiuHgTXZTH+RPOwCWiWLVheU=bydS4mfkxTP3g@mail.gmail.com>
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_085414_019447_9AAD15D9 
X-CRM114-Status: GOOD (  13.63  )
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

sorry for the late reply
I have three very small comments below, apart from these, this is looking good!

On Tue, Aug 17, 2021 at 6:17 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing usb phy power node for usb node fix below warning.
> P5V0 regulator supply input voltage range to USB host controller.
> As described in the C1+ schematics, GPIO GPIOAO_5 is used to
> enable input power to USB ports, set it to Active Low.
I would phrase this last sentence as:
"enable USB VBUS on the Micro-USB port using an active high signal"
My idea here is to 1) clarify that it's about enabling USB VBUS only
on the Micro-USB port and 2) use "active high" like the changes inside
the patch itself

> [    1.260772] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
> [    1.260784] dwc2 c90c0000.usb: Looking up vbus-supply property in
>                 mode /soc/usb@c90c0000 failed
>
> Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host
>                 controller on Odroid-C1/C1+ board)
>
please drop this empty line

[...]
> @@ -119,7 +136,6 @@ vcc_3v3: regulator-vcc-3v3 {
>                 regulator-name = "VCC3V3";
>                 regulator-min-microvolt = <3300000>;
>                 regulator-max-microvolt = <3300000>;
> -
I don't think that we should make any VCC3V3 regulator changes in this patch
so please keep this empty line as-is.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
