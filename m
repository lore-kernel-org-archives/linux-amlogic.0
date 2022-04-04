Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE21C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 08:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5d0Q8dYXI0sNnbLLTzyETkWEZZGCR9qpMHMahghmas=; b=BcO9DP2GG+J2D/
	Kq8CBjVV1C6WS1RPURHcgi3hkDmSRQKS51UqZ5Xg11mjfwIkr6J20ExsDlG0NYIn/7eG3TGabrADR
	lARtqs5cC6EVms13EMPtzg19LBbmZJiPoox4xyl3LF0kc8BcXv1Bfy1rLP0i3Bh3wA/5RoA/vTz7G
	ij0JlJuevsKIAog/8YcSwQj2xSEOZxaZN6kFnU+VnYiZp/KdpZkMqX6GYtTZ3pINXyD1Awp0Hc8jo
	lNPsvLaNyIHy+eDUPJ4gPm3yU0J8ud6c+wYMIQ/X8IffXS4xcFJ3XJVwCCP58RE2/RUmps5iCcKZ1
	7/NQ/gSTi6lU1CA+Z6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHpV-00DmbY-Pc; Mon, 04 Apr 2022 08:12:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHpJ-00DmTv-E5
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 08:12:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q20so5389683wmq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1Fdq0DczHkP3YF2vj5LPcppX6TH/kpuXtMffHmyoZQ=;
 b=ccWa7BZsRyHZFk7vojdgTbQYkDBDeSyof2uyKirvXqz3ERteAC5pvLBFmlrdNffaDj
 p+h/6RjcW3bvMEt4clBiGuxS4MnUtbhEuG6ULWRAL2wzcrUkKm7nekYS/fEmLz/nNeNu
 rv9ohiz3Y5OUaUaCiliDT7BFQiWeSfvOCBU4JEOkxtTWkO+lb2KjOob3dSsPWNC+WSym
 Xz41jfw5uuRnvhkaF78QwpwQTRVkpeaag5/JyFtzF18D3ufw8rxZ/9ZKSIGOMCBuaqHz
 1aFgwncugW9a6H6tmYi7vFWdcmEJ0e0LgjX57qkWrFqFewDBYMps4GhpSaLFvMGpi787
 jtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U1Fdq0DczHkP3YF2vj5LPcppX6TH/kpuXtMffHmyoZQ=;
 b=vJHbV/prgyyxfNcmWQ2azCLD7TB0JojvcvCX/q3jMQCzyBOh+P2pvjvOJD/sAyLDVr
 Zx/xiPD4NxHCStqt9gWKwaHeM6KMv7wVI0z6N5HcH1NwL0Zu+8rMLHQOWnX3DbiZHl9N
 GlsMDQ8WQ/0OGL4j1J14R9zuOxCmBqeEk3AQAMbZO6woTz9PBhP+G0jxs/3Ow0icGH75
 zzhHOakysyEtiP6MguRwNWkwfEzj6CUVWMiocJ0xSF2L0Lf/a68qMOs6U47ZktS+TAYk
 /eR1zLZIYW6ZplwFincTsk5sQomFSIypvzJ507FcqZoi3jTbjsEgWWVOvpa1BrG5GJJ/
 ej0g==
X-Gm-Message-State: AOAM531zNPT7HU5kCPY8smkf6gJC9vrZha/d3yEwR4vrY+t7tuWHe9Tl
 XsjXfS9Gx7nC+cjQcmyomMCkHA==
X-Google-Smtp-Source: ABdhPJwWjslOc4kHuu+OQclfFY0BZN3W5Rz/UbNzTFSp4pRRp+RHXzsaOZB05j1V4cEt05SxETfHWg==
X-Received: by 2002:a7b:cb87:0:b0:38e:7464:f796 with SMTP id
 m7-20020a7bcb87000000b0038e7464f796mr1674221wmi.133.1649059959885; 
 Mon, 04 Apr 2022 01:12:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a7bc38c000000b0038e708d163dsm3297510wmj.0.2022.04.04.01.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:12:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: krzk+dt@kernel.org, khilman@baylibre.com,
 Shunzhou Jiang <shunzhou.jiang@amlogic.com>, robh+dt@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V0] arm64: dts: add support for S4 power domain controller
Date: Mon,  4 Apr 2022 10:12:34 +0200
Message-Id: <164905994877.1805420.15799716011771473596.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401110306.3364551-1-shunzhou.jiang@amlogic.com>
References: <20220401110306.3364551-1-shunzhou.jiang@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_011241_507976_F8036C00 
X-CRM114-Status: UNSURE (   6.79  )
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

On Fri, 1 Apr 2022 19:03:06 +0800, Shunzhou Jiang wrote:
> Enable power domain controller for Meson s4 SoC
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

[1/1] arm64: dts: add support for S4 power domain controller
      https://git.kernel.org/amlogic/c/085f7a298a14ed2a088c8ba01d2feda2499cbc72

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
