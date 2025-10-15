Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB350CCD195
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Oct 2025 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IReWZaYl0Amigic7ZP8plhaAFp9IzzTQohd6VRHUAZU=; b=0IgOByGJUbIFIq
	P/e67z2voTObD4spPc3u5M8Ri7UzkJRy+AsGlyVgy254it9s3Rcvq1M6BXYTXNQu3fDixE9Ofz0/U
	pMgIwoNLtFCR0rkkTu10dmWbFxKVfJiw3AHTI47cEuWPsaNQ+tpqGQ4ESQMY6eubJxbcayV+EazqZ
	bYbtWcA2PEkeTKZOwflplI3RLJenCp3GtDH5UDlgnYeLRbm+RtS82M3KnVsSjy1fRdMqgOMZRFRrO
	2UEhhV3h5QQrOza78+voVNidA3ojKQLU5uauj9DP/zrqjWla1heYkwSWlZ9U/EftttFkSbyeelIBo
	Spcps951Xwq+DN0CkiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Ej-00000001Upk-1J3m;
	Wed, 15 Oct 2025 12:04:09 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Eg-00000001Uom-47r3
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Oct 2025 12:04:08 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-88e371e3cbfso95176285a.0
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Oct 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760529845; x=1761134645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
        b=CmjKMQQxalohCKa19hLFu05BC9gR+hUoogekzbPk7zzbE8jt66LezCjoG3TrRXUsLN
         ronbv0i6EzQJ7PK2Tq77C0/5Wg2JBdJSZ+hZW0rrwTKjUBKfGyCnOrZmdwAwU1ZdUp7n
         uke1f+XNu/cnzvzU2uvNoytYO0HGU4iLzDFLcr098OUnmcNwJgVKf+ZUrV7YObTwBlEW
         jNDSRvVZX2/ArVk9KNUtUOZkvoJkzjw6dlwykynPX373YLH47WuVt79qDJMFkI9nUZjw
         p0Voo3xKPCLjvAx3YVvk7WRVm1mO1v67l9HDuROG6boD11oyJx4E28WCvDqEald9NFgF
         7hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529845; x=1761134645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
        b=eRPJ4zXcO+vmgOF8oAJ/USlK6kriT1+6JnJsvUFsEmrokq0LQVEFGkaVFOm13EGdet
         WXhnwCnKcQvbQDQDKrvV1T2I/tFExlqSCChA/Wv1Z2kdVAMY5QzFwc47XMIWzMx5iJnv
         sJhw1rBUOA5dx6IR0OGH3jEv6yl3NY9sjR2uGkHmnn/jAk29EhH1Rz2/b5UmLlW4Xvu0
         sTyrosLFuTnvBbunpe6CIB0DBrcg+qLk8VozQu11Zog0/Fut6zc1YbzdCI5zi1svOONY
         Y/Trg5Qt8wWc/TMULEGEn+SCa6bqqqQ/ynlebqOk23HfKi6+IMNjZNBAV+El0PSHBF22
         UNHg==
X-Forwarded-Encrypted: i=1; AJvYcCWkGiNkGMkyxbfSYXuZ5PLPEqXrLh38rrBFCNPZ1xs0MYkhVKKmatStXF7HEDZLX2haTp+E6QiZTKS4lNfI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ngRLhVe3wPjppaP95S7Fr5rLXItqmhlphCRoKYbGzia9yGK2
	MW5lRsESuUUY/27Tf6vBKXVAnFWczSzS9yetEAu6c4vcKQnTtDHKy5W3mwYL1tCoeQGL6shgPOZ
	5mTMsnk56zBreHJjMIvSiWqBs4GHmwocCQlRHf0VyLw==
X-Gm-Gg: ASbGncsNWwYI7ybV52/jObFUguCDxiortpCpDcb0CAZaDwWEiYHRcETfN4XAvOcTjAV
	lT1xKJtCLz2lqc1o9DGKDblqN2IX5U1oMszEFL+F4yBk+bqpwGgRDgR/p+NHO8PKl3GXLnkPUM3
	GUhw3snDBfLgHekGHqW4dhUf6NRvGXGPlFR8chtSglKTu1bkRlsWUJp2xLWWGejBW+0MsPMqtjC
	3HXLkQEGEITJd96B09/CMTxFauQlMnq3g==
X-Google-Smtp-Source: AGHT+IHqCTndsaW9mNNOpEoxqpK+g671TVftkJwHJncfJRnISWrovh6jkW0GrLsJk4LzlYEdY/SfnIetRnQxqll+9N8=
X-Received: by 2002:a05:620a:d89:b0:859:7e5d:efb0 with SMTP id
 af79cd13be357-883521dbdb5mr3978297485a.43.1760529845105; Wed, 15 Oct 2025
 05:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:03:53 +0100
X-Gm-Features: AS18NWCXawAF8rrUemNB4cY6pOyINS36FA1C_QZssu58BBI9i4GnKsHpaQ9lquo
Message-ID: <CAPj87rMRKdm4BvfD8gMmSF3jjeMK4nurzTKPOFY15V0tBr4pyw@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_050407_086777_0C4BBB08 
X-CRM114-Status: UNSURE (   9.13  )
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

Hi VIgnesh,

On Fri, 18 Jul 2025 at 11:54, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> This series introduces new jobs to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> - mt8192-asurada-spherion-r0
>
> Other updates include:
> - Uprev IGT and updating test expectations accordingly.
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use of the Alpine container for LAVA jobs
>    - Various other CI improvements
> - Disabling bare-metal jobs for apq8016 and apq8096, as these devices
>   are being migrated to LAVA.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
