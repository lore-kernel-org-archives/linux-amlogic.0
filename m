Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1887DCCD184
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eg7/2gD0LZXWGeyBsz+OnmOhyk+5lbwVA5W5xiIcS94=; b=DM5IIXb9V8fZya
	HswYzmIDB6sltG/Ato3Xy1vcq0iTrBMmTuQrdGJwRJZD+BYkvyDpl2LbGNoh+13fzcWMKu6mTWk0p
	baD4dfL4glOlKQSoDhA4MFvJz0ktzNkcEuFtd/bJM3e1ScbqEFGODTbK5VovwCkZ62wZEyMqXjqbW
	uqzPkm4YZmHVqNAbN9c18cMHh7WeaHkxIs8AqGkcg9Tak1taHxliE9YVCUxImJqEpi7tc+o4I73Yx
	p3xylxELxGrr6iN40fJxWKlBBba/LlnqqDC4bG5GygTG4BRj8I7NbbV4EgX2nF1pFvXNSg69fIUv+
	B68YRiBtu+CRrHguqRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7BX-0000000GB3t-1uni;
	Tue, 21 Oct 2025 07:53:35 +0000
Received: from mail.proventix.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7BU-0000000GB2I-2opG
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 07:53:34 +0000
Received: by mail.proventix.pl (Postfix, from userid 1002)
	id 2B324A4AB8; Tue, 21 Oct 2025 09:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=proventix.pl; s=mail;
	t=1761033204; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=DH+sGi/4nvg6ryUKYhU65kcPF4qc5dzh3KzCSoUD4Xum0j4W1r3fn+9XgRHL+q5sx
	 1DOvmvNtf4E33eGAOVpq4Tv+WxTTrGV3N64q7UAQtX/ks78ezoD4mswrUqGQvdfbX3
	 PDiaiPeaWjxGF+SMN/S79DtKibNGZKJ3LPogS2oGloo3IZfYbBPHwjSBnrrksk3G4n
	 WZ9SyULOtZq7lIwDlDFcpNd5dkKhk5lKdacDxBs41dO5wbBNLzAIb/2AV9WHpVzcl5
	 D0VNed6vMGe8wcNMtKjYSt1UCSbOxWa+b5m/IlwOxi+tRnegjwCFC5e/48Sksgcp/t
	 s2m9DMk1sdY+g==
Received: by mail.proventix.pl for <linux-amlogic@lists.infradead.org>; Tue, 21 Oct 2025 07:50:26 GMT
Message-ID: <20251021084500-0.1.om.3jwmp.0.bg7tm840h5@proventix.pl>
Date: Tue, 21 Oct 2025 07:50:26 GMT
From: "Adrian Liszka" <adrian.liszka@proventix.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.proventix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_005332_983720_4DFDC655 
X-CRM114-Status: UNSURE (   0.04  )
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
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
