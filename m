Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE5CC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxuR+0d/odgAye+3oqQHAbVBumOdXV6BcMVGoSXEZEQ=; b=n4XKQUpHeVbH7G
	XuplOqkcUEU+lFx8SaSmO7Kbt/VAc14Ay29egi6jJutFsVxHpLDyZPsatvrL+qa621ffoUEX+E+e1
	iq0DLr311+xRcxyAoTMBp6jf0SU6U/W9Y3jEAlg02CuOh04L5ALBewEeA0igb3vrOqNeNZwAr6EVs
	sRs0o4nmGhHjDsOCBNRWPV+TRuDTeS3y89GrZu5W68CC2Xc6ZCDxMsF+Ri1IWnQ+2BIBbk6U+NX/z
	+7Ez1oDEjfDCPd4SkMinEptxWgkSYQPjrtQGRwh9AfY09HNc07muZU6D/t2Gq+15Trr5vUl22ZDt0
	Xrm9w/PQTSJ1JcfzXWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTmm-0000000C9hm-0kzj;
	Mon, 29 Jul 2024 17:03:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTmj-0000000C9gd-1l29
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jul 2024 17:03:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3684e8220f9so1132608f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2024 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722272623; x=1722877423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4QMJ2vu32awVFR08ex54N/5/opw4a1ucxK32751hSU=;
        b=EHTZSz7fNC95Xz2xTjyxCW7mIKSylTKXlgFnjczP+QlBl2AUR7ZlZ04q2fVJ/Qn7xN
         XwFTU5D3Sxo+9MRw8Av76JenhShLSkL7GGolPMfLOc1zuQq4ouitn1cC5rnDe2lG9eiM
         OWn+kqc8RkyqlbxbscB+jEKmtkIOVYUho2uSjADry1eTTlMC0v5u9jdqifmGeukywMM9
         R9A3b1mvVP9ZOAVVXbOtr9eeyAgHPcy/1cFBY/PRyKBLgDsNuQMAeMBqAZrTPm/ZVufn
         ME0dQ7ZRQyaywYBA36RtzKIjHPo3J57bTN0uGF/FPbMXTZK7rLF5+qyEEzrrFm0VVgiJ
         +Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272623; x=1722877423;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4QMJ2vu32awVFR08ex54N/5/opw4a1ucxK32751hSU=;
        b=LEpl56KLiqPhsv55DLlX5qRtlpbwo5RvBqlXt/FWvsIw/+7vEJKJE4uePGF+PtkR2a
         KzBHxKWeSZ3Pd38LjoqGZjXrwTb8Vl62h8YGo1EzzVm8mSaZwjVra1EzorrJ6nl1MZAg
         FQhYfllTb4mujg6wcyHoAlkTgDEa0RX4TP/3Rt2wfIO3Nu5ltDqnfaW99QLA4GfmxRio
         g4j6HZNF3nZzdeGC6o9noQT/tTYz9UkKbXtl9s7C5er0TjHWSrJlKm5xcbh+MYmYEDqc
         9iAl6DJdT3z+Ef0kAwyyhgGJCAnEOlHJkwsMLpEADIyGYcmvDbhCxu5F8YMjLi0wmscq
         EtMA==
X-Forwarded-Encrypted: i=1; AJvYcCXPlkVhTuxN4qcUyBLrPCbGCIZRoKZz2tFRTnwlNfC6eBj6GR+OUcaie6Fj+U+rg8q5MFErjpV4X/3jkhLUoH7Hu4ttxZWyFJfMxAwjkzjIne8=
X-Gm-Message-State: AOJu0YyGreUWt5VjIALEN/nhjNic6gYynWzzu0Nl6LpJ3b+r7DrGg97n
	zzgsLIorIIS+P50X/6LXgAcWO5u/wyjbW2Jy9hheamAWWxw2QINen+WniepO0OI=
X-Google-Smtp-Source: AGHT+IFDDBwmSOgvzrJlt7lNEcKvYu9x6l09Cch+NOr9qiXQtZC+LH7RjBJs+0BzIHEp5aK7b/y8YA==
X-Received: by 2002:a5d:5710:0:b0:36b:33eb:f0d6 with SMTP id ffacd0b85a97d-36b5d7beea6mr6206706f8f.2.1722272623164;
        Mon, 29 Jul 2024 10:03:43 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36b367c0668sm12712416f8f.10.2024.07.29.10.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:03:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20240719094228.3985595-1-jbrunet@baylibre.com>
References: <20240719094228.3985595-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: introduce symbol namespace for amlogic
 clocks
Message-Id: <172227262256.349016.9112945226896279160.b4-ty@baylibre.com>
Date: Mon, 29 Jul 2024 19:03:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_100345_495140_09C26229 
X-CRM114-Status: UNSURE (   3.70  )
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

[1/1] clk: meson: introduce symbol namespace for amlogic clocks
      https://github.com/BayLibre/clk-meson/commit/adac147c6a32

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
