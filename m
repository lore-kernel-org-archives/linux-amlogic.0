Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45445C77B7C
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jun 2025 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfPcVsfTT049/ONdTHlNnYIc0iROgxkSIJpRXpkFQeQ=; b=Jgr2qS02qarh/H
	gY4gGY3o8voS+mP+Dv3/nZk/a/ZoTR+m1+/akufbnf0dGlnIxrMfLBJcYz0hF0Kapk8oLi5OmlegX
	EhI7skF15PsFZG3ITsuecxC860Stc1Zy97gqU+uMvjL3fvvmXQDNKNqhuyGl1Bj+vVAljG3FzgIVF
	b2Fkt/bC5x63zP+bAjeAGlae/taQbheHt1+UabNI5RpT0r5uTbaKWJBLraLxHy1iCkum+akL2aSBU
	0x83nWj2L6LstzCPnV57D+cvsJseZWpfO39vBiyNHMrzPAaSRojlJwRyqa33Y3C5M3feATki/5sOb
	zrnkQHOaGzZQ5dDuX6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkXS-00000003V5O-1gEX;
	Mon, 23 Jun 2025 17:00:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThH5-00000002ssw-2cYJ
	for linux-amlogic@bombadil.infradead.org;
	Mon, 23 Jun 2025 13:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=; b=lQ7Bqv0Pf3292BkwOxlrIw3A9N
	BZLOgkBssKyKtgdRIme0/XCytx+dfPBhEesOIg+SsKgQkVp4pTJCogOaYw/fIuaRo1zisJoBpoRDP
	wTU9y41M3qKocebo9WR7vsJWT5eaJTea8k5BUf26itqJqV/hEy76kH8g6g/M5Xken2XLQiapm3xOe
	ZmXhdOQLVcXEu/GlO9ZdK7hP2+blsygIiya3tJRC0rMSC3eqESdNft+mFSSDdF5fD+ypiE4s1QCd4
	BPWiz2nE1DvKfkKlZg05hPb7PLVhfLHjm31LoqcaStgZjYandkjuo6ucO2GbfNHMGJ8E6QMonRK4W
	l1T9ckwQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThH1-00000005E1D-3I5s
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jun 2025 13:31:50 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1825760f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jun 2025 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750685504; x=1751290304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=CLq4D/2ABPLGTOsxkciHhccOeg1/sp0klMjsqjr5wSpKTc/tBgrPBH5I12KPS1b0Sg
         Wra3yz619IzDvs4DaqEMBGD56bQfBk2qX4ZI5s3dBjUvNqV57OxXG0Q4pqXoyuk7TuL9
         Rn77P1M6hNQi0ujEV4PPQ7zVycPppGUDnjWROtDis809Fuy3CC1Sa7Pv6oT//lDM7i9p
         2txHfVBbowJRCcJknhdsuujEepBAQq7lMhlEeAMt6CQhOooqg36LlUiw2H7VZkErPPW0
         +gkmJ7A3xEtDav0LC9eZkwTsjS3HrAZJMYx60eo6eMCzyX/b9a1MkGIfmWq5Aaodu4o+
         p3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685504; x=1751290304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=fUdOT0jtP2zGwrHvt8JL8ehL3jeWzz+dt3+JvC9qSR6fF4dCV7Dz5gS4atixGuIUqe
         W++e+lddDBYKY2z7sXdiYVBPLluBzuOX7jluRkZdMWBhO83++Olkn9ir7NNOtPGAosC5
         QD7R+dTPxnaAzuyGRnXqFKX9/uBxqA4wuanvrVh+gx3Ab+mKTKjVPGWbDXuzLiAvv2Rd
         saiaz0XkoiNZc9y6eXqj3NfwlWTXu9W/EBFDCWjIQsThbvuJXn122ZI5E9fKBRjh5JJq
         PRbu74wvuSIbE7gcdtcB+hlCxBF2bdh/78Mgk8eZDMhR1lEQzOU39mgn/kTCsanIrxmJ
         CV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7Xdslq4iJCUqigym93YHSL6V2eSPFguUyFS0DT7wtFhOQHf3lW6JMHKvtUtHkf35jBT4hpwDvQkdIkZg2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5k+RDXJmVBW83AML7fk7s1r3qtHowmMkmfECZFarnjTlZbQlC
	iJPxnq7CIg/WaOG7cImm5p1ndH3bCU60Lvp8Mjg+i1EvVHjGdsCN7XBhVOtcdjiJX4E=
X-Gm-Gg: ASbGncvtpAM5OuzC3GTmCyUdgZg5RLXtpvyDPZBFkdVviTRfaBfg8HqE9qRnvt7dM/Q
	wHRFTg/9GnJQABeG/IoSePJFiimim2Y/4NKUOBsL2svGjbg7unLlt03s8+IiZkOnvPcIzAJ2AlZ
	wFKMJUG7WWR9yGUSTG3dHNUbzfwf9hf3jfSUe09SYfnwg5utON6TiM164B5ldgBef0hEpgKkWse
	kax8lrDPkk9BY8zRmQGdjSVjdaC9qnBPSCtrx8X9z7EhysIeUXl0FaJ72BhFOot/VerPEueMKBb
	cSaDnwZCTJjFx5pkNQnWSeA8hGzTyfNlw4fr4qeLvPolhDyOvFwKSKgT+Y4E4aG8
X-Google-Smtp-Source: AGHT+IFMA6wLpwWOu66ZBT/Uwcl+XoqhLxK9+V0tMp8/c191NViuqFm+b+1J2RS5eF5XWF43kziHdw==
X-Received: by 2002:a05:6000:491c:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a6d1164217mr12380643f8f.0.1750685504100;
        Mon, 23 Jun 2025 06:31:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1808bsm9401818f8f.24.2025.06.23.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Mon, 23 Jun 2025 15:29:56 +0200
Message-ID: <175068537068.1888277.981802582113061223.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_143148_032406_62522007 
X-CRM114-Status: UNSURE (   5.02  )
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

Applied to clk-meson (clk-meson-next), thanks!

[4/4] clk: amlogic: axg-audio: use the auxiliary reset driver
      https://github.com/BayLibre/clk-meson/commit/301b96e0668a

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
