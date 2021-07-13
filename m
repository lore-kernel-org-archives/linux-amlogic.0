Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB9C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 15:10:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CAA46128D
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 15:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CAA46128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ1pg27CvibAyVysuFHIsrRqu8RMhK6wHeKm992LcwU=; b=qFRykgVWlsnFtz
	wmR3AO87wv5TeFPmoH7uyg9ITvUQJJhSPFJCv2I7tqnOVzmSliVtYyWzZhm9ORhemcZIG6t11ElAJ
	+NdoJ/BB/h6n/DCsig0HKJtgtN9t2AJkUfFOIh3uuuxGd+K6qywm33P4GMuzGq11Fw3XOWCdedia0
	rcQ15NCvzpO8Y3csH4O3VBSITy27V1CPgcrK3kOsrhETCEg9hZLkE2kgSgVH6/1wYbUDWC/cRbKZb
	E+YGXXLbNcNxKQZhcMGsszo9GxRG1qV30APoN/ysyGsApB5FiisxZ/Mkr9lrNSS0KjxirDmqiRStZ
	g/FGqGT/wOEcb5esbZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3K3Z-00AkaC-40; Tue, 13 Jul 2021 15:10:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3K3K-00AkUe-FE; Tue, 13 Jul 2021 15:10:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id x17so2314493edd.12;
 Tue, 13 Jul 2021 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GXSApPPLGUhhXM/V78f8wajJ1bbfuwFyK0zy0kRxBqA=;
 b=tLM2bZBt40bgP5Vo+Gh6dkRxvT+9Sr8VSaJWjxsi90cSlMfCWM90/OhXLI6uHq7BtK
 RpjBkoU29VPD7/3V5PLHRn4dGaWEy22WHP4FX3DMYZYT50UyPrKKZ8g2+Q1C8JPfP4OI
 4Kmw+o23DEBPHF/VRXclj+xENv2LnWhMDnV/OsjbkihotRXXfd+vdYhIxKYt/OCrtItf
 aKVw6fB4kh/6ZDsK35gAKPc//Ibd4gHwno4abwP2H6BPrhpPP8anuS7FOl72RwJ+BbA2
 DVy6NBq6+XZzdj85xrqyZ/LYLvOjoysbhEzBfDiidmeZAGNXiOFGhA1UEvWyZNBgSbDB
 E4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GXSApPPLGUhhXM/V78f8wajJ1bbfuwFyK0zy0kRxBqA=;
 b=EP6fHsvHgT1P1X42+MFt2kwyu0wxIGWzDedmXY+1X94yrcsFW0yehTxM3UhyECg8tQ
 8LlImSr1BGWDFUuw9A9P8GDSejnfg+fAGcwmWM7xE7AfpYpFaB51UWd09pyoElfxqK/k
 GyaBB7248pp7QWS11W+Ifwec2SFVUu7NepslOZ3D7WXP6avYwGdFY5HbsuMtonwumHMu
 3uX/xuSDn+hXSMRqIj5djny25Edd5CPwOmTpT2Vab4WnKUiLROnph5xk5D65dxjL5wvo
 rUt9obmiUi+79Nd0brKJm2fJkEGKMAf62RpTOfegTkvDu9m4X3OCUFUzJstV0us+e2ET
 N8kw==
X-Gm-Message-State: AOAM53034qOP3iPX7yIoHIHER4pOJLKhFRqCBBCbwB3QnSkYgQOjD8lh
 MkOXCNVMq9Ds/QOlfEB6eb0xDRtfQeQ1tFyBPfQ=
X-Google-Smtp-Source: ABdhPJzCxYkRS51Xrr9LI81R5hzAdh5tZIviK3d3m2EE0Sh2KMgNVn6R7JxtZZxPw8xNgGZ3DtaTSVLMPZOFuUzzmYk=
X-Received: by 2002:a50:fb04:: with SMTP id d4mr6302757edq.143.1626189026249; 
 Tue, 13 Jul 2021 08:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-3-linux.amoon@gmail.com>
In-Reply-To: <20210713055227.1142-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 13 Jul 2021 17:10:15 +0200
Message-ID: <CAFBinCC9rR1F7Fgg5sao4h3qtFZU6OTTJMgmSJMibyBv0nGjMQ@mail.gmail.com>
Subject: Re: [PATCHv1 2/3] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_081030_552595_ECBE0988 
X-CRM114-Status: UNSURE (   7.22  )
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

On Tue, Jul 13, 2021 at 7:53 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Power off the PHY by putting it into reset mode.
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
based on code from the vendor kernel [0] this gets my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


[0] https://github.com/endlessm/linux-meson/blob/0672f0b61eb92ba63c91d858a678d2c3a0bba06a/drivers/amlogic/usb/dwc_otg/310/dwc_otg_attr.c#L706

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
