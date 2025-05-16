Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E7CC3ABC9
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 May 2025 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eg7/2gD0LZXWGeyBsz+OnmOhyk+5lbwVA5W5xiIcS94=; b=l7lQxlGG0xNxGj
	33pmH1YaIB7EHz4ukLyFn97aiOC0oyQOdW+5+L0VNl0oYM8J4ugo5Jkcq9VOQsoREFTFLUjfugm3+
	v+i/Jzs3+4HaFqI4igWa5P/QgDiOf1PvtZ6GBtaP+L32siYKC0cPNKeg8fsUSnipmzJ33h/r/GD3T
	rSAOuWFhWYI0nZwWltuJXinAy0GNeyDLogKyUxyWJiadokMoKHoAd0tsOnIxgrfmvf3j1WhEKxXFH
	re57zS+TivG8rGcdzpZDf4VihYJcosetbkoH/Y+v/MS4OnAdrZi5bNCq0GJhs+URDwFUDk5GikxP9
	0nMqylZ9xnwwjkByWj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpsp-00000002il0-3ErK;
	Fri, 16 May 2025 07:53:31 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpsm-00000002ikH-2iBg
	for linux-amlogic@lists.infradead.org;
	Fri, 16 May 2025 07:53:30 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 5916EA4C53; Fri, 16 May 2025 09:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1747381883; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=pqnGqtF1wXc/i69pVMZBW/8s7TbTqzMFbHuzH/Now1f/ntlaWEJS8qf01z3/AOMyu
	 aq3DVcyNh/dhBVRAa/p7bh4Dy1YncVfwM4uRNyeyrd2ph236pDG8MgpAl8e3H1b9Qg
	 TNRXd+dDhamGapo8t6+L2M97TNvsOzO2eW+etXdUIlKeOxYgnL5QaETubNnxoibdmd
	 Gyvuu4S9IjtH8vZY6pJxUB3Ma4S/LAwsvTKFIAMREn7BU9huSw25X1JT0MS11ZMbuB
	 H5yV9zfBw+24771JrV9TNwDZ+r9W1Quolac8l3kOoO860egUYhaxnvT8P0RTQvddx8
	 kH5ul1iBeUZkA==
Received: by mail.novaplan.pl for <linux-amlogic@lists.infradead.org>; Fri, 16 May 2025 07:50:33 GMT
Message-ID: <20250516084500-0.1.ll.1xpcf.0.6x8bfkqei8@novaplan.pl>
Date: Fri, 16 May 2025 07:50:33 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_005329_374413_FEB6BB5B 
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
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
