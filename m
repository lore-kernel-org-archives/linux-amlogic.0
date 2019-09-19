Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB2FC49ED7
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 20:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9F02053B
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 20:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SV0soc9v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="u6+ZcWhS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9F02053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NI8mVhFdVCRG+eLD/ZzwMs/UWyJ6vA06/bP0X1zqG4=; b=SV0soc9vsrVp2s
	Acwq4nXwRk/tvBHY3eQGhPKVT9LAEP4JZDQ0RR4B2jyFuR9xsmhbJcnKOcqvvy35swp2iVdfNLyEF
	d5+6U0tYwch2Dn1QvjHPflvchEbtxYH2xfQaRL0w6Z4U4m08fF7Ec3iOqY2LUPHSrazWd6KcWO8Pp
	R1COCkeqlMECRj67twU1vgCju62KZPgqzhsRNbdeXPTuITA782huLTWC+Fqk+6YWYlH9T+lQYfgeF
	8AYyhMwIeL2iVv2c1h+95D16XKWeYm9X1liui+fCcRnlxpQSO99zAVRlEnySOUP/0mB2GXUTlo5/2
	zQvcEoj0/C4A69bEXbXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2eg-00070Q-Jj; Thu, 19 Sep 2019 20:03:54 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2ed-0006zv-AC; Thu, 19 Sep 2019 20:03:52 +0000
Received: by mail-ot1-x342.google.com with SMTP id g25so4254571otl.0;
 Thu, 19 Sep 2019 13:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6fHpBKw6eUOwimptL+ITvgs75Vin3Zdq3uabBD6+JFk=;
 b=u6+ZcWhSl1aG3A35Qb0Fd19psh9JCrKFkP3pP+Kb5YWJrplnAx6n1LDAaQqhi5ZqeG
 jyg37wc0W5HHbAEgGWnj+/U231oZzC19ON9Rfo91cqTK1YiBcxFzRvsCGEFZVajL39BU
 IxICNwcDbn7lpr+dCbIjgaoc2l/rrdjuqH/1PUK9/IOAvehhnEUgJr2gT7AKWGJy3dA5
 reAGIbafrW81R9KGq+LLSQSM1d1f/MB5gldml/A6+cQDuet+ACqBeBdW1Y/SvRHoYzjg
 597/gCDnetAWPqfKHAI31kFYvBIe7V6Ypq6IqICtfmdAhkPA70pyiiGAGdCgFb7F4kwQ
 29kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fHpBKw6eUOwimptL+ITvgs75Vin3Zdq3uabBD6+JFk=;
 b=OBkoBayqSknMD47BO3NakaCSfROc8RAsE59Ci4YVqWAU8cF7Zg3eMaGUo0r8ICYfj0
 mWPG/ghyHM0/wzjT6HHrTD2ZTBSu1uS8d8rU378WlKRknCfboQxqI3MvIRIg832z3DM3
 dCyi4240Wbqh5zflpx0S8WdV+3cTLT2ndNJLspJ4yp1rBLz2nrdhrjibRslEhEun3mBw
 N/paqUIZ8Cqf0bgcPj+G/T+FP5QPmmpmNmZDd5RrXs7Uz+37X/6aKtE6oL9RomRNANxA
 fJSxegKM6LjI5z0WyoGNHmb3r9G4QyocCy5RTggKBEmhegMicS/gz2+aoY4ESsFsJrPv
 lXnA==
X-Gm-Message-State: APjAAAUhPUAxFySVc3avMHcGp1Cahvc+ubeMQ07OH7V9N0KvLhZrmebz
 5b6iYZXT71O9AuUcTOSLcANByMYrZdWfOFx1z74=
X-Google-Smtp-Source: APXvYqzbB6OA805TN6az8052Brpw/uRvuz3y/MdV7wEM646Gr4PT2OrZKwoWHj/BiQcf4dPqGRq77DOrFesFh5Oj13c=
X-Received: by 2002:a9d:6084:: with SMTP id m4mr7893739otj.6.1568923429439;
 Thu, 19 Sep 2019 13:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-3-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1568895064-4116-3-git-send-email-jianxin.pan@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 19 Sep 2019 22:03:38 +0200
Message-ID: <CAFBinCDv2m_0tP+rdT1tgXhMs-hPE_cJ9TmO8h9ftDvJXvby+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: amlogic: Add support for Secure power domains
 controller
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_130351_380576_CE2E85E2 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhiqiang Liang <zhiqiang.liang@amlogic.com>,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

I added three comments below from a quick glance at this driver (I
didn't have time for a complete review)

On Thu, Sep 19, 2019 at 2:11 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
[...]
> +               pm_genpd_init(&dom->base, NULL,
> +                             (match->domains[i].get_power ?
> +                             match->domains[i].get_power(dom) : true));
.get_power is never NULL in this driver so the ": true" part is
effectively a no-op

[...]
> +static const struct of_device_id meson_secure_pwrc_match_table[] = {
> +       {
> +               .compatible = "amlogic,meson-a1-pwrc",
> +               .data = &meson_secure_a1_pwrc_data,
> +       },
> +       { }
many drivers use a /* sentinel */ comment inside { }

[...]
> +arch_initcall_sync(meson_secure_pwrc_init);
why arch_initcall_sync instead of builtin_platform_driver?
$ grep -R arch_initcall_sync drivers/soc/
$


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
