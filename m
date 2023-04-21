Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6E0C77B76
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Apr 2023 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyEHQ9e8T/ejGBqu+QYOj5tP3Rl2HVajuluj/fHqr/E=; b=nrNTSB+S8kr+ER
	qz5CzYu3TYiH5+UnqwNaR6lxOMSYzv/WVi/EgWk2wPGkvQB3cs9oTLyXvMn3I1b9yJ5UK25SNOCPy
	RPKoX9HQTWTaPmB8ivkJD+G9dbXHOju2XsIfSNADSOQLQApy/yJEWL/n+LLvpnnG+qpl+w2nleOlX
	Jl9w65fztW297VM8bR9pOEM2z7We+JxAp7se+DCVQS/2uC1yyOnZ6XIPQT7PeuFhN/KBAOOTzoFqC
	9jW3n4rHze4EsRbNJCO3OOmHUk2u6DaMgJNlFsaonxkx2vt//mvIG/HufFYKHhFbSMHz50LAc45ng
	B0dQNDT6GiWhnqgi+Wdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pputa-00BXut-2l;
	Fri, 21 Apr 2023 17:50:06 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pputX-00BXtT-1v;
	Fri, 21 Apr 2023 17:50:04 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1842c7c2daaso823103fac.0;
        Fri, 21 Apr 2023 10:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682099402; x=1684691402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+Yw0wBucBO2eV03SjOJLl/RpSRFafXyyDquHk7Jr6c=;
        b=YtKj8NP1p3mRdddS4Uert2tyObulWm7RaCjwP2QyO770Fgiq3dT42Mfbalc8I5A33B
         doMBgooJnlOVXozxF7paojS7YjBA+NULthIU29+BKpTqRbR+9pk7j0oJQlPngGm/ixj0
         u0xEPu51ReT3Pvf5znDitlfpG18w4bRUqvvQAjV5Q4Z+RYgGJ+b2OzrP6G6ElFB+3nwD
         y327We6MbvbJOoOv30RPrhr8+SXKaFH3X9qLGAAgsJR5Tggubzgn7ZJzC5VPWB1KvBUL
         qpb8OrfOtDNW4KlnKtudbo8Lkl1xXsPqTGwnJbv4iKu2xyP/g1rm4NAp1uXJjWSvOMHP
         UVNQ==
X-Gm-Message-State: AAQBX9e/Mgh09x1eq+WTXOnbWKoYHeyB0mTwR344Kwy63mBwHlMAmp3T
	IZcYH1rzdgThU9DCtCz/6RqMj1LTBA==
X-Google-Smtp-Source: AKy350aPQ32Mv080byx+joW6KOyOF9h1ws+ph6JZBWjTq+j0gLXXO/D9blhUaQqzLeuFEAsL2xpe2w==
X-Received: by 2002:a05:6870:d693:b0:17a:a825:6be9 with SMTP id z19-20020a056870d69300b0017aa8256be9mr4436762oap.43.1682099402364;
        Fri, 21 Apr 2023 10:50:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j6-20020acab906000000b00383eaea5e88sm1775777oif.38.2023.04.21.10.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 10:50:02 -0700 (PDT)
Received: (nullmailer pid 1537581 invoked by uid 1000);
	Fri, 21 Apr 2023 17:50:01 -0000
Date: Fri, 21 Apr 2023 12:50:01 -0500
From: Rob Herring <robh@kernel.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, kelvin.zhang@amlogic.com, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, qi.duan@amlogic.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V7 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
Message-ID: <168209940084.1537528.5735682632466385395.robh@kernel.org>
References: <20230417065005.24967-1-yu.tu@amlogic.com>
 <20230417065005.24967-3-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417065005.24967-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_105003_639256_70F80DA9 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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


On Mon, 17 Apr 2023 14:50:03 +0800, Yu Tu wrote:
> Add the S4 peripherals clock controller dt-bindings in the s4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../clock/amlogic,s4-peripherals-clkc.yaml    |  97 +++++++++++++
>  .../clock/amlogic,s4-peripherals-clkc.h       | 131 ++++++++++++++++++
>  2 files changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
