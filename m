Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE849C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:04:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8723C61052
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 20:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8723C61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cEcUHHaoqy3vgzK9J89pLX7rtNcaOmZDmzO2tR6/5Y=; b=3iHI3UIkli02WC
	OmcnBn/zn3k5gBps3Su25ezu8Oub97T0sAxCP3Of64rJWhQMjrhRHZIxNoFqsPAasMEslu/89WRvy
	pK9MQFwFVn75h/1ufmJ0Qs/vrLoYe3YNrmTPIwVk8waxKHs04hcRZsUAqchH8xdWBNmX27giODCrD
	kLkn6+1imQUngpuzxDgXyiyZxclifoCGTJLtXZLnU9cTuM2SWMd9/crIZ0qKAp5EdYbgwYh/0wfT/
	JsJMHcKtwPSphCXhNyhnNILp9JYdbO6QbD1/aKbbAFZt08yixKKTnlbTXBc1zl0XCioC1NjAZgttN
	yEf/ICn9s4deGlQqw2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS33A-0008zn-J7; Sun, 19 Sep 2021 20:04:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS32y-0008yV-0F; Sun, 19 Sep 2021 20:04:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id co2so5869899edb.8;
 Sun, 19 Sep 2021 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6dcfeSU/NOsGSKbPe3yVGjy+BHxzeNlCvBUbxrUC+I=;
 b=eIEUGJFpKqwaqe/BM2ipxcvnehHrJDzjyAepeocNa9a/QbsroK3efi7YIiCyEGTRZf
 JrqYvugCXMPfdCMBpi9t5NJlq8DIO0SQSKhEsv2i7upHyblhsEhfE4lIpLTkzVM5am59
 36cZWoLGQn6wkEzu4V2W4y6ZqDGKOK8xVmY++3TgAaoQeTVEVbKzWvEMv/6r1/IYKaIS
 J9qVEC7P6etYjyeAQ6v2LB0ENIK2Ymy2abnCx7fqoYFvqJ8XmIDMhfm+N4WGDj7/Kjkv
 /wp+Ea0sY38dBMYHWDFWbo6P0X6DFz8sZ5KdSWvCqs64nosGKDh9DGxFzyplY/W8DEwq
 Hvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6dcfeSU/NOsGSKbPe3yVGjy+BHxzeNlCvBUbxrUC+I=;
 b=4uj0R0k4E+VTMpR6/BGypViNgpigR7SPApyLJwdUguzirTJf5dIhHE9/EQRcr8UPxr
 J55z5/GEpGUbbGNEfvNS5YKhUW/zo2gxYJgOG5LescP/48xTXi8u675Dpn+IhRAXIWb2
 r1rMIn+Fef2DuBeoQAjO2741Ln91HhhQI4dRsyEhxhIueZ9plnDuCKS7BkPTKiCOew55
 BA1Zwi1q3sMRkIhuiOqO9h/UvLZ/27OP/AUf2e6aPDB/g9P0FKlb+QHQ/SwJW0Bwxk4h
 RiSkUVEr0AvkQtSPNam853+8bsakRu+IWUhUonf0PchhDPl/gCbJXU1rpidXgG6ILBWb
 nCDQ==
X-Gm-Message-State: AOAM530Rcc6L6+pNeF4EDXYDUSdIZn2G3Dj9SNdibZC0UGvBqTvQiEP5
 JUgDwDvKlmm8uy5gVoaeV1fyieT/VxfbagLkz7w=
X-Google-Smtp-Source: ABdhPJzZSSqwoRRH6yf/ElrPT7c/a1ILbXHOxkd8n5v3y1fDg0NwwQK4OJUrZKHLvrxDjZ6AhRLPnIn3fFBxaKR+Sng=
X-Received: by 2002:a17:906:e105:: with SMTP id
 gj5mr24161655ejb.408.1632081855922; 
 Sun, 19 Sep 2021 13:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210913080504.832521-1-narmstrong@baylibre.com>
In-Reply-To: <20210913080504.832521-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Sep 2021 22:04:05 +0200
Message-ID: <CAFBinCDbxTo9B5nfP=etv+DBwwf3_L7PaRr2Fck2pELwwLQnLg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: do not use memcpy_to/fromio for
 dram-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_130420_104718_B730A3D3 
X-CRM114-Status: GOOD (  13.53  )
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

On Mon, Sep 13, 2021 at 10:05 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The memory at the end of the controller only accepts 32bit read/write
> accesses, but the arm64 memcpy_to/fromio implementation only uses 64bit
> (which will be split into two 32bit access) and 8bit leading to incomplete
> copies to/from this memory when the buffer is not multiple of 8bytes.
>
> Add a local copy using writel/readl accesses to make sure we use the right
> memory access width.
>
> The switch to memcpy_to/fromio was done because of 285133040e6c
> ("arm64: Import latest memcpy()/memmove() implementation"), but using memcpy
> worked before since it mainly used 32bit memory acceses.
>
> Fixes: 103a5348c22c ("mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
