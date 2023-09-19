Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49445EE6441
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Sep 2023 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h25mtvo6aX2qTagJY16hkB0Uw90eCenjh3zxRID28Rw=; b=jC61gAM/bAD0Bw
	XjotQcfcrTePJxIJVdW1nA9EfS7KBypupGalA95UUs7C5tIM9XMTtXti1ISY7xAYXxZxarDcF80Vk
	1A5SPxJKQ6khSZBtHuL4iGu3n+9regsGS7F1kpXIqmaD8zat1Juxt73K/euX+yFjnK+lEHV2bo7nw
	EO0uCf9+A7ZOQLGUrrkfqE84FyaMmPCYOrb9qNLf5jKjnko+FyhuSsz3chIhXDl0SDrGsMUUitQ7O
	KhTlOijoxrWkRqtRIlyN6PhEUV6ugrPRCkg04VQVIvr+qgF3G4owu9zxiCW0/0wQpTNnmzS0AWrNl
	2GwoWF46YgTpFWlXl/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCm-00HF4o-0o;
	Tue, 19 Sep 2023 07:31:32 +0000
Received: from mail.leeswilly.pl ([89.116.26.225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVCj-00HF39-0l
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Sep 2023 07:31:30 +0000
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
	id 5F93D761368; Tue, 19 Sep 2023 09:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
	t=1695108684; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
	h=Date:From:To:Subject:From;
	b=uH6aQj3jyWwRI+JTR+W/0ooIUDhEQ8HvWmSsxJlF119xU+p/nK+9nWu/90qMuF2WS
	 4hBh04tyTJDwBQ8lQNtOwufVZAFHkj8X6mr8R3wmGI4zJ7LJ12jA44u3BwpT+qEeZw
	 aenN2UoNvfjIGovEC1mP1u13Tbe9Rl9uYewYsM01MEwk/5/6BqhzJU62/Aosxw5SYC
	 YWnAmnXyIoAk68pmBK1IW2s2oixMasJVVF9h1oMJFQR33+5/OazBbTOkLQxAPNXmE6
	 /5P4k1QwC1L9hzUYLNwEuMfA5LLJw5SiRlQdYbLMoIte5om3/8EIqpGRN8Xzt6CCL/
	 9Az5OE5aBAy4A==
Received: by mail.leeswilly.pl for <linux-amlogic@lists.infradead.org>; Tue, 19 Sep 2023 07:30:18 GMT
Message-ID: <20230919084500-0.1.3z.bbzp.0.k2iffsdtqs@leeswilly.pl>
Date: Tue, 19 Sep 2023 07:30:18 GMT
From: "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_003129_425201_D4F9FB6B 
X-CRM114-Status: UNSURE (   1.16  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkpha3ViIExl
bWN6YWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
