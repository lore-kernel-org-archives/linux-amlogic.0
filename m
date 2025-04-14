Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2689C369B2
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Apr 2025 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eg7/2gD0LZXWGeyBsz+OnmOhyk+5lbwVA5W5xiIcS94=; b=b0Xf/qQxknWKls
	sB+6hvJ9o6NYJGZFr18/ftxb+WzXXB3BgkHGAtRbMz0vRjfCV9YtwNma0IU/9hpBwAkYu9+YuKWHV
	oJop4+CXhInmbJVfVqcucJo5q8tL3juuL6cthNGL/3ST1XfoZsntNE8k0kQWSrW5d3DbIim3BGxA+
	GTdtck3kFHXujGNUf8sVA3XZPdr0Y/DlGPXsTxMLFuWMFdlE52YrJeC5xcgP5Uy+/0W9hJW/eP6Dn
	O980m2m85/nJJtEoRNijxs7H+0IVhp2wB8XLFc5HoaSsn1OoM4OKs1x+leHscEEhhkCq+9OcwqCgN
	aIi4lAmjtw0RwNp0xvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EwX-000000012wz-3lbo;
	Mon, 14 Apr 2025 08:13:25 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EvG-000000012ky-1Yy8
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Apr 2025 08:12:10 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id B6A21A40BC; Mon, 14 Apr 2025 10:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1744618240; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=eXJFPn1RylZ22wZmLy+7P0tiEKq08/mMx+uB5DuNE/MG04oQxdFrfDGas2BS8OUpF
	 lpFGW7kx2sIaSTGgRzamrF7yeAa0r1lVWTfFTU4Lj4eGLFybZ3EVTnzywqm4d5rOrU
	 VUNus+XRgPz/zyXrWnSlBOMZNWMU2GJAIpslCbJ1zV/CCzV9I2MEKRjOvOnzo9k9Fo
	 8NwsDJItuq9ERRxIpAK0obo/nlvbibCpX3p3i4SgUERPFSS1aMKqKZpVcM60cxQHMI
	 3LdqP3LFRIBW6Qd0j24E9upufvGS6f7XSuf7yAxn9q6m4LH74K0+GvfUCCJ42hcSml
	 h8W4iQ4ne8hWQ==
Received: by mail.novaplan.pl for <linux-amlogic@lists.infradead.org>; Mon, 14 Apr 2025 08:10:25 GMT
Message-ID: <20250414084500-0.1.l0.1ovle.0.bijf0qkuep@novaplan.pl>
Date: Mon, 14 Apr 2025 08:10:25 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_011207_099359_C0351FD0 
X-CRM114-Status: UNSURE (  -0.01  )
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
