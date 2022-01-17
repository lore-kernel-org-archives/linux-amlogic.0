Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A304C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WI0ckyqtRpdsTFuvjH7wNdOUY2eJNweu8qOGhLB0SRc=; b=khNxgXt0Ec8gRT
	zf84Xig1uMLBaGXocYyQsyXalEkeMzG36yyMUoJdaLWP2mTn3yzwSvVYl4LBDQVMmkhsT6QEi/aYl
	/2ZX6uU2F8D31kHv2eO3j4bqM+ANlfOlmRhMt3tdTYwNhULvLlCm3Aduz20MMXpUosuuyehxmGZch
	lyTAyeLof2TP+qwE9ExXiTAd0Y0K3SRQOlJiMhJTtmBf5/Km9m56nb5EvS9B75WpzmwbV3ewEeZIW
	1HlxO1ZIQPEsC7+sFpaQfc3gXpNtmwRe6FxJIgjSJJBwh6uQEFZ2mW1XxO9h83rT0A6ucl805o6CD
	UUf8S0YevMIsDVTe8Ueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ObS-00EK9I-5Q; Mon, 17 Jan 2022 09:47:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9ObO-00EK7j-Qd
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 09:47:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so21296248wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 01:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRAvAjK/N2MPBV+RqbnX3H5XDs9hU9NssPwwrjipaMk=;
 b=rI/Akq165ltR9Sc8h1verZ/wCn2lR1lsS76Yj54rscMrukZ6Pwz+1/2D/nwadWo7FO
 kyNZgp51EyoRMEZ8xq8TGDsIjmr0C/44Sw85/RdM1vbuXqs7FlNZc1cmK44JgD7Y9TBj
 5eeQ1h8nnyq0ZKHfC5KzZOS9Z/5DS45DaMy8wd+hvW1r341VDgDrIfSyMQwyob7EpZe7
 i6mVtQAYM/DZcA6TphpY4xhvZh03+8tQoExkXmbUFkHz3FRnxRGx28kro3xSabzpN+fw
 w2VUVubuybtk9XnaaOHYIyXC4rGsNr+aFHpJtqL7v5xlN2ockNlFHvwE+MkiiPdLl8h9
 q61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRAvAjK/N2MPBV+RqbnX3H5XDs9hU9NssPwwrjipaMk=;
 b=pmCN0/eFZRc/0br0kgC+aEC3ysKUzXBF+ed9X2IsHQzTK310KSt6WbC2FkJvjFpoCQ
 Qq4WOP2bY0dC5GNbOBp3SS1Kqn6obtkSapjFixQwumhE1FuRG/uMOJAGGlyMjJLXk3Ex
 5J0QCNvWuYeE7ee9yAzaTwMY7nRzS7EHvA9U09DQNbo5V0Lz64OFXidkuMIzkeTg5pze
 Tz8SqTvs2uNk+IC/ItBeGxKfpzSEQiGTu8rH6huKeiPlcfMNbGZeQsIEwAuZ/dSZKzUa
 fTeZQgjQ5yaG3UWSdZCFvhb46P2xCgsyEwyTziX9pleP75G4pwz4mKeaUqfwHUqt9NcM
 /XmQ==
X-Gm-Message-State: AOAM532Xgtr4M+Ke2Oa5Sa2S1G1HWB+TsdUurY9FVpqYaZtdwNfey2q2
 opT1wW+K7l5zrv94Kn8J0DbM1R/OKqxVBQ==
X-Google-Smtp-Source: ABdhPJwaN+4yAJBpQqlHvJEyP2R6QYz9crXuPiPcdC9aJ26DpXJKQdiIm8BihjK2Pqp/TLP6IvHUjQ==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr13330778wms.1.1642412820040; 
 Mon, 17 Jan 2022 01:47:00 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id k23sm12844404wmr.36.2022.01.17.01.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 01:46:58 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Gary Bisson <gary.bisson@boundarydevices.com>,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] meson-g12: add pwm and uart pin muxing options
Date: Mon, 17 Jan 2022 10:47:00 +0100
Message-Id: <164241280577.1159604.15931539808955359814.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_014702_941427_9B11C9FA 
X-CRM114-Status: UNSURE (   9.36  )
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

On Wed, 12 Jan 2022 22:16:39 +0100, Gary Bisson wrote:
> This series adds a few pin muxing options needed for our HW platform (to
> be submitted soon).
> 
> 1- pwm_f: adding missing both GPIOZ_12 & GPIOA_11 options
>   -> tested GPIOA_11 as mipi display backlight
>   -> order for this patch is not alphabetical but follows doc order (to
> match current order)
> 2- uart_ao_b: adding both options for ao_b uart + its rts/cts pins
>   -> tested on custom hw too
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.18/dt64)

[2/3] arm64: dts: meson-g12-common: add more pwm_f options
      https://git.kernel.org/amlogic/c/073983233302641d080b524640cc99be696e802a
[3/3] arm64: dts: meson-g12-common: add uart_ao_b pins muxing
      https://git.kernel.org/amlogic/c/2c420d79dae47f9fa3bb8ccb76eaba864c579721

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
