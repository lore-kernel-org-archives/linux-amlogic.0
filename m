Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F43C282DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eg7/2gD0LZXWGeyBsz+OnmOhyk+5lbwVA5W5xiIcS94=; b=BPkli1E4SOdJpn
	3reS6C09wKg53gOLoKBv8JS6aEr98S2JCnR1ctA3IbsRVSVSmDLosil8lGr31fKUv2WHcMYxbpdhS
	307SZWul6qhG1ui/g3tUbcjj/wPuBzRuiSKJPm2cnltwp8aG9Tj0BFD5PPCcPprJZPsA0KjTPLoro
	WPO8KhO5zxMlokGcDTq6ZtCgVgNKLLQ59PY6JRuyieAIoFSponj1WRMGnpr7Mz1We/coL/UmIm28M
	NLHsO7JkkKxGZIlh9UP+UTjeZ4DfD3IGqAOYxJORyR7BCooPfg7iOXiv8/LwJwERPtPBJ7mprYZW6
	UbufP9RpImwNh6buGpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRG-0000000Adda-1urd;
	Thu, 13 Mar 2025 09:01:14 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseN2-0000000Ad2Z-1zZJ
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Mar 2025 08:56:54 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 1B855A46A8; Thu, 13 Mar 2025 09:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1741856207; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=bzII0LvODw+WcP0mWLQFk9wFN+T1GAYp/Fw15iWOz3UEO5ofr12ecpbSkAbSyGUo9
	 jYsw0ZyNTd2v1QYnNpKMGq9BjTg7Yj/qBsdJDXgUnzWe/PIh9kkxdQkFi+V3tvCoDm
	 9ONRjDF0RKpDLD6DqVPD4WxBADtXZih8wIztdcKaoRfLAHXSfYEyxWj22PEj5FrRuA
	 5zUglqC8q2aJEtJhkEJsUW/pnxQ9K+HhSeCsRrFJKAG1iWtHbgZ882YntSQ8ijfjbm
	 anlEK5VjCAZUjYa6B9hZqBwQLR6UokcY/qid7LLFdiuMduC3SLke8c7PosEMSIbWCt
	 jcOIM5dzs4VLA==
Received: by mail.novaplan.pl for <linux-amlogic@lists.infradead.org>; Thu, 13 Mar 2025 08:56:18 GMT
Message-ID: <20250313084500-0.1.ke.1g4bn.0.jly3mlzml0@novaplan.pl>
Date: Thu, 13 Mar 2025 08:56:18 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_015653_227010_8EE58F6C 
X-CRM114-Status: UNSURE (   0.55  )
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
