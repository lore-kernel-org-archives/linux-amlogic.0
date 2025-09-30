Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68772CAC5B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Sep 2025 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Hcj/0WQq65dioUY+BNnzjzYIGdTtxlEUEvsp1MyZcM=; b=1bRIJVHi6J2zsi
	0oY7lZ0VcdQb5dU2TCoR7iB7jp6Zj8Bk2pQUFjiwNQIO22nxXy7livGbXd4rfrymPmFlps3pnxoFx
	UpzpXupiyh15V9UKmam2S5GOa1TdGU00fQlprRitOII4m/uQh+mWdX/5C7u1qboyyeOvV4dkNiPM4
	e1+ivtXAQb9mW+5AxfIdx2C+k3xH//SEszLO3dovyLFQGjEv8bmUbb2HM9ZpTNqG4DT5HhcOG5Jxg
	yE+ClYPS1dy1OoglVViS44d2CQ6c3gY73CTbpTGXvM9wZv8g2Q+uvSaZsqs03+owDwEenH3IdpdLj
	OrsANejxTXN4Qav0GdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V8r-00000004Y1p-0gSH;
	Tue, 30 Sep 2025 07:51:21 +0000
Received: from mail.bizneka.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V8o-00000004Xze-3mKX
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Sep 2025 07:51:20 +0000
Received: by mail.bizneka.pl (Postfix, from userid 1002)
	id 6B67AAD564; Tue, 30 Sep 2025 09:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizneka.pl; s=mail;
	t=1759218674; bh=yG3h65zQONp0BG7voFVqypH2B2cxmwvPBgIw+EyRk6E=;
	h=Date:From:To:Subject:From;
	b=iHB4ct/xvAVyD83KjDE6eVIPvyWNHvvePvZrkW4cb34ANfw4MCxLxdnxR1rRKVpmV
	 R44wvGNuI4vIQ+znyjmua6YaYGzZ+CdKvamUqo2uWnQ2nU+gpmQFfUq6sFIk4A6xb3
	 XCOu27kIIoEhW8jQFym41cu0h3K9/UZmNP7bzAxTLYgEbUIQYs8JkWTa3zl6zWmdTE
	 FEwmakenHcAG2q8M2qMP1n6dogdIq3j8U8e+bYQzwaiUsftoGi208efqlSisugTNQG
	 NupA7QlGati6JyPChKboMYOXaLEa1gO0Hl6fIdDxKgZJ7ZJGDiw91rkUaVj7bbC5SA
	 h41vyNecASu+w==
Received: by mail.bizneka.pl for <linux-amlogic@lists.infradead.org>; Tue, 30 Sep 2025 07:50:23 GMT
Message-ID: <20250930084500-0.1.oi.4r7bn.0.k740eqnh2i@bizneka.pl>
Date: Tue, 30 Sep 2025 07:50:23 GMT
From: "Sebastian Sikora" <sebastian.sikora@bizneka.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.bizneka.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_005119_217834_441AA751 
X-CRM114-Status: UNSURE (   0.93  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
ClNlYmFzdGlhbiBTaWtvcmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
