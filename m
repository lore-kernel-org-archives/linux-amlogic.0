Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FAEC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Feb 2023 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A65lStj0yQOKAEX1dd8sY5RufbehzmlYnSSv5QJ7TJQ=; b=OF0j6wfgKtO+wd
	T8qS4oYByqElhyU+mVDifZLjHOxte7dKpyjJV3iZIbL3iHoamHYTIO0wDloCBruaESO0W+2I562so
	MHoKjcj/cYvRbB1v1/So9pbSEeIDa0wazRXwBmJqGIYZ8dokLROTT2dHMcmWUdlk6vdmtTVPBErwi
	jQ2pwrFYsUYWR/ieSifVGk1yVTBANjV0bVeAp9Dv8sElL2/6c+T3BrE7vOGf8+OQheYrLt+Lwctiw
	fJIhbmm+fmoM3C3Yxw+xE1j6PTIXKGFqs06sp15EAnqI2kqKyygC+JGoRGPBRWvWnulYIXVDBy0Sz
	QN2/EeTYPs3QyNAGp/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTPJQ-00HD1L-Hj; Sat, 18 Feb 2023 15:39:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTPJF-00HCzJ-Fu; Sat, 18 Feb 2023 15:39:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id ez14so3383428edb.1;
        Sat, 18 Feb 2023 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhk/LkcUqvmtS88Fsav13SkCJ/dBHDE7V+3gF5t/b4A=;
        b=MP597z2WR0qOWuRDBVzTfxR4AeV+HiWWU2uhGXYK/uk7PAfvaRtx2Y2YXtN46Lfs/j
         AWs4R2tTWt+933UrqGuMHOU4IqohGnT/RqNWQ8vG3mAwrpaqrXSj25DkWKMOiwNXA9Dv
         oyVAXW0nL4GgWR1aPWMUc7amir2zCfbV3Cd0bKQmypAh2aLZ2HpN2FtE7Byzhhmq7MHA
         LampGVrcO7TwGb3wZC1z5VmDSAkdYYFac8cs7KwPHUqN46qHfxaiB/3n1LLLPPDxdpln
         GatHGBfg8dPCcr7k0x3oXetlo9gnWbutOA5s+9lfqZ6uJM8DjQNP/zeAk9178VJdUnBA
         Oxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhk/LkcUqvmtS88Fsav13SkCJ/dBHDE7V+3gF5t/b4A=;
        b=ktjV474AiBCfe710bdLqC8FgRAbK4atOIylZ7RS0PrMMC4Trp+cdTgAk4dVR4F4ImR
         C9AV6+BqodfsQwbrykf9ZHZo2cvUVZAaWpiqMj3VdH87ovbwOBaIfbRjVsLPPupKNxEx
         PSgDeTTrPLVcbAYO4dTboT1EUF6SfaoEe+ojNq9PgMfJnSRdc4or1hjfhbm+RsTqyH8K
         9a2BorHvf+5jSAYXD9fam2Sd7iXqB1yzgmbc50UGGKLUNQ1qwz32xVCN9AZ+GWjCHgRh
         HXEghju1ps7XcuaHbz1FrYe2U16An8uzHM6KCjJQI0O4ONplxmyso16Rxw2JL5F+alwE
         io5g==
X-Gm-Message-State: AO0yUKWRGKilF7PcdaKv4KBlUr9VpLitrPtiBPw1xOwWsRXDEHtrj/oO
	3WfgIiY8azc0FR75d0udJuGk5WpfOO2oT8W5D1Y=
X-Google-Smtp-Source: AK7set+vFRITxhRNR9KOBSvon1FZkyHd4S6hRd+JrHh7YNLrepBEdvEyBlkKQiNvgavMaIKNoOC1Yhxheuo/9nEWOLQ=
X-Received: by 2002:a17:906:9f25:b0:88d:ba79:4310 with SMTP id
 fy37-20020a1709069f2500b0088dba794310mr317170ejc.0.1676734770845; Sat, 18 Feb
 2023 07:39:30 -0800 (PST)
MIME-Version: 1.0
References: <202302161054598138273@zte.com.cn>
In-Reply-To: <202302161054598138273@zte.com.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Feb 2023 16:39:20 +0100
Message-ID: <CAFBinCB72j5hYhpmWJ8T1kQcfVf_wrMF=vBAFPLGL3BRq5qV5g@mail.gmail.com>
Subject: Re: [PATCH v2] reset: meson: Use devm_platform_ioremap_resource()
To: ye.xingchen@zte.com.cn
Cc: p.zabel@pengutronix.de, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_073934_217188_7F2A1F41 
X-CRM114-Status: UNSURE (   7.15  )
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

On Thu, Feb 16, 2023 at 3:55 AM <ye.xingchen@zte.com.cn> wrote:
>
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to Use devm_platform_ioremap_resource(), as this is exactly
> what this function does.
>
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
Thanks for your contribution! Please add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
