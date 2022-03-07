Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwTp2/3Td40yicQeFTdYJl6kMNQERS7mtMhe71RUmZM=; b=YOO6bV7ivZShsY
	uJeB8/z9/8jddzV1gjuellwAvdphDPcorlLCvkidBSCugoLKbywmXYkd3Hui3hLY8M3kZ7gqIQ1f/
	SjFwB5jTrWnVvUf92wxDgUJCB+AjZwDk1MAgmhOa29Aux1Lh1avq9jvi/N1L8Jjd66Ym0RnW1Nq5r
	Hlqz6Ropi7vCZB/a+n7dnA40T4UQfb8DSn0OZrjc48K2g0pvE1e72uUs9UV1uSaMaHCHkp22zgwMq
	u80PVfOWmU1ZwV8h5rfxRKiByd2eBTIEBXzcxkgrpqoQgPvR0XA/Ln8IKGrjlVqtftWXxiWQQQMOC
	w7zLJTtBehTq4F/joHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAfG-00H8cw-P8; Mon, 07 Mar 2022 10:32:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAfD-00H8bP-VC
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 10:32:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id t11so22469078wrm.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 02:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Gy2GGJRNoE8yXst/AS7H0JV0qPwD/Ie1gxojbs4D5c=;
 b=Fo26egBRntaoWEL3/DfwEyAAq742j6+C9p7nDoRR3xfgwKcH+E0TDoMeGdqSawnRY0
 zK2N5vNx5GMF6qcKk9V2KQnbaO6UyAUZCaFdE/FXr9jbVZfTgPCvGzsNhJ97oyKdTfTT
 9E7Vnhv8Rurn78Ms2XDJxajn01Dbp0imBBo9Q3pRVgfySlysnVpEFWUvCcmDxiOegZIl
 WWg1dZA3DQ/fsbnGYraHhMuoUVT/avjAHhbckx1TMJO0ndoAh5wSR7jCu7rJm18ex+HD
 6/yN5sjeCaH7th5JEU44U3ejPjC2rJ/XGT+w0F7t3lGOEwoOp7GFPRO/arGAf2ZkvV7U
 7hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Gy2GGJRNoE8yXst/AS7H0JV0qPwD/Ie1gxojbs4D5c=;
 b=ROdgmdRJZAAUqWAim2VaHrIU1JfL3s6Wnm7Sx61K9H3V74zkhNOjNNE4NgBXNfZpBg
 iLNsBjrP7Rbg3MGZL/ZoFXZpfxUMc30Fl0EKwqdEJXx3KNiAdEK46m5Mkrl3SEhdAcXH
 T1z/qZ27hvQiOfS3o7W33M8a8MKKCvt0Ha1YqxoiBwOkWcqIRwpGnJo6V+fOtX6M93pw
 bpoQAEXRpOYgJ4r/DRoMqpkMZKcYfd2pRflY03V0w5CkA7RFyKcv2MtR8uwOrW+GJanu
 oeG4g0RChspMW1xBbY3QtEiQJIfZgovhLKK1L1L9zofjqDvdxXSDY+Tz8CT5JoepHevv
 YqxA==
X-Gm-Message-State: AOAM533dEKmuRbvKOIPnv9cQoTz4SirV/Fs1J86kTfGRpGIRvWzqoCy1
 UBFUGKShEAFObU5zLoE9fbIQmg==
X-Google-Smtp-Source: ABdhPJwHiGercBUiYw+DtjYkKgYMr9GAQJXwN7tAmH0OoSry2XwjfzU/p74ni4PpTyE4NNe4RLvE1w==
X-Received: by 2002:adf:e98c:0:b0:1f0:2f5c:2e9 with SMTP id
 h12-20020adfe98c000000b001f02f5c02e9mr7534324wrm.356.1646649146147; 
 Mon, 07 Mar 2022 02:32:26 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c214a00b00389bcc75559sm385091wml.27.2022.03.07.02.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:32:25 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kevin Hilman <khilman@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
Date: Mon,  7 Mar 2022 11:32:23 +0100
Message-Id: <164664911819.1311314.8887306245856110435.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_023228_072543_FD44FDE1 
X-CRM114-Status: UNSURE (   8.84  )
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

On Thu, 3 Mar 2022 13:44:56 +0100, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: Drop commas after SoC match table sentinels
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f6e68388443ff50088e224b3a75090bdc0403be6

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
