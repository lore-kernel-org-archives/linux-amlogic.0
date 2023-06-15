Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104D1EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lnYVmy8QWTbq7M19dFOzJHYi9ReQUr20JvLP9J5ang=; b=LH2MtRGVVdkEdr
	Uv017Gg4VC6+jMbHsje3UwkJWKh0QtFSIy5haXQ4SQULeAli/Di3W1bN677QJRG8uHsBBaRcn2clg
	HLymCnCwb++umlnicU/XGaHIx5ef6KRc7v+oyTyByBCLYBF/v00gYA51nvA+Vc75Y33MkjjrBRZME
	oQtPY5XRAzuGiMlhDGdAC4RQCBZ+wrduxFXkIcB+OzAjKjynSmVkWdU+O316HJaYjAjK1s/Npdk+7
	IpJ78jJYVSI3Oy2Dg8ly8Roq4Bf9lM+SckrPdUnMIJlmio1cyhXJYuTORPJqWlLoB+g1TiIwmOl9R
	iiFIVnRViZkC5Ei7Q3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9swd-00FwiX-1u;
	Thu, 15 Jun 2023 19:47:47 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9swa-00Fwhp-2D;
	Thu, 15 Jun 2023 19:47:46 +0000
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-777b4716673so1808539f.1;
        Thu, 15 Jun 2023 12:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686858463; x=1689450463;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BoanQllugvdpQeDJKzQh2Vhxrm51worbUy3JNVYOXfY=;
        b=BNXrgrB5A+fYZ3DYKJFBw+LSdczTMkpvWNpCWTEK4jaAHds1o2N4VKfI0kMPyeH+ch
         IgH06ktER53qsIH/lYfRFlT4djaiWxtmcoR/qeTzPSgDJ1OdysP6jIVtbntDchVtTAuV
         ouYsh5sgi5hyZhkD8Y8+jZTasHAoiM5a4GC7OlLYYa63xqtOqc+Fm3oAaemF8C48mbid
         5BtukFe4sls3Z19x4snSeetxqZXEsT3DpMXvZEVyr3qvOk0i7EF9zH7ZjkXcwqB4FnqM
         ArcKafGkiy5GE4BncmF1qBqFZBOdFJBonPLmWAeAhWjtFWZQrx2ZSZcdQGYES9vx8PN+
         cxew==
X-Gm-Message-State: AC+VfDydowydSBaErF3BrCGt9AUiSq0qcK7+KMUDja1s+//saLXJxZon
	Vn2vc5R0Zcf/SVWNNHa4Qg==
X-Google-Smtp-Source: ACHHUZ7d3DvP7l3zfWutNtmjbI34IfXHzMgmlTEjZRNw9Rnk5sVkcDsBlAlRpDu33vLwLk+wRDNwjQ==
X-Received: by 2002:a05:6602:2d87:b0:774:9415:bed8 with SMTP id k7-20020a0566022d8700b007749415bed8mr4195831iow.10.1686858463454;
        Thu, 15 Jun 2023 12:47:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l17-20020a056638221100b0041f4da30787sm5696946jas.167.2023.06.15.12.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 12:47:42 -0700 (PDT)
Received: (nullmailer pid 1560576 invoked by uid 1000);
	Thu, 15 Jun 2023 19:47:40 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: linux-amlogic@lists.infradead.org, Artem <art@khadas.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-serial@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Nick <nick@khadas.com>, Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230615182938.18487-3-tanure@linux.com>
References: <20230615182938.18487-1-tanure@linux.com>
 <20230615182938.18487-3-tanure@linux.com>
Message-Id: <168685846058.1560559.10275388482372807124.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: clock: Bindings for Meson T7 clock
 controller
Date: Thu, 15 Jun 2023 13:47:40 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_124744_728492_B7DE00AA 
X-CRM114-Status: GOOD (  11.19  )
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


On Thu, 15 Jun 2023 19:29:34 +0100, Lucas Tanure wrote:
> Add documentation for T7 the clock controller.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../bindings/clock/amlogic,mesont7.yaml       |  69 +++
>  include/dt-bindings/clock/mesont7-clkc.h      | 487 ++++++++++++++++++
>  2 files changed, 556 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mesont7.yaml
>  create mode 100644 include/dt-bindings/clock/mesont7-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,mesont7.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/clock/amlogic,mesont7-clk.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,mesont7.yaml
Documentation/devicetree/bindings/clock/amlogic,mesont7.example.dts:18.32-28.11: Warning (unit_address_vs_reg): /example-0/clock-controller: node has a reg or ranges property, but no unit name
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,mesont7.example.dtb: clock-controller: reg: [[0, 0], [0, 1180], [0, 32768], [0, 800], [0, 57408], [0, 188]] is too long
	from schema $id: http://devicetree.org/schemas/clock/amlogic,mesont7-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230615182938.18487-3-tanure@linux.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
