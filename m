Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058E9C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQ2A3IOr/rOVjFKLPXw0w1LV8v7JjuH1rdCfM/fuRTk=; b=FkDNK/TuBgx3aw
	iSaf4oUPY+CB9MQF35+Ek0HCDN3U0gzcC84bsGDTM+ipWBcUK4izOvztZVBmEicpZ9xK072O+O8PU
	4u/TdRmB/C8p5djFdznQNNa7q2HNr/kB+0S9laX7A+37uFOGNIxyKuEF9YpaMlcBdMzza6tlXhqpo
	dH2OKw9NHnxjidh2K7umxwtIsRImjLxGja2kqAqofK45zuNMbASPYVbG70SCr0JthVpZ3QUxbVd3S
	BCHmRDfva0Orzxq4f3aOadFjREhwFzzg+UYNFhffXgStqG+7muq2o0SCX9CiJN+mILoKrBwXp69Yv
	r1oxrjMqR6ZVyvLLeMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpmN-00000007A5G-1ARk;
	Mon, 20 Jul 2026 15:19:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpmL-00000007A51-3v18
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:19:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F38060103;
	Mon, 20 Jul 2026 15:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599711F000E9;
	Mon, 20 Jul 2026 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784560777;
	bh=109Y4pROIOE4v6JzP2mj0CftObYJX8Ya91dyfcfsWxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vy+bwBiIt4/fUFI+dUDk9Dg3zDRGN2UgA1jFoqgAvQrFjEQnGxK7YR9zluelaeQgS
	 stMVCspUaWzWzsfvB1JmBUUTn0cVaIXPQ1HUwcr59isRzU1dGIBsEJa/94jKOzMDPD
	 uqh4Fk7DYaGoIHIZISEglZMTwGkxnVg2dHJToiIwSDMYflKWHGUBm9L9UCmRKUspU5
	 qTxtbft53cSn8jsEkEyz5Ax5r1yilj5wxH4HuNIIiw5qcBzzAoWHW1v30NflGcNuR/
	 3fmgbwp0AKk20q46+sgVgtC2+iVakW8dKOaEuIx2GuyFKRjRPbMjXuGmmG4uIVOomO
	 QjqPqfoMn3XGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/16] PCI: dwc: spacemit-k1: Use cached PCIe
 capability offset
To: "Hans Zhang" <18255117159@163.com>
Cc: imx@lists.linux.dev, neil.armstrong@linaro.org, linux-pci@vger.kernel.org, Frank.Li@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260720150619.24733-14-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-14-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:19:35 +0000
Message-Id: <20260720151936.599711F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBCZWNhdXNlIC5pbml0IHJ1bnMgYmVmb3JlIGNvcmUgY2FjaGluZywgd2UgY2FsbCBkd19wY2ll
X2dldF9wY2llX2NhcCgpCj4gaW5zaWRlIGsxX3BjaWVfZGlzYWJsZV9hc3BtX2wxKCkgdG8gZ2V0
IHRoZSBjYXBhYmlsaXR5IGJhc2UsIHRoZW4gYWRkCj4gUENJX0VYUF9MTktDQVAuIEhhcmR3YXJl
IGlzIGFscmVhZHkgZW5hYmxlZCBhdCB0aGlzIHBvaW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhh
bnMgWmhhbmcgPDE4MjU1MTE3MTU5QDE2My5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlz
IHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28g
QUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMDE1MDYx
OS4yNDczMy0xLTE4MjU1MTE3MTU5QDE2My5jb20/cGFydD0xMwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
