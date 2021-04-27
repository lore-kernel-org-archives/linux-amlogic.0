Return-Path: <SRS0=DSzN=JY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D4DC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Apr 2021 18:34:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F7B61029
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Apr 2021 18:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F7B61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=buvAUQ9w/rgY3wV0kfEQXJ8ggCDxzY6MyNsvvJLqln8=; b=nawIsDGOIb+6mX6XmqSxYPds1
	RuUEjGfMcwNL7/3TjJWHEPdozxxKu2BSK29daymycTElgUT7DX/FC7+yVf7mIH92v4p+OduGOKHcx
	or209CP1lpGw5SvzbaJrf1Dzutqrh3IJF8ybs/odZ+KltUdh43GuuQMeGebeTkMRwnXFw6CvZaAsk
	hclL8lkL/AwrPfP0Zowb+uIB6cd1EU71G/FKYUGCnIli9UAHkyYPq+BchHePrVRitozR+GDrMs3UC
	QmTXFiVlStKOgryco0ot2Kdvrl4qb9Q5vB4BBSdiCTzXBhRF7mWl1MaNsCKyoXueTEQ//3Cy42vZV
	NQbUOe/rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbSXR-0023fL-8b; Tue, 27 Apr 2021 18:34:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbSXP-0023f9-I3; Tue, 27 Apr 2021 18:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A5xmzT0WzJDDHOkvVRV5AjYHf40HsChk8Njw4hrRnLE=; b=b7hw5LsnojjMt9ugNc5JV/Te/x
 sfL3TcB9t75Nyy84rsua/pswnuBBAHwDlD0qrZmhFpNyw7rqtYyE9lZD+EvaAkk8NH8rJvSfUArsp
 FbFPx/dd8Uxk8eGVPFuwtlgLx7Ql01cGu19cusymha52moZB5MytFbVOlCmZuDbsUfdUPMkiX0i4O
 FH0sPX2b7JUm7KPLEwrhCT/YHyP94+yaKEm1gPl/MCo5yoU8rusITidYMfOjM3kuB3liSuO4XehML
 WO0Dcn8FZvyGRS9zffHm9ll7TnPOxqi6CL7rmlPrrJrzLigxtdsgS/uvgDplsTfoRa/AMWitJ9bRY
 nJGliIKQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbSXM-00Gv8j-AH; Tue, 27 Apr 2021 18:34:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id s15so71191449edd.4;
 Tue, 27 Apr 2021 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5xmzT0WzJDDHOkvVRV5AjYHf40HsChk8Njw4hrRnLE=;
 b=L+krghGInoAmAnhlwYLKrfeFLlhwJ2XNz0eMB+qbGVam0e4IpcRGvwGWsHILy9BoAe
 42hxvV5AIwoqswQWVws33bu3lrb4G/EDzaZeH9Sjpjg86KnllVdZcHwosnY83WwEHMaa
 OQ6k/0rSO7ICThQ1eC1GyQHyozbfpeDFMCgtG3Rz9v2ANWoxAMY3KgGJWhGhh3A+2hy9
 3cb6L2DJepCN+gJBuwOklGTQM8PMxvEpohYPHaKyCs8G2QHeSn+Sy9ZXdTjyntMX4ssQ
 LG+UPm/oCsOhPGbDi7reSDUpXvky+bVr7lMW0vdJpYpY3snEzuxHtMQ3bEWjhm8dIikb
 xoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5xmzT0WzJDDHOkvVRV5AjYHf40HsChk8Njw4hrRnLE=;
 b=aOkbpLVfEH9uT8wUBvledH1htM/ne9qLBilyORmE6QCD/iPa6XOuK33egYdAILJrvp
 KJyh8jZIHk0mRmc0emOOOqMGsE2Wc0oNKosBhLleQJd9X7mrj+Y09PFPFO8mS8bdU0Mf
 4p876C/z8A4h6NZ31ww/kxjFOmx8/ERDPXEIDNtUuPtZSXrFq0C+FJG4DRCoVYz601Yx
 1UcvuhEewhpwlk2worQP1SYPkhZmhpbtcm/1IEUkkTEvk0TYkeaX8xDy40sa9NoqTCQM
 RrEEKJr/v6QVYuo9koESkYD+4BBw4bhW/aNpz+R6o82sVRwaIfRm0XoMg3r/MPwgKtax
 v77g==
X-Gm-Message-State: AOAM5300DIEZ+YCNRLGNcAqJbLUIWXcMakyqBuXYOlYzV88y9DmrZq4I
 sl8B4DkGF0GO7loL1TU5oivBRrrZZ84gp4QhDV0=
X-Google-Smtp-Source: ABdhPJyXil+DULg+GIVf+69JFlY+AmrhOQ0EVXN1y5/l2hjCszSsOadeNnSfsv8E7rBh4Z1lJGVL0U+Ki8vMOBPRmuc=
X-Received: by 2002:a50:bb27:: with SMTP id y36mr6183368ede.365.1619548458935; 
 Tue, 27 Apr 2021 11:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210426175559.3110575-1-narmstrong@baylibre.com>
In-Reply-To: <20210426175559.3110575-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Apr 2021 20:34:08 +0200
Message-ID: <CAFBinCCN88nfSnmPoFq4H_ROWFMbq=Kcpr1W6CpNs58XeHtV2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: meson-gx: make replace WARN_ONCE with
 dev_warn_once about scatterlist offset alignment
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: ulf.hansson@linaro.org, khilman@baylibre.com, linux-mmc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_113420_380639_23F8CF4A 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, Apr 26, 2021 at 7:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Some drivers like ath10k can sometimg give an sg buffer with an offset whose alignment
sometimg -> sometimes

> is not compatible with the Amlogic DMA descriptor engine requirements.
>
> Simply replace with dev_warn_once() to inform user this should be fixed to avoid
> degraded performance.
>
> This should be ultimately fixed in ath10k, but since it's only a performance issue
> the warning should be removed.
>
> Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
