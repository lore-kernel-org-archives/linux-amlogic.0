Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8ED606A329
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fgPovRrk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RisrCIuh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LQny4Tp09HXwYJHjINsjHXYg5rB2e1t6zahU/Yi8+ks=; b=fgPovRrkvM0+p8hHPR98pV0nLh
	0x3ySsCRYjp2C83WocBls0X3/2ZLErfKVfcV52RJzf3ajo/JbPMIEvmYQa/fcwuDsH1zuSzt4xxtc
	sfoxfct8Hg9/V03DO2dAHnozl177bKCp/mgxZTgdacDAGL8hYgVKpXlOdAD9z8T+7GJgYUJmqtMg8
	f+s71FHwZBDH3ao4CFt4RzFDlY8e1BHYw7q9txKfqWP64J1zcL+xROfvHJ2oGq7ziXwbSPTmZeo0g
	J6yvYwl1u6+GcoXEb+8Bgh7SC/IAgTJFVJmJdytj4E9R7lJ02Fzh16wQwR1AOgRdrOnTrrj6OAmbP
	sXZL2/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDJ-00000001ptX-0FeK;
	Tue, 03 Nov 2026 09:53:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDF-00000001psX-3KUK
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:53:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2741805e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699632; x=1794304432; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
        b=RisrCIuhOSEsCVZyBRoG7wzdalFtZHR9+J1ftklL0DjwimhFiFig190nwzPVtWDajM
         FGX7pVHz48XelEXyy5pRnDllBu4aneY/1aXz8zsr2laCJVJlTvYCtjs++OHuQY0lbNLb
         9RvL5oIMbDsn6ijHV2kVNK5vXrT1bpVVRk0PVn/eAhgez1IuyfJwKMatIzvTH4GtOiQU
         rL5loEZCADrbVry6yyVhE00j03hqu8pbEAwR/eJtfbHWwiwxeTBSDnK3PGnq0uy6pDK/
         hhMAi6sznz0vngNjm0bNFbgmTVszrPpvxO6dqBh9IC+g7pDher5wFotIiy2Al51Fg12u
         nw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699632; x=1794304432;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
        b=fddb7qc4A6QeXahEgdmDjCvPtoT2ZHhdryeAxSMVulCmxzRthjAPH7KmXLDTHZ0vud
         cRNFgPDevzcJChlQRuOO2ptm0hX7vTMun5OyzTOKYhUqzstz2jgoKwv4h157U2kxK8uq
         9VL3n+5XTwbx8rg2hSzcbGqWUc8MWZerx8y9aqpv3D+JbqybvoV6vBZj6WW+1AZsb5m4
         MD5pguhT30aZSyabHWFc8s1I7NDfa20BqqyAtdHsby4bQhvXyZk0c55pcyLXkdn3wG7o
         4B0RIJfuIzNoQZeeiM1tx1DuWCxLMXKnVVmo3726KYftrCDl3AnKWHeCIRQ9p0U5/pyv
         A4kw==
X-Forwarded-Encrypted: i=1; AKwUvBwejm2rQ2HBlG+U+M0SZR9/C8hWQz+AdLeKQtDelne4EhAu/hEe6QkDREWbIcQwscuUyPhmeBgkByBau2Ct@lists.infradead.org
X-Gm-Message-State: APuU4Z8rIeBJwlbH1u1iSQk+mrJXXW1P3klLtr+R5mmII0Iw6wP/sD3Y
	XFRkfuO68fuKT0ew8da2cob+ihxMmba82eHCrxCo+FIuNpBVVEmOYqchAY64n8AgG0Q=
X-Gm-Gg: AYBFou1AnrH/eDUrA2gbAZ7A9RZFhdqVDDtzRvIQO+RYUNwH4Oocc/UwdN+aVzvfZJB
	ciq4/oUUOTCzT6pJ0KeD44LNCX2tTkr+RH4JBYCq2GMdibe82KV6nWyhrrQrzXKOGSeBOx+a0im
	DVtgYZuNMHKqpybb3bpwnmobEPENMmCjQ4W6dlSJy/Y1ZT2CqhjVeB857igPvjC7xL1nbhOtDV4
	lcs6+jH8/8rtL1b8WgyBDxAiclQ8XHsw/M9nVl7fa4hVTaj8V2ZP4VUoLQ7Xt74UCI2yKUH9VWT
	FIJxm3k124NqBqOcwAhboZXXj3ktoceIcN6eXzfc+TntenacAkmiGh9jjMd0fy+LuJWVTTVTmDn
	qTUy9to4wN4Dmd/Sg70onkKSB8Mjysx1k5NI1paKOZvgDhcw9LO4xifAIG6DCIPOkH7OLRSr7bY
	A+tgy4mhvJMBh4A4tjTPSSw8c/jYFulu6SvIw0hI124uoXFR1zgZ1P1M6xt1xhs6pWVbrTZSEyU
	dqlSeGnxLk/qyYVxvzWTZv0jr0PcfoEqqMqEnreFAHPNDjFu3dFdHw3e1eRhE4tRkWHoDIAo7V6
	3HobHbPVlw6NFCYgT5+aaKMV87AlSJVIUA5KQZ5MvnXHqrLdm3uJHmldbwusAfiqWFhiNmpq
X-Received: by 2002:a05:600c:63c3:b0:4a1:8dd1:305a with SMTP id 5b1f17b1804b1-4aa842d5105mr293968785e9.0.1793699631508;
        Tue, 03 Nov 2026 01:53:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm24713976f8f.30.2026.11.03.01.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
References: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
Message-Id: <179369963090.2329777.13837819298498627747.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015353_870750_761E6967 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 27 Oct 2026 16:43:39 +0800, Jian Hu wrote:
> AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
> to the HIFI PLL, but it is incorrectly named "gp1_pll".
> 
> Rename it to "hifi_pll" to match the actual hardware.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/fixes)

[1/1] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
      https://git.kernel.org/amlogic/c/81e66c8204c98b2c71798f241cd43f694c5cfb3f

These changes has been applied on the intermediate git tree [1].

The v7.4/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
