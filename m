Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A33C25B67
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Oct 2023 00:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIKTScEm4XT556l/f3XQKB96ncbxAdzJJ03bmtbVXI8=; b=A6grwzeqKfYVpY
	U172DSM6+cLtlunEUFhPdtD4f1hGPiPL5UjUROWVVJu+Z1+fGbunDqht2QLQZEwK3jyiAuqyGaEuy
	0CKDlDWL4kadaWq3I09typ+y3EuQQAp/BZn1nVhaTFEwFXmjmLex5G/EZSW7lZQaLgVnF2LAbb7Hz
	jyDLQFxh+n8vpTYGdRIca7qxcsI6kFc4T+qvPhfZIsvyB3jMs3H0E7kJInAJzYw/MYLp90KF6onvx
	Iqe+mu/hpoASMPuol+Q4iJqEPrvwPGKSyHfOABtU8xUBqxi6OPimcCPAO3CwY/0x/2YlVzUmPtlZF
	Gfahob/T+o4qfGhCCYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4pW-008UJU-2m;
	Mon, 23 Oct 2023 23:59:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4pS-008UJ8-2K
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Oct 2023 23:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D613ECE2A29;
	Mon, 23 Oct 2023 23:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E0C433C8;
	Mon, 23 Oct 2023 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698105561;
	bh=vcW9N3bg1pcdPgOOj7c+HRMYqqNXhrFHhuxSF9qN+RU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VA8LEHbdXH8kQV+5X9USktifDZm9F8N6l+grkWQ5k/Ax62eah0jH4FjNGpCBSn7e8
	 nQ6Ux8VDj3NUNROH2fDxlxhKqWX5Df7Y9MP9mSVMFGvuy4TlJA1uEbLvNJp/H1tTj6
	 p1v4rzi+R3Zlj1/KeUaAmW6uUsrY4DtKlgF/sk8wVDI4NXyPNlJ5brTlShwUGp/O63
	 HAy7s1E5GcwzNw1HUhZn08Sx9QoGhdMs2dibsgDpLcPDesdCIN8RwWy0xKWSnRR4zh
	 KQJgMn6R+UQ8dfVhc7cqgx/TQu3jO38koh1oZ9Ikdenci3FjheuuzK7THF1MPvgJqk
	 dpJ+I8A0CrSkA==
Message-ID: <4c5cddee041d73dfef1256858171eef4.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jwmvdo1k3.fsf@starbuckisacylon.baylibre.com>
References: <1jwmvdo1k3.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: 2nd amlogic clock updates for v6.7
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic <linux-amlogic@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Oct 2023 16:59:18 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_165926_960139_593DB8D9 
X-CRM114-Status: UNSURE (   8.51  )
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

Quoting Jerome Brunet (2023-10-23 07:23:10)
> 
> Hi Stephen,
> 
> Here is a fix for the amlogic clock merged in clk-next
> It fixes a missing dependency for the s4 clock controllers
> 
> Regards
> Jerome
> 
> The following changes since commit 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239:
> 
>   clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller (2023-09-27 11:01:03 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.7-2
> 
> for you to fetch changes up to 98408df6ad1fa14ad352f8d28d68eacdc94ca382:
> 
>   clk: meson: S4: select CONFIG_COMMON_CLK_MESON_CLKC_UTILS (2023-10-23 14:54:35 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
