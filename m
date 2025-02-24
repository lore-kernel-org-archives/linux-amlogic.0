Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E4C021B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2025 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crkB/OHGNlAZ5oVlAiNB8eMs8sEGH3bSKi8UpVUwF20=; b=N8qearxlPSxy2d
	yI0WjSNrE3ni8t1AsRYmqZrhR/4Vy+19bPaLEoho3un+jbkYzDbyiXA1jOsLrkVlcy1R9oE4jrEk4
	T29ItDqtQqroQyaNqUrzV2jETad/IjTQiehE1RHCrri7EgxaIHY/zKqEoRdPgcLhfuzTXLElXyWSB
	ZFowSFyuYJX1YxQlsbkrKl3GBBv5cGHkMTbiYl4y9L6/m2VdA/14wKVJNHW7hE9nT84tU8R+01J0M
	vVFLSO3foLcBkkKFnE17x3YZKmbkf1TTmhV1HBgYl6zoYoRusGxTTYzrRgCr6VAMYjtsFfdTQatd4
	ZkwI8QDYPpMydbNIvung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUcn-0000000CsXm-3Bkx;
	Mon, 24 Feb 2025 09:19:41 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUIR-0000000CnCa-3SbE
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Feb 2025 08:58:42 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id 40ACF49F38; Mon, 24 Feb 2025 09:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1740387110; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=sdEu+FIv2GearbFuCY9pG8ADKoPZXPAUEt9xjlyQH0HHg4FvYOoxAI7Cwpzdy0aiY
	 xb+k91jFzYflgSkzRbC88k+4SLTBl8jh8IXRUBxIwwCEA0WqMd2DdlXLCXH9MO7zj7
	 4hLTcMio0tg2+VE+Zy+QPJvetgsgA5URbs00LFHFqNQjDTh2pfiXWX/61PSShnTIe/
	 3tW+N3UIV1Ji7atmCQclJ2Mm4xUemqwTat1tMdLf2xCbBELVq9xwUz+lE0iAEQ3l4O
	 H/lgexDBcaihC5WeCCiravCrsr8CEsbm28MXKEhshGaoX2MbUh6dSX4EHvG6dB/CS3
	 48aIUqOvYEDdg==
Received: by mail.fintara.pl for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2025 08:50:35 GMT
Message-ID: <20250224084500-0.1.7z.1omhc.0.oc0s695gf6@fintara.pl>
Date: Mon, 24 Feb 2025 08:50:35 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005840_546536_145C982D 
X-CRM114-Status: UNSURE (   1.15  )
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
