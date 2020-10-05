Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F6CC4363D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 13:51:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E772F20674
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 13:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="epgyJqED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E772F20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0SB+PD+4+JNzX06WP/ziHZIahsqwTqoF2fP76vKko8=; b=epgyJqEDtEKNWXsTXeIalTJPl
	hamSPkkaXu6zQcX1xdueNKMzME8YdedtyUNQbsM7X3Ps2pZP5CMze8iYCDj6VXIZ/t1KV2MzK4gum
	HPQyWQAJR4J3DHYSqr1OJ2CVzw2gbh0OpAd9cXIGf131DORwCiHZXogpawasS4EoJdZ7TEAKliBPW
	z1HWyWEn6VPXhH5KLEoCxqPNhRvL1g8BoQ2TKfEP++nmclI43UAk9mm8dXmJIgSahG/Lvrj+VMXEt
	vUQ2OSwPiHE5HXivao/TO/tM7hiyMeySx9KeHWBMR2cl9glQ4snJUaRLTiRT5HoNSZfJQJZWUBy/A
	zcfGfXB+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPQtx-0004ls-Cz; Mon, 05 Oct 2020 13:51:41 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPQtv-0004kl-C3; Mon, 05 Oct 2020 13:51:40 +0000
Received: by mail-ot1-f68.google.com with SMTP id s66so8647909otb.2;
 Mon, 05 Oct 2020 06:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+6o6Nhko1kPIF7bb/D566IYk+rcVxOYL8hgnCF/Sb70=;
 b=hDEeH9cnqF4bDA8mUkfgsZKiYGF5CYJsLr77PzZJ/qs4lHXxT7AUzN+OQF2iQGiPom
 n95bMaRihocfumZ1/gbmnZHzMVIcJ7YZUF44QAn5TZSOd1o1LeI+hxRJtZ7W4AXTBKMb
 Bhv8BVFtBO/1II/eKQ46c/ricy1sxm/LXHXbHxwqxGUD2zsF+TZuJOUmwjkQMEMOTi7X
 iei3A0EdJRFyr0fMqOjc4ep3cQBxqbSaH7/06h2koXUiCGp/J6keYdchLxn/zo6iM0ia
 xQUQEdU9YeBVil0AFPaUHyGQ2Li59X9R7pdGN4VX/BjGkou6R9UYP74b3pQp9XGeRoK5
 AkeQ==
X-Gm-Message-State: AOAM530v6xarBn9elqSMOY1OeT8GwXd6BiNA35eaTkFZOOcFOaHJNFnw
 4OHi0c7PGw7QgKHk0j82rw==
X-Google-Smtp-Source: ABdhPJzAwIYiizyypF4j0t0rpTJ8sI9zgsna996D0Xvsy6AB7FQrOTjn13rToJHrnoBBPZBd3LbU1Q==
X-Received: by 2002:a9d:71ca:: with SMTP id z10mr11677488otj.307.1601905894166; 
 Mon, 05 Oct 2020 06:51:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m22sm2883051otf.52.2020.10.05.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:51:33 -0700 (PDT)
Received: (nullmailer pid 82320 invoked by uid 1000);
 Mon, 05 Oct 2020 13:51:32 -0000
Date: Mon, 5 Oct 2020 08:51:32 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201005135132.GA81148@bogus>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_095139_425335_73EEC158 
X-CRM114-Status: GOOD (  16.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 01 Oct 2020 01:46:32 +0200, Alexander Dahl wrote:
> The example was adapted in the following ways:
> 
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules
> 
> License was discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
> 
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-pwm.yaml


See https://patchwork.ozlabs.org/patch/1374765

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
