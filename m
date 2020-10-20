Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EFFC388F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:41:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A3C22282
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 19:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5PTtpgY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UkSiUPL5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A3C22282
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yQaGI5Hh/UDs5zHTMj/DsavrBiaUqVFE9GMJ945sGVI=; b=e5PTtpgY1PPqgFL/EmqrbAlPK
	JpTePlxLLjyGSn+COnTnMzc3tu7KCl0mZi/Pua23ahe8vNdhgMUudkzkzdbhySBdwODkWUQtSrWEC
	/APKEqEcVU4c6mKSc1MDvbtTy0sH1b40F/7f5wRmrb2yeGAXhoTq8l4LneMtVBWeO+2YOLvBe18mk
	P+//Q9lb/mxVmhqIjo0xEFkIQh44UqtydiaXeEJ2/eI6zJL/avauOQTHTkZztcf2oyXncRHjAVACr
	28SywlqXYbgVDvGEzNCKQJnjWex4udzc8fnXBtqkLrSigeRiLaarqaAhgZzjnJjEHW9F42G3rTRaF
	ecR/7VDwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUxVH-0001wX-S6; Tue, 20 Oct 2020 19:41:03 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUxVE-0001uR-Od; Tue, 20 Oct 2020 19:41:01 +0000
Received: by mail-ej1-x643.google.com with SMTP id qp15so4500918ejb.3;
 Tue, 20 Oct 2020 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p5dpb4kiOG3nB28qOobnMgBkhDz2AQObVZvmdFZBNDw=;
 b=UkSiUPL5SOodBVrE+eCgHOs90wYhUV9/U1E8NsehB1tTFwd5IDL9cH2Pk+2UkYdPPc
 qIIEQPA5XiU2X21nrRom5YqvSoLB8Z2vpBepMJjuzv9iP9ASjiLTWELrjlmVOHcKpQB3
 az336Qiikwj6YWNWaf7zpqF+TWb52EWLBwEgXuNFXRSf67dd1wtWmdwCAzSUY7zqtGny
 vHavMPJ+F9CkEGaww4brJEId465CdSZZBWLdN+LoLT7vETWSV+B1g49DXddSGLkhe2DX
 UAzK+Pcoit1NTZ/SB5NgNllBa7bPlQ5xQkLBlzweSaMlCefCAV27LPRFwvYL1rnTE8ea
 dryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5dpb4kiOG3nB28qOobnMgBkhDz2AQObVZvmdFZBNDw=;
 b=D5F3vvI6xzcH6CUDOoStx/pMCwsaRrMgygfmXv4fid6ZKoJNbee78BgfDU15DH4chn
 zZGeaqLOHC5GsrcMkOqUjbUEycKUrmPLQCxOaBZyW81t9scCvq2nSfKIwv+I/aweWmP1
 vv1RFSYWoDhgAQOUMTCx3O7RxG9JXwE57s8BNvtJKN9beFEhkdBFu+ZSEI2sN2KsM6Kr
 0NXB8BBPrco0RXf4mDKahyFDXJoAKEzD2+FAIzbAomOId6oEssQR1RAv3KnYHe+A6RfP
 ehFZCbM9T2cPQ0ffvHW7qOn82ZxW+2Kd8UlN3GdRYXSb217IgA60f05+CAKODW/sv6bI
 vtyA==
X-Gm-Message-State: AOAM531hx5L3+FUEN4uQA8u95HxkXD8gWA4qnlqpDFMtJeQDt+K/6B4P
 cbHwjRvNwV59g7eWeyaMVzVKRrCwW3ReXJlC0M4=
X-Google-Smtp-Source: ABdhPJx8L2G/3qAOiTQvv2mwBI8JGvVyrM029xP48QfLgPOhZKZjXqiItunHsOt50Ye9se5Cvlu+QdAJwiCDkQfVXbw=
X-Received: by 2002:a17:906:2cc5:: with SMTP id
 r5mr4897726ejr.328.1603222859733; 
 Tue, 20 Oct 2020 12:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201019224649.14302-1-khilman@baylibre.com>
In-Reply-To: <20201019224649.14302-1-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Oct 2020 21:40:48 +0200
Message-ID: <CAFBinCDz4Qqftk82fn-mFW8Zm900zAvnJ67zRQuZACW2M92+NQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: mx-socinfo: only build for arm
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_154100_814512_BD0B34D1 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 12:47 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> This driver only supports 32-bit ARM SoCs.  Only build it for those.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
