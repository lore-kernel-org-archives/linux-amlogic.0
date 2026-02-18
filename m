Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE3E9A03B
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4WJ6QCegMLIYpF9muOkx/FQvuQtXTHfF44deEaPB9s=; b=XeRKGx1MolSuxT9AY9kLyMgpvN
	hxXVsT1aqvmNptRzFor0k0DS4p80jjDUL4Bos3rXcpNJ/UefmTDJKh1axH4MYpOPBBaDaOkCLOUE6
	iJb0ZLcMn5qmEyd1mWUsbiarqS2G1Jze1NEXkQtzK/wMLqEWSmMuyxVLwxFzV/Hj+Bl0x6DofQJeM
	pZ403fUlPJ/TJ8A7KTSU533DiqI1fDGvzDm2lGoTWZvqI/FNtZK4IIVA+tC+di7mEMEGWIEeYu1tW
	6ypbqxdnKSxVsTI0dzq4+G+6e2SCGzjvyv9igre8LYZqFd33DOYl/jc0+pylm7yAc+ku6iTM8vl5m
	aUWQFDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsffL-00000009iFF-3TEu;
	Wed, 18 Feb 2026 11:24:23 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsffI-00000009iEt-2MM9
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 11:24:22 +0000
Date: Wed, 18 Feb 2026 11:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771413854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BEknqRay9cLst5+GJTiimtPKgqbaOAo4KgPgHKVMPt8=;
	b=RaPraqdEBp6UPnaqoDyevHruMq95QSv53angpGggoOK+NLRbpW/jmUnTZ1bK91Uetwzwlv
	8ZEgDt1wq7CPBSLFiujoBN5uhZcKE5+LMq9pw2Oul5AotTuv8vNh2c3GYNtEXWu01BuLuJ
	osYkb6S0f+Cv/agd6nNDDdJda4KLgZ5YeJLJHOf6YeZHnvKyF4Kpr6dyx3FBaj3G19Y89f
	gJPfywKJGtCujFS0TrBHv2L4FqSReG5k/Z647wGZvZiOFDpLmNRyM1XLPb1CNm4DQ+2BYh
	Jn94sPZblRRGSdUYUNAPWPuKP3vZn5us5B0QqazGPL3mT+o53wnPDCff56QVyA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll support
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr> <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
In-Reply-To: <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
Message-ID: <tanjoa.3m1sr95zhvsal@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_032421_081001_3791AAE2 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 18 Feb 2026 11:01, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
>Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Your commit description is almost the same on every patch in the series.
Probably having a more specific description per commit would be much more
useful, for reviewers to better understand your commit.

There are documentation pages on how to write informative commit messages
at [1] and [2], but in summary, your description should talk about *what*
is being done and (provided that makes sense), *why*.

You also have multiple commits with the exact same commit message
("dt-bindings: clk: meson: Add Amlogic T7 sys pll support"), did you
mean to squash them all into one? (You can do so with `git rebase -i`.)

It probably also would make sense to add a cover letter, which would describe
overall what you goal is with this patch series, and on a high level
(doesn't have to be too detailled, because you'd describe these in more
detail in the respective commit messages themselves) what each patch does.
This once again helps people reviewing your code to understand what problem
you're trying to solve.

[1]: https://docs.kernel.org/process/submitting-patches.html#explanation-body
[2]: https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Best regards,
Ferass

[PS: sorry if this email was sent twice, my email client did something
     strange]

>
>Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>---
> include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>index 32c4b62037de..0cda8edfa7cd 100644
>--- a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>@@ -224,5 +224,12 @@
> #define CLKID_SYS_PWM_AO_CD		215
> #define CLKID_SYS_PWM_AO_EF		216
> #define CLKID_SYS_PWM_AO_GH		217
>+#define CLKID_SYS_A_SEL			218
>+#define CLKID_SYS_A_DIV			219
>+#define CLKID_SYS_A			220
>+#define CLKID_SYS_B_SEL			221
>+#define CLKID_SYS_B_DIV			222
>+#define CLKID_SYS_B			223
>+#define CLKID_SYS			224
> 
> #endif /* __T7_PERIPHERALS_CLKC_H */
>-- 
>2.49.0
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
