Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63753C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Dec 2021 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qe1u4nPkQEdyGZC5N/8rDdR0d9Wf0ziZX4+EA0nMdPg=; b=4qV9O7dtGWZV/1
	ur7luJSVNWiTgcIKZoE8st203TI/S1Pg7aQzCwnI0JluAeO+Utoo2ZAMlQx5uxZfrs1zfrk5Lv+sd
	w+0At1q7L27/p/TMtEr8ySMSZI4s0M8LxMwaAggDTha3FGJkB/0U49fEI7AzE6cIrWQOWUlPxL6r4
	f7dgFm3kcKuKoDEDeG0fgWHJXDl/6nmOvjkPTbkUAjrdJ7H+y1pf6fpsHZ0EV6/ZLlCGOfUDybIna
	uO5KKg+v+i2k2bz0vAQcUVjVqzWxIkAIABmdwRprdwHaf0YE7ZGiDpk4AzmlFSEg9SrMOAHLstYRc
	2TkGCzqanUCq4U/L5bnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msLws-007wkE-8c; Wed, 01 Dec 2021 09:30:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msLwp-007win-Lx
 for linux-amlogic@lists.infradead.org; Wed, 01 Dec 2021 09:30:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id j3so50743264wrp.1
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Dec 2021 01:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+lQcO8ppUE7hejt9YaL1vY0mu8mVlWjuLxDwwyoQ/Tc=;
 b=TPS/DB745w+9fVWD0DQRKtMppF7KlB0l87RE7pzidy+9/mbqUxL8vX/M1184NjUfBe
 7YKDQ/M05Q46ZnY6vkb3QRJh2vZUKNrYP3bM/2ThfnMDlyrLwZNc5P2Q9aHNk4vYTM0V
 oCIqL0dvLybIN/uvq4qAPNJ+rn8HhMviIVvKD1RD1+FXCZGLDM2UJKhK8IUjezXV2BzX
 3q9758XE5U8vE3PwAUk+SdCqO4fIKydjYpG9cuAuaAEK15bwoJdJB/+cqk8v+zQ9b925
 wfp2+YwMqEKTVv1a0yP9JUcyNSMEsEU/fiTfhvRxLvAO+5mgL9QUgvbrbq5uzgBZWF57
 4j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lQcO8ppUE7hejt9YaL1vY0mu8mVlWjuLxDwwyoQ/Tc=;
 b=ad00IaoNmAeqMMVior5tEOQyOPYNt48XjxHJKDQhiV5zPAT4Gxs5DlfRvytSCXG26i
 krN7mK15RyATz0b7zLNXJLQ+GmwhMFrnE2Fox6gIDLPCxsFzy3zxO7jxr01D3D+jGH8j
 /msb0u2tywlrPUH5A2zUgHt7Oq2K9LP4u4wPORyn2vddM5mdMDM1Y0J8gXdnt9HkiI6m
 iGoEReNkn0Kyq6FEKTzvixMI/eXd7Wle+Ctd8vmVknGmGoFWdPXBFBjnH9pf6Zs3UnT9
 duB/YhB7fh2ysLFicCEJeythh+PYH0DmJDYYB4a6fuKhO17WJaXMagwADWVOYZ35eDx/
 YFQw==
X-Gm-Message-State: AOAM5303VbIMSU+38xl4l2VDP9hkr8xUkFqmb81t1qcCLX5Z3PsMZ6HL
 YoOQUu3X7YGCkhjwFEfrrbQ0Cw==
X-Google-Smtp-Source: ABdhPJzT1IuhrS2TGDdSq4UiTp/L1srB/g3ytBrh3irQ8SUHGP9eItEtK+ItCJezZ8CSKR403NLT+g==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr5345728wrn.337.1638351040539; 
 Wed, 01 Dec 2021 01:30:40 -0800 (PST)
Received: from bojack.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h16sm20066480wrm.27.2021.12.01.01.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 01:30:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: meson: remove COMMON_CLK
Date: Wed,  1 Dec 2021 10:30:38 +0100
Message-Id: <163835101636.1348067.15879754302967719702.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609202009.1424879-1-jbrunet@baylibre.com>
References: <20210609202009.1424879-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_013043_768527_035F1709 
X-CRM114-Status: UNSURE (   7.05  )
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

On Wed, 9 Jun 2021 22:20:09 +0200, Jerome Brunet wrote:
> This reverts commit aea7a80ad5effd48f44a7a08c3903168be038a43.
> Selecting COMMON_CLK is not necessary, it is already selected by
> CONFIG_ARM64
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/fixes)

[1/1] arm64: meson: remove COMMON_CLK
      https://git.kernel.org/amlogic/c/5ad77b1272fce36604779efe6e2036c500e6fe7a

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
