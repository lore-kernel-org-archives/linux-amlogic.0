Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E55EC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 17:29:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D035217D7
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 17:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XDgr4HQD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="G9y99tj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D035217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWAlDcZ2FN3KmQeby3bhHH4i+jovSpKbXyq6TqwC4P0=; b=XDgr4HQDALuPaG
	otV8jByVMxr4obsJEOiAhTbxBxIVead7xjBuUZ6fBHs/AK0QAK5yeipNSxd5pNjlfe1oLNy0pEIsj
	H90EkQgwuKDA00dfDRpwzX5KWrhwyMsrfqjsKesrMVM7cuVM2dkkQF90SdUaWaWbz2B+Ud1ciesmX
	izgS7BZcquPvWczAWUm8bZiLLragnXDgnppmpzk38K0LxIZPzuRBIftopLpHgmKFnJNgkqw6E7WzW
	+HPGt1mwOUgcm+OoDzAiZ0cKdT7ufXjXDA7iV/lNKQ1qmnIAMG1N2gmcWBrLO3JV7t+B99ggcVESK
	r0WQDrZ0IpiNrQxjU2VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHtIy-000814-C4; Tue, 08 Oct 2019 17:29:48 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHtIp-0007sX-WE; Tue, 08 Oct 2019 17:29:41 +0000
Received: by mail-ot1-x341.google.com with SMTP id 60so14757389otu.0;
 Tue, 08 Oct 2019 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKu2yueVNgRFpAUd8185a7uHA6JiCaBaoe2JcBRlEts=;
 b=G9y99tj3v+V4iLG0bqYPs3+tPbnpm+K8PGhBA4ulOWisBfs2mqDJ5CCVcxua9X0Bzx
 TVb6f0KBhJy1bc0l/MMaIsdrzarm2gYuYU9syVv1oPFNOeThISGEZ7Te3Nl1Do4fcAts
 6aNd2x2aW8/U3xy9lGvYlbPdehJm7w5ixP6MhLXb6OZ4g6U97xVFakR9uCo7wfBxUEvM
 CVsTNGDcMCWPv/2wa7pmOUIdy3fSENuSbsO9XA2/gPYh8ehyc5qK0NkzRqq1oUdLiifS
 oZae8ODfAnBk743TO+QxLUlcXA+oX+61WnMPrOhKnethMHPGIsmV2T15IM39OkAhV1fQ
 KZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKu2yueVNgRFpAUd8185a7uHA6JiCaBaoe2JcBRlEts=;
 b=Gq0kMDXU+ePQdcLgMk2CweH0L6OpxEvpIFEHpj3A7VuaGSJSlOahP7rFGdkzDs9KZX
 f18JZf0dM5H81epclKSB3ydFA7LYXPpc+qu7JmEb4VTazpyRfBw2wrLnE5hBHVC/QSZG
 Cl1pdPmSszAbYzN3zOsO7rSphThm9XENCA572PMPYMrrA2vtnn5LbCJl8Qn7mituZgCi
 wmVaO5KpWg6cz6XZsAj1CmSjm6rBHaU8qENOQ3UIpsY+l7MkS2z67SdPAkYArYHLM1IY
 FfqyOZsRJXQaDijSJHEjou9XsHqUFmHSAQY9fc5bzuYES33jBojylJWfaair6b542tck
 2B8Q==
X-Gm-Message-State: APjAAAX77tKCi6qQR/s+Qz96/VaHH0Q3B81NHqLNSIPqBjfte7M6q5/F
 Cghx1uypaxeu1BJZL7VFS4PodFDbUsdeRdStHD8=
X-Google-Smtp-Source: APXvYqzPWuVdtFGE/YccaquQ9QBrKyV7COFmAU7bcwEA7+/a8q74QRmUfb+jPHM6v3jDSj1K4d99J4XdiezQ+Ultij4=
X-Received: by 2002:a05:6830:150d:: with SMTP id
 k13mr25811500otp.98.1570555778900; 
 Tue, 08 Oct 2019 10:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191008102751.GA10401@saurav> <7h7e5f5lbd.fsf@baylibre.com>
In-Reply-To: <7h7e5f5lbd.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Oct 2019 19:29:28 +0200
Message-ID: <CAFBinCBxwcuSd7RYpJ0PvLM3-O1SHuXsbvaLFwO48z-hRs+hsQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: dwc3-meson-g12a.c: use
 devm_platform_ioremap_resource()
To: Saurav Girepunje <saurav.girepunje@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_102940_032400_E2743953 
X-CRM114-Status: UNSURE (   7.19  )
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
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Saurav,

On Tue, Oct 8, 2019 at 5:06 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Saurav Girepunje <saurav.girepunje@gmail.com> writes:
>
> > Use the new helper that wraps the calls to platform_get_resource()
> > and devm_ioremap_resource() together in dwc3_meson_g12a_probe().
> >
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
the following commit is already in mainline:

commit c6e4999cd930b8bd11dd8d4767e871b47f502845
Author: YueHaibing <yuehaibing@huawei.com>
Date:   Fri Aug 2 21:04:08 2019 +0800
   usb: dwc3: meson-g12a: use devm_platform_ioremap_resource() to simplify code


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
