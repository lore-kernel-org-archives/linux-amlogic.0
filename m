Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0B7C05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 20:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV/Hz2MeXxbRdaWA3oSWQ7TeQyARdzQPU9chetZgTwU=; b=Jj0XkyfgpUJVir
	i1AaqpgWRN1x7DrEoGsjJOnOW6vzNyg5XdoNR7pkwcHM+EUCunD3/HTqSBNx9qQO9GSQSALq8BKx4
	IR7eZtGfUOsERB+xoy+aALebVP4KK/1gGYHqFZ/zTBhdI076s51UZkULiYVr0tArcA0oOvmIrxA8y
	7VOS1LlQrC8iUTZJDbCdhqIR8OWkNRcJenQ1xk/r52qbMJ2s3chISZN/t45UAW1qEcExHvMKnWj2Y
	XC5DfWjL38PzV+IRfSnbm9qMmyYphpI0rHyJ4CYKdfGtW7vULwqoNtA0+gVqOnbKgQzWlkJoSz5vK
	oed0KIohMY7edl8HZ+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJ1b-00CHa0-H2; Sun, 12 Feb 2023 20:32:39 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRJ1Z-00CHZ9-1E
	for linux-amlogic@lists.infradead.org; Sun, 12 Feb 2023 20:32:38 +0000
Received: by mail-oi1-x232.google.com with SMTP id t5so8710635oiw.1
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Feb 2023 12:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TfuDf1G+7QK5W1Sf7bGvvyvW3sJzP3KdbFvUVDlFUko=;
        b=g2pW3Ae4MW1Iy0AtgxX9Z9gjPls1szqKd8FYFODeaxBi3AE9XVsBDX09bkTmiGoHVY
         kiYb5NsitYu7ThQmxjS2VBgSKK6TmkGDz63SRVOHuQzCtKW6RZLlrvnSSPKnmI4/b5EI
         T2OMD3mEktapxh73S6/YFYU3l4ex7IadPLITGMoS2RKdy9c0fTdqHYvdryvn8BZvAkqh
         zJqYAoOYR9dU9JGuLegLlc/VlSuDQtpqWH3k+EZMldALD8bS/XOiDV9gzxIk5VqjJrRb
         Fm0h/6V7H1V4iYOEJ/o7xCh5ty14ctsST7MpJ7sCrQSY+MNJuY09bG1ZGS0yCT8zOVgT
         IfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfuDf1G+7QK5W1Sf7bGvvyvW3sJzP3KdbFvUVDlFUko=;
        b=Bs7GSub/tavB89eLauz7B5U6HqXsrFrKzQNE8SLM2Jr6aQIU4hf/PibjmXST7s717l
         MNV3pgCXAjmt5s9Gv7GR8YI9ObbtjOpfngh/gSeteWsEW42ih/AILLA4UWJ5X27HPOAD
         VGca9ITZ/y1nM/46RJRGqvCIiJRy4glWXv5OnuPniMccHat/PwyZaf80qYi5/l86hOWl
         rmOxdAZB9+tB9WVYRdh1oXlVqBm+P3GCtXbzu88ENUTaOk+ao4bMJetFUJ6fQkr3BZdC
         2zkzxDWEabb3ClYMaCU8SvTzYb/LwWWkNvHKh77T+FTfjVWDd65v2oObZgchwgA1Gk9P
         ugnQ==
X-Gm-Message-State: AO0yUKWfjtgWKWTIs21oqkYBr0u/bb0Hp/9ji+Np9XuI95J+fWVDZg1a
	PqWrWABVdXriHWuCyrgpa5sixodkoYE=
X-Google-Smtp-Source: AK7set+r1GUURHwoMt9VXPwjUmfPJxIhlE1IZRsrpuLQkPDtCQILAsajIVBcSb/Xl1FCODljNmd5pA==
X-Received: by 2002:aca:2205:0:b0:35e:acd7:99d6 with SMTP id b5-20020aca2205000000b0035eacd799d6mr9738975oic.9.1676233952026;
        Sun, 12 Feb 2023 12:32:32 -0800 (PST)
Received: from geday ([2804:7f2:8006:2be1:80e4:f9a7:d80e:f5ea])
        by smtp.gmail.com with ESMTPSA id be39-20020a05680821a700b0037d6dd95756sm2531976oib.33.2023.02.12.12.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 12:32:31 -0800 (PST)
Date: Sun, 12 Feb 2023 17:32:27 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
Message-ID: <Y+lM20XtiZ7CxftT@geday>
References: <Y+fU96RVq4GwKaDH@geday>
 <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com>
 <Y+g114kasLS6/x12@geday>
 <2CB0C2EC-B084-4185-843D-3DEADAC5864B@gmail.com>
 <ccc7ca41-8874-74ca-d647-4eb84cb0f207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccc7ca41-8874-74ca-d647-4eb84cb0f207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_123237_136165_EF977EF1 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Linux Amlogic <linux-amlogic@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Feb 12, 2023 at 12:55:25PM +0100, Heiner Kallweit wrote:
> 
> Could you please test whether the following fixes the issue for you
> if cap-sdio-irq isn't set?
>

Hi Heiner,

With this patch there are no problems even if cap-sdio-irq isn't set.

But shouldn't we set this capability to take advantage of your new
codepath? I noticed that on the old Amlogic BSP (downstream kernel) such
capability was already being set on the DT, so it's not some sort of
hack.

Thank you,
Geraldo Nascimento

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
