Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B046EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7+2H3ZXhJ3hkDEypascPgXdFBBrm1r62j5JT9hUCXU=; b=FVW/9Duq/7J/uu
	ddW6reVmb8P++M38vcrb0HKMHUcNdFu5+ue/hS4TVDq0ZeG6gyvsQkPh2L/uvQbPfop3ieKXlxTKb
	Y5gtPUgMYOdG7XihxWMh9F+p1y+HmcMx0wabr9Q4NJt4ZcrsToArWS3T11bK9bAb5cPtPSkqpH6jK
	W01xdf23anY8h3huzXwYW4A1IIJuK4hO0J95B8VXlL0J0SeZ1TOiBhj1JSOOhdDCZmD5JCjpgZQIJ
	0caNVe/RHTFaHJhbYIo87MqzOp4qDIai1d7ZOXCZ7QvapF1bqnwYr4uDYFO66qUYpBUHg7T7y6kqB
	x9VF0HGow5pGsnR1Hnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnQg-0053Lv-16;
	Fri, 07 Jul 2023 15:31:30 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnQe-0053LP-1B;
	Fri, 07 Jul 2023 15:31:29 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3463dd0bd4eso6893375ab.1;
        Fri, 07 Jul 2023 08:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743887; x=1691335887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4krSfV5RdVLkdj4vMo1p32Ocs53a/+FB/VamolfXKgk=;
        b=XCjedBH2iJr67W32EJyDp1XvAlh+kWFn29dQ65wVQozgyf8rr0Le7hcjeJaDcmFaJ3
         vLElM3oWE0kYn6LH488aRfJ5JXP43HlE1FcYH22hiEeDSEsXtdm881r1OIgOw+jn8hXg
         gnzSZ2ZssQyBtzfY+xA14QWKePluznOLAkHFiLjtfV8Gzp8StZrXjKu5I2AkfEfz3Axa
         8e8r9fK2aXx2IRH7LRp7SBL8KKt89PKAkgCI1XPy/eK875RFIk1BskAV7dViA6lIKHB6
         o2KeRs00yHtEpfIzlxEEolELp4yzgs1vytrckZs9HY4hISf1r7/IsfCVuTbvCR3bnMdi
         CR0w==
X-Gm-Message-State: ABy/qLaBCpC9d1OZ94m8oDNjq4UxlQ+ioM8kLZOwscgpU/tFmzT5IBxz
	14/10J1ndb17V33nIOl4EQ==
X-Google-Smtp-Source: APBJJlGsBsKFeZBb8fU2bcyVgRL9aJv0pp9rDtUdPfMV8gTZk6+GrVqq4VjMLpT6v23Sh93K9+x0rA==
X-Received: by 2002:a92:c083:0:b0:345:ba42:ca4d with SMTP id h3-20020a92c083000000b00345ba42ca4dmr5490944ile.15.1688743886724;
        Fri, 07 Jul 2023 08:31:26 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w5-20020a92db45000000b00342093347d8sm1346438ilq.76.2023.07.07.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:31:25 -0700 (PDT)
Received: (nullmailer pid 339098 invoked by uid 1000);
	Fri, 07 Jul 2023 15:31:24 -0000
Date: Fri, 7 Jul 2023 09:31:24 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: amlogic,meson-pinctrl:
 allow gpio-line-names
Message-ID: <168874388364.339042.7246831191006264441.robh@kernel.org>
References: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
 <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-1-2160060446d7@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-1-2160060446d7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_083128_403082_8E48A461 
X-CRM114-Status: GOOD (  10.06  )
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


On Fri, 07 Jul 2023 10:20:44 +0200, Neil Armstrong wrote:
> Allow gpio-line-names property for the gpio subnodes.
> 
> Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml         | 4 ++++
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml | 3 +++
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml          | 3 +++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml     | 4 ++++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml      | 4 ++++
>  5 files changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
