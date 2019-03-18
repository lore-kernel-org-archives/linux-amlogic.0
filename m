Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C4CC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C1B213F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 20:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U+JFvy5j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lNRN7zqp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C1B213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZ8QflB1QvxGAGstms4lBcBftnpVa+poFQp8UPiX2bU=; b=U+JFvy5jfA3B1H
	+zcUYaTjQ/lTl6g9uWiJUfOwHPd2UpSTMxC1PUQDdchqJNc2s53POCBOL4XAeFfyHo0ZXbMQ/cy3S
	eAn+aoudxARguqFhyETf9/cg90kYDL5WGHHmn0ekIsI3WVeWEOlIMr46NM8afZjIZ9wOibYU7RN3f
	CtCyC8+MUy8N8Q1kQW6iPUaEb4Qjfs3X03mUokhQe6qfbBjC2dHzcYE8CFKhULgJuW9u53Jb3Lj1x
	GFYztH0GFgY3MGokk8H+JnMs0j64s/ip4Oe/AcWj2RxlnaRq8DNNDsfQllJjJ+uVO9cguckntzMmW
	QsWwTb3uHchI5nmmTtHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5yWe-0001Q2-Pk; Mon, 18 Mar 2019 20:06:24 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5yWd-0001Pg-3c; Mon, 18 Mar 2019 20:06:23 +0000
Received: by mail-oi1-x243.google.com with SMTP id b4so14127734oif.6;
 Mon, 18 Mar 2019 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t4pDkE66N9sGNKASHxnAqppvdriwVXM0y6liBW4Fl+g=;
 b=lNRN7zqpEJ8dA5/HKwAmAbooQdHo3yI2q0UHdjzO1S0KU2vfJHhHROTU87zXAF9bV6
 hDAeeDi9oqizsUrR/9kHy/rc7DBPJrs+A6NkihmcpUhcHoZ+t2qJB98Hhz0+lJRa51w9
 8amF8TOrQy4iNlTU6IFPR0PW7y8SPPi4fGijMIO02tSt44hV6b2RgUFZlOP/gIRbhXbh
 DBz/dKf/e/65EYMJ3QcHNNaTeb1E2MYThpaQBdsMblubS6L88Xo7i90q43RfiuHf0DhI
 hGWelWTaJaOlE4b5zMEP4oYITZUHsohqRPI1cswqre4NUcL4uXUEghvMvDvqzwJxm/Ky
 kEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4pDkE66N9sGNKASHxnAqppvdriwVXM0y6liBW4Fl+g=;
 b=beiueXliWMA11rA/E+cu4/Wssht4HvAxmUwT7dD9g8tNlXmI70TZzmHgdlrB/xVmlN
 FMCudBNHQCrUzMK2I31QjjRKrzo1kyCw2Xxqa12jYWy6Ph7Xs3+t0XEJskR4v+wQJkeS
 qJDBKG48elRuUVasN8EeeVKFXE2mFNevxOFDqxZNGDjRIwodzWxkjr2r1EDzvl9QpAoF
 BOtdlg53Cr3biNVOzWBQ3nTSdLoz6X14f+yvZyULRnqAiSSLbHQm7/bNTMhY+b14YY+Y
 GVlOhNcxikRt4gdYbqunwO23DEt413KvdtWhXVle4DfNOmA+a9oNJlNibC1KHZnTHNLr
 AdjQ==
X-Gm-Message-State: APjAAAVxp/8N5VyIcAvFfPCGvnAnPqA/X7H+pd0VBCsJ6+USrFWoOkSR
 rSyACzthyFH/FmfCHTKk2/aOqdXx/rDKCyWApfM=
X-Google-Smtp-Source: APXvYqxr6Ufg5Lzv3ks/Djyr+Vp6g1/TOH0X3DdnsVANCN9W9gLpf0+qzDm1JC400HNvczEqZKvX9CoSAXdvIm8HiIQ=
X-Received: by 2002:aca:a9ce:: with SMTP id s197mr428994oie.129.1552939581538; 
 Mon, 18 Mar 2019 13:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-6-narmstrong@baylibre.com>
In-Reply-To: <20190318100458.5619-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 21:06:10 +0100
Message-ID: <CAFBinCDueGJymC+SgPe7B2D_EavWFxjq8FHfhWr9RTPwxqsSmQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] arm64: dts: meson-g12a-sei510: add regulators
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_130623_145888_702FDA4D 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 11:06 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Jerome Brunet <jbrunet@baylibre.com>
>
> Add some regulators. Still missing
> * VDD_EE (0.8V - PWM controlled)
> * VDD_CPU(PWM controlled)
> * VDDQ1_5
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I have no details about this board but the changes look sane, so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
