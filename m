Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7D1CFC275
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yRNSB/mvSSeF94OTboKHqcbJZNf4dW8hpnQvlqWyyIo=; b=OMFoOseQBs8qma
	6BOMbxjp9rxeLdWV0eW22nsFg8RMMVIT9z7TyCX5Lm17mYkGilw6kcmKupF6xc0E4CBfqCpYC1IeT
	xzSLr2w0gztfZIVLpXsvSz63+Pp/QF2LxFWuIjYXtGXFi4yz63Lznotc4B5w5OHF6+WMY1YLOQTp7
	PZeF9aYIRLGcQLolNYJWqDKmPJAHaATnbjPFE1CIl7LDDq8UMKOgoNF5onjRFoQO6quh+pA2Xd4DJ
	qUCfSS1qnrKMQyfUQQ2ZYZRkkS7mJci5sJKL9iF5xK6c1Nkkul/CW4br/RCLtrPms/pWGfnveKTqn
	zWAeClHdvxgu+P0XhCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cYp-00000007R2e-2P0g;
	Tue, 15 Oct 2024 08:05:43 +0000
Received: from mail.originatepro.pl ([162.19.155.125])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cSC-00000007Py2-008D
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Oct 2024 07:59:10 +0000
Received: by mail.OriginatePro.pl (Postfix, from userid 1002)
	id 5E10323AE5; Tue, 15 Oct 2024 09:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=OriginatePro.pl;
	s=mail; t=1728979062;
	bh=HDodNtmiQ0oQNph7sp+h4NRbkxw8d1NmRLmJ4HyiCoQ=;
	h=Date:From:To:Subject:From;
	b=jvafA6b7gcsYmcZmIhAKNA54a8Jgmy1kE0dpPo5fs7R2x0CQJBlS8fz1o2ejsP89b
	 XaPqQyWFS4ZZbKahDJcYDJzHBdeM8P5W+i8bHQ717JkLuOGunmetQ/pH/Zm+K3/nvZ
	 gccGQElbVrHR4jt9kH0k96c++H6dFvzaIWztPfN+aUZrdfgPaPxE0TThYSy08g7WTT
	 rNdvHg8nSVemB+DU+Ti6ChPYPz40gtNHC66C6fsiGwIowbeffDPtRp2GWDS8oPDXLP
	 AFn84d2fDuuf/0PCVB2e5+C/SHYF6PfUkJfVSUlk7nIv7YSlGm0IlqQPGOUK23RmqT
	 d/vkIiNtXe2qg==
Received: by mail.OriginatePro.pl for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2024 07:55:55 GMT
Message-ID: <20241015084500-0.1.em.2eu46.0.xiuti743ws@OriginatePro.pl>
Date: Tue, 15 Oct 2024 07:55:55 GMT
From: "Marcin Wojciechowski" <marcin.wojciechowski@originatepro.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Zam=C3=B3wienie_?=
X-Mailer: mail.OriginatePro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_005852_212454_1C32128B 
X-CRM114-Status: UNSURE (   0.42  )
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

V2l0YW0sCgpDenkgcG90cnplYnVqxIUgUGHFhHN0d28gYWt0dWFsbmllIG5vd3ljaCBrbGllbnTD
s3cgQjJCPwoKT2QgMTAgbGF0IHBvbWFnYW15IHBvenlza2l3YcSHIG5vd3ljaCBwYXJ0bmVyw7N3
IGJpem5lc293eWNoIHcgUG9sc2NlIG9yYXogemEgZ3JhbmljxIUuCgpQb25hZCAzMDAwIHpyZWFs
aXpvd2FueWNoIHByb2pla3TDs3cgemFyw7N3bm8gZGxhIG5handpxJlrc3p5Y2ggZ2xvYmFsbnlj
aCBrb3Jwb3JhY2ppLCBwb2xza2ljaCBzcMOzxYJlayBnaWXFgmRvd3ljaCBjenkgdGXFvCBuaWV3
aWVsa2ljaCBkemlhxYJhbG5vxZtjaSBnb3Nwb2RhcmN6eWNoIHNwcmF3aWEsIMW8ZSBqZXN0ZcWb
bXkgamVkbnltIHogbGlkZXLDs3cgYnJhbsW8eS4KClogd2llbG9tYSBmaXJtYW1pIHdzcMOzxYJw
cmFjdWplbXkgbmllcHJ6ZXJ3YW5pZSBvZCB3aWVsdSBsYXQsIGdlbmVydWrEhWMgc3RvcHkgendy
b3TDs3cgc2nEmWdhasSFY2UgdHlzacSZY3kgcHVua3TDs3cgcHJvY2VudG93eWNoLCBwb21hZ2Fq
xIVjIGplZG5vY3plxZtuaWUgdyBzcG9zw7NiIHBvd3RhcnphbG55IG9yYXogcG9saWN6YWxueSBw
b3N6ZXJ6YcSHIHBvcnRmZWxlIGtsaWVudMOzdyBiaXpuZXNvd3ljaC4KCkplxZtsaSBtYWrEhSBQ
YcWEc3R3byBwcnplc3RyemXFhCBuYSBvYnPFgnVnxJkgbm93eWNoIGtsaWVudMOzdywgemFwcmFz
emFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4gIAoKClBvemRyYXdpYW0KTWFyY2luIFdvamNpZWNo
b3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
