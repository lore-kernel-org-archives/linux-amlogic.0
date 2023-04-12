Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD94C77B6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2fYxyVbj2bl+D+9A5+90GVWrzr1WHL6VJVhLm5cLQo=; b=r4M0oVAuAeuXvQ
	2vj8ZahDrHqmPp6OD2O4oXGaHs6Sy33Q6wxx11V9kVd4iSGD3MNsKZMlKdsbK0wuwx26z/VVJ5X3M
	lAmoaQAv8iJHraEg9qsfaRa/L+oFA1q5j4OOSVrVq+4y+RSwNVO4ltxysuADez2jOPAOjD6CNsvwm
	D5UFKREDK7MHGgjdZEh0xvvWJr31YhDTopkj0ju4Z4MflZiqTjLtvd86Mr10sY1RMbAqfIcJWbMVY
	RE7tI68XNo93+0N9Akt8vIZ/nwdfbdLpO/XvNXHBOyIA9yfbiNGovuONfc9XZzHSkfMHPbjrpLh8f
	mYT/UcZduhnEKjWzphCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaoI-003ODF-08;
	Wed, 12 Apr 2023 13:46:54 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaoD-003OBj-2H;
	Wed, 12 Apr 2023 13:46:50 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1842eb46746so13749444fac.4;
        Wed, 12 Apr 2023 06:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307206; x=1683899206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMIsbHNnroLWpq0bCS+nidwmOEDa42ufuQvEvuau8Vo=;
        b=2Tl9sjQZRXVHS/1wpr86qhylIUetxG4b9xBVDnd1hkfreSVnB6bsUc/UyHqwDb+EAM
         a8P6esQonW15qRruiuIEXckqVo2FYK/hLJ1MaSJlrnkhEVJospo59j/6NACPsfzlk8Rc
         lqkJRdpHGRFes2ujXcHvyV5R3s28kOkrq/OCZAo0aSVcKtl3sz3jnGbkfp+ofLVni5wZ
         yjxpsIFJ/HgvAlZbCP1TEg27qGt0PcK24phqTTUR5t6/Bb7MNzPYOuWe29t5jdBENzV5
         aTj3jhCBVfddItNjB4q63fY++3xOC+AbXPlfD5hayfFAInCCbfTlJ83stsjHSTB8pwuH
         6MSg==
X-Gm-Message-State: AAQBX9dgKTjfn/38mWZcO/yxDESu9lpL0E1SaUopZNvhF+7wi1cEvPQN
	6upa/ctqnrFK0/FwvuQbOw==
X-Google-Smtp-Source: AKy350btiGupIrvvLRbguGEmiks3gnNC3F8BxcxIKf+7+nVWNNkVrB99ACrNuK4eYRd9VWILOpnecw==
X-Received: by 2002:a05:6870:4608:b0:177:a1ab:8c53 with SMTP id z8-20020a056870460800b00177a1ab8c53mr3642678oao.12.1681307206210;
        Wed, 12 Apr 2023 06:46:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e5-20020a056830200500b006a1287ccce6sm181638otp.31.2023.04.12.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 06:46:45 -0700 (PDT)
Received: (nullmailer pid 2218307 invoked by uid 1000);
	Wed, 12 Apr 2023 13:46:44 -0000
Date: Wed, 12 Apr 2023 08:46:44 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, khilman@baylibre.com, mturquette@baylibre.com, kernel@sberdevices.ru, martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org, rockosov@gmail.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com, jian.hu@amlogic.com, neil.armstrong@linaro.org
Subject: Re: [PATCH v13 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <168130720431.2218249.7671061964988064525.robh@kernel.org>
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-6-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405195927.13487-6-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_064649_749065_C3901630 
X-CRM114-Status: GOOD (  10.53  )
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


On Wed, 05 Apr 2023 22:59:26 +0300, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 Peripherals clock driver,
> and A1 Peripherals clock controller bindings.
> A1 PLL clock controller has references to A1 Peripherals clock
> controller objects, so reflect them in the schema.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   5 +-
>  include/dt-bindings/clock/amlogic,a1-clkc.h   | 114 ++++++++++++++++++
>  3 files changed, 190 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
