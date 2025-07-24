Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70B3C87FC5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jul 2025 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crkB/OHGNlAZ5oVlAiNB8eMs8sEGH3bSKi8UpVUwF20=; b=Ce22QDCKOBbIR8
	8CkES+LR2piOQ7VR83915pWu/gSeK/ChFtZ9Bpm04Mg7jdLpvAbjVpXoFD+QHVeL88XAgQxkSEOAL
	KjMUWBSN1SAMgHBcx915ggKfdujMN66XDnCoaIU7GNB1bDx/UBUeNewYzIDqGt7Gim/6UFKhMdY1l
	/2nu48nPPEDDVLeXlItzUCJgoRTpOXVgV8wp3yQTGVbqke2XO55IsyW5Nisuh54VgKBtQi0HxrjgT
	Vtm7sf8TZeASChK9fI1hxWz7GdY/KHUZWC+Y9tL8xM/2sABbMFDoDSjJBMbPT+VWSQyW4AjLwPdaC
	zsXvei1XxJGta3xAE09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerqk-00000006yc5-1JfJ;
	Thu, 24 Jul 2025 09:02:50 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer30-00000006oRs-3tuI
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Jul 2025 08:11:28 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id B3E364E6C1; Thu, 24 Jul 2025 10:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1753344682; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=hvhyxNAOnYGEnxHEagPRTLE3RulZ70VNVfqae0IN8126jIXIsMp1mAZamEyKsVnwp
	 GY24/S31cBiw5tfwxMPg8h/BC7dEOSS6horLcDlxfdW2tdEaLg0HC4vHijWaAYUJWI
	 ti4NsmOmSeMY/mduqMacCvK/R+NdMqCT6tTT0sG2oVfqtoPTXBuii5aNRf8TbdDOaZ
	 hN17soRO/gvXnZflNP7JtWWfam/2PaQmQYUk++DpOOR7F8/WzjTNowibNUmHDrjdsA
	 68v7jFRcZeZEL41uQqqe87Z7bs7Pe56EPWKpBEfCfMCEUJMLAFDleSOv9IdkTNoU3Y
	 0LIKqWlPNCEIw==
Received: by mail.fintara.pl for <linux-amlogic@lists.infradead.org>; Thu, 24 Jul 2025 08:10:58 GMT
Message-ID: <20250724084500-0.1.av.2xslr.0.zzes52o2hm@fintara.pl>
Date: Thu, 24 Jul 2025 08:10:58 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_011127_219505_867AADEC 
X-CRM114-Status: UNSURE (   0.05  )
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
