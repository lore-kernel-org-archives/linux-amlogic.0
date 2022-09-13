Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450EC54EE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Sep 2022 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GD+l4dQLyb+vnkZOG1oEXAMSUmtDYFtelF869XN/bw4=; b=I/Z9dxYc7Je2zI
	of4V6zFmk4j1prKb+AJup42Sfe1s7uN0X/IPQPsjwEHL0cX0SzXglmoxn5Xlfb7xPNjr0aFniCvy6
	P3dJ9URTmSAmWH2A/1Xr0sfbu7dD5zSCXtfJR1MSxZMUsRKsyjkNAVaRT5YP4NFvKF2F8N2lVuWuG
	tDh0LoU09ZcIinMI+SOE0JIVyvyezOCs4+NRmn3KVwiXNfTIL2GYRJJiwJzOseI99MQuDsAzhAkUD
	1NhnAWNQn1hAdFdG/rs6fHPju1yp4XI1G03x1A619Bif2wCca0AYDrtHvb/nw+g0zGAWn/H2g6bOL
	ezJBTh3LbwlFH1MDOVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1qI-004rcp-KW; Tue, 13 Sep 2022 09:04:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1qF-004rX3-GA
	for linux-amlogic@lists.infradead.org; Tue, 13 Sep 2022 09:04:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso9065524wmq.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Sep 2022 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:subject:cc:cc:to:from:user-agent:from
         :to:cc:subject:date;
        bh=4jg4yuYKw3RSbHJBXuQGNqu00f5a8VIbgi4jPcUwKxs=;
        b=djz+A/vQdeMccYKWYMMPVB3e8Fm44jvmtbkWNpnpqVPp4ezs4dB99J1G+B6h6NNiYL
         KFUyGmXKdvSFpCyLeQSc2np9MBZeLrABuZ1PBKEWPBtg2NPCDxk5Lx2TI3cETPzozrIl
         80bzh7O52TFln7C595fqt0fabBvl1n1VgtJIGhiGyaKc1Tuz0OAISOUBMrvS9ZOC9c8h
         MH2DFZ9avIheepq+QskALtXhTscqncb3qSPXZWDho1bwThYvaraegbhTzNhQPgFphZsS
         JYA0LlbZJJ9EmJ7S1aQRx/ZVEKZlBqV8ObaWCnjkGJ4n3BD5cq9Ya6T7/mbxkKkpIuso
         ZojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4jg4yuYKw3RSbHJBXuQGNqu00f5a8VIbgi4jPcUwKxs=;
        b=byLkzl3PQMb6ldwnG5ic2mP3sFBDGliBbtPrFeuQuPmv8igGi1bAiNBp7S0bxXcjJ5
         bQzvjVX73eco0+CDsruIIy628+W8B25Fl7Bx/CVLJ6VsP/kdQHY6skZRdV1qW9odMiJp
         XSieRfh1vpUKl8a1Z2cjkyQbQn7MWaDaj+Twce6JPVQkbHsqGwL0f4YMGPIqvvMBX9mY
         D99YUKhTT2uZgGALNE+btht7pmk4s0v4EsY9BAwaxsf5XUxEJHTm4Hg11Sl2kdWWntyl
         Fbt/PislhOPQGqQQ9Yvbn1Thc875VIvM/R3HkUovh7xuvz9yJ+G4LarH5OmJYQG8BYH0
         C12g==
X-Gm-Message-State: ACgBeo1acnelYibKByh/xuGS2JEOANpXYr8VzhO6TyTaIZ/IVc0lKOy8
	yRzgJiAy9aNhnvFtJJ/JTGw83tri0o5EOQ==
X-Google-Smtp-Source: AA6agR5TJD5cbds7dOjgPGzgbjt2fnk8X0x1y6Fdf7eie0pZqmSiNHUp8hPswTmPcnGPZ/2F6IGADA==
X-Received: by 2002:a05:600c:1e08:b0:3b4:8fef:d63c with SMTP id ay8-20020a05600c1e0800b003b48fefd63cmr1572410wmb.158.1663059864502;
        Tue, 13 Sep 2022 02:04:24 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q3-20020a05600000c300b00228d6edade0sm9793752wrx.46.2022.09.13.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:04:23 -0700 (PDT)
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, open list:ARM/Amlogic Meson...
 <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.1
Date: Tue, 13 Sep 2022 10:58:30 +0200
Message-ID: <1jh71b3asq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_020427_565921_941CEAA5 
X-CRM114-Status: UNSURE (   6.51  )
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


Hi Stephen,

Here is the amlogic clock update for v6.1.
It is just a couple of minor fixes which do not conlict with what you
have already applied for amlogic on clk-next.

Please pull
Cheers

Jerome

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.1-1

for you to fetch changes up to ceeb22187ee27943212da7b1a384529343a6a2f8:

  clk: meson: pll: add pcie lock retry workaround (2022-09-13 10:39:23 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.1

* Adds 2 PLL driver fixups

----------------------------------------------------------------
Heiner Kallweit (2):
      clk: meson: pll: adjust timeout in meson_clk_pll_wait_lock()
      clk: meson: pll: add pcie lock retry workaround

 drivers/clk/meson/clk-pll.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
