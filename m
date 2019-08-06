Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1D7C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D7120818
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dzLwFsQl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DqFxHRGx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D7120818
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXfQn/Y0jsA2kQfFv+ydtz0k/P+BaMIN26kvu6U5rWc=; b=dzLwFsQl1n3oCa
	/05KenD5SVtkyugkqkZTfHsGgv4AbOMkGE/gfdO7qDsObWaKT7BQNPBaVjtPZRK5UxkWqyHpdy3NG
	sxW5NMbNH7/imnvEvZgGWwppEReggJbmJYianUflKPUjaoKrv+qXfXBj9zjmJvq/wEQeB41Od1ryk
	E1sp+mE7fm3pWNsftC1QaR9lImI+6Mfw3vSqSC13URAgobidO4+wwxZfade0MUPXrocd8vomX8Zjs
	fRjLQqhRPZ7NvThe+pNewb6mbORkikZlbOnLFVbm/zHYNg0gRpXdIH+u5Q9OxZV1HoeHVABT+hLJc
	8OfW6NvNGwCS8meq7lyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv54z-0000K2-Td; Tue, 06 Aug 2019 19:25:05 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv54y-0008F9-25; Tue, 06 Aug 2019 19:25:05 +0000
Received: by mail-oi1-x241.google.com with SMTP id m206so68298522oib.12;
 Tue, 06 Aug 2019 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r400Du+BdhcnVb2kJzBt3FbA/D2Jmeeyq4b8DmzoTuE=;
 b=DqFxHRGxeE89aj7Qk9S9u07itMR2N59xYxVR0F+sAU1LmSLFrJiN5HAHMwrNQ7ct/K
 v/Ol7T2q+hmaYWo/v48u89lPjO0+affKUKx9WKGXAZC24PwmbvsLZoIya7p5fbOLAJ2n
 Vfjh1pYQtqFV9bPQZV3NzTUSWkyGQVqTuN/t+aTTX0L110+DIMg7MCDXx9aODVslSRu7
 RW336Yu4K8W4yAjoSIY798FPBJ/9yYeSQE+nmNFR0dvGLms4arFI7cI6CtDcv084cWgN
 B6PicJp3uO+PPhozN3GtrB4EvahPkew5AqhRv9De+Lo6PYBRI1Ey2lR7vitHuRFnrFXf
 jWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r400Du+BdhcnVb2kJzBt3FbA/D2Jmeeyq4b8DmzoTuE=;
 b=RjpT5WcaPJ//ps0K2NhlbKaSXNw7sjjn7jYFfJbIy4f6vDMoJHN6uakOeXP0ltRpKx
 FlODDfeDcEl05nccyllI6lU3UQpQZo0yqViBNcWT/XMlK30iVowtyCch1UyigB4kyuRu
 IBjYNXTCjj13v/wau1+MpDi2MGdlkWQyzTtTXjrsBRtTb/ZY2elHrkftcWnwYPRyTnQd
 uAxTK2BMYEeqZRizSA131mSH+51bJHOOI0tprGflF8i2ABAZN/pI8PVZXMnHBDu/RWrJ
 FWUgSG0+LpSrFTaaWcIZ5V91BPJKPIBng8pUrcKHYCKKsLwpupUEH5EdV9Vx/2kk+B2v
 NlRw==
X-Gm-Message-State: APjAAAWU7dYis5CQNu/CaCLAHidBUPf0WofVIY/71u9Kjk2L0OkyyYL1
 ip8FVLGSFwPMZCFgAXiqMpIhKNiLSXwQuHb/ulA=
X-Google-Smtp-Source: APXvYqwewYkUVdiv1FBOEZMeibK2YzRko0jtbtspzjUrql75NVp+buCLmwAHPvJS6h0/N8GPAo9FKa2th99cIPmU6t8=
X-Received: by 2002:aca:4306:: with SMTP id q6mr3731470oia.39.1565119502665;
 Tue, 06 Aug 2019 12:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190806130506.8753-1-glaroque@baylibre.com>
 <20190806130506.8753-5-glaroque@baylibre.com>
In-Reply-To: <20190806130506.8753-5-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:24:51 +0200
Message-ID: <CAFBinCBMk=OZH3L0mWL=Wk95MeGey2O+xXD19T1PbYXz2CmuWw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_122504_133946_1DA65967 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 6, 2019 at 3:06 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> Add minimal thermal zone for two temperature sensor
> One is located close to the DDR and the other one is
> located close to the PLLs (between the CPU and GPU)
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
I'm not familiar with the thermal subsystem but this looks sane so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
