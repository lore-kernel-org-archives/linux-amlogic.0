Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7A2C61DB2
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jun 2025 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eg7/2gD0LZXWGeyBsz+OnmOhyk+5lbwVA5W5xiIcS94=; b=GwUR+XSx6DqMm3
	EjMEy127M++5A+u488xvy378rQ80EnQP5sIoGcFBg0hNwm7svI67IrP6h+1XHekPE9fGlNQtg0/c3
	VPOUL5stwM30TQDrO+mcY0h+90wZfOiUC4ejgyFNpzph/czTp9M67s0nl5vf00p5zkHCuZLKi6ANZ
	NBGxR/drPnDzqoE6FT1s/WhIIXsHRl3ArvRxtYNZjDm6lPd5uviDeaSjHxU+yeEMCyouAIY05dhdf
	GPscnS+svqr4qQVliXPu5fj1wov25rBsS+8s8xdBFJwcCNYUeR/kHTqxFSXrNzcJZeif3481yTEPs
	lL+/WkYSyk+Vk1vAYehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPz1D-0000000Fd6A-2pRF;
	Fri, 13 Jun 2025 07:40:07 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyuW-0000000FbIS-3Qed
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Jun 2025 07:33:14 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id ABE97A42D1; Fri, 13 Jun 2025 09:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1749799953; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=1A4yB5PdvSJqJ0TYF7noLszpqJvqz+iUN/n4B2zgKclkqTQctiIG8zx4VOMjxO02Q
	 /Tzx2YSndMQmkbbiaDuLQqJ983sUxezvqFEK4YXD2td70gxdgdip2soUsEew9FGkTH
	 ANVisgBjrPL87jo08u+NNOEVkTrcTsBFT+KgsC5EGQAdi8yHoasjA+OI+wKjJ9Og2W
	 6yT1P+IodrlIKORgtGhoYYdG7xssoho540MwCPccQ+E10yk5DBbg2MyKm4aWzxv99w
	 u97tXowZ2N+U0ZMtrLtBmCNCxywphw+misOlmZyXjQf/VsUd/9Jxej3pv92ALgJSQ/
	 lpsXsM9GtL6EQ==
Received: by mail.novaplan.pl for <linux-amlogic@lists.infradead.org>; Fri, 13 Jun 2025 07:31:02 GMT
Message-ID: <20250613084500-0.1.m5.26msj.0.stc0075qva@novaplan.pl>
Date: Fri, 13 Jun 2025 07:31:02 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_003313_552116_DCAE1F81 
X-CRM114-Status: UNSURE (   0.03  )
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
