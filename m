Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7208CC04A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yT1yEr7rqB9GmCZwsU0xoTUsmN756WVUVFKlAnQ6SsM=; b=nVKKZdYaiUH1N/
	cxNge7ZtH6ZuDBbnbQvloCDLJK0Ey7ZPT+POpEEUvGTzW8LphCGvpsaDJfoo0SjVHq90njgQNJilA
	iotYCcyxgbhjDvaRSpy6YSnixahkolMsnHtZbyoZn6jmStbgbhEf8MVTsyLYS26QHC0XqnTCZL+LW
	a4zWQiBQKRa2VfFJfOX2g8z9K6Vhso90wy02nI4ncB5/u3hDC9PzG2tN2EuDE+xq5SGabWBgE1mqJ
	jFt4YsVbCdT1EnDnGVdoRj0oegt7smvopsbcHO4EXB8ufPrtpUfc9+a1SJYDylsDxehtUnLQypgmR
	UM6Sl+MzZ9vLkrjGqHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPfn-00EwVQ-31;
	Mon, 31 Jul 2023 09:58:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPfk-00EwJI-1v
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:58:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so19319025e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797517; x=1691402317;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rg2nsL33DJP3APkKNMN9PVz8TJV+b2lWQs0h39zCPdk=;
        b=D0CoOihB3i7vfd0NMuE+IHCa036Obg/hpIa5zSSxwWWza07mstlN8/upTS0yoIfuj5
         Qg6dODVcwzceCYpXrF9g1tFAA/I5TkGckqYyQuqoOY7h7H0xpUa/Jd7z85nZ7QUDxHhc
         EArzckJn73/0IGSJWZllm5YnLABbccWDAZuGWIqaxhgHdV5D4D2OsVvwAvIrVPQX2Qv4
         hb9cBaMHMop6CgT1oMVocppR0fAnA+DzmcgTrl2FHd8Kt7EHyOpaayst2z/RsELa0BYm
         wniLBlCyEK/MXeK86TQdiWtXsaBVqE4tyCt+/TqHDQMEzlR3+fhP4JbYGru2veBQQ4vL
         p0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797517; x=1691402317;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rg2nsL33DJP3APkKNMN9PVz8TJV+b2lWQs0h39zCPdk=;
        b=ggstu2VxJJOyIi5SaagHjzDWVHFIX/g5HxJrtnO6YGIK+qK8Rk7SC0dJAieKDTSiGb
         LAyoYr8Zh3AreqvuEpid9fG4tzaSfrYEQCVPxhsJcVzLx1Fi4FSYCB7SH/1nDiheWlRb
         KRs2u9XFZhBKr1I5p8tdBxJBQuxlQD8LA4u8SoeiRr8noxTEaQZ8imxKt89g1c+xe5w0
         K+lwXkshtynn/dZ08THYU+fBz7OkwV9VCKXV4w3ak4zah/FQQ812/Kic0qEsTGGPN2Yb
         eUHs/aSx7FcnDUHHQGSjVgsQCx/Y+bbS6xfAH6kBnqgmj9pZvqTolOuaY66/1EfW3AiV
         x69A==
X-Gm-Message-State: ABy/qLYR68Lq8M/vmBQ7wSB3Z1Tpx3Sara/k5i8BdV4Q/a2Zdre4nael
	QKR0KdXh22RODcLj53kzsi2p8w==
X-Google-Smtp-Source: APBJJlHWatIum20TrxpJEWJ1w3MDJ0L8YbqPTf426+yes4pyrdIxTQM3BwWTW5meZG9v5qeIpdgvMQ==
X-Received: by 2002:adf:e586:0:b0:316:f24b:597a with SMTP id l6-20020adfe586000000b00316f24b597amr6780410wrm.46.1690797517412;
        Mon, 31 Jul 2023 02:58:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b003143be36d99sm12568762wrw.58.2023.07.31.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:58:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230717225623.3214384-1-robh@kernel.org>
References: <20230717225623.3214384-1-robh@kernel.org>
Subject: Re: [PATCH] ARM: meson: Drop unused includes
Message-Id: <169079751641.200989.17748164958378497482.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:58:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_025840_649461_39C5A06D 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon, 17 Jul 2023 16:56:23 -0600, Rob Herring wrote:
> of_platform.h is not needed, so drop it.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm-mach)

[1/1] ARM: meson: Drop unused includes
      https://git.kernel.org/amlogic/c/b5bd2ccac2d5b2830c1d59e759e5e35e50639b99

These changes has been applied on the intermediate git tree [1].

The v6.6/arm-mach branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
