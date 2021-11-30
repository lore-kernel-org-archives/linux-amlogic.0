Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0609BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh15aTmE/368+BooSFltL+pH9zX0Wv/WSK24m2T36Oc=; b=bQ71Y2HQPp0plg
	J7OmPRiatHmxa7pnr2rwKn5snOcXfLqaZRG6vD4L0wh15OkYavvX7CcxZiCnf4nXkMw93cZvUSTC2
	FBmrgoi8cN+KbbJT0Atu2aIvutLPR8DjeJM/YlEiNjeagqPnfyINMfZBDmTrl3sMFB53+9h+l5ZsJ
	yXID7bDPVfD6dBuXElDCn209kWnMJDqQ7jdP2jjrPZoQWZRWXIH7aytMcv2xDMh78puwR9bnVwLAh
	Y8SHV8sBqoimOs6E6JMsBQ55IRMmIvcbMU7VD0+BomNfzn4H1zTRnI1x1kx8qnlIBlRx+BXEmnRdn
	BdUAtqQilD02ovUV1dlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0bW-004hEF-10; Tue, 30 Nov 2021 10:43:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0bM-004hBK-3T
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:43:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d9so22500468wrw.4
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jTHuYMzNLIH+1EREfrK23LGcaA/r+2HAUHMYWHTbK0E=;
 b=8AU4j1dXGyXQzi/uOV/ptlQLu7n5vNfIJWecdLQT8PxPK+4CrdkZuL0dYAlvoQAo6H
 FAJwmS6/QbMdGcwjzTy9aqSwkf2ZDQsf/JySYiSf960T/oGHLCNcUOL6zDmk7Nz5pT39
 KwjTdt3e0FqwJvf+OrfwS6Ox5WH8KASJeRlVXV+T+Rtf3p5BN+gHeBtVD16fAd+driri
 p+cZlg5qaXkJDH4Z3cKkm5HiuWLS1iNG6N3XBGI3IZwq9XDmzfxykAo9+Uj4Ax867M1L
 UNyRBr18fT66sHHaZ4HHCmnH4uCwVNIwpDzHIGnQwfpdZg1Ks99CF7xNbARs/Qz/ERGT
 uSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTHuYMzNLIH+1EREfrK23LGcaA/r+2HAUHMYWHTbK0E=;
 b=pfeWqsMnToAHUwtztwRTkDl+KcwcmfJ2Crp7bn6ZzsYfq5rQyFL5CMLsWoA5Oc/d5R
 rUg7HbqZMeLB7QjGPwmDO5aTEBkEl93x9+kuxnfuJl8ZmKTswfigd5JMlkC1gixSiOvy
 K6QMJf3yXE+XBOqeIuseYNPKlEakKlAb9yO1p+US9q2Z2sat8NTz5Sx9p14tYXxXyJhn
 ROBLpSZjhIp8l4hM4Uv2AufMcP3ku9S1+BVe/xdQvfVbaSu0TgN8O1puBJg0SH7b66k1
 e2/bK/f4tWCmdHpts3WKOCi4IwZWnIIQOaU2psvLch9hiHIJyoZrybrcO3UafLMHIs7i
 5AGg==
X-Gm-Message-State: AOAM530cbzmybBhvdvJBV02WM2oIUAP1bqLbY0BawUOwh5aILGeTWS1k
 X0G52YYjxB/aRb9E/vpnd3UGhO4YrwrRPNOW
X-Google-Smtp-Source: ABdhPJxoxwtLa58DHcN5BX/aqFazIPZzvKQDcbKnJ8TD0G5IhqcDtB/Vhcs6l1jpvcR/iGcYKHg8XA==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr40916159wrp.29.1638268986722; 
 Tue, 30 Nov 2021 02:43:06 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a])
 by smtp.gmail.com with ESMTPSA id g13sm21775686wrd.57.2021.11.30.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:43:06 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Vyacheslav Bocharov <adeep@lexina.in>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] arm64: meson: fix dts for JetHub D1
Date: Tue, 30 Nov 2021 11:43:04 +0100
Message-Id: <163826896367.1309037.1000352899984422910.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125130246.1086627-1-adeep@lexina.in>
References: <20211125130246.1086627-1-adeep@lexina.in>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_024308_234781_FE928933 
X-CRM114-Status: UNSURE (   7.35  )
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

On Thu, 25 Nov 2021 16:02:47 +0300, Vyacheslav Bocharov wrote:
> Fix misplace of cpu_cooling_maps for JetHub D1, move it to right place.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/dt64)

[1/1] arm64: meson: fix dts for JetHub D1
      https://git.kernel.org/amlogic/c/03caf87822220b4e22c349d170881d122df0b349

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
