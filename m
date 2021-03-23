Return-Path: <SRS0=VcWo=IV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E77C433C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Mar 2021 21:34:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F200619CB
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Mar 2021 21:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F200619CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FqcwOPu43skqt9XSCvdwbJTtXGxodAn/o7dV1dhJQA8=; b=eUOfWBoDR6JT4KxZLPTRBStxz
	mjpw1W1VV0WiK0nhExLD6GmEPYql58uQSPv1l4Z0ZOgGQbRm9rnMwIQKAbbBkNJPlQIjv5C9BlHyl
	4pPmXx7ITasvlRFcW6aG3mm6kRc01Ew10uOHZyvb+SRhnCkhihYlb3q7SrNGoJVB2fazJ+s/PEeAc
	VvlwSb12gFhaGEfu5+phKS3DzVy0Bykl+UfOrfpIBkcllDUO0EkGjeVQg5zFliY3QUyjkWct3KXji
	f3wg372w33ppkB8pWh5ZSX0kwS/f2IXawrrydhVF5ujIjgywRMnVyj1JXXGMbhZ4bF0oD4DMaa4di
	+Ub09qdig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOofo-00Fn1k-47; Tue, 23 Mar 2021 21:34:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOofX-00Fn09-Si; Tue, 23 Mar 2021 21:34:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id jy13so29470697ejc.2;
 Tue, 23 Mar 2021 14:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vI1hw8A60Svwko1G2zPHBamlOLbkGHLt0wNrUy16zmE=;
 b=G8uGWYQzUpbBGIctDNPg81KNVrRjA2Nzc80EGw2su91df70CACfNGZe4ROznncT8qX
 D34aIBLw++cD7dNbh9QkTXwb/TaZFZECpv2/tbMVex+GYjYHKB3+NC3i71uAWZ+Lwg9m
 lF4aYtT2acX3POgzCG5ZY2U4kclCadkO3Df1+ljvXeqv7u46hfSsZGiF7SHd9mZcheLJ
 6jjom4ctWnecWfVLS8p0HZ7bggk74g/rUCpUR1XI2OVZ6rPPNS83WjxzU5RIsEirSONH
 kEfp8x4yiTmyFzmFUjvAvo97P1ymVQ/Yl65DiOx3vHR4THMgpebIsE+CxdKB2XbSDhhl
 bP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vI1hw8A60Svwko1G2zPHBamlOLbkGHLt0wNrUy16zmE=;
 b=dMfC0L86trSk4U58XyHPcPZ++jQ0oEeDOF0m57P6IgMxZFXyT5SXgvaRQxWm8mqi3k
 grGdyMcTgpYHE6ecaAtAlDVU7Drvvq6ACYlS5pTzFAt5ckK9+c1VGHCLpNu3i1P1K+nq
 3KJMd+jeetEdw3xJsI22f0G4eyzWnUCZAcx1NoyRTl7zARBM6BYNqLroXtNgc6gL3prx
 /mynELEO6Y6iiNRk/prwVgzuaGhoy+isZsBe8sD223xRFuDCDCdrhJGMDl/Yy/MgGyI0
 37LoeJg4wUMH0JctVFcXcGFz9XXhRR6/KnTG5gH/7izwVW9VW9rq9+CvdNn2ysGl2KVh
 GEuw==
X-Gm-Message-State: AOAM532G+tXzoIejTlZVX/61n8KGA5fMuDfF/9rrjSr3jENqqpBMoTVM
 lKMk7D8fh8PHXIIJJSr59pFLySwB27O/sysPLuU=
X-Google-Smtp-Source: ABdhPJxuc35t8ZMihNgaL/Yf6oo4kgpFO9wPGbnR4Zwpswvv/uagH5C6iyR1p7LTIIfbtCKjhtKvUJRw6k52m9hS3aw=
X-Received: by 2002:a17:906:52d0:: with SMTP id
 w16mr246003ejn.172.1616535271362; 
 Tue, 23 Mar 2021 14:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210315083459.359773-1-narmstrong@baylibre.com>
 <20210315083459.359773-3-narmstrong@baylibre.com>
In-Reply-To: <20210315083459.359773-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Mar 2021 22:34:20 +0100
Message-ID: <CAFBinCC5t_xhqa7J3K-SYyV+b0hnqZq0nG1fkG=qQxe5Hj_v+g@mail.gmail.com>
Subject: Re: [PATCH 2/3] tty: serial: meson: retrieve port FIFO size from DT
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_213432_125421_B2B271C5 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, Mar 15, 2021 at 9:37 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now the DT bindings has a property to get the FIFO size for a particular port,
> retrieve it and use to setup the FIFO interrupts threshold.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
