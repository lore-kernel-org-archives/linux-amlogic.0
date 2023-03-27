Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C707C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzU8ojury4Fj0AsQ247UJYfmNVinK6bqgcvnSQAtqSI=; b=xNkMp9Lnaexz1V
	TNyhNQwwdUedy1X6SFqP4vs3QPaSjDGH1iLpoTNfq+ExHXk9ND2fvF0WTo1NirxnTLYQBkzxmBFM4
	QvG33gWBvVM1l09byhBu6chyLhJbily0tGrGJsCs4OJIxuVSuvhoqUfoGpXV1GOTtps34zgC71vr+
	lbVss0jPh1pUbbxOl/sW1g9zfUrNXLNZUjWGAaoc4rgnqUCoucuxUdSJeloxPY66z1sbi6dccZuwv
	lHKsNRxDR3Agr5KTbNonde9ojSkjRhq1ytIkayUc9dfU4bN8Gc2ThUdtOUbjqPIN7jNhcPkJ5vDyJ
	akZt3RO19kKsqQE4tpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnde-00BHUe-28;
	Mon, 27 Mar 2023 14:15:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgndZ-00BHOm-1l
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 14:15:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id l27so8975273wrb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679926547;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9a10JnyXM3O7nq+ocVEpWauDoX8na/m6EKdBpf2XStM=;
        b=pjN7OkP9Zvs9bgV9MpMwAoKkNIMvn15CF/MnjFZDCxddCdc+V0vEJuwdDfDjClLot0
         zXAB62ejSLbvbBQv81WIApqfnbad9T+qybOkWHisMXWI1fMZ2IP9zUbCUnBXYgkCTyy8
         3/uD5NTqwCzV1CdK+TVcRVcCPs7bxKkd8fTbh5Y4q0aRhhFXWOTyFtjctZNGASgYFAX5
         733cKR9v0G23soURi9mEr5Zp0LKG4GHa2FnOR/eJZBuPd9+FpYkJ4SkwCSJwMDdl1m21
         hs+kZY80LfTxB13YtmWknAjON5VZypAYywtNXoJs2+iqUAoAZTZH+AcGAHQJvp+AlnEM
         OEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926547;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a10JnyXM3O7nq+ocVEpWauDoX8na/m6EKdBpf2XStM=;
        b=DH6Swehk6+F2qqhPXmDLnKXAXv2C7v9xcBaGGRrdqYrB2Md7sBQdUxA2RsgsAumM10
         qHCCEmtpL+Z2/C2eJ9L9MKy3ZEkUs6EX0GLdp8zddmS0A7dosOTpsIEfzMGLCw4U8ora
         eWOAj3sBJExlOLK9Ico5NjijUgkhXDY7iSRt2CyyVKqpLVXsjob4QrRF0538vth0Sfuv
         Uz+WOq6qGCT6VTowNxwgeRZujYU8nrXNXW8L5ibCIK3xZyPf1dFBJ9RjdscyTYyiDzax
         IlmQSZ6Ym5NT4j3cIR4azBo7RuS+S9VNcUBUww8tQUPqAAcoESfpmFkKpzHc45W12gVo
         TDTA==
X-Gm-Message-State: AAQBX9dchYz/gpgRouVkVuamuruL4etT2GFYsnUNkyhmD3AEstjgoIFn
	x3tUoN3rw5S7rz70keUnF1i7A2GA04c5F49J3BmmM6QV
X-Google-Smtp-Source: AKy350alfc/0KH13dq6Bga3nEcNs6opirWl2TeMfjgFDZ3vOapLc/X2uqPFESMqmtOARHM+VA054KQ==
X-Received: by 2002:a5d:67cc:0:b0:2cf:f3da:5b7f with SMTP id n12-20020a5d67cc000000b002cff3da5b7fmr8441439wrw.2.1679926547192;
        Mon, 27 Mar 2023 07:15:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6106000000b002c55521903bsm25076208wrt.51.2023.03.27.07.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 07:15:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, 
 Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230327120932.2158389-1-mgonzalez@freebox.fr>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
Subject: Re: (subset) [PATCH v2 0/3] Fix G12 PMU conflict
Message-Id: <167992654656.581030.553442502879512039.b4-ty@linaro.org>
Date: Mon, 27 Mar 2023 16:15:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_071553_632731_B03B6BB0 
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

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/dt-fixes)

[1/3] arm64: dts: meson-g12-common: specify full DMC range
      https://git.kernel.org/amlogic/c/aec4353114a408b3a831a22ba34942d05943e462
[2/3] perf/amlogic: resolve conflict between canvas & pmu
      https://git.kernel.org/amlogic/c/33acea2049b5058b93d1dabb536b494f543f02a2

These changes has been applied on the intermediate git tree [1].

The v6.3/dt-fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
