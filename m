Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A890CA0EFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Aug 2025 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crkB/OHGNlAZ5oVlAiNB8eMs8sEGH3bSKi8UpVUwF20=; b=yNylQNk+B5cgg8
	vTQKzN8GPr6gowFf3+wF+AOfDye2NiK9xKP1ZS7o00v7Z+pezpdnEpF2DSblK/WUCr/mBxi9aAI5D
	+J5D4rmys0FxYUZ3ol3OcCyOlHZBDK6sJPlkF4u993BsQiz9EbV8cqIzTaQG/svSAzbU6ybSarP7y
	+f+ihU/v7tNl+lmRR1P9KdXlBDH3OyUJQbflx9FZcf1Lc0y0zubv5vondf5tvD8xHvBFGYGqFFRt9
	Qtf/VhgiYywuDjqFHJMv4jKsmmcD6xx/cI155xQ4SXl4V6Vb4ViFPoXM1tLzBZlrsWVKZ1gMthiuy
	LImvQRPq4cvjbWwT4E1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoekm-0000000Cq2N-3jPT;
	Wed, 20 Aug 2025 09:05:08 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodyC-0000000ChGm-2VTW
	for linux-amlogic@lists.infradead.org;
	Wed, 20 Aug 2025 08:14:57 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id DCBD44D4A0; Wed, 20 Aug 2025 10:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1755677558; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=vsWcNrnCcttBocRVBzPdqUzUaSxpQBnVrSZEBtopO7gTKfy0pW6ppNqJAj9X1uj2R
	 zDEt8TuFuzubXGXNwrJeOy0n/oF9de705kwjv2LTYo/y0sU7nQFisD98DaGFTEAnq1
	 6xpZG1abVeyp01axgEBKLddcHTDbhyDlyyzAF0bW3HzS1THqd1ICpmIx8edXLt3qv0
	 9+HNVJP9hFmvnXQ8GQoItdfkCWnipKq/BE/GW06B30tsZZvPE0PxW9FpMUq1BYZIKQ
	 uk1taHXCNuTw9v+y5YTQVE/MFT4vkgCPNmZvhHBQhzAKo0Yy8mBI6OViINrQVAYjDB
	 vC+geHtJRjeaA==
Received: by mail.fintara.pl for <linux-amlogic@lists.infradead.org>; Wed, 20 Aug 2025 08:10:15 GMT
Message-ID: <20250820084500-0.1.bd.38qko.0.3ekl44ff0e@fintara.pl>
Date: Wed, 20 Aug 2025 08:10:15 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_011456_771050_8220974C 
X-CRM114-Status: UNSURE (   0.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
