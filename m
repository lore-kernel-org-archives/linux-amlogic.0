Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6443FC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:22:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F1E20656
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dqIM6/L+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ux3qmG5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F1E20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKC/QUa7DcyRl/S1SP2Zdufeu9Sz9pMIMDuFm9gUXt8=; b=dqIM6/L+GxUe1u
	NOOa+0vojofBP7n9nAkDGBx5HjUSpqyvc1g0g1WtuGTkmverXA1zNBbLXUJ/eIFO1Js6vjIru+Grr
	FRsBtrhrqEAiPNpmlvo0kpIY7Wb1DLaI5n9USOWWnQzelXDRUOyyyTVRpoH7Fg7GYiOkB6ro4vfnc
	4x1vnBKfapZJvga2ZNPcGs3hX59ZYbt83m4FyNrlNR/o6b/dFBjKuDOzt5/kP0qRpFz3UXkhqKTbA
	zsMOqWOssOv2VQdFHMVhXOeVPJ6q1oyGKcdENrMfWbzwqF5V4WuSy0Yc0KVyshcUplb2fegNx6+rs
	w+OaGUo6JJLTsPHZ5s/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Adz-00019e-8C; Tue, 20 Aug 2019 20:22:15 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Ado-0000xt-Rm; Tue, 20 Aug 2019 20:22:06 +0000
Received: by mail-oi1-x241.google.com with SMTP id g7so5161425oia.8;
 Tue, 20 Aug 2019 13:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nchB5IQJ4eCth7WRS+xQ6t/J7ftCZRuwWmTvIH98SPY=;
 b=ux3qmG5nOv6RqqUO/UrNs19nFUZIDIKIO7BX6LX3OPX2OxfXe+uFPOLooSObQ2w0ds
 EnvmG4AXd+88LnBogF6v/DuNpOpLiH/uQQhgqL6OE+HkMmiATORfDcDAo1/QqMcDf6Z0
 +MKk8OVRri9it0A2iMQcts7O4hCeME79BXEQFWKiKhtpHCnHPk0N+fcfL/KaVTrdtHw8
 yuXCZ5qSq1ZdP8rPyXspMQYC1XIGKbr0y8lGSBlaRcn+0JRvFYQWy0M2RDqqpjMyTdHK
 qYpasjQT1u954Rd2Led1/R7OQQkQ8HxJNZe4TL05ptOv87/+rZ4LAF+3FKtJT5K1fA01
 G8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nchB5IQJ4eCth7WRS+xQ6t/J7ftCZRuwWmTvIH98SPY=;
 b=Liznr6AKE60mpcre169wR84tDGvE42Q62xCTOebPs2m5HDB0EtZ7uojgutocbmJLp7
 h3AUTeU05TT82hv26oXM31T4aDb054XUIxk0GxlnRqD9SSHlFUVawOm1QizAa0nrVdfK
 INPdX1ugiQ0vgzFK4crkQ3KJRY/rMhltiRvMoH1ByNrwp0YLIcelj6y+BSSgkvhGHNlX
 FeWfEAXPUs21MFBUDQwQNFGU9D11wVjPF+GZ1Ln4dkm6oeBL/ZpgT0kwzbnC3LJUylSU
 tYT6b5t6bHaKqcMXKIXo259jZqjixqYbSWbTWC1ZTt6sBScW0I6Sxn6cxcj3HLU/SLSS
 8e7A==
X-Gm-Message-State: APjAAAV94el48zDuWdNYy56yXd+EPJTq9F1e5cJFbth3lhqg9xQKPaaZ
 zGQUqtWANxnEDviyBGpUgUq3pjdIwbHeh4a+OQs=
X-Google-Smtp-Source: APXvYqxumwUgslc50+vHGLyx2kOQnH2aNwLHVp9M4yP8Dwkeo7QcsJKJWf1GmXl+B6DS9UwRECTx1xxWxPS0jw31bp4=
X-Received: by 2002:aca:d650:: with SMTP id n77mr1398101oig.129.1566332523693; 
 Tue, 20 Aug 2019 13:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-4-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:21:52 +0200
Message-ID: <CAFBinCDvLHrfy4_kSc4ne6Au_+gdC6Z6BX16KamPO_=rcYaDqw@mail.gmail.com>
Subject: Re: [PATCH 03/14] arm64: dts: meson-gx: fix reset controller
 compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132204_970047_E116D235 
X-CRM114-Status: UNSURE (   7.30  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:29 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-nanopi-k2.dt.yaml: reset-controller@4404: compatible:0: 'amlogic,meson-gx-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
