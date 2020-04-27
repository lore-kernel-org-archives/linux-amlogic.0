Return-Path: <SRS0=4IOV=6L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD393C4CECC
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 19:46:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3967206B8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 19:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l6jZA5XY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="otJ/1Xsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3967206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYhKH/gH1jtfEgK7EMiwCOyIS97BCXSj9kfijx0RDB4=; b=l6jZA5XYxubk/i
	UdWw+J8nR/v1COjHUkh1Pp25XIVpEi5CuDhbHyaguEyJWARbD7qs2vc4pQLoIQtMhcEyAUYzYccoL
	hzB7VilKajGIeNsXBiSNbxzN4urHO4desLwMe4Cy/ezhg5UNDQbOb2f9mw6dHgurI4WsKbnQCVubs
	8scL8U8q6d1Z7ND6jm/2z4i1QNsBlOBWo8ju8+9tYs8egAG8BAk3x8cELiJh02yfG+yMJVETlzdoH
	wfExKLzbCw2UbCyVrHEHCBK3GMWRVmJE1vs7Oe6PpbBqNOcDemthUsWU/o1eotPi+jLJx5MAF5UUj
	7BGQ8JnMDUUHb+6ZWgZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9hS-0008PQ-IH; Mon, 27 Apr 2020 19:45:54 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9gS-0004uu-2z; Mon, 27 Apr 2020 19:44:53 +0000
Received: by mail-ed1-x541.google.com with SMTP id r7so14443864edo.11;
 Mon, 27 Apr 2020 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VQcsbuP3pB8CDC+cItJJV21Dnh5PuIRR4nPKttHGjzE=;
 b=otJ/1XsxOtfHp14bHd8Kf93q9ptKtRm3hglsJawWMzxNHKYCD7z6ECVnscbS/vBVha
 Zs0kLO2wdbw68nXZrww0yrjzXzy++SVTTkfKjR+ovO1otx1+cGbTyeruo2DDg0bJrb2K
 /1lk1vT5EhWAFPpVmqCweZ7vf5ZgmEuzHwCe7focxGC0MWEXvhLb+q5NBFzpRnWcTNWh
 XEvqoHCsoVjLAMeFAwBsLrDGX41nzUvanE6tM370s5f4+IZl5CFfYCvEdjIv44JBjrK1
 q0YpwfJ50+lUfdzfPcXiUwiryMAQY8+BXLGb54Y/dLv/7ruwUlDi36CBtdHTZYZrvUf7
 u0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQcsbuP3pB8CDC+cItJJV21Dnh5PuIRR4nPKttHGjzE=;
 b=BslOvVdgALoHavsMaacUxJSC3uFxxivY+8Z53pAOR5LBNcKrCSmeW0RVtMbQdJBnl/
 sRVZN44Z6zfP/GCNc+T0XG/cIOwohLSQDYe04j7D2eS8WB1sgs8ZuuQJmRBrgWTzBzIa
 FctqkMhxY1NywZuXhebQv9kRjz8BjOPKrO0Ntod7dGyWjdQ33hw5VxEgsZ+VOh5Kha+5
 AIVKVUJqurPAnxNmv9M1jrnucvfsmr0rfL9azYYxt8xOBZPfr5fk8tA+dPmMEb2RqLxE
 8x3gJbKTG8j9X1NlzD/cPK6P7YaRAhvMBs3raxzurIfEX+nWDyX+VTQLj+xn+sOcqUNi
 aOGg==
X-Gm-Message-State: AGi0PuZinQ6GXHtRqKA/VbLSulc1qnhw1pi0kqMy8+xlR3phwsWfoxRS
 URzAkTIAu95yPSMAfrXXhLoqFMxoWYYcZvgPIj8=
X-Google-Smtp-Source: APiQypKdvwLdxCF/E1pxaH6di+8W+pTb7+5wMbfJFWXAgXSq3W+jSu6jwARdIVsNAY136N7lf7NMNpJEjCTrQ7cHC7k=
X-Received: by 2002:a50:f61c:: with SMTP id c28mr18663659edn.365.1588016690108; 
 Mon, 27 Apr 2020 12:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <20200328003249.1248978-4-martin.blumenstingl@googlemail.com>
 <CAPDyKFqsG4kyABmxn__gAbe4fBmuZ=4mdFpRaCL0ih7QZEhwzQ@mail.gmail.com>
In-Reply-To: <CAPDyKFqsG4kyABmxn__gAbe4fBmuZ=4mdFpRaCL0ih7QZEhwzQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Apr 2020 21:44:39 +0200
Message-ID: <CAFBinCCr2yk5WOG_Y7E14ekpkOsyurkCfYBO0DOWg1MSjvxaTw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_124452_140977_A3A159F8 
X-CRM114-Status: GOOD (  20.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ulf,

thank you for looking into this!

On Mon, Apr 27, 2020 at 9:20 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
[...]
> > +static void meson_mx_sdhc_wait_cmd_ready(struct mmc_host *mmc)
> > +{
> > +       struct meson_mx_sdhc_host *host = mmc_priv(mmc);
> > +       u32 stat, esta;
> > +       int ret;
> > +
> > +       ret = regmap_read_poll_timeout(host->regmap, MESON_SDHC_STAT, stat,
> > +                                      !(stat & MESON_SDHC_STAT_CMD_BUSY), 1,
> > +                                      100000);
>
> Please use defines for timeout values.
I'll take care of this here and all other places which you have found

[...]
> > +       if (cmd->data)
> > +               host->platform->set_pdma(mmc);
> > +
> > +       if (host->platform->wait_before_send)
> > +               host->platform->wait_before_send(mmc);
> > +
> > +       regmap_write(host->regmap, MESON_SDHC_SEND, send);
>
> Isn't there a configurable timeout to set for the command?
>
> I mean the driver sets mmc->max_busy_timeout to 30s in ->probe(), but
> can the timeout be configured to a lower value?
there's MESON_SDHC_CTRL_RX_TIMEOUT and MESON_SDHC_CTRL_RX_PERIOD
here's what the datasheet has to say about them:
- rx_timeout(cmd or wcrc Receiving Timeout, default 64)
- rc_period(Period between response/cmd and default next cmd,default
8) - I'm not even sure if this is related somehow

if you have a specific test-case for me to provoke these timeouts I
can try playing around with these values
otherwise we have to ask Jianxin and see whether he can get some
information about this from the internal team at Amlogic

[...]
> > +       mmc->caps |= MMC_CAP_ERASE | MMC_CAP_HW_RESET;
>
> Should you also set MMC_CAP_WAIT_WHILE_BUSY? It sounded like the
> driver supported this.
I can try setting it.
From our previous discussion (on the meson-mx-sdio driver) I have
learned that eMMC will be a good test-case for it ;-)

[...]
> FYI: I left out all comments related to the clock provider
> initialization. I think it makes better sense to review that code,
> after you have converted to use the devm_clk_hw_register() and avoid
> registering a separate driver for it.
yes, that makes sense
I expect the code to be easier since it'll be one big driver with the
next version (so no more platform device allocation, etc.)

> Other than the minor comments, this looks good to me.
great - it would be great if this could finally make it into v5.8


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
