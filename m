Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A0C31E40
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD5220818
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 19:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/M1tRKq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mD/z0LTm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD5220818
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXfQn/Y0jsA2kQfFv+ydtz0k/P+BaMIN26kvu6U5rWc=; b=X/M1tRKqAD6TId
	BccZp/u5wRJ52RmhNFnVLPQJjxFhK5gdz2/Xo0Wo7zY+qEYDbyP4/veE/HNQHIxK6P9kMOPY+8Ab/
	XN9Q06dEGhn0T+d7Uxjvro+Czpw7Jiwau5zZfwUUUG8SRBi+eqlqG6/cxk8H4wnlRSxG+Z8+1zfUD
	+ha0Ez4ByfBWjvbY2unH02UCC/Fut/DmkXflWwFzYbeDRA8PIk39B4lGT3jXhvoX+Sf+Xme4EWd+U
	xch/x+zMYLJk8QnXjT+6NovyX2DTR+IEs/4c/sMMfi1pnvKQHOm3YByib1iCMkNeAxQIRzqiqWfMV
	erV4x/fJ6BVszjb1W8Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv55B-0000tA-Jp; Tue, 06 Aug 2019 19:25:17 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv558-0000q1-Le; Tue, 06 Aug 2019 19:25:15 +0000
Received: by mail-oi1-x241.google.com with SMTP id t76so68315410oih.4;
 Tue, 06 Aug 2019 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r400Du+BdhcnVb2kJzBt3FbA/D2Jmeeyq4b8DmzoTuE=;
 b=mD/z0LTmYu+WiqSkvRq3LLNujYAd8HlJFwozWt4552r1/zczO8LbiytL3e/MDZPv93
 tKx2hPMqdZNJy4AZEtSf1xYNmFi9cTQ0pg/e1V2e9LTpcKZL2x+lIaiQsQXoXYAfsjNF
 MswbQTt1PmNXl/ZdWsUgdcCG54PR1yGVHLAo1DzYg231IGuaZYdXpqMocD6Lorye/0Ii
 wxqgPZY4+DO5OKhBhuujKEGKCh+I94hhv+5PYRhqxR8LTf/p+JDW57C97tpbCY5SuUg4
 sre2BahrbnzfpUPj+zKkiKXpU4R62NHuLps/qXZyzUkDpsHPwYeMjcPsJ2DniB/2h5Fy
 xAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r400Du+BdhcnVb2kJzBt3FbA/D2Jmeeyq4b8DmzoTuE=;
 b=kasrkkIyQ8Nck44boe3vGU7GgfezF3mLeS0oP66uwGgKzKhZWrqfmMlmXR0YbTGx/r
 qAByYxmZ0qGgCqCo4lWIipOgcT/AtSKayDYPaj6euIVaWoyJ1HwedQVwDz8q7q8aStK0
 EW0MSWZqVOGfMasi7oGuh6F5Uyj2fW5mM0sad7z71pSCcJp9VRdLuU73FA25gqcsw+9y
 LzVxs78YXn5OAWhPx/Iu7CQUCdPGEj7k5U20MWGb/9vyDxNAku1bt46FdfWuGu6IoGz5
 xeFLbuugk1uWFU02z1foBVcxp9Zb66v4IbbCrSOasWMhjuY6QfsHRNGlMMV3E5AyW6Rb
 w28w==
X-Gm-Message-State: APjAAAU5VgNW4SCSwrDt2FBAQC3SZKYeMbHlsXRGn/tbcWCLhLqTbapM
 qr8hwBZvX+9sigXlC1MDOZQRLzn9WrdgksZzRWw=
X-Google-Smtp-Source: APXvYqycqxwAz4ajkkyCaUP9+StDKHGffRIZJGY2i531ZcuklTJ3ImWMc0UgBRuQREKN2HBys+2LheHpq2cOHQCsqK0=
X-Received: by 2002:aca:5c55:: with SMTP id q82mr2887362oib.15.1565119513938; 
 Tue, 06 Aug 2019 12:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190806130506.8753-1-glaroque@baylibre.com>
 <20190806130506.8753-6-glaroque@baylibre.com>
In-Reply-To: <20190806130506.8753-6-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2019 21:25:03 +0200
Message-ID: <CAFBinCCtuL_3TcYJS625ZdJQE_9Lt0n_nNVtxKoY-Nyoz2wSDQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: amlogic: odroid-n2: add minimal
 thermal zone
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_122514_724050_51DF197C 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 6, 2019 at 3:06 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> Add minimal thermal zone for two temperature sensor
> One is located close to the DDR and the other one is
> located close to the PLLs (between the CPU and GPU)
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
I'm not familiar with the thermal subsystem but this looks sane so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
