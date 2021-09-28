Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E862DC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 23:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FB4613A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 23:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6FB4613A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P34yrlOACGIboQiJ4U1nT5MbxFhXarlDdOX+E9F386Y=; b=2NRsh94g2ox5zA
	tEVLWX0Ca28fKo2oPzpdbDHku5x/U8gCt5AFT1XfDxDcCHoSG7LddiGTPxN/G/2czhktfNkk9Wn5T
	ha6MetOcp5bptiC2NtDP4w71CHYP1Rf9F1eTWUzCtGdWp4Xm3/DAysffmYEsEhsd9Ea+RZ+zuLV0w
	lFcKY/zqu2x3i7sDEdekx35mzxalZafAICLOSqVzaj57GvQS6A3GMEIECPC5dgFahRAqGyw6Yu5Rd
	MHwscBdNOrQxVV9mtcGWyCw1+RTqE9IgkHcDj44saKbSd3ctYl4mMsJ0TKVnFm0DvS92RR4+uE7+L
	YD0Yfqga4+9mLhk3oJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVMXY-009Ipf-PL; Tue, 28 Sep 2021 23:29:36 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVMWg-009IcF-NG
 for linux-amlogic@lists.infradead.org; Tue, 28 Sep 2021 23:28:44 +0000
Received: by mail-pg1-x531.google.com with SMTP id m21so644260pgu.13
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Sep 2021 16:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jylB27FUomRkCrHM+xh4mTWUasmip1Xiajoin8oWp3E=;
 b=NWI1NX9eXWWmTOdjr4JvOxg5hBa2b6biLsvMuVhM9/LH54tjnkMLfoIOpUJobF2WX0
 Mfq+CIrRzMeHKoAxmY7NEESaIiIklXuc6ljmL29v6ly8KTVfV8ZzfkaDuzzF0dukruGe
 noZM/vXdYq+7irLpNxPr38xcxvga0XwzXGgn1JLDgq1twB1HgQtiUp9x0vAY367S6kgi
 eXTWGckzJg3rWOQ/Qr62TmNqE9h9A+CCb81FbVVJbhGbboYJGduvXwuI8ACdVg30IF4R
 BL6UG0McdNzd293D++LAyudbR3rLQdlBl7bVn0eqf6SXIpwB8JF9+E0MBjW1bvBAJhUr
 ideQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jylB27FUomRkCrHM+xh4mTWUasmip1Xiajoin8oWp3E=;
 b=4SZF1uIhl74tECDbP3U3kYeO6cOHBWdggFph97LqOZ+0OqlIDzO8/DTu/p8YtCsmD5
 3IuLx6S1UoHaw9ygg8LsPf/ZJmI864ymb1ibwwOvF6K0W0eG42nap5Q7L1KDPX5Oi5tk
 PTYFZfmnDuTqeaCz+Dz+0tGaB+Ej6z4oScrZHjRWTvNHAJrjRMQID0Cd+mzR3g2GY7Mk
 jmWI4H9n4PbLW8MA6w0wAWgLRVTLwODgNxSgUNJvCdPzkHP7e3a+yoRTveZQq1nhrlUg
 TMLPxANREbTC+64EFTi+5bHt4Y49C32fAa4AKk1/aDBVNeT5LbZPL9YY1gfvcPwFlooJ
 mwhg==
X-Gm-Message-State: AOAM5326vnnWN0Kzih+29321FKSBl59mYtexOiEyQOzktBTZjrfep/mM
 YT+m6dLA0sD9wjWRoWvtvauSUA==
X-Google-Smtp-Source: ABdhPJx3CC/hEXextag5g33mpfB4YE/n0s44Oe9bHD5FM9ieQDbPdiWuDkY26XEkwA4jCTk7j7kb5g==
X-Received: by 2002:a63:334c:: with SMTP id z73mr7050802pgz.160.1632871720693; 
 Tue, 28 Sep 2021 16:28:40 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h15sm211829pfo.54.2021.09.28.16.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 16:28:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, maz@kernel.org,
 tglx@linutronix.de, jbrunet@baylibre.com
Cc: lee.jones@linaro.org, saravanak@google.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: meson: remove MESON_IRQ_GPIO selection
In-Reply-To: <20210902134914.176986-3-narmstrong@baylibre.com>
References: <20210902134914.176986-1-narmstrong@baylibre.com>
 <20210902134914.176986-3-narmstrong@baylibre.com>
Date: Tue, 28 Sep 2021 16:28:39 -0700
Message-ID: <7hmtnw9t5k.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_162842_834894_3342D1F1 
X-CRM114-Status: UNSURE (   7.21  )
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

Neil Armstrong <narmstrong@baylibre.com> writes:

> Selecting MESON_IRQ_GPIO forces it as built-in, but we may need to build it
> as a module, thus remove it here and let the "default ARCH_MESON" build as
> built-in by default with the option to switch it to module.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
