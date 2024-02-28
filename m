Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00738C5478C
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Feb 2024 13:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4UXZFHyUsTT+kxiIK1DHSGaEImHAkWwqzY3GFXuu9I=; b=orQE8ixgZQaomU
	1tRs5jme40H+rKeOr8eEqr214ZYElxWLO7GxMAc7Nohfkg8SxMySfib4XEhjjILAjKiV+D3XcBkM/
	0IVDUOwuXWsJFWXq0ivNxGeH7cbzs2f3Vmt3ifpcMArZh88rvUWwJWIIKKRIdHLByo4o8BxIIl9SX
	jBGmbwmxQUAbSUBw/RfltgB6qm+ovKp6BsYr9HV+GEoaqrBF/aN1bqz+0SXwMxG0S9EqyU3dwKdYj
	JGbtFRn4El7uHfJfbWv4oLZ+ytI+QXzqVQiMuQuZAt0FpQh38QsH4A8o4Xhlb+mZLPuRPTwtbjWcm
	1MBmz0XMjq8HKFKXxhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJbS-00000009NYt-0uD2;
	Wed, 28 Feb 2024 13:04:06 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJbL-00000009NTc-03QN
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Feb 2024 13:04:01 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-607dec82853so57320887b3.3
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Feb 2024 05:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709125437; x=1709730237; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VX2u2nL7Gqt0bJC0pWxjYsm9zcaPhxS427Aecf5U9kI=;
        b=fFDKmJBBBH0nFDoXYTyJt/2pFIfZmN30YMmC7oIkxnYr9pyhMcfbKwr7Ci5WdvYEqd
         0BhbQ9yM3d99m/1oq+s7Q5BKWhaqZ8nwr+meZ+31HgQ3Gb7DopaMBQCkRSYiy6DOdiMZ
         J9MimgvnW9ZAx5vsbQEQAhbLB8BioEcfF/HJz9WRSQvOEi/as9qV+p2CHCd7GyoOjSF7
         LFfEHI4mHpwsv3XyEaKPUTds1e112rb4SPGmH7gceKvKbXEtaLKC2xSSKqp0xPGyjyp5
         nRdRG3XnaFaMtUc6ZxtgfEQkMkEMRta7Yv95WOqnq2xNqMCB2ZW0tLaPgyS/hD2oE9vG
         9kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125437; x=1709730237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VX2u2nL7Gqt0bJC0pWxjYsm9zcaPhxS427Aecf5U9kI=;
        b=aTs6+1o7//ZahUrF2e5r/JiA2uTnRrkRpIFMDPpfhKoFauTKilBVONEa+Uu0E4bAGK
         Rp7f8+Hth5983E4qspssfBGysUyher6Z7xvizA8tzfPq/uZeWnluwUNUmpdfBDKOnBFZ
         PuFoarfQvWARwDKC0oqmVoc85aiwsgpTxS32Yoilhn7S3tgzi5k90P3nUZuNi5qIWwhh
         t2OBB7eIQMvapOKrGkWN4Dw+1XsC28kIlQqKK1idrh2dNmZiHnQToa5oQj723r9KblNy
         b8S1JRbJ3+DXiaY9SFbw2F7SZadlDl+mFuYrQvbSzO0HhdnlpgdH+X6YiNr7d+xSdKmc
         LODg==
X-Gm-Message-State: AOJu0YyNDGFjsRY3oRzOjmMeM9Y9nTXkRc3cTmCpv2/lx2aDVWfSR+gR
	r/7S6do46uMvLfVpsSIRCybNZtX5VgxXW2b76BTTZs3Lk1/OFElqmz0C9Rw9Dfd6c1c+6j/+dy1
	/f+F9ETSdCDbDtBbeykfT//YhRz2gCazZVGD/IA==
X-Google-Smtp-Source: AGHT+IGb0wKrNLfu+onaUcRz1WakEHJECK+0R1Q9sc80YpD8cv6nB87hp1e+C6g9lbDPslASPWL18AGsU0obol0veCI=
X-Received: by 2002:a05:6902:2486:b0:dc7:423c:b8aa with SMTP id
 ds6-20020a056902248600b00dc7423cb8aamr2408268ybb.12.1709125437091; Wed, 28
 Feb 2024 05:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20240217100200.1494980-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Feb 2024 14:03:20 +0100
Message-ID: <CAPDyKFqGWm3pFr5KOEc6c_n+b+NJe9PV_T65bU5udRQPZX72QA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] mmc: meson-mx-sdhc: two small cleanups
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_050359_249880_F745A367 
X-CRM114-Status: GOOD (  13.84  )
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

On Sat, 17 Feb 2024 at 11:02, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hello Ulf,
>
> here are two small cleanups for the meson-mx-sdhc driver.
>
> The first one is resolves a TODO comment from when the driver was
> originally introduced where devm_clk_hw_get_clk() was not available
> yet. Nowadays it is and we can and should use it.
>
> The second one removes an incorrect .card_hw_reset callback from the
> driver's mmc_host_ops. This part has never been correct as we're
> resetting the host controller, not the card. It didn't seem to cause
> any issues so far, which is why I don't think that it's -stable
> material.
>
>
>
> Martin Blumenstingl (2):
>   mmc: meson-mx-sdhc: Use devm_clk_hw_get_clk() for clock retrieval
>   mmc: meson-mx-sdhc: Remove .card_hw_reset callback
>
>  drivers/mmc/host/meson-mx-sdhc-clkc.c | 43 ++++++++++++++-------------
>  drivers/mmc/host/meson-mx-sdhc-mmc.c  | 13 ++++----
>  2 files changed, 28 insertions(+), 28 deletions(-)

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
