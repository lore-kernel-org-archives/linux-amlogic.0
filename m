Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2518C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:15:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C16D23432
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C16D23432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLloa1WHgh+6Sav4hL269YFRW4bKN6b+NVuMGj+Y93Q=; b=YSPZAI8SotsUtt79sFHNf3ERz1
	rG5I57icYwRcWEFZGfodW5RW5RHhWe5N5E0EY5qWWA54iYZBmzl0tFalQXGGHuGS/IZHkJRmyJ5b5
	i4xbdmd3fLLOE/0+grl3h+4Jg8FsbROb4sdtbWXF3tEfDiBgmG2LgSoBZcyY2UsdJJodUcY5A2op5
	5PYHJTdbjWZxQJx0UpNLuoxx0wsNSz60FrjKT88xYuMSHtH8gdHLG54VziZcsYevZ3aF5N/rzTIFd
	lkG+9sAZMhu/gNto25bn6W1DXl+9z+tce9HFAfDCiW/myTbRUovC5VDHSuSBRaWf7RJk4tNULeT7/
	JZGRGMxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmLz8-0007d1-9m; Mon, 07 Dec 2020 19:15:46 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmLz1-0007a4-U3
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 19:15:41 +0000
Received: by mail-pg1-x530.google.com with SMTP id e2so1399773pgi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e3uhuWBGRirYhIvh2jEudLI/qnhKeXXNabqkGsagY5Q=;
 b=PN8fh1FOzpq/dowaxW0lPNtX3qFf0NK231+P13cgmo/xEHXKqrXDKhzSAEOku6z+19
 6RkuwohsG0aQrDLy8IfRWt/u0Y6zx3DmYUJbFhWJs/Vm7Vk1lB7ITJzXa8VDoSJpnvBp
 Na+KZjGYxL2Qq+kYrvDR7VrFop/8Lx2luPFXLxLY+NkoAdNGu3WSi09gZXivav/i3QiK
 MDk16bdi55Vc5RB4unX7YKHxj2ZJDSIIU5SuA1S6k5X/1Ysa9BBNfO2k24PPg/IF3dxO
 hrj6pB7JBJHkl6+GkICIufBKhoi5PMtVtyledXo0D0CSEynC+IfVZEv6DY9bNormK+ff
 wseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3uhuWBGRirYhIvh2jEudLI/qnhKeXXNabqkGsagY5Q=;
 b=Ua0YifbJikqU6RDuioO2q3dklbLlbX9NNnaCpeaOT0c45D5kRXcH4UuahhqoaSWpj+
 YQy1EfmPe044uKyxykr7BUK7jyMTmVymcCcxy2iVp7Aoi7vF8OiNrVrIrBRSwY7pq/OE
 ChkLBg+nytsuMcQrCvSKB+iwV4wheE34h2+M9MRl+y7WCxbiPdEAIEBbx3ztm1AqVkpP
 3NyWN3NZuOf+loZYsitZDCCdn++ODXNxk4EaFrzbAJF+pGt/I/Duxa0G5KBXHV6x6/XH
 1lCpHHJD9FIQOufGHKaEezGreDNje/mVmgY5QyDTaioGTvOQiavz4nRBnwWNcCzSWH8J
 9/yQ==
X-Gm-Message-State: AOAM531NKKLJF1raeWosI5w/Cz8RzHkXp/qcCGpXCqgK1dZdNT1DWLL1
 x01xT2ULmYX55rpwAhAueVoJCgzdPxljarxw
X-Google-Smtp-Source: ABdhPJyRkay3wetKUaMSU+yXCso0AfuCU5KmfwrQoyKia7MsjxIRm/wInWgqLuUFDIw5JevsGREZ2w==
X-Received: by 2002:a17:90a:398d:: with SMTP id z13mr280159pjb.1.1607368535750; 
 Mon, 07 Dec 2020 11:15:35 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o198sm14912876pfg.102.2020.12.07.11.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:15:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add KHAMSIN IR remote node to SML5442TW
Date: Mon,  7 Dec 2020 11:15:31 -0800
Message-Id: <160736852894.39684.5494741496019809209.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201126050440.6273-1-christianshewitt@gmail.com>
References: <20201126050440.6273-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_141540_019650_0187A0E8 
X-CRM114-Status: UNSURE (   8.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 26 Nov 2020 05:04:40 +0000, Christian Hewitt wrote:
> Set the IR keymap to the KHAMSIN remote shipped with the SML5442TW.

Applied, thanks!

[1/1] arm64: dts: meson: add KHAMSIN IR remote node to SML5442TW
      commit: 2493a9a515cf2bfa958d1d68beab507a1c7f5962

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
