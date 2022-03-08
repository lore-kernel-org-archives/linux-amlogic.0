Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F197C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TkyJcojUu6FhtGH2DfLXSMrHHh8pNQQlsTMOudbpXCU=; b=4yTXhFy8xctlSh
	LvwwrUNb1a0Tw0EAoiOymGb2YW0RUT4x/8aycVF7CzAaRbs+snf0yHPlxDHdV/ahbDX/YIEPXtOA8
	EQhke/TTF3p7r3xjbwG336jl5vvjEa2n53aYrOK4Sui4O2Vn5IMyQLvhxNE1+ofreZpQb9yMwmMeG
	XFwi6Q+mFxSMQjuxYV89hsxF5O6/NRHWr45qM3tlyyQxO25vpDHGMg0uIfePuUA7PHvaaCZ3ndMVg
	7K25RiOBurxyA4lyHzh3SNa2ZkStPRh6ZbWIj3nftAQP+B1KF9uU/A7hzqit0Gf9kJB8mMiT5YwRG
	u2SfXUezhgyTgGvOWXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nReVR-005m5Y-35; Tue, 08 Mar 2022 18:24:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nReVO-005m4h-5m; Tue, 08 Mar 2022 18:24:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id q20so9362355wmq.1;
 Tue, 08 Mar 2022 10:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=qtkG7IkPrQ4JLvq7HqHZ+MI7v3AhHLu+VY5VIIT3z3U=;
 b=aO6j1vBvZFQdbBFxUD357mFqB726I42aeFAKQV6Tw6Ldatq9mA9QPqt28eNQ9x/rQc
 2C1L4lgeprxPcBkR8RQBqndrOzvSuzpV1nCoiBf+mRuyK4GJFCC0UwFywBREJ3NNMkXO
 BAlUH3jb8fQb5Nw627ME+KHG0nwR0sHB+5MBaY25zEWf+kbo2xY7rafPjeCLmcN43jeB
 ndouTcolQzAsWumCOxbhYM6JXk8/29vWuELiSe3inQOX3snKW00MGceWA0zSAS/AGOL4
 lBS8bdyruaGxdjd1Y3DLP8YEjXZI+LaT1fvz1UCC8sJ2SmHOh9eGQpUm2RJdrwF2sFaM
 WZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=qtkG7IkPrQ4JLvq7HqHZ+MI7v3AhHLu+VY5VIIT3z3U=;
 b=akJIvrNfC2/DAGZpS/RQB+sBuM9ZCe2w7g+rJOPVJ5qBf32y3m2UnRRzf/Gkg8Ffs/
 mtZZjvAdDUFxq4y2WXhSLHUoZUPjGStWCMVJnd6jN2R/lz/GVfcRfPLSyt1us6jgKy1v
 ellSSudz1YsURh/cs9/4LXjZcs8/XQjf5IcWR97V+iaQWf6QZzsJ5pxebDYgknngcOT5
 YVS4BGrBZ0XYGpSG8/5XHrdsn2M8yAmSJMcSyjpX4ZreAk2v3XGPAm9DpywctcICm77u
 7fDdFIkRfODWSnDNrMG9WPK7JMEku0o4l39f27hhqs/2XqPzNCgtPSjZfgzY4wu3bsOz
 kSDw==
X-Gm-Message-State: AOAM531nRY0Tq4pTzBKsTRLYYvqqWeG4KUPob7VUq+yldYl1bLg8JAbI
 R5waMb8VV+WpE1BmwoMLhHE=
X-Google-Smtp-Source: ABdhPJzIi8UMwr4Ov9cUxZRtxKYt4q3XOLgwt3b+fRVCztOKJOW5mQjRSosoxD/OP2v4UryOvXKT1w==
X-Received: by 2002:a05:600c:5011:b0:389:948e:bb4 with SMTP id
 n17-20020a05600c501100b00389948e0bb4mr4576157wmr.107.1646763855669; 
 Tue, 08 Mar 2022 10:24:15 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b54:500:3175:f9ac:af86:a778?
 (dynamic-2a01-0c22-7b54-0500-3175-f9ac-af86-a778.c22.pool.telefonica.de.
 [2a01:c22:7b54:500:3175:f9ac:af86:a778])
 by smtp.googlemail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm3456435wmb.1.2022.03.08.10.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:24:15 -0800 (PST)
Message-ID: <13ecb1a6-6ae6-2815-7ff8-58f661c14b2d@gmail.com>
Date: Tue, 8 Mar 2022 19:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Christian Hewitt <christianshewitt@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Missing mali regulator in Amlogic dts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_102418_251923_14FFE687 
X-CRM114-Status: UNSURE (   5.73  )
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

I get following error on a  S905W-based system.
lima d00c0000.gpu: dev_pm_opp_set_regulators: no regulator (mali) found: -19

I see mali-supply in the DTS of few other vendors, but in no Amlogic DTS.
Is it missing, or are Amlogic SoCs different here?
In the latter case supposedly drivers/gpu/drm/lima/lima_devfreq.c would
have to be changed to check for the optional regulator and not call
devm_pm_opp_set_regulators() if it's missing.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
