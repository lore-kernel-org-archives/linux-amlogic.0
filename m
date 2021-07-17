Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396D2C636CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 19:58:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCDE6115B
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 19:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCDE6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L25jKBprxstNl1mst8urvs77drHKBcqs9Y4oA0bIKsA=; b=T9ojly36cspk8/
	pm0XVT25T1lA0aacDYMUuNnHgmAav4mjz2hkvkddpVOgmVREdkRyYpLVP/s/Y9pFiADKQsGJqzOks
	BrbE5AkyD+2XUWaKk1UeBA9brVupBdamDrDT538U5xQel/+OvR7QXPO4O/6jgEs9yuV8JWyzkshLt
	reEzZhmvm6ohHl+sLDI3BHoEguqrZwrcZo431x8uoGTG8QgsS9tHw7qYhkb9kiqAjGpoi0DPt2nYr
	iVjrRerbmJvB8OiqTd8f6kR5rtKWVUj9RGo/X4VoYip9b4vEUrmYxQYIbZUFbjL79a1RLNOBnlPss
	VxiW3q01gM5/wMhM1Zgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4qRn-006zkp-DW; Sat, 17 Jul 2021 19:58:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4qRa-006zjY-Gc; Sat, 17 Jul 2021 19:57:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id hd33so20700802ejc.9;
 Sat, 17 Jul 2021 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+ea6pzYYKo4cDkWfiwOdkV2qxIy9/iS07XWyARv99s=;
 b=k9zzhV7x3XfY4+B54dcuottDDUQN6dTRIhvvcrHRAyUaZ0y+GICSAlFzINZI39/EAa
 uYFJ0b/lAZPxBKRxKJUSlsz0w9oXldeDiuWxHB3sMc0a+JDfrOJQiH5p/DFn2M/4ffiC
 beyVRYaaNbVLHmrPE2DkmJaTFZgoReyXGvxAnwmDOM80V64PKJDsw4MwBYPc12bgOPGH
 xqQjhgq5C69moph3jkZmaKgbtkE/MWdyUe23wpqAQTvidhx6HeWOZW1jTJsoB0H9MAk+
 KXoKpphPeZgeNyzIpRvex3tdxNbNTVXdLqdvsOZX6ez09DPrU2Sg8cQ6438yolxsif1r
 uWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+ea6pzYYKo4cDkWfiwOdkV2qxIy9/iS07XWyARv99s=;
 b=RGj/RiNsi/HQdzFFJk5Br5OKx48oZUBCrFibgzpe06Ozi53ZSUNP2CNym2839WyoG6
 wtH1j+feOX42bu+zOBfrzVVYbdE2m5lnJ2YsGKhqtsbL5dvTz8iQCUeqeSnjMQISpRPY
 ANcILNb3gxgAxyigc6cQiMw1WrJfDgxzii2idhOI0HmK4e3Sm+SMogXWSi95BxAAOAQ+
 fdyxrL4dmOHE/M0QVAtbd1SBKnMQgQyHmgUDsSF8xD1PH34bh569IQF6wB+yRfeIy7ZR
 oKo06XO2RrZ5Y4r+PeG6L5nrS+ZrN7zgpj8kfodabtMofqoQLX01n/NEiF4+QTss5M+Z
 LUvA==
X-Gm-Message-State: AOAM530scaXm/Uj5nqJ923e2hoc8CO998bZ2J2yDfOeBH06YNL51A23W
 xVKOpsnhou+t9Y+jPOvyG3YaZtN3aGRWEG5jWLI=
X-Google-Smtp-Source: ABdhPJwvlh8H0pbtNu2RZ2q6pYC+ejnHlQkxWG1NPp1Le9NscIfMxDFiahPNGNWS13bCEbL9N4GHrAMy4iuAXbUO6M8=
X-Received: by 2002:a17:907:9719:: with SMTP id
 jg25mr11832158ejc.362.1626551868953; 
 Sat, 17 Jul 2021 12:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210716144508.6058-1-viktor.prutyanov@phystech.edu>
 <20210716144508.6058-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210716144508.6058-2-viktor.prutyanov@phystech.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 17 Jul 2021 21:57:37 +0200
Message-ID: <CAFBinCBpxcHHDs2cr+V4gDVk48G3+T7V-Lde2CkY6xvVrqixmA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: rc: meson-ir-tx: document device tree
 bindings
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_125750_625838_103D8DCD 
X-CRM114-Status: GOOD (  14.22  )
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

Hi Viktor,

On Fri, Jul 16, 2021 at 4:45 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
[...]
> +  amlogic,fifo-threshold:
> +    description: TX FIFO threshold
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
I tried to make sense of this property but I don't understand it yet
(even after reading the second patch in this series).
A "FIFO" (in my own words) is some physical property of the IR
transmitter in these Amlogic SoCs.
So for one specific SoC there can only be one FIFO size, not a range (0..127).

What about a value of 0: my understanding is that this means that
there's no FIFO. Will this hardware still work in that case?

From reading the driver code it seems to me that the FIFO size is 128.
The driver can use fewer FIFO entries if it wants, but this must not
affect the dt-bindings (as these describe the hardware - they don't
"configure" the driver).
If you look at arch/arm64/boot/dts/amlogic/meson-g12.dtsi you'll find
toddr_a, toddr_b and toddr_c there:
All three of them use identical circuitry internally, except that
toddr_a has a bigger FIFO size than the other two. Using a FIFO size
of 256 for toddr_a is not correct as it's an improper description of
the toddr_a hardware (that said, the driver can still decide that it
only wants to use 256 FIFO entries).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
