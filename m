Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5972FC3A59E
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 20:41:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD4E21897
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 20:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSNyHo16";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uSLbfQPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD4E21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVAtSwSlUkm+kVEbgHbKUSXx5lh7/64WM20QSzIuS9k=; b=lSNyHo16l6GNOP
	5Xab1kIRAXSb5VF67KOqJIIrp7OxurkVaqrDqXrKSN1zvi5ZodbwdnY13mpxt02Ra20dRNd3iKIRc
	tnWBDfIrW7QPN/RGQVHPzjHyrF/KkDO1tSwEy5pZLDcr2Z3X3ddMS/+lVh+3n+XU6DtDtXi+mCykW
	GqwMZi+1k7ELN5Ad3c2ON1oIrTEhadZHhLVLqcVvr3B6KRLNMYkxpffIsSyVQU9M/TZp+RUDJhoG9
	+RGdgUJ3oirvjLAUxEbTpjgMzdPtfYYrX8IXF0yKDBP44x2aE8g0Zf+ocAIlGT/k0Un7gXRV6go9B
	0b3FskDvdCheGgxnXNPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4t8Y-0002I3-Hx; Mon, 02 Sep 2019 20:41:18 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4t8I-00026d-Tc; Mon, 02 Sep 2019 20:41:04 +0000
Received: by mail-ed1-x541.google.com with SMTP id f22so16605653edt.4;
 Mon, 02 Sep 2019 13:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6xZYkgl4ocSqmwrHXLN+0O+x2+BOQMBtBz7Y33HFq8=;
 b=uSLbfQPDAcBsaxTcXTs7bxHorDIpkF8/bQWuFPf8D0/arS6TmVjKnjoXhcg8cRA0f8
 e84ZQSgf/VANlfdOsVBJHjNr8GTYlAwOIlrNoa7Ujj92GY1jO/3FbCw7H6r08lzC39et
 3oyU2ZHjbtg3xZqUU2dqC25754xnGeWSAfBMCXNneHrws0JXyEo91fjTU5flrJj0ufnu
 zCq1RWVtzQni6KAaIuLpxBRIciIEgQ8hfPJkoqP5vjZvZ7wLs07Et5YfVoGz7Gvct34M
 V6m9Z6jSXV0YmavIrtBfN333cT6KY4HAmNDWp70k7Xqg8FwZkY/OSJOeN8HN3QPuohtv
 kzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6xZYkgl4ocSqmwrHXLN+0O+x2+BOQMBtBz7Y33HFq8=;
 b=qBC7i5fSPocsA8qYy2szBFwcXAIhA94vggH4EFK6K24iLyehi7wEBWLfPcsKiBua40
 qFV4TtgvB+/4vI91O2LbYf5OiImiPQHm1ccUsqWtQQ+1s1HtqK8zOpbb6y+sgSNem1Y0
 OQ11N+31pyU+Vt68MkHW2um+fUjUfAlxs16T6l/mQfBzfcEKzLMg7UCEGmHP+E826/O+
 Fuhlx9vLfQu9tPiEm8sO9tLuVX5A7NBsAiyyMOOU33lPR4jyZZm9rw/l1zIQrsPrJhJA
 5Tz93asj1e5CRPy43vnAIzQeS6ayIq5Z1+CUX6c2tLo9HolNJBAmFVpyhpDlClGQ48nF
 f8LQ==
X-Gm-Message-State: APjAAAW0UfkMY+ht+mDHtS9Whp+fX7CRqXK9W3Z+bwioBqCc4Cpl1frQ
 H8BfISr7XR2ZvYZ+wM+79yyHH9SzyVBwqp8USsQ=
X-Google-Smtp-Source: APXvYqzkGpl0pu44qDC0uA4IX121wLLKZE0M+hrRSi3CbuBwKmftDNqCzqy4uvMsNkzIcxWoyGa7h9FxzLr5ayiQOhg=
X-Received: by 2002:aa7:dcc3:: with SMTP id w3mr26706924edu.202.1567456860910; 
 Mon, 02 Sep 2019 13:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190901105410.23567-1-repk@triplefau.lt>
 <CAFBinCD96nJBPnyNgWA6CgwE2kZrkXB3-cgbV9aQLB=JtbrN2w@mail.gmail.com>
In-Reply-To: <CAFBinCD96nJBPnyNgWA6CgwE2kZrkXB3-cgbV9aQLB=JtbrN2w@mail.gmail.com>
From: Elie Roudninski <xademax@gmail.com>
Date: Mon, 2 Sep 2019 21:40:49 +0100
Message-ID: <CAJJ5kavS6RU1tK-BqgWD-VmJzPuG114y+pNApYay=+xwCtAwQg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson_saradc: Fix memory allocation order
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_134102_983695_4FE7B061 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Remi Pommarel <repk@triplefau.lt>, linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-amlogic@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Sep 1, 2019 at 12:29 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sun, Sep 1, 2019 at 12:45 PM Remi Pommarel <repk@triplefau.lt> wrote:
> >
> > meson_saradc's irq handler uses priv->regmap so make sure that it is
> > allocated before the irq get enabled.
> >
> > This also fixes crash when CONFIG_DEBUG_SHIRQ is enabled, as device
> > managed resources are freed in the inverted order they had been
> > allocated, priv->regmap was freed before the spurious fake irq that
> > CONFIG_DEBUG_SHIRQ adds called the handler.
> >
>
> Fixes: 3af109131b7eb8 ("iio: adc: meson-saradc: switch from polling to
> interrupt mode")
> > Reported-by: Elie Roudninski <xademax@gmail.com>
> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> thank you for fixing this!
The patch fixed the kernel panic I had, i can now successfully boot my
meson-gxl-s905x-libretech-cc boad using patched linux 5.2.11

Tested-by: Elie ROUDNINSKI <xademax@gmail.com>

Elie
>
>
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
