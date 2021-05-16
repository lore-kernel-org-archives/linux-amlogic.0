Return-Path: <SRS0=q7sb=KL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13A4C433B4
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 May 2021 17:02:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B16061007
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 May 2021 17:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B16061007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wvODxMcrK4Zfxme7FlqGwy29iUX5Tbk/XUz7eDC3eQo=; b=J37SRpfHvDaShSvOSGeqBfWaj
	we0HIxNwjWUFNL+fLl/xvrBnqM+RcVcuI9OMVzJYp9qh8Qefgv9Zw9Pq0qSOssyQWsvX13Q/ajbho
	JiA23urTXcT/e8DADIWu7GBKi2iZk+JTpiiB/xFZLg8KpvKVFyYb1wTBryMwxb+MKQeMN3jp2kNxO
	mkVAgKYKzEfL/dlXcE5uEV38uamvCHphAUYTQgcKH8aFA/VRsh82RcQwKxn54+ZmGFDVfX1ea8gKN
	6y/ch5aTeg3htCR15ShsTJRmReiVq4FlQ3GtWMIh4ccuP5K8ToQdDkJ44YhZiFnrUJXKPGpDOr3WF
	UKDnzNfCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liK9R-00CcZR-J3; Sun, 16 May 2021 17:02:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liK9P-00CcYv-7e; Sun, 16 May 2021 17:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=; b=pnoKaOGX8XeBWlKU175Z3uXyoi
 wsjnrLDXhiW3VsetWlh8cS3W5T/ki6Koj2xuFAqYeSWhZDfjad09BNyL/WTTcK7reAydckL1U8xDi
 4qd4dwQGU75SEJ84IJDwvwd/mNyiqeO+7RisIef7JCIh0RbdOVj3NHMWmWaYpw/To/cCdve1LRn0K
 knC0nHIIwRUYoHwqa2JzlpwBa2HUUK1v+jvgLGJeDsNdNPMPjhcy2L/6KN7Pk2dgVvR/9+teHE8io
 TERH0Eoj7SKTAZMau8G3owOSUmdDl668DavqUWICNvDW5uCshnYXqzJ1YXE82C963h1+/K+4xduMm
 rWvW6RSw==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liK9M-00D4Cy-JK; Sun, 16 May 2021 17:01:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id n2so5708774ejy.7;
 Sun, 16 May 2021 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=;
 b=DAGiCJN/B0AuQYxR2YMS1YdLG7E04XbNnAThdGjmBoPVyWeVm0Vt63bTbv2eoScYRQ
 SvAEYLrzwnmzOR5wp1CC3RKN4hyBnHKWJQKmPAax8xiYeQN0kxz2jQJP+F4Eg3PnYmne
 1tPqS44UJ6bIQx53XCLEzkUDSA0PKYzdiJ1Bm8Ux9G1YFwdM/2HDZfALKNqSjTCpM2/w
 /Rh5WhkPS0VtYInMu//A4ZE4YYK/MTrUiFkFfqoKnAk9XrjylD1xFHqznvRukMuPJ097
 ZgkrbbJ358Ttx/9WXCUX4sI2HnbgR0YAj0ln5t6NUysuwZ90LddsWhtadieg1uDXWzMv
 XHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtiJHfdmT2LSVR4rbNIaNF36Xfs944KqtBektfTje5M=;
 b=BQvowoRtTRR9XrbzBVhGYp/ShHIrula+Wogdod2NlxFLMLuNTa9tQf1ABF/2orxxm0
 LVJWJq7TEcd3MaBniTmdO4BZxyzTx85KinSyg2awF7uHbFajPt5hPgECoJfMKNIVNrKy
 RyCQhrGXcsBa/uguZQl2FA07YPmAtSVCVe6Gxv7+3aFrNN5waNb2lNUMSpOdcYWOSW/t
 OB7rsVMk1s4oPBBoSRoBbOTs52s7y99NO3FzEJh0hizLEJFt4ECWgQMEAcFuRxt/WsIA
 Yja6kblDlg+2aoNMzYNsHly29XPwwdb5KvgkOY7iU134pLzD8fa4U663kzBpt1R80h7/
 mIGQ==
X-Gm-Message-State: AOAM532tzg0993Jhjlkssm2VnDI4qPQnDcl5Vp3K5XT37xP2GcmiaZ3j
 sQ8GiDzNrimkyDwjPmavkAQbb1fMJvbK48iIe+E=
X-Google-Smtp-Source: ABdhPJxElTHfIzHywbG8S+ZiNXqSjJEqGZe2D3CIdGakxelu3WUAQhIbf0zHelLeFVb7YO60doX8+J/CEmulNZITgNg=
X-Received: by 2002:a17:906:57c3:: with SMTP id
 u3mr59329306ejr.162.1621184515178; 
 Sun, 16 May 2021 10:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210513220317.137090-1-colin.king@canonical.com>
In-Reply-To: <20210513220317.137090-1-colin.king@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 16 May 2021 19:01:44 +0200
Message-ID: <CAFBinCDde0+QzDOYF2EAkjmbdd80Emu3YuFV3jOCMaZuT+FNmQ@mail.gmail.com>
Subject: Re: [PATCH] media: meson: vdec: remove redundant initialization of
 variable reg_cur
To: Colin King <colin.king@canonical.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-media <linux-media@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_100156_673579_F93DB6B8 
X-CRM114-Status: GOOD (  10.55  )
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

On Fri, May 14, 2021 at 12:03 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable reg_cur is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
