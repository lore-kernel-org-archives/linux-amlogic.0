Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC60C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbinBlGAr0SPEK3x3pgD8QrJKifNgig5V+ZfqzFbVKA=; b=RZiYg+euuaHUpb
	wDqdh/L8F22Km3itbQtHZ3dQOqDKrRCTCf6RoFgj2YMIjBTxkI0ROa2K1cllcHvQgffkq80LCdBYy
	UOmYHKwdGBbb7jqcEH8BHpFMCuHosXZBIbt9dsbBf8cZfFhqLyQlcX2DEW119maQoaGl+LhCx9Zhl
	5fXjlPJTLQ6eB1xi1RxzJeVa4qMhDihanQn+wm7t7mJwr1UD+OY9WVn5bv9C2aDs01TZ9N2gea4Wr
	3DxKgQ4W3tIufrhsMbHmUZYVCgydg73CvxvN12xkmzknQrQhbh8vZbC6ISpQcUbvqcmRG+ceuZ6VG
	qtnJ4+6aswm2fZlMg7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgop8-00BXEV-1K;
	Mon, 27 Mar 2023 15:31:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgop3-00BXBC-1n
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 15:31:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r29so9198572wra.13
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679931107;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GEeC2vSAVvM+girCVvpBkeWkK542jz5ATazkq0vJOA=;
        b=T53FSo/FhRT7czaVzli/wSmppKWXWqxt2MKFBWxGZsSAVNWf9KfClmRVVuSeuzJxeY
         SQ7XGjIPHKivkAwLKmqFyzq3gXvpbEdT6tWfz8Q6oo9k8Y4bzBiyf2bkTi4SEcBJaZ9C
         Qb522MosSGhUaHyXSxjGWJ/s3Tsq3YItmQmNCa2V8ukCga7VwB4Uib9RuFFv+LCtQDhv
         vOV8blvTl9jCjDrBHFYGNJ+cN7HnGtuaTvocspRqauO55ph++bKU+tbtoJQ2MV8rYoHh
         x41CXZ/iQ6nTtjfqqqabf5H1I9FVs+7nicEg/lw8yv8jQ3fcH9/yWEXJVIw4ATaloSj9
         14yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931107;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GEeC2vSAVvM+girCVvpBkeWkK542jz5ATazkq0vJOA=;
        b=iaWOe6lTYE5g7fRbkVAa1I/BqFClz1HX4qPYTOyrd+agEUCZ3n7sBEF+TdMOjrLvEU
         FTyXUeF9/DBT0BCSVi3rj8q5e3uoUbG2gysKftkg07JUNZ+8D/7VdvLSd4OVojg4umgi
         KpDWOxykMDFtXfHS1BGDweHBfOWTMiQTMgVcFj13uLcx4spkKynPIZvCqhxXhHUO6NtD
         nB7tlaSaT4g3FFuiUlQ8qRp56Q6qm8r3+a3rNW0SbJizL2CKOLH6/gNVtKe2vJlDcA7D
         ZfjTLVyUhUWObkHkctRnATkHLx/nGHGguWG0J500m1xxdEWEd/NRd00Z320E5vI3/vqy
         Xaow==
X-Gm-Message-State: AAQBX9dScTQKoz0BMvs8g/RFi12koAMx29430hGSLWzXrP6p0i9JTW4r
	QgG35cSujTOT9B5/30GJi/P4hA==
X-Google-Smtp-Source: AKy350asMzEdAckdSjpRIiMZc8XjrBMTPMLB6uC4aAc1FbAKDBQxrFKK87ul1WKDRsLv734QW7klXg==
X-Received: by 2002:adf:fa92:0:b0:2ce:9e0a:10ae with SMTP id h18-20020adffa92000000b002ce9e0a10aemr10151262wrr.53.1679931107238;
        Mon, 27 Mar 2023 08:31:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm25172188wro.102.2023.03.27.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:31:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, 
 Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230327120932.2158389-1-mgonzalez@freebox.fr>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
Subject: Re: (subset) [PATCH v2 0/3] Fix G12 PMU conflict
Message-Id: <167993110660.651347.9684463772496010931.b4-ty@linaro.org>
Date: Mon, 27 Mar 2023 17:31:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_083149_599992_49B34FAE 
X-CRM114-Status: UNSURE (   9.54  )
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

Hi,

On Mon, 27 Mar 2023 14:09:29 +0200, Marc Gonzalez wrote:
> Move the PMU DT node & adjust the register offsets.
> 
> Marc Gonzalez (3):
>   arm64: dts: meson-g12-common: specify full DMC range
>   perf/amlogic: resolve conflict between canvas & pmu
>   perf/amlogic: adjust register offsets
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/fixes)

[3/3] perf/amlogic: adjust register offsets
      https://git.kernel.org/amlogic/c/f9d323e7c1724270d747657051099826744e91e7

These changes has been applied on the intermediate git tree [1].

The v6.3/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
