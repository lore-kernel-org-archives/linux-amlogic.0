Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CE4CF649E
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obKR9ujloMiqjxPeb/x0zePX39ZEtlFzsMZJGLM7bi8=; b=zeRC0ZzawfefV4
	SacRBCR9DMRm9PoFaoqpzheoa/cOuSHQacgTj1Fv5ayu5qt1EkbFXnbG/If8U+d6TiG9tS9CL0vzs
	XoPQuaRwNV4C4rw6Lb+LlInCJpzaoUGQN3+vRycvJBH6MpJaKbWvcsx5NvrVufPTDM5UDIQsLN6t0
	suoqvvHnJb51t4Vg25s3C9YZ8h29jz+txAGM6bWwwSTQtwUccnLq0AamAWI7rvlY6KKMqxMop7OkS
	+MnM0Yqsldvifq3lTUP7+Oru+LUIzY+kR7ex1rddGANGaS1haJmSlrZTOyWvUyTGnlz+GsXkLdsU1
	ZCb7sPT4uaQax64SrEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svB0B-0000000GCf3-3EPl;
	Mon, 30 Sep 2024 07:39:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svAua-0000000GBkm-22RA
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 07:33:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so23603895e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681618; x=1728286418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmxLYGkXEUKmfFxj+/X3mAcVyAXxZy04TraLuPE3WeE=;
        b=ChbDz87expjJan8NBtUJiRqK+KGKW2Pf6YGJU88v6uICz4/8V1TtrirIeFo18Ok3nr
         zOLjUNXRh276pikT6u3lOD4nd+DNcrNJdUi1GBPGom8tS4a0l/fepsyp4H7ZZAGHMv1Y
         L4fJDBH0xQjmRUfsj3n6RI4WbGRXKrmR1KDqQBCyysoRSdQXce1dOYCzdS74fnL76+ph
         97zox9Rmgi8WTgSfWvopbPbOzHXvwZQKtWhpCWNPfj8TGaB1vvKte1TVbiOO0vVHd7nd
         u1KqqfE/q7lmWJlSbPlqbDphWLnkO1t1cp2+YTBQlE6MUdfMEfJc8hUFjDIR1JHidxCP
         IDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681618; x=1728286418;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmxLYGkXEUKmfFxj+/X3mAcVyAXxZy04TraLuPE3WeE=;
        b=nHMRcUp5YWD7yHlwrf/ZG+REpH4ZGbqVv1xo8OQ/WTJpQ2Pum141/dulTL2bUo+Rl9
         VKokjtKTHRF1kCiYWBlryhSPm58FEUfKHny0a1KErU70hm4LPKVjsh5UtmbbEDKWpr5j
         IweEjIpOFBtS88UQDWbUtddTbEK3OvZ7NCtgmh4nPrqQKnXH1NisgFiGRGtqvZFy7Auk
         d9BZZbMc+3IJNbSBzfG6kNJYjK5Tq/4OHyz477vEBc4jPF+gO97owFOM8zx+bTWoP90E
         x56bg01ju0bh+ydnPIyZN78kkbnVLsg5vJMX9+YSzHDE8fUbTtH5HEAd3LHITAsYA+xg
         v4xg==
X-Gm-Message-State: AOJu0Yw4vJnmM8QFBGMu/f/KxUxNisXfH5Bg4qwUknz5quadNWJNK0km
	PvvYt4jar7WKdqfMSQYJ3YH5/ygEv0ZgHqX3Ht7JrNmUlIjbMlzk4QmCgj3dm8ewLJYMeMG//eT
	J
X-Google-Smtp-Source: AGHT+IEuukCXLbxyexuDkX0T0Q52HbPpQjOtx9tasbZrs838iwaM5sNm2feYyshk67D+LB2dfnswww==
X-Received: by 2002:a05:600c:4592:b0:42c:b377:3f55 with SMTP id 5b1f17b1804b1-42f521c6035mr83590985e9.3.1727681618635;
        Mon, 30 Sep 2024 00:33:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e90274aa0sm105673295e9.0.2024.09.30.00.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:33:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Theo Debrouwere <theo.debrouwere@gmail.com>
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
In-Reply-To: <20240905181803.94127-1-theo.debrouwere@faytech.de>
References: <20240905181803.94127-1-theo.debrouwere@faytech.de>
Subject: Re: [PATCH] arm64: dts: meson-g12-common: fix uart-ao-a typo
Message-Id: <172768161707.3724702.2660885905871404.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 09:33:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_003340_581870_BA0F1DBD 
X-CRM114-Status: UNSURE (   9.59  )
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

On Thu, 05 Sep 2024 20:18:03 +0200, Theo Debrouwere wrote:
> Change uart-a-ao into uart-ao-a, to use the same naming convention as
> the other uart devices.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.13/arm64-dt)

[1/1] arm64: dts: meson-g12-common: fix uart-ao-a typo
      https://git.kernel.org/amlogic/c/eeb12b07012f060cc8abd661ebc0a22cf106badc

These changes has been applied on the intermediate git tree [1].

The v6.13/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
