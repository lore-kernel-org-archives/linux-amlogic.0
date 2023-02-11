Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C790AC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZMunN7mH83RDgDr11MbY1yY6XqLGD5qLdWlhkQYV1o=; b=wVfBC4nAMciOYD
	Gz8sgoIU7Fv5ly80DM1XtYFHDaxZZT+Gq6HdwLVicZzhZU2pb5XjGtjIoisKmaFZ4Wa/5v5XRfiAs
	ckhCt5R1+oB61Hu0QPVrmc09JI/e+pL8ZdpYtarC6JY3B2Q+gXIzoDHW4/cpthCbPsry8Q8APivOf
	g8IUYW6bVSTCWG6JARZMatqpB0aWAJZ5v6xo5k2IxGUze+Qsn7cBnIFytgfMkuKxluvcfjKd8oA1n
	Yn6ac65D1JU8al0hwMjnYoVUYoSz/VNrGfB378Ol1vM8jxII6qp2ALdHX7/j19zkmnelDq/+lotIx
	wBEXUqmDbdOjapMM4EjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwG7-00AJT7-BO; Sat, 11 Feb 2023 20:14:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwFp-00AJNA-VT; Sat, 11 Feb 2023 20:13:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id dr8so23284084ejc.12;
        Sat, 11 Feb 2023 12:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c9e5tNbxrcBqEtClBWjdGwDiemkYMqsKA+UfmHWi9+Y=;
        b=peycM+ujMjmntXoGI352UOHmuAfZD/7B8Z2kvOo6YTCh/KJgu4kYXEBBuJ9pF6eOni
         n/jkAn2nzhAbTV4i161WMDkjtnc7jgH6wPfW7dTfm6LZTzvHFz+0b1tBY6pHhezeVhC1
         wAUwDsP/tZsr0cvP7ENO4JD8TULOY6hnOuipeT8blB0aYiR/MqF2ycAkRMGv0ChVqUZy
         VRdPfk5vN6lbG8pyVkZcT1tIMr72sRFO6AbBbckRAIs4ZmVOg5r9Jw1PmpQsOeeXhTrf
         H9LT9SRgFrQTJ55BeTGy9aUCDUJFSlMPYeeKk5Npgc1gfYsiMy/iwC/OcluVY3HEeAfa
         8GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9e5tNbxrcBqEtClBWjdGwDiemkYMqsKA+UfmHWi9+Y=;
        b=whJr4kT6N+1HLsFnRyWl9YO4F/2bo8gPUFRlhq5sjA3hBF+byD3QZQNN2DMq0joLcG
         crmdt3t+aixqvB9axH4end7QH7de83FRt2OTr61p0IxQ/MhMkgLqU0dEoEJr/9cjM4lZ
         +Cm2xtzFquQlIHj6M3JRFP9qIUMyv+arDW1R7O6hV167TNUh+2TYjw7wjAKOewbvJDE8
         Mjj/FNzhE+9tKybqa5WX0KU+QYrujNnY2GjedVFnHsUGeALHSMr1sQ7tq28RsupOCoNH
         TZE7BH3Mh986VYZSN2GIhNqgJslxNXcuUrztRNjIetJg8Vsc8ii39sB6/2A2QiwvyOX3
         xj1Q==
X-Gm-Message-State: AO0yUKW7nB6XogOXy9by0ASIo0VN8PSyYB3MPG0dNw4Ry8ng3li0lmbO
	CcMhmGL/uv26OoIyC15SEBnWElqVSpHqO2wuxwA=
X-Google-Smtp-Source: AK7set+CLHA+r6hk9yDAzRpOY5AME8RdEBbntcSFFOqlzGdnQUpD1d7oJaCWx8p2BMFIbib4Qh1NGfRfm+it7DyoINU=
X-Received: by 2002:a17:906:149b:b0:88a:5bed:62f2 with SMTP id
 x27-20020a170906149b00b0088a5bed62f2mr2644188ejc.4.1676146428121; Sat, 11 Feb
 2023 12:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:13:37 +0100
Message-ID: <CAFBinCDEtwVYUB5KTJCQ+1KL5+bqeCNeF4gPe1jzx3SPeftqGQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_121350_060149_3782B4AF 
X-CRM114-Status: GOOD (  16.52  )
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

On Thu, Feb 9, 2023 at 2:41 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Convert the Amlogic Internal Clock Measurer bindings to dt-schema.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 40 ++++++++++++++++++++++
>  .../bindings/soc/amlogic/clk-measure.txt           | 21 ------------
>  2 files changed, 40 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> new file mode 100644
> index 000000000000..77c281153010
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-clk-measure.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Internal Clock Measurer
> +
> +description:
> +  The Amlogic SoCs contains an IP to measure the internal clocks.
s/contains/contain/
It's been there in the old bindings as well but it would be great to
have it fixed.

[...]
> +properties:
do we need something like the following?
  $nodename:
    pattern: "^clock-measurer(@.*|-[0-9a-f])*$"


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
