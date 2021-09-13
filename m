Return-Path: <SRS0=/Mmf=OD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85844C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C1160F6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52C1160F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByQLtuXqy83js413jfT+87hF1l0Opt46Si6ncanOgOM=; b=dOf4z0WuNnaN6N
	3O/e9kq9s/swfGIe8/3Ya5or8QqE+iiEVBcoCcni5v3VZhf20WZ5z9v+VC3Y1gDHm/zk8eLU/2fZe
	wN3RZ8T1gDsvDHp7ea0wF+lFWLACYEguPeBNwtrhuQFRT6dc9VnkxSYCY2kNlqnTFRVxDhhRUhks0
	XrOD1KXXXJyNiltdEbj0RkPs+SgFEO5Zj3838TFq74PfRjKZWic2XVneZAr9Jfp3nx5I+qZODARlw
	7ee2ItKx8PESTo4fVeU7HTr3kEGPZqLSWTscLnVU0/TvE8bpwGbgyBmsleKqufJenmOplEO8HeKQx
	TSLyGpju7ITvw0SNLKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPghd-000Z60-7G; Mon, 13 Sep 2021 07:48:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPgha-000Z3y-7l
 for linux-amlogic@lists.infradead.org; Mon, 13 Sep 2021 07:48:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 r128-20020a1c4486000000b003065f0bc631so1532823wma.0
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Sep 2021 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H8B7xbwINRHhqxF1MMsyq3ruixWSjkWr3WYb2IwC/4w=;
 b=jQYgRv3r1b5ziq6GAtSG41IHs7Mxmx/7NzVkqF+Ma3TW+6U1wVsPjfdvcuZxTGrmKF
 4D/jjCMvaLg/xODS29m4xMkilg9/mqeMXeJeRcewjssgFJhyhaoJwQUD8NTkoKq2lqXy
 lL+s7LeJ2n8Ovc541c5u43eN3OnkxwKcBoXv0sRbWT3Nsznx/pKb6jebChR8wQMew9TS
 nEyZsuBUA4culcO22Cskdb8TWc3EWEpMYAC/eobso31kmM3x9sdgx96ZBLfZzAEgw5hG
 N68Z7foU/H7V83U9poDMgN31e2FPUCQZefZF/5tgwIlAFyAwN2Q14mEPpK1lXrBFAlet
 XhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H8B7xbwINRHhqxF1MMsyq3ruixWSjkWr3WYb2IwC/4w=;
 b=k2VNPCLLyi3GJwE4k4immWkK7ov5k7iFvDJCFOWH3W5Lyh9bpWw1JYJrnYsJNCkJJH
 cgmGIT0vsD8forW81Na3hKaa/FOLkjy6MueoPT474YglFz9tFuSZjWlnhg4xKUqH4DqT
 YLaPYCJMRA5+hVISYUwCiIr7CbJJMAhSIgz7N7Ix+IKGhidqNO0xAysr9USuxGhGHIiA
 XwbCxL5dbBAzbGXlYlZtA5XaE6i0EsaKePZu1Q3nIT9UmjOuMeBMdgyyNdIUQJhuVTyd
 hFqqB3G9OfCZHmW9LnPCWfeXcSesmEPnTEdRoYYmAri3XImzouEvOQCEyjDhvSKroQ0L
 trvQ==
X-Gm-Message-State: AOAM533j7zmV3VFLVygqlYOWX7eeAyrwTkAuodSBDuOk0EIoYk+x2+Nz
 7fUGqQd4MAp4j2GGCLOjTF8vrg==
X-Google-Smtp-Source: ABdhPJwUUH8bihHEeIDsCFA08JpJBGJPQWwFBqCrYLeBaXIPrOvtHZZIp0yGJFv+rYkUNEMD2wvFiQ==
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr5671046wme.32.1631519307550; 
 Mon, 13 Sep 2021 00:48:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:9ebe:26f1:5acc:c894])
 by smtp.gmail.com with ESMTPSA id m8sm6541195wms.32.2021.09.13.00.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 00:48:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Dongjin Kim <tobetter@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1: add Ethernet PHY reset line for
 ODROID-C4/HC4
Date: Mon, 13 Sep 2021 09:48:28 +0200
Message-Id: <163151930396.823339.15277942851578495255.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YScKYFWlYymgGw3l@anyang-linuxfactory-or-kr>
References: <YScKYFWlYymgGw3l@anyang-linuxfactory-or-kr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_004830_331075_85FAB35C 
X-CRM114-Status: GOOD (  10.27  )
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

On Thu, 26 Aug 2021 12:28:32 +0900, Dongjin Kim wrote:
> This patch is to fix an issue that the ethernet link doesn't come up
> when using ip link set down/up:
>    [   11.428114] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>    [   14.428595] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
>    [   14.428610] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
>    [   14.428974] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>    [   14.711185] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/1] arm64: dts: meson: sm1: add Ethernet PHY reset line for ODROID-C4/HC4
      https://git.kernel.org/amlogic/c/9d02214f8332d5dbbcce3d6c5c915e54d43a0c46

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
