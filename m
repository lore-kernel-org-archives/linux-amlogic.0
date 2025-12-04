Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C42BD1D899
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Dec 2025 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LLNfAhhVvFtkD/hEOqyb3c70zD59X+3aOdpUK4eBiw=; b=U51Ft3Z9XGqIK4
	M4E/EpPbxUF23X//gjtw7anDF+V3+rC6kNctw1ssKr5PZ/jU/m7k5KSz6LO+Cxcc6bmg0kYXpxiSC
	r0zSZ1hvxANW1VzbjOKpvBIYuh6jJBGKm1Kbj5W76cRiVxPrNvDfDqAqVRpIe2iYvnKKhLBTTg7i7
	f09YyPL984PCmxVdLfKbLSuvBd7wvGap0b7Eo8YFypBVaHV+c6dFvvV/0LlZSf+u30h4v3lZ54bim
	QAfrIz+8FcnPoWHUciqfcQQIHwzjN0yN9QA5eUeO/X8lmCH6dlsUHL37iBjVbmt8t8uH2Woip8HWe
	dLVpwm5ryWfZg+u4ciEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5To-00000007kmt-2Bfs;
	Thu, 04 Dec 2025 09:18:28 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5Th-00000007kka-1il3
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Dec 2025 09:18:26 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id C5A11ACBD6; Thu,  4 Dec 2025 10:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1764839619; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=eCHxQw4YkQUj/+gB0JbeORfFIDhJ/TXtKnzmdNoH4AUhi0GvnP2h9VGsS9CO7Gox4
	 s2fg3PVIitz8tTteKh9HS4UU7t6nuDB+LGEm3h1Dlji9YlQ3G7mXtCEtv7BMgjwhD+
	 bmoJXKa2S1GxJLJQ/dPP4wPAUEqahOBFVkPyKXfRgLWTesND4dfy9udEPcARIViR8W
	 Y9lOCeykzZZZXxt6Gf9j+LqdFOqBl/TMBJYIB2hobKMJv4XJvN5qVwrtwdCcfe/1sJ
	 Ow77zRJPxpgRVecn8DZuwnvKi52IdDAuN1dZ4CusMe/FUuVawrlQFITh2YmKs9m6ag
	 ChVFuM53KB6zw==
Received: by mail.fontri.pl for <linux-amlogic@lists.infradead.org>; Thu,  4 Dec 2025 09:10:27 GMT
Message-ID: <20251204084119-0.1.sr.67uj1.0.6d2jq2i7c7@fontri.pl>
Date: Thu,  4 Dec 2025 09:10:27 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_011823_844651_8DE32D4B 
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
