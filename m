Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE36AC433E5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 18:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51BE720758
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 18:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cia2MFpC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LYgd5M71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51BE720758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NHSq5bblFPi9yfBl0sGMdZIFou7cgZbCuUgiFMryydw=; b=Cia2MFpCRWpd5XI0eGRWCvkD0
	KKrLyvsK4SXrV+VzeAjheoIjwjx6rotBgNUxzIM8qEgyBBCtcE2DwIizIS2CffKtveSWJpOX0jrUh
	ws3WGPgCRE9blPUvCY5QYpsf2nayWNB3uMDFpCulp5sTwertOYcOFD1MuFx0eY/oI9IBZkiHu0O0v
	gghKZQLbi1S0wG8aNYP08J8Ds3tZJLnYqwlRly1ahMMrNz1hS0alQpwh7mWQFrm+q+YQEbEghDF8D
	/h+SKn6WX0ZX/JmI8bCrs+MTHrNXL05T5nPCmTpJ46s9A9GS7zACA1Q6IN0zvtn4XwsV8CmZ/FJeU
	3EQnqVnnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv3YD-0001a9-4F; Mon, 13 Jul 2020 18:51:41 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3Y8-0001Yc-62
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 18:51:37 +0000
Received: by mail-pf1-x444.google.com with SMTP id m9so6418310pfh.0
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2020 11:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=617BtXfhDhCxYwKbF1MbJDp6FkHkJ91InZTtwhgrWAc=;
 b=LYgd5M71atEpjo9+l5VDZyOrkPHo9IZuDVdMJYTe4U36kp8vOrC2TapmJ94j/8UYjJ
 jIEt+3OwdsGQQYvAr3ySOyYYhy4X26dlaOpJV9sAg1NvJQn1Oxrm3vxfzDSrEDJaHUzj
 g/VMUbc5LxVbW9KyCIxKvMDO3FGJwRAhPNAEfElYDGjrjAND8qcfgqmAREnmg+2Pqj72
 62k/UVl4GaFMj7zTDTSL8MbS0J/2LKASLUMNdB5y6YbBPfyP8G3ZOpPFmj5q/M8sW0wV
 ilJG4VB7U77x8hJ7LvAYcrgW6vtacGTNQJzs6T1K/QG3pey6yfK6fwF+1aapm2TRW9xW
 2VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=617BtXfhDhCxYwKbF1MbJDp6FkHkJ91InZTtwhgrWAc=;
 b=Jb5ulhvyIXMQXfLGRQdyG+jDSac8hmhCfum9mK3FW4NuMtQ8XDbMju4T2Fm/AddA/H
 iHiAQ5fbJ+hWvPF2/csA4lp1Fd1F07K94XuwHyiwPDnsMb4yDYzyytwl7kqArwBJm4+9
 sLJTS+JF8lxvfMSqqZRNQ4/TkhdDICBV9NEk5NSbe1ff2lln0np/gmIa82RoYVarT41V
 9EU1J5stvlGT5vNcSi2+aJa82rLFH/2hv7Kkh0sQKU9WzKKPKdZ0TWDyMh1S4NOCFhxl
 pMzOUbKqPn4UzZigSdBLg5GoA8fmKZOeNMf1n+rt/z5tlzPwW2La+gFXdCeewuq5VX4O
 rO3Q==
X-Gm-Message-State: AOAM532XeArGs8IcWJukeopFealWzZ3iB43oRzK2ZxeMTSCRy0GRX8G5
 uAXoJF+3TSKHeWJjrQ9i7u6B6g==
X-Google-Smtp-Source: ABdhPJwkB7sITv68w2uhGuGyIEDhJuVxctNfcClDDMcucA+tPHFjkiTXUaT2RW1CffXlgMiXC6FjFQ==
X-Received: by 2002:aa7:97b6:: with SMTP id d22mr1134558pfq.202.1594666292267; 
 Mon, 13 Jul 2020 11:51:32 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t5sm13652413pgl.38.2020.07.13.11.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 11:51:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
Date: Mon, 13 Jul 2020 11:51:31 -0700
Message-Id: <159466628489.14780.16650652644732625599.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713065931.19845-1-narmstrong@baylibre.com>
References: <20200713065931.19845-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_145136_238985_27920AEA 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Amit Kucheria <amit.kucheria@linaro.org>, linux-amlogic@lists.infradead.org,
 rui.zhang@intel.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 08:59:31 +0200, Neil Armstrong wrote:
> Add the Khadas MCU node with active FAN thermal nodes for all the
> Khadas VIM3 variants.

Applied, thanks!

[1/1] arm64: dts: meson-khadas-vim3: add Khadas MCU nodes
      commit: cabb1f3827109372dcb80081cc654eb54f997afc

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
