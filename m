Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3315C63697
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 22:52:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E3A22202
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 22:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fcRc+zz1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rzj4Q4IS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E3A22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jOBsoTwf1KbmI3ygvBCgsMdh5CAEYIJ6Kw3J19Fndf4=; b=fcRc+zz1MThRTtgxsPyxuTPnX
	L/2mUpXTEWBz1hdIJY1v4EHl7f9zdZlO79QMh0ULVzUiwkikcbT7U0w507pmW67UEefn3D0lpMlvb
	Jbfad7cAYg43GOqUMtbjvhC7ecuP58NNWOuJFWZOLclGHCRldXe6+6tqfBh6q3DpBPvuBCzhxGj9X
	pLxME3O2C5BQBN9t3GRcn7izsEg7lvGIsnGyJ4vK8VHwWZufDVnFaQw8ghXqkO8BMC+Li7rsv3Zsr
	2P9TImElGqUPEopIobdNVYjesS6B55z4dk0NDdvPgwJblbJa7plF5fGgAFdsh+7QSHpBdPLhISI7q
	F6+rv61kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf9pu-0005o2-5V; Tue, 17 Nov 2020 22:52:30 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf9pr-0005nT-7h
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 22:52:28 +0000
Received: by mail-ej1-x642.google.com with SMTP id dk16so31717204ejb.12
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 14:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVx7xlf34yZjkIMHRK5xAOJxJV8VtpY0oFLpdYwDAbc=;
 b=rzj4Q4IS6djGDkjbkMzeQDOTPA6a5zaVcvU0h6YZjLWf7NAeRVqZue5yUITLhaD8b1
 y/5AApCH2vauExvY5ERDzXkk5+IkhI0HudIZDStzt8/bK1bvk7BAc3d7FvKgJCr8Zbwa
 0vrhc9rJXkuOdzx1eT+aDoApQlUA90sQER5T8zNuPlydg99Rv7JpuK1WVLmn/FlbO4No
 Sqbay0z2Tng0iCTNv0jugHs7oHlsH5LrAAG6QnLENCYSkZL95D6Ld/y/JFxh/MKbY0iy
 Iq/Ndydt22GuTEHwAU7qOqo9R7aSAz1l3rmVbiw2bynSK1t8VhuYlxc17IpKRklbp052
 iQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVx7xlf34yZjkIMHRK5xAOJxJV8VtpY0oFLpdYwDAbc=;
 b=PZlK2Iz3kS6Vg0j6QLxworMCvCG/5isvE7BOlMjX2KKNTCoE659Rvfi/YuhkTWlUYg
 YGr5LOsqu4sJK7ngk6OtIgNtlnyIn0/Zcaup8boFLs7wl8XxMScppFhZ/Sgzre/1lJPE
 Opzizxpp6KWzWqTkI80mBbwjDQ5daYOkp+pm8Whb/qMjrWI3h96hciu/T6VbEKJTzuVy
 4LMe/mmY2whfS/5675BeYoYgI58l+0ALNu0DCs5w9EavImeA0GOW72PL7k2RA95SDjEV
 7Q8axhgAQKXavikErJtEGJvNBZ3HDnrxj4mmhrGoIOztK8oKK/e9doAC3+kERzoxX+tg
 l+ug==
X-Gm-Message-State: AOAM531jgRty72gQVFX9GVj7AQ4JesoLoJkgAscaN267eSEpen2YjDnP
 OwRCxb4mu8FNY7nFJV16rgyGsk2gL2OOHNq3YTU=
X-Google-Smtp-Source: ABdhPJz56NQ2nNIJmj2zdoXeFWF90XZonsa4b22vHPHgKrBDRXMS4PlMbHx9YKDJQzy4StI/XfWg6vVwK1xaJ3i+ikc=
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr21769495ejd.328.1605653545896; 
 Tue, 17 Nov 2020 14:52:25 -0800 (PST)
MIME-Version: 1.0
References: <1605592689-10108-1-git-send-email-yejune.deng@gmail.com>
In-Reply-To: <1605592689-10108-1-git-send-email-yejune.deng@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 17 Nov 2020 23:52:14 +0100
Message-ID: <CAFBinCCQTTAR9dTpf8pWb4D=+Hc2Tjxj1WE1KYqsyT-S-XPdtA@mail.gmail.com>
Subject: Re: [PATCH] phy: amlogic: Replace devm_reset_control_array_get()
To: Yejune Deng <yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_175227_295373_CD49635D 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: lorenzo.pieralisi@arm.com, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, kishon@ti.com,
 vkoul@kernel.org, repk@triplefau.lt, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Yejune,

On Tue, Nov 17, 2020 at 6:58 AM Yejune Deng <yejune.deng@gmail.com> wrote:
>
> devm_reset_control_array_get_exclusive() looks more readable
>
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
> ---
>  drivers/phy/amlogic/phy-meson-axg-pcie.c       | 2 +-
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c | 2 +-
>  drivers/soc/amlogic/meson-ee-pwrc.c            | 3 +--
>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c        | 2 +-
what's the reason behind including PHY and SoC driver changes in one patch?
I think both main directories will be applied by different
maintainers, so I believe the patch should be split into:
- one drivers/phy patch
- another drivers/soc patch


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
