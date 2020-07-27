Return-Path: <SRS0=KqJO=BG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857C4C433E8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 17:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5595620729
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 17:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V4in/VaO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fTy0eoZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5595620729
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QWRUm5viEvsX8wI58ImGwXnVSmz7yWwNwN05N8ILD6E=; b=V4in/VaO5RBJofsmtgC+2roBy
	sFZzNvtX7RLwvgJ3eBV4J7xxY3BvWB5K18k143JPWbG1PHuW04Kllkxaf3VpaQebdbZ0bXd4cy2wQ
	zpBPfWFeiC+lWhzVySgeLne4jcp8yjfuz/TshhsXgH4TC2iAYCPImG0tnEkiIAF/aHSYK8gsFHw3k
	dTZmCC8gxb0o55EI7xv48/oUMfIfPoHhap/M8/BCPDPZkKn7UJotr5rgQR/snJv8d/5xtu9JH2K6b
	dmqWIyU+lVkeDONXkTZYHjbjaH7VySPRmW2/ZFu2HLpqmz0fyXsat8zkUglvhawI07IjmCjX3B4K2
	h0Gf56YPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k06qc-0006ww-Ea; Mon, 27 Jul 2020 17:23:34 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k06qZ-0006wV-Cn; Mon, 27 Jul 2020 17:23:32 +0000
Received: by mail-ej1-x643.google.com with SMTP id y10so17905256eje.1;
 Mon, 27 Jul 2020 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rW54nzCCL4GuWdFMqiSyemICms6c3Dfb979g59z0VXk=;
 b=fTy0eoZFgjMcjWe2e+0QmMvnN5NGXrgBmR2gMg1PxTDEyWhcEic7MJ/7mIQLiSU16q
 7LtgMxlarZOrzCyKM+/P0dk65qrjrCwbWs9fkRuDqVVRmt8WNBeW96XK3K51o6nu2+Pl
 Pxt0cTde+BgxbDHl4oo2IUsHaHT9gbgJIkXfsBJh/rlCNcOMgggBs5k3L45DQLP3e5S4
 jQ2+MN9MXWfK9PMruow2CleRfm93J4Bm+033u9eSxbvbqcvJNOyEJuWYKYh9QPG5B3hO
 TteCGGQF38eM1lkn3dJmMwMQYpJVJkes5+F644RFBjoLVOKxzWhAGqrEo0lT8UFTe2Qq
 NZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rW54nzCCL4GuWdFMqiSyemICms6c3Dfb979g59z0VXk=;
 b=T35mNT3pixF5fXQA7BgR4kcBYx5tQlcYSU6WSGmjYZhNwehFP9IeqxL03VdedTpIOq
 nnd6Yg0tDqPHShvVqgCu0N6zSEsYaGD6NzTo+mREsR/PsM72QMGjZyONyADBZxncYh8w
 O6CM+rEEL8aaG2m216CUNezJKkiBfqvjZp4g9+vpRVhM0PWjUBLpoeG8PfpkpgkRo9Vd
 ZRglirFyuYvMMCIdmKaE2FU3GGifKn0SFoXD3oSrkVRROM0jjtlGMCJTGRszlgez0Xtl
 FsuIH3qlvCTxtA1SBfd07ytuD/x3usRi57VMrxfFBc27rxYcRWHxoux3e2aRg9R9cugY
 yqTw==
X-Gm-Message-State: AOAM532D+KBwhzeKCeMpvsGZYigZlC2GFx57f0WM3baupiSc9dEvdClW
 0hOJInhuGYdiaLqbmj/cypjNTZ7PDgkCn4LPZZ0=
X-Google-Smtp-Source: ABdhPJxLkPmde2Lb1+/ALUZz6EWmaUnTOLl9EqQb1dRk2JyPzpwoDeYz3xZDJTvER7uCSni3C7LdgVkpW6SJAUFicho=
X-Received: by 2002:a17:906:82c1:: with SMTP id
 a1mr10776134ejy.172.1595870608763; 
 Mon, 27 Jul 2020 10:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200724184107.24600-1-khilman@baylibre.com>
In-Reply-To: <20200724184107.24600-1-khilman@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jul 2020 19:23:18 +0200
Message-ID: <CAFBinCAfatyKeyRZF_12eqF1ZYDdFeHt94pnrK4Gr=ZjLDS_bQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: arm/amlogic: add designated reviewers
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_132331_442750_723E0577 
X-CRM114-Status: UNSURE (   9.58  )
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
List-Id: <soc.lore.kernel.org>
Cc: linux-amlogic@lists.infradead.org, soc@kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 8:41 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> It's already been the case for some time that Neil, Jerome and Martin
> are doing the bulk of the important reviewing.  Update MAINTAINERS to
> reflect reality.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you Kevin!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
