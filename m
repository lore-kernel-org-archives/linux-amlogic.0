Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71F8C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7UyAokGKRNtiTSHzwsCUPoEA99sjjAy5FxDzWnUE3eY=; b=o9Q+uNCVfeEnbj
	AqyARXK2Yc4pmGweePjBI0du+F8YK7VofZprjCjqybOdUVzGbKNfb/n90O+hITNRqigTtjFyE0h7+
	127HoOY+LYSPRAaLlCw5oZcqnT/wh4Cdwk+ApoUZVHyPh5yEQX9J7BsFLOuCK1vqBRS0C7LsQmn1d
	9P2USIDNz6TDexAneQIB+Qs6Z3HhUJqmGgR6R831PXcT+HQI240/6alQfMSWtUNts2XoVUtqx5CTx
	QsaeJL2IjdonN22TPuztWRdzWB0Th45Htk/I38VfUho4mHK6CWQrcJiP+D02HpZNFgU+AT182akk+
	HKIcMYX86MBJ3ErL7ruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwQKp-006gpx-LT; Sun, 12 Dec 2021 15:00:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwQKm-006goY-Py; Sun, 12 Dec 2021 15:00:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id o13so22953006wrs.12;
 Sun, 12 Dec 2021 07:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+XKpi1Nw/K0WwguHbm8TyEDZ13WyLeSnzDDVy8OBGh0=;
 b=BbcEfHrxsflbtHwJaZkG3PwLNz7LaNIlm8ci1p6MU0ofHz22aTuqYTxsEFnTKQP8cM
 vM13Ir+W4lAOibTy/sioVVfDEY6VlreL5tuWit3/D68RJi1s97PUS/pGugsRrFE+hHuh
 ke0XGkzLVW3Oh310JSntNVoJ8SYPAy+buFww99kf98SGR70kjJETkHaJMgS3Cb9QOb6e
 uhtUAhg0T4Kq7giWtd/nleWouGZYmVt0E4vYy1RLhmneeGjzlzLf8Ttm/NnU2eO7Yw9N
 HAT6vtFW3UyY3nC5bWNAOIoyA6ck4834KmL7DIBqKSZw57Yer827Mn1JhiYFOk1IuY35
 /bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+XKpi1Nw/K0WwguHbm8TyEDZ13WyLeSnzDDVy8OBGh0=;
 b=RIEvyW1HbOKllHNxrvLdjvion0/3xR39ASBUYN2uOXpSvMdfzwFqivxqtqzcSkO9M7
 TSF2PMygX7PTC25m/3quAC57guWAc9JbeRSGf1N1W664UVVejFUL1ud4fC8gEtKfA5NC
 olw3QmTkvBvkjj/rypAR5HVYGyLet91+D7R1FnDgzWaglP8YC2LuZ9SLkNzEoXR/ubmu
 1w+3PYc3/H9x7dc4ATm88oTDgqsyBB4gJb6oTDX5yNk4UNVtjqrl5d5w524sRmMKEzLK
 SVvGwgk2aj8TJHUSuJp2tMppj7IfckV3oG/laRNBSS5h++2WVg79sJLmjkbEEYtYUOQp
 41mA==
X-Gm-Message-State: AOAM5316PZGvDmqGOb5YOUxXUjjJ4wNAo/FxuBLjeqPIi6sVhxUUG0kz
 oZQefy5Xisk4YzbR7y9/DoU=
X-Google-Smtp-Source: ABdhPJzTZpsZI1BAw5ZZwfPMws34vaAaoaZIAhFAGIM+aq5rlwXlEZPax6qRx+/jcnN6isMRKWD0oQ==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr26313464wrn.154.1639321214331; 
 Sun, 12 Dec 2021 07:00:14 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-6ebc-0100-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:6ebc:100:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id v6sm4284789wmh.8.2021.12.12.07.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 07:00:14 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mmc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/2] mmc: meson-mx-sdhc: two fixes
Date: Sun, 12 Dec 2021 15:59:54 +0100
Message-Id: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_070016_907692_834AC5BA 
X-CRM114-Status: UNSURE (   9.04  )
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

The first patch in this series fixes Broadcom SDIO wifi cards (using
the brcmfmac driver) on Meson8 SoCs. Meson8b with Realtek (RTL8723BS)
SDIO wifi is unaffected by this (it worked fine before). Testing was
done (on the S82 board) in private by a user who wants to remain
anonymous.

The second patch in this series is a minor cleanup which I found when
working on the first patch.


Martin Blumenstingl (2):
  mmc: meson-mx-sdhc: Set MANUAL_STOP for multi-block SDIO commands
  mmc: meson-mx-sdhc: Drop unused MESON_SDHC_NUM_BUILTIN_CLKS macro

 drivers/mmc/host/meson-mx-sdhc-clkc.c | 2 --
 drivers/mmc/host/meson-mx-sdhc-mmc.c  | 9 +++++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
