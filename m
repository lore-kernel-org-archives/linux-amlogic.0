Return-Path: <SRS0=2olW=JP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C7FC433ED
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Apr 2021 20:17:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A31F161078
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Apr 2021 20:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A31F161078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VKyg99sjjgfG11D0WDemdUT7j6eyhmmk1qZ4wSDNxRo=; b=LRHa0nvvbjMF2wcwAFydz+xVs
	bv0pTVgPMumukYHpnrEd4eKKt3BTr4o+Ze6lGLqcPGUPb09oxs0vsNeRoSqCS6F/O/UuzeavXbAZ1
	mjbMbt621ohBbURJbn7TaHR4o1iV2qPbTrdwa6/hdhK/QcuGgAe0LWrjCvUlB9iMJkVSRdh3AMdVx
	f8YcyEwdYrD7tLcDhpjOXKCciSdj1jUrHMfbUWFHGeP64gijUJnvEVPEBtulguK0XhO41bF9ro5qp
	S+UkAdLE1CIq8rD+KmOoUh7NzWazadw+QdDXsM9FT8UP0o6paL2AAldmfZLBdbukAZ6iuEuTshKDK
	0Sx0an6Xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYDqf-008WFf-At; Sun, 18 Apr 2021 20:16:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDqR-008WCU-Cr; Sun, 18 Apr 2021 20:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Vm1TuA39RV830rM/Py41JlCpY3m5T71EQqnbFk4N8Kc=; b=xXzxNX9lz0uy+vC5mQMgzHHPCh
 UvN/BzHd4s/0LFCG8z4ANfrBmJ7iSK8kKNCFqAHcSt2im09klsQSByGamIa+0CSwF/Qk1y3xkFwLy
 FvivNpqJToIOT5d73j+HwtpmyIr16e58/ELdVVOieRw28NdQeMqXtZGn56TSiIp6FRDEmmopGV5ZX
 nLcnsoAtMpN9EFproK/FgXiWJOCMz38cSNk/MF2aBOoc/vewPQwzUDNnDPJP/5rbZ0L09EqbZ55pE
 NEsTTtYr9kRJqWwmrjC/3GP/m3EjHU6y3ozGzunc00t9LnQfVpQk6RtImXsifeuqTEtnV87XYja8N
 GX+K23dw==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDqM-00AeY9-AE; Sun, 18 Apr 2021 20:16:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id y3so1944822eds.5;
 Sun, 18 Apr 2021 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vm1TuA39RV830rM/Py41JlCpY3m5T71EQqnbFk4N8Kc=;
 b=mm+zEQCSZczOVNYBvQy6LA1axst8NY0jpOSV1OrfIKRimKZwHhbuXlYY5ePoBzxaof
 sAPuWaCsA9sFaT8IhOz8WWDs3guTv2JGdbPpnzg+FRBZViwpcHxN0B7jLT1bGgO0aQDq
 lLW4CyAVLgQqyCyQcjMPlyM73GbonMgMNE80XBq+OwroJC8Yt6wS9MJ42xc5NPGVhBI9
 O9FSoCF2jcA0tpZwqlMjUF2e/jw+WxuI6ULGDpZ17PXJsCxVY6GOovVntEaVXQ+Fi+7q
 dMl2LV4ad95BcwwOdXl3CSX+3IgxRRbKioKZWD9Pu+xLj3yD7415dQRFQeLLwgZ9tZ8j
 eyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vm1TuA39RV830rM/Py41JlCpY3m5T71EQqnbFk4N8Kc=;
 b=OPiO9tq65aLqNAT0qdR1rDbmyaKblIof2+PBPDqHVPzv1f7iDZg7MA6NW/HOHcTBaq
 6MJEmUYPrErW9jRMuRX0NuxZjxfCxQTTE+q7Gylrc1yvvQqSHuw11uBMTNAhK3PbTOgQ
 tgYVBmBcW1uZ0e5S0hXxhEbQMfbF0ElRgV1G/snRVSgqvhH7niKN63/6Y4DDK2jOiHYJ
 hhUp2gZ6goqeMLmkpkmmMyNb/Fzu7LO8Xag3bmdWP+lKkKMI2Y6dd7Xflv0WcI8VMHLd
 aq33YFF1s5fD1nxyhOC7jxb4RFt4eKAeBAOxNCnztFnBK0jA7tPk7BSroR1IGc7bhsa0
 c2iA==
X-Gm-Message-State: AOAM5333gDyBHRjohEsMjZnJo6uz8PCIVL7cHGivPVAbEPUiNVbJ3m4h
 I1Rj3/V5FNyO8dujcS8H+1I9R+YxV9pCTGBR3bw=
X-Google-Smtp-Source: ABdhPJw1Bm+UXiVL+hXhIU6zHK7TADZXYP/7LDL9pFxaS+1Fu3pQYfoCxhsMo2xU1RdocGGa3Q4rFMPYTiIk3DyHxbQ=
X-Received: by 2002:a05:6402:54f:: with SMTP id
 i15mr22041465edx.365.1618776992766; 
 Sun, 18 Apr 2021 13:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210407042609.9736-1-christianshewitt@gmail.com>
 <20210407042609.9736-4-christianshewitt@gmail.com>
In-Reply-To: <20210407042609.9736-4-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Apr 2021 22:16:21 +0200
Message-ID: <CAFBinCAhC6c-Q5Hhmb60TCeokJ805ep20WBCfzmctqxArS=eng@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: meson: add GPIO line names to ODROID
 N2/N2+
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hyeonki Hong <hhk7734@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_131634_371898_B5519A96 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed, Apr 7, 2021 at 6:27 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> From: Hyeonki Hong <hhk7734@gmail.com>
>
> Add GPIO line-name identifiers to the ODROID N2/N2+ common dtsi.
>
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
