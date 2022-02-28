Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A434C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWga3+J/aaM05qjuianjboq5100v6/tl020JsKepxH4=; b=l4Miq7vwcE23Ui
	jrWNO6TV4OJRTKBtTajSxts1991W3QAAYgfiFMeRY33lHKR7JaWg++UYlmgGddJNNgBviXxRcVvsD
	TX05bkDhfVrN1nVB4X8h6CyoOV7Nhe+nenMVzqjn4Jjt76d1lu/5YzCSKkATMtfvs66Rk5hl4woUz
	s+7KaTa2zzr1Xw8w51oG4vG0nKFmR5TuIOaGdtLgVAVJ7RPiBjYuc74Y5tVsHoNpFt+jYvDaaKh2T
	3dL98Z6udtgVQ+HSeBY+fFPJ8LrwLukbHMM/SbXzwft/QcdOVk46ehzD1mpTKkQ/azhLoggS6HBZq
	2DzMpP/1CUJtWQMZIjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOhoV-00D6rr-62; Mon, 28 Feb 2022 15:19:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOhly-00D5oz-4A; Mon, 28 Feb 2022 15:17:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0A4160F9E;
 Mon, 28 Feb 2022 15:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9031EC340F3;
 Mon, 28 Feb 2022 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646061433;
 bh=P8hImRLDB7ZfS50bo83+vbX36f99DmRmsmlB+TiGQu4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkoaP/gIaoNZTjE1CHdD8HwxrXqsifuZJDxcwcdeo7FnpIyBr69BrkOaKvpiBvQcE
 X0u/T2JZvUxt9iHSsdrQlv9jPY9P1rIXbJOem6V0Gb58MKs0Spyg/HM/eauAcAMHfu
 ZaLl+AlpHFNfI7PBg9UIlZ/rdnkeM1JSgjE4iXo/8oAT1ddFVw/jcQKKxPzN5KdxJ2
 cJmdJA1DPXRoDswsqxuGc2qQeQeMMbFYjuz5JEXX3Uzg1VK3EgPp29j+liapZVBKJc
 rs7/F+XVfXRByPeStrQNt7NB4mCTF0qflqNavEMr95bV0TrJiKQ9jV0oVGOuc9sZSl
 DkvnC8O7b41Mg==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org, Neil Armstrong <narmstrong@baylibre.com>, soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.18
Date: Mon, 28 Feb 2022 16:16:38 +0100
Message-Id: <164606116967.3364867.17248022329754081693.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <a7cd9937-d441-3e1f-9709-8e80cc8814f1@baylibre.com>
References: <a7cd9937-d441-3e1f-9709-8e80cc8814f1@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_071714_241286_9B014382 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 21 Feb 2022 12:38:47 +0100, Neil Armstrong wrote:
> Here's a set of Amlogic ARM64 DT changes for v5.18.
> 
> Notably, this adds 5 new board and a new SoC family from Amlogic, and minor additions.
> 
> Neil
> 
> The following changes since commit 0a62b3cc0af9322e650fe89bea0bacdedf01960a:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3b364358cb9e46ec4a3c9d75f1b4ec8ec863f6e7

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
