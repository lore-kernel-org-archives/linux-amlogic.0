Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BBBD1D899
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Dec 2025 09:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LLNfAhhVvFtkD/hEOqyb3c70zD59X+3aOdpUK4eBiw=; b=yJF3ZaNteEx8Ev
	HG4qsMqkYYqkO78RYm1kL30EpVqIrz8wFdeYndVug6M+Z31nV/WNwuOLUYGY7FqFqJvBrUFQ44nnr
	NtNRtFBuxEfpUz41+9vrlFwocwDyC/OeYGPJBWUqe3Bh94zELQF25QP5IL5JbV1TkVJZdDgw41CaP
	3fysMoEemnE6ZbPWs2LWx2QA+g3pEYK6VVv5NXt1erR3Af5lAqxfh2nvtaevtELjCHBXwMoN8C7Ay
	mSevLU478RK2iVL/KrY25M34U4HC3O1sCLygpXrKWINquQKL6Gfli5GN61X9DVJnrjJThQtTs2NBl
	41EFaEkO8QZOm2Zqaicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5U9-00000007krP-3IBD;
	Thu, 04 Dec 2025 09:18:51 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5U7-00000007kps-0Mtu
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Dec 2025 09:18:48 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id 0D464ACE01; Thu,  4 Dec 2025 10:11:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1764839672; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=Pqf2HypIM6zOQwLpkvBKJe7hQFf+JSaFFVLiiJKIhVi/8RPxkNzCu74R8ToK3VHwV
	 rII++vFW+u0X2mq5asqQlRDJ9gZ6GnvzpgqXX4WAoFMvmrmkYMwFIcu5yzHOLTu41U
	 THzw2aQUVLZv8Ap+LRL+xdOlrMf47lnZaA3ATHYuLZEOGMA8KX01n+VKZRYjA9jAUS
	 pwf89GX16Zv2z7fAdfVLOMFw6x7W2RWDTaCXjhq6G4rc8JDhMYV2WpGhoigiVIBMvr
	 AeQ5CDdhYYq1zni16KX0VCj0t4rWLDtE9kzXH39CMRwamZSBUiQo38Hv8htYB3d7LJ
	 movJtrCdtGwLQ==
Received: by mail.fontri.pl for <linux-amlogic@lists.infradead.org>; Thu,  4 Dec 2025 09:11:14 GMT
Message-ID: <20251204085837-0.1.ss.67uj1.0.a4imkpl2f9@fontri.pl>
Date: Thu,  4 Dec 2025 09:11:14 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_011847_376409_146C247B 
X-CRM114-Status: UNSURE (   1.14  )
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

RHppZcWEIGRvYnJ5LAoKamFrbyBsaWRlciB3IHVzxYJ1Z2FjaCBrdXJpZXJza2ljaCB3IFBvbHNj
ZSBwcnp5Z290b3dhbGnFm215IGVsYXN0eWN6bmUgcm96d2nEhXphbmllIGRsYSBwcnplZHNpxJli
aW9yY8Ozdy4KClN0d29yenlsacWbbXkgYWJvbmFtZW50IMWCxIVjesSFY3kgZG9zdGF3eSBkbyBQ
YWN6a29tYXQgMjQvNyBvcmF6IG9ic8WCdWfEmSBrdXJpZXJza8SFIC0gamVkZW4gZG9zdGF3Y2Es
IGplZG5hIGZha3R1cmEgaSBwcnpld2lkeXdhbG5lLCBzdGHFgmUga29zenR5LiAKCkN6eSBtb2fE
mSBwcnplZHN0YXdpxIcsIGNvIG1vxbxlbXkgemFwcm9wb25vd2HEhyB3emdsxJlkZW0gUGHFhHN0
d2EgcG90cnplYj8KCgpQb3pkcmF3aWFtCsW7YW5ldGEgS8SZZHppZXJza2EKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
