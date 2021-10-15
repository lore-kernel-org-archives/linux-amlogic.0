Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0829C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:08:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F9060C4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F9060C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMPnkP2n1wiPK/a8497rdYCmWAMGg0p61bOJH8SqFmw=; b=eUl2vQk/5Sf54Q
	FurYOjHiPwNrkqsE1KJs8mcifP+B5kiaDUiBDeS0/ker9ol8E/4KctNG1aq8DNgaAKT3//dZF/MgP
	OIeFmatKdoTbSUscPobwh6arroYio0EAUe2b81wLRey5cc80iPNVn58CrzTSlZCoxoqoPNgWl2QeZ
	dYGuFL57gQh3DQm+UyTInBo8pDgiXRViJS6cr01EamCSYJdwIrTcGZQlRyDTP6siMQW4uS9DiTEV2
	dyd+Mko2/1OK6ygLjMEssQLK8l/sEPYxVyDf2+gA3BZ52p0oPMA3L5uYLzuoQVfarbM+n88kBHJw7
	EvA0gSc/wBXzmD1267cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbVMy-008vCO-2e; Fri, 15 Oct 2021 22:08:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbVMw-008vAq-6u; Fri, 15 Oct 2021 22:08:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id y30so25698547edi.0;
 Fri, 15 Oct 2021 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ev7DTwrp6MZ4T8F+BiqYB8hT2a7fhd3qu/orSoJYRRk=;
 b=NDGXVXGgETY6w1uHUkxl0aOQgqOaHpy6s2tvAueulF9tqhRGEMU1NjQYegLI3Jmbo3
 hMp16bm5CVYOdrpZ3ZqND4DwL/pVY3YuoPzlRl6zFe1Wda7MkRmH2m4B3RmVw22Yk8fP
 znu01dYMmUoPyb0ZB36/pdRAmsw+NNX7CbKye0vNLXiSLmALyEzHlqsfsPdlLN0444LI
 uofuLyjYZwg+g2tceQcGFhQ2BLhzZWW3ktU5XA7yMwiavU0c4s3yTNsZQIZapXVSiKvg
 AI+Rn/GlRx1vtP3/VGe43e0VPyE+06dcXnwiL1S4y9AUG8Qpn7UQ5/2HUECgBdAOz2as
 kYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ev7DTwrp6MZ4T8F+BiqYB8hT2a7fhd3qu/orSoJYRRk=;
 b=aMhMkvL35NrbJ0FS2DTzUKAKHtIwBlATNTDqerORqas/kq7447LRX6ekWB71iKJ4cm
 /nbJBFm6r2iAG4FaokZ8G1bg/HXZoDWNB4BIR/slMOrw4WcDyQsa1W8Q3qGco815mXYl
 YMRqe+0laEenq5Gfxm1xpkBKLXNvUJLLBjwOnuh2gU+mMRsdUeMSKxfzas7olJgV1npY
 h3MvrL2LmNW2UShJBrkPU/P7eOCLMW8ZTvG+7idnIGG66g2TL+o4gI+6P8W9tX+x5ERz
 S/r+lMLspDtGk1rCu+KLkHUJxVhZ9gPFveECaO2mmrqN2gjyB5eunmtObfUE+XJw5dPX
 mBNg==
X-Gm-Message-State: AOAM5339hutKzvHqPwTGgwmKovOgVcg3P4wp8omri/hLqxVk90N5pORO
 fb+6eMAlgtfqVAhGdJBdSOCqLZgAT/0bEVekfXw=
X-Google-Smtp-Source: ABdhPJwuty6qNhbPHzOorY72ZZmKmtfUjljYFLAIkJ8cKHfYxsoqmg7A1X3fEyIG7As6fntwRInrBrRk7Ui5lNkexi4=
X-Received: by 2002:a17:906:49d5:: with SMTP id
 w21mr9997649ejv.30.1634335680467; 
 Fri, 15 Oct 2021 15:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-7-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:07:49 +0200
Message-ID: <CAFBinCAdgokOt6HSkX=FmYN064nV=XY51CqGs100R0YnNi511g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_150802_283177_65E412F7 
X-CRM114-Status: UNSURE (   8.27  )
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

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Drop the local connector and move all callback to bridge funcs in order
> to leverage the generic CVBS display connector.
>
> This will also permit adding custom cvbs connectors for ADC based HPD
> detection on some Amlogic SoC based boards.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
