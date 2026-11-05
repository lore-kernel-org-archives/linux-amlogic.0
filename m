Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64B606A326
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3OEAmIa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bcVDkrBS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R4CTKt73b7ktLJodF/PZkKZW80EzuLRZOFu41kPFWu8=; b=Q3OEAmIawNelLTlRwiBN+v5Ksp
	rSIpHmEQAs+6tS7C2Ab2cxQpPZSwueKm8YrUBWbVHHJh9CMaMArJl1vehHQ6f09PtvmgvGYih59M+
	m9hG09OzFtjnyPleMksMz2g4hnGS88gVXAVnCBl+3o65zWqnQ6t78RweYROCOLsop8f25k4uuSwcg
	ofIin+4mMK+SnEyOwAWUAlR73KHKKMOzthDPzrKY2mR4Ttm7ULk5T1xKQ/Wu7pbESfgIpGs4dugFj
	eRB2uvhebMH1LPjiPv2cpz1iw+r8lW40qBcZ+tFxOamTt4N0AkCuVE9fVtx28nSBFQUT9x8vhCHKa
	ox2CGz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxhF-000000099yL-1UqZ;
	Thu, 05 Nov 2026 13:40:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxhA-000000099xO-3dNL
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 13:40:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so18032665e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793885999; x=1794490799; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=bcVDkrBSiBlmcu7/HDLcDm+cECU6iLC+0XOVTCjqNB367sPIWF2Tu+F+ezAT/FSOVJ
         9U2+/yOWfXN09FCbRUOuyFoXeE6r2Fjq7X7V5thpvWLCdQLrCb+TuZZh4ByUGBCvBmSf
         9MC83jRlnyLE4JzfAdE54BOVRxoU4lhKaRC7nHLjeQTlg9KLeVlfrusqUz1NP3oqlr/t
         /UcOmjB4AtteVWOpK2uGp7WsnLGihv9gRXVdopR12TX72bDGApREeOqfsYERrZPi9I8f
         xi7N/2pW0xBDEK2mmqyxjOnBpa01O1pAnDmqa7EWFBMynkN2V5zXf+m+aZaJcRpWX7sF
         1+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885999; x=1794490799;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=f99AXq6AUT8TDcizgXek68+9pdNNT6/hHAWlSuu5Xb88rAS5cdh5hN4YW+uW4Z2cMv
         w3tu6yRenTRKamqOOuh86AGZLGGoXzc7hGBKzg/fDK2G1ScsgoOGirZcrP7IinhdNETy
         dEXLlbrWFkghUS7fhy7+3nGcDTJLxVNGQeXWnyAb1cvuXbeN3qERKmUqqLmBkYYFttw+
         pGkbOA6jKuTyQn+9LkeMebiJCLzI8HhDBLt3Y1HttxufE99XHmVkQO4+7FwapFIVETfB
         fdDiJ/aUuJ2pRxMm08dxY6N9DCyQ8X3HNMNX9Vg0THtUP4zM8P3ocdPTttJi9izvld+4
         6HWg==
X-Forwarded-Encrypted: i=1; AKwUvBx9AyXIe4MrqaTVK/0Wo7yE+Qeefjjb7+pqBij08IGgcO757Ez+EL4V3CUgKe3u5fZUuWhdXIA7aQ+Pd+A4@lists.infradead.org
X-Gm-Message-State: APuU4Z9dEXEpTCxjl/GpX3NAwxmaNAPRJ1plPwIzciXK7DBxraMXWdOF
	0nyT7R8KCN7HhDULbNRdpaVnNTE2GHVm5ZClTSc8vqiG6BqIRHZjB3OWeJdH52Loo5s=
X-Gm-Gg: AYBFou2sc97PuisqhZzkfhl/H9/SaYIb8vF/C5nU222pz7MnpW0ROzJDt912/fCz23Q
	EHknMjwqlvbDHO175mK7nEPb7y8E9s6hrZCT5+hsCdSuRuwJJ6p+bwaxcfy4l6/bUhZxMyyUddH
	5XUP+uZ56RVuCLqcDnE+slIfqO7zJBTYKfAyL2RgBdPBk0didXdSyISTvU+pdyg2Q6GxGHa1VO5
	qHRBdhSVLkFKcW1j1GlbHnaXyiFeP+bDq+8cCfmY8KosblXo/aHzb5a7AR3r6G/XnNZtBCHHoPQ
	IqlFPVWQhetvybJBmAFXcP/1azpRrMBgvicQXGDQAF6L+iDVpqoP1ZpGLbMyx29nUSHKMtPHjLr
	89lAqxXv6mRKlJIW0bsC9fDMKw3XNsYZO69yBl97YFdEOIIU7S+Jf5jPmBO5YId7oHnn3ycToZw
	ECq59nFlRudjh5+AEv+g7E3JobaEKj9FEdFDElphsYOoCu9CrpH++dHM/dJEep8oU2nAXnr2Fr0
	XDrRLt+xEhsZtGtECeZ3dX/R6LTSYf7hHCgHDalW/byaYFH72Sn2HiRCXcoG0uDQQ021oTNIXcp
	ysNaZRPJfaJNkhV45QhFh0ng0gHkai18P53UMz4NS/noHhvI
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr407422615e9.18.1793885998746;
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm64630215e9.0.2026.11.05.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: sashiko-reviews@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
 <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
Date: Thu, 05 Nov 2026 14:39:56 +0100
Message-Id: <179388599696.2573818.3573650064673131943.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=jY1a/cgO/AsaKMem8B+RlbZOedbhgH1XS158DQz6dbc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlv2nXPrdC+L/KnMu9R1D1tRzX9vYd/SKduvDY96+S2Z
 Tdu393N11HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJTN/N8L/a3f2p9Iup1qle
 KoeWqkfJv4jpybA4dudj29W9U+WudrgwMpy/8nfisn7WmB+KC1myC7YbqbNEOAjPtn3JYzfjRZr
 FGTYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_054000_966276_E2C0473E 
X-CRM114-Status: GOOD (  19.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 17:07:10+08:00, Jian Hu wrote:
> On 10/29/2026 5:47 PM, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
> > --
> >
> > commit 5ec3118aee2f03855552c58a4a8533e035b565bc
> > Author: Jian Hu <jian.hu@amlogic.com>
> >
> > clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
> >
> > This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
> > a zero divisor value represents an invalid hardware state rather than a
> > pass-through. When this flag is set and the divisor evaluates to zero,
> > divider_recalc_rate() returns 0 without emitting a warning.
> >
> > [Severity: High]
> > Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
> > a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
> > set?
> >
> > When a read-only divider has a register value val that maps to div == 0 via
> > _get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
> > CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
> > CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
> > clk_divider_determine_rate()->divider_ro_determine_rate():
> >
> > drivers/clk/clk-divider.c:divider_ro_determine_rate() {
> >          int div;
> >
> >          div = _get_div(table, val, flags, width);
> >
> >          /* Even a read-only clock can propagate a rate change */
> >          if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> >                  if (!req->best_parent_hw)
> >                          return -EINVAL;
> >
> >                  req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> >                                                            req->rate * div);
> >          }
> >
> >          req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> >
> >          return 0;
> > }
> >
> > Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
> > !div before calling DIV_ROUND_UP_ULL(), which will trigger a division by zero
> > in the kernel when div is 0.
> 
> In this patch, the dividers which set CLK_DIVIDER_INVALID_ZERO use 
> divider_determine_rate(),
> 
> not divider_ro_determine_rate().

Yet the point raised is valid. The change must work for everyone, not just you.

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
