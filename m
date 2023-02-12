Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA41CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 00:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQmrnjMCmIQuFS/FUuQbxTbuTVv4xAcpkNYBIoiqzDY=; b=tZAveyu076xugA
	ER3nbs7jHh+L253cbG5mgQoo3kJ3HCaj0ZfbcJyeJhSvSoHGRlH4uVoefv32fL2avjkPfHMuE/HVt
	SbpvPNBoD6xXczTjriBPahsnm0vYhtZmz2cweHQ0F3WLTeMSxg93WarPU92Wd8h6QnhbQ7wMINf1o
	w0jh0+LE984RTgK9vBuAaTBIfwIOBrMPS+tw8DeTuB4vcPFI1WBv6m44VFF3meIjUtYBTM242C+Cj
	UditwkDpoEi2HkfZxri/UjW2eGtRFgwUfmRVB8daKuaNZPsUPJ3FyQPuCdQpHIDyAPxcuc6qY4iAb
	FlG5+8iG7mmItxzUvUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR0RQ-00AeMm-KW; Sun, 12 Feb 2023 00:42:04 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR0RO-00AeM2-6N
	for linux-amlogic@lists.infradead.org; Sun, 12 Feb 2023 00:42:03 +0000
Received: by mail-ot1-x331.google.com with SMTP id r34-20020a05683044a200b0068d4a8a8d2dso2729870otv.12
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Feb 2023 16:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7SLN4vRGHLRFbmoIci92U4rR/7enp9H7EXxVB9XOfw=;
        b=g391jZxSxEEgeIQQvzVvJ3ORRw812mWIgp/8TxTBa1ZEbZd+azotracWMbi/LvytMM
         HudgaoYxaVMT/UzwjXug4J1511C+OkG6UyYuRRkanQuLBDDLvgH2GrzBzxxGUXvda9DN
         HQJKz26Xj3vzRpjD+oDVxPXVV0TJ5JW6mubZg+gtXEyr2MHS4k+3QNRCAJDsCDrWO6FZ
         yN3Jw8GlwUCl08BjfbMVky1Eq3W9fCKlHYvGm2pZZXq7bu1gZ9/I1ToBnEogvYlhbQnP
         yqMq5z6q4krxKiXvHNrXD/7a34PHf65bKtn87cXdwx5ul/PhjcOJMwZw5l3t6WKF1c6M
         iDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7SLN4vRGHLRFbmoIci92U4rR/7enp9H7EXxVB9XOfw=;
        b=MGsnVzm5v7FGJ3KRa9lP96LgNrXqs7nj2Gj+FeL4sAmPz2LhFdDy2OBGqLv7bp5s6E
         qlFPGT8+gPCkSWE0Q96m6nPG3DLG8d6YTSNZLgg01SbPVumaYiA9TWsHwC7lx+HJqaaq
         9UOyt6cMCJ0u2T3tVyklvJE0KEoIzWegJobAADg7aYHueEf4/B/pu5f8cgRRrE8ukfyu
         NdOmcJ9lkJoPslgHgC/G5J6otoEUz8BwWUKTl7XwGEumexO2HXCF780ybkB4b4H38ty8
         GA8UbkdAuM+6m6z4bvFToyx+KbyK4wqDkeJCtNZeeK50Y1ApQFnvW8CYkxPY6d0nLCYc
         HUAg==
X-Gm-Message-State: AO0yUKX8f4uvs7IuvegpNxg9nrfjJjPtR/qd/qKGrmcwHiIGNEHpDRVA
	GcphmA2hWjGQV2/aChp9oE4=
X-Google-Smtp-Source: AK7set9Lu71ZWhkQwXwWLvtIj2gDh9FfLBT/HjPVf/wiK2UPOuwc8MocQOKd/7IbdwyvSBjiFlCOXg==
X-Received: by 2002:a05:6830:18e2:b0:68f:1e6c:d5e2 with SMTP id d2-20020a05683018e200b0068f1e6cd5e2mr6826427otf.13.1676162520812;
        Sat, 11 Feb 2023 16:42:00 -0800 (PST)
Received: from geday ([2804:7f2:8006:c9c:adba:da13:db7a:720f])
        by smtp.gmail.com with ESMTPSA id c17-20020a9d6851000000b0068bcadcad5bsm3631757oto.57.2023.02.11.16.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 16:42:00 -0800 (PST)
Date: Sat, 11 Feb 2023 21:41:59 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Linux Amlogic <linux-amlogic@lists.infradead.org>
Subject: Re: Regression caused by 066ecde6d826b443 ("mmc: meson-gx: add SDIO
 interrupt support")
Message-ID: <Y+g114kasLS6/x12@geday>
References: <Y+fU96RVq4GwKaDH@geday>
 <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd2dc69d-f7b0-bc60-782f-34ac497d9507@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_164202_280092_BD369965 
X-CRM114-Status: GOOD (  14.07  )
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

On Sat, Feb 11, 2023 at 11:44:25PM +0100, Heiner Kallweit wrote:
> On 11.02.2023 18:48, Geraldo Nascimento wrote:
> > Hi Heiner and Ulf,
> > 
> > After updating to kernel 6.2.0-rc7 from 5.19.1 my H96 Pro+ TV Box
> > (Amlogic S912) failed to provide wifi. The module in question is a
> > QCA9377 SDIO driven by ath10k.
> > 
> > Reverting 066ecde6d826b443f492570e080cba3f2212280d
> > ("mmc: meson-gx: add SDIO interrupt support")
> > solves the problem and I have wifi again.
> > 
> > Thanks,
> > Geraldo Nascimento
> 
> Supposedly this patch revealed an issue with incorrect interrupt
> trigger types. A fix is currently in testing:
> 87ef638d6557 ("TEST: arm64: dts: amlogic: Make mmc host controller interrupts level-sensitive")
>

Hi Heiner, and thanks for the quick reply.

I reverted my revert and added the TEST patch about interrupts in the DT
but still had no luck.

What solved my problem was adding "cap-sdio-irq" to "sd_emmc_a" DT node.
Now all is well.

Thank you,
Geraldo Nascimento

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
