Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECAEC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:01:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4DD61027
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B4DD61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5O3uAfsHNE7QY+M8LKTrIe5T+dcu7mxhSWp8YoGv5F4=; b=t0TI1wkJZMOB/+
	TymIPz5TG/o9a/YOBar2jcnmS8DAyxu10gcmsL7h5zlZKRvnFz/a2P3PAGYQvMpJgiNs8g/eKyPmf
	+fd4oBT/F2rieBuPy3w3Fzpq2XAb9KNeBXFeREc65qU0rHGx4JFmLt8VDGnzYoKK1nUnBFlCj6j+F
	nA2e3PWm8qlOw4AScdfMtyTxzvUOqELY3NM8XWxU/gE0FU9InUTa9gV01o6uHF4W/9M8nvHwPkyI5
	TYkBCMl+CgAQLGpSU+//aO8iNPti1YoOsNh+KFI62cQdPLcH9Vw/WcFHGfJTPrVnK0uU7glQJqYZu
	WeXjeZQdwCwK69pQUDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbVGj-008uD0-Ve; Fri, 15 Oct 2021 22:01:38 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbVGg-008uBX-Rq; Fri, 15 Oct 2021 22:01:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i20so42421005edj.10;
 Fri, 15 Oct 2021 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VdArxZN7JWq/GtMisAnVnOhcFRIyl27YGTGhWESz1Mo=;
 b=AP7PoE3eVj1rJ3LwTKXMtVjphKGuZDmojGn687G2JyiWjbUZ38mpygQ81X1Ccga0nB
 uw5SbwsTU0VeQ4dTnrMVjIT3dX1ImpV+ZhYfAfe2VsfxVgYOD6fceMzt08fuDcj+9oUt
 BNVrXhhT0hZphbEBNJQZp8RbW7uoluOLWX6/2EORr41YfYJNGWhGPsMKE0LqopJl6/8j
 Qm/M10AuIt/LBjaEKdCYEahKpJJpw7ywrJtmarX1XtLBetjKViPaq2ufVe7i1VUFQiMQ
 3E23NkJYGcoW4dx1p0EoomFAlYBoR4RdvYaI8gxWE7Zs6tMOdRFSXOIsKiQW0b3zmWqW
 C5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VdArxZN7JWq/GtMisAnVnOhcFRIyl27YGTGhWESz1Mo=;
 b=yJ6on0Hr8JgzG7BGGNogXMzwjJqzcv+fmrtCl2Jz1P2QJNbgz60Ukf/ua0XmZfY2m1
 06LOUvRxm6NR8+OGZ8NTRuuX49KHhshzxqH3mi4xSF0tQ0Sb5YlWV3ySuLZelueDZM+D
 GFf7dewrvv+wl17uLYXyFW/DuT4j7lYPsBvOmzQSD0PSaNxU83Bwu1d4R6ySBjOH8hi1
 Bx/9jIUxiATyx9QZqXy0F2eLeNUQmW+XXeOqXeustXp+kW18zVg/NDNcnN+t5GOm96qC
 SK/UaJx9bWJfWccKv3m4VTeroiEGAtMKAgt1PIueRnU3kKZmObawf9uryVZ+yYq47sWB
 utBQ==
X-Gm-Message-State: AOAM530Y4WFEuG+PybRBOLXYBuXAdFSaYLXQLWJ1GsJ9p9N9yA260Oxh
 H9PBMR2BKo92oOidrgOIpluDbIpNWBnlAJrcfjk=
X-Google-Smtp-Source: ABdhPJyNzRTtu3SHzdokxlvf3m2rFKEjdlgvWFQNN8uNikRTK52xQUEX9H3Fr68f+iA1J0yFdfk/EEwLH3H1aa51FtA=
X-Received: by 2002:a17:907:2d28:: with SMTP id
 gs40mr10145552ejc.203.1634335293007; 
 Fri, 15 Oct 2021 15:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-4-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:01:22 +0200
Message-ID: <CAFBinCAo4-shmtpN=nNMEwTSu-cZJrqX+0+mctM0Vn57ZS=ytw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/meson: split out encoder from meson_dw_hdmi
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_150134_926242_73C42AE7 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This moves all the non-DW-HDMI code where it should be:
> an encoder in the drm/meson core driver.
>
> The bridge functions are copied as-is, except:
> - the encoder init uses the simple kms helper
> - the mode_set has been moved to atomic_enable()
> - debug prints are converted to dev_debg()
>
> For now the bridge attach flags is 0, DRM_BRIDGE_ATTACH_NO_CONNECTOR
> will be handled later.
>
> The meson dw-hdmi glue is slighly fixed to live without the
typo: slightly

> encoder in the same driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
apart from that typo (please fix it up when applying the patch) this
is some great work!
it helps me a lot with HDMI support on the 32-bit SoCs
with that said:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
