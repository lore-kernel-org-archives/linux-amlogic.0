Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787B2606A319
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2026 06:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JZ8cn549;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPrpmawx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDMqkx3MeO4xT87SChE/bJ8sqdn4iyl+8BC+joEyUpM=; b=JZ8cn5495jdPwI
	8mK1/WNaZAbuhBSVy9hTA5px6QDSjIA1R3l7cLEe27eX02ytaoGOKaLeWxS9KOQWViUx2dcPuv0Ce
	b90L9ndqX9zEfoTwel19x5n/3eU6/Eele5azQUnNh6Zdv8+7rN3P/oE/1qyBLfn+6Wy47X+pjSKwy
	D3Yt1D+EhmoIPThpSW8uMB+fnHPqhwFbqEoUknkG/WjInkrq6XS+GKAHrrqOmcKgxCSI2N7x7yZre
	JhaHdufkQFc5sN4DD9E8FlQs4P+vZ8Arjy+pMb7EifoCyiFor5wyp8AXtntqHz5aJYPMLLM24/wPH
	m1WqeN9B2rTQPQ/MSiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPNm-0000000B7sg-3Nhs;
	Wed, 21 Oct 2026 06:01:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPNj-0000000B7r0-24Rl
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Oct 2026 06:01:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so2312515e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2026 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562456; x=1793167256; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=TPrpmawxu29exfU9zdxi15EOJYvXqeXdlKC9swf87s1Q65Yk81Sn3aduwmArcuKc5n
         uVOuDtUiLiE7MDS4YDYhSmR0drhpIKnD4FHFbAmgc2U0/NaQ0JzbxBeoE/AH5T06dkXI
         q8afk8BdHU4pmn4FpBwt/QSMoZoRY7fm3rvopQx6OFjfUgS0wVyRU9J7TdGndZxxYmMB
         P8yNUPA3gczSN4eKsovg6wdmwgT/5WZqqjDYeBtN/jDIWATw3b97gBCe4kDV+ljVe7GZ
         8SZqJo+PCTjwXbfIg8SFYZhWKZ/DCWK2Xmhe+DiPyR7pxYqC99ABDNJxXvoe9/NBH/po
         KsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562456; x=1793167256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZCxWGNKVDrgA8OGLPMyOoCY7CLwULXtFPHSf9AA35s=;
        b=tuLKaTyDFac6j7vwdtywjcrMF9e6L5aTGlsPfXheMwshLS2x8Sx6HUVoaG4D2Fd7XB
         2E0F83DYEyYGmYqWFwhM3G88mSeUHsSHzkFt1P0WumEMR7qHAWN6lca0xxZOU4AdtTO4
         Q3QEpMHletkDGndXJlK1DXFFrtxLd3Lvf1RSVn1Yi9Ak2EavK9ITQngx7KPqK1d3Gb4L
         F6MvzZpyzAiy/rkFX73114lAJ0Fvv1p2o+TePQ+yzxbCAUINToIvZhBs+ZblLw9jGhpe
         FzNYUquyymQpY2ivJtroAW3aZj5BvSXuAyvh7cz+wmtsBoffH7vAmHi8L2H45CXzCFbE
         pkeg==
X-Forwarded-Encrypted: i=1; AKwUvBxAIJY7kaAFKI0Z6CtmJppZ3k9OnfLuh03vQHuG5GWHPOVbqyKwqhOcLrMun5s6K/G0lYX2VkbVdO+7XsH5@lists.infradead.org
X-Gm-Message-State: AFq9FYLt8WNFGgUJEhEMoe7FHxu5g79YLDobUnP4+oA75huYp7KZDm4a
	tj1+CZTN9ma83QmltIc62gju/yq/t9uxr+gRGuBNpendLfDXGA2DG40x
X-Gm-Gg: AYBFou0eroPmmMoogj6TnyetYYvSiywF0v+IQQgzkllfFHmNfgEEzXMlK5rJq/LrPRc
	Vp779zEP55E1ouqlHK+oR5xxpeU5A6L9/n368gxyGBdi3nyXx/EnLQVZgOeBf8NcAwPHbQywPnA
	lLDuFq9rPIjL4nOYz51K5LyVtHC0efaFZL+T4ga5i3aMPBdwKj5je5h9cclw8u0XRncSjT3Yy70
	rwlLPsJbtdSI7Dt0AKt2kCaW73Q37bfF1cjmdm1W+anIjPfxTmx996+sdU6OiYpyPMnv2AxRe9D
	vhltbXwQSh74xcm29Wfl4cmKuzA1CJBB6dMkMP8BDKNS5w21dygE1VPQJz/AFldUdFjmdjyfyBe
	o4uTQvJD8U6uk04YuNSyMyHDYvpTKC2o8yb7gMDPC6O0NHnwDDgyPtDZzCjoY94W+DI0HaGWraQ
	0SR/z7aQQzHHtLBhEyo0s9a/cZLQ4zI+OISWdUQB5j164vgtMnNLGRxJvjywFvNyxgyGzTky7nU
	Gie2Fm7ctRXMeEDKbrKGyi4We6QaEf9nzGezo6eTupAvT+szfY/rRuIomsQfVQekfk7qupic0Dc
	xMCPvMEj1Mj7qoNQkt9QHP47TPE7bkYU/n3Pv0v0xA9xNLO+
X-Received: by 2002:a05:600d:864d:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1fdd399dbmr10139275e9.21.1792562455713;
        Tue, 20 Oct 2026 23:00:55 -0700 (PDT)
Received: from john-desktop.station ([109.77.5.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm63793845e9.7.2026.10.20.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:00:54 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
Date: Wed, 21 Oct 2026 06:59:25 +0100
Message-ID: <20261021060005.2947837-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_230100_200791_DBDEFEFE 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chuan,

Jerome asked what was tested; here is a G12A data point.

On a Radxa Zero (S905Y2, G12A) running v7.3, sys_pll_dco occasionally
fails to lock on cpufreq transitions, at room temperature:

  meson_clk_pll_set_rate: pll sys_pll_dco didn't lock, trying to set old rate 6000000000

It happens with all the sys_pll OPPs (old DCO rates 3216, 3408, 3600,
4800, 5592 and 6000 MHz) but, here, only while the video decoder is
busy. Reproducer: the userspace governor, random writes of the
1200-1800 MHz OPPs to scaling_setspeed (~700 transitions/s), with a
GStreamer v4l2 decode loop (meson vdec, H.264 + VP9 1080p) running
alongside. 46 C SoC temperature.

                                       transitions   lock failures
  v7.3                                     500290        33
  v7.3, no decoder running                 250056         0
  v7.3 + this series (1-4)                 500089         0
  v7.3 + patch 2/4 only                    500066         0

So on G12A it is the 20 us delays of this patch that make the
difference.

Tested-by: John O'Callaghan <johnocallaghan@gmail.com> # Radxa Zero (G12A)

The testing was scripted with the help of an LLM coding assistant; I
ran it on my board and checked the results.

Thanks,
John

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
