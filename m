Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3769C25B0C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Pnr4RxfLbPtRHk/T2rlbNtFa/C0uTwvdfDK32Eojbs=; b=kIL6OmANQqaEm8
	xjbFHA2p6j7sAXCMLGIfJ3bEm624VoUw5FvpYVi7sFviGwv1LMqUYAcz9oYbHtv3YD4NUAuhXURA/
	442zE2qLczHuEG+I8nEGEku58nT0FRX9+7Uhm/cL/YVqhX//vo5mhIBLaWOCRNf5bSrU4r7W/okgo
	a0MXdpOrTWLc+pFnhwher7WRdH3VbpF6uLOTVxgZqNZdkTfZ7TgfngFSS6tXGnovQ9SJfHqWJASwk
	CJNhs9adcTXOEX2BmCxAiv93ta99AaSisTdRbdkBA/MY6/VjAe9g4JHiLazicnPcdykVjX2tWsmFJ
	yn4KQ6ECKLRlNwB5imwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxYg-00CFF5-PD; Mon, 08 Aug 2022 07:52:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxYf-00CFE5-2P
	for linux-amlogic@lists.infradead.org; Mon, 08 Aug 2022 07:52:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id l22so9909725wrz.7
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Aug 2022 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=IJ4kunP1J9pj2q4yZwyvQMf3KoEr+bUd77eXvDlFmvM=;
        b=7OMB237UVNyaV3vNucxwikyrOugV6/sDg/hkJIzgLZlxDKoRTrlWNsFy9ct8cj0GJ2
         wYTdnM/YrkU5DirkEzRF0fwQp3jy0S9aHtFrasiQyh+sbAriAHPHl3OdOyeN2RztfDPL
         KmAlwZUHzY7GWyWPrJK0j6KN5cXgqkGgNW5PE93mkWprStUfJoZK4bHu+m3S+n6TqW+H
         gH8Hu3AsiNveHsa/QRuEgfchKpxzHPy5gOz8FLkBdFsvy3pTjqnGl9/U75udYKZEO3eq
         sYlJB7vN6yNz61aRqoPM8AglPF3cByra40plcjRuGSPciuVtQ60Pep1bcd7jdetq4TcN
         cAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=IJ4kunP1J9pj2q4yZwyvQMf3KoEr+bUd77eXvDlFmvM=;
        b=j5F0A+iRXAmNMBXr7qb+EQCrfMDO+XPgRdIK0ozp97gIPTKPcsr18/sn76q3w58Ir4
         Gb5TQRBvYFX+uGnxxQX2OPxcKnHCFNtKbJ6oHg1qLhP8YcthtjARe9jTtXNPPh7LBzgi
         QQOPUjyJwZkLVLKwB2SXoq4FVFPWQgpm6wSZGV8cIN5L8CVQKEZdYlZRQNSJSB60CTul
         CAGoWX1b3EU2MRni3YepxIRpmWhfobuBdvUdwXybOsls2kkrct3+uTFFqwxEXq3c8ntU
         Dwdcva3OkZZqsNm6QaxOuwU+zn2y5jpJCcjs0tZxn82iQG4imvvYLqsjV/HDd2FR7LDT
         3QIA==
X-Gm-Message-State: ACgBeo0F9MuWZoV3x5idWNgmEYqdomdL1XlUOturOTfqUFTUIPaLP0Un
	a6PJDlNxNrmvFzUWHOp1BCC4BQ==
X-Google-Smtp-Source: AA6agR43e+yqIlLSyJSG6dgGvsKXg5JEqdq3EVBg6TTrHBtXN12v7SlbDG3PCFvH0ktIrKBk8z9W5g==
X-Received: by 2002:a05:6000:61c:b0:220:6425:c113 with SMTP id bn28-20020a056000061c00b002206425c113mr11149522wrb.612.1659945133528;
        Mon, 08 Aug 2022 00:52:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b003a342933727sm18480533wmb.3.2022.08.08.00.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 00:52:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: airlied@linux.ie,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com,
	dri-devel@lists.freedesktop.org,
	Liang He <windhl@126.com>,
	daniel@ffwll.ch,
	khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
Date: Mon,  8 Aug 2022 09:52:11 +0200
Message-Id: <165994512091.16922.455382541518056728.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726010722.1319416-1-windhl@126.com>
References: <20220726010722.1319416-1-windhl@126.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_005217_126932_54DA0416 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, 26 Jul 2022 09:07:22 +0800, Liang He wrote:
> In this function, there are two refcount leak bugs:
> (1) when breaking out of for_each_endpoint_of_node(), we need call
> the of_node_put() for the 'ep';
> (2) we should call of_node_put() for the reference returned by
> of_graph_get_remote_port() when it is not used anymore.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=91b3c8dbe898df158fd2a84675f3a284ff6666f7

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
